package com.pinhuba.common.code.service;

import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import com.pinhuba.common.code.bean.DbDatabase;
import com.pinhuba.common.code.bean.DbField;
import com.pinhuba.common.code.bean.DbTable;
import com.pinhuba.common.code.database.OracleHandler;
import com.pinhuba.web.filter.springaop.ExceptionCatcherAdvice;

public class OracleDesignService implements DbDesignService {

	private final static Logger logger = LoggerFactory.getLogger(ExceptionCatcherAdvice.class);

	private Connection getConn() throws Exception {
		return new OracleHandler().getConn();
	}

	public DbDatabase getDatabase() throws Exception {
		Connection conn = getConn();
		DatabaseMetaData dbmd = conn.getMetaData();
		DbDatabase db = new DbDatabase();
		db.setName(dbmd.getDatabaseProductName());
		db.setVersion(dbmd.getDatabaseProductVersion());
		db.setDriverName(dbmd.getDriverName());
		db.setDriverVersion(dbmd.getDriverVersion());
		return db;
	}

	@Override
	public List<DbTable> listTables() throws Exception {
		Connection conn = getConn();
		DatabaseMetaData dbmd = conn.getMetaData();
		String schemaPattern = dbmd.getUserName().toUpperCase();
		ResultSet rs = dbmd.getTables(conn.getCatalog(), schemaPattern, null, new String[] { "TABLE" });

		List<DbTable> tables = new ArrayList<DbTable>();

		while (rs.next()) {
			DbTable table = new DbTable();
			table.setName(rs.getString("TABLE_NAME"));
			table.setComment(rs.getString("REMARKS"));
			tables.add(table);
		}
		
		
		PreparedStatement ps = conn.prepareStatement("select t.TABLE_NAME,t.NUM_ROWS  from user_tables t");
		rs = ps.executeQuery();
		Map<String, Integer> map = new HashMap<String, Integer>();
		while (rs.next()) {
			map.put(rs.getString(1), rs.getInt(2));
		}
		
		for (DbTable dbTable : tables) {
			dbTable.setRows(map.get(dbTable.getName()));
		}
		return tables;
	}

	@Override
	public void createTable(DbTable table) throws Exception {
		Statement smt = getConn().createStatement();
		smt.addBatch("create table " + table.getName() + " (ID VARCHAR2(50))");
		smt.addBatch("alter table " + table.getName() + " add primary key (ID)");
		smt.addBatch("comment on table " + table.getName() + " is '" + table.getComment() + "'");
		smt.executeBatch();
	}

	@Override
	public void updateTable(String oldName, DbTable table) throws Exception {
		Statement smt = getConn().createStatement();

		// 如果新、旧表名相同，只更新表注释
		if (!oldName.equals(table.getName())) {
			smt.addBatch("ALTER TABLE " + oldName + " RENAME TO " + table.getName());
		}

		smt.addBatch("comment on table " + table.getName() + " is '" + table.getComment() + "'");
		smt.executeBatch();
	}

	@Override
	public void deleteTable(String name) throws Exception {
		// oracle表 有回收站功能,带上关键字"purge"可直接删除
		PreparedStatement ps = getConn().prepareStatement("drop table " + name + " purge");
		ps.executeUpdate();
	}

	@Override
	public List<DbField> listField(String tableName) throws Exception {
		Connection conn = getConn();
		DatabaseMetaData dbmd = conn.getMetaData();
		String schemaPattern = dbmd.getUserName().toUpperCase();
		ResultSet rs = dbmd.getColumns(conn.getCatalog(), schemaPattern, tableName, "%");

		List<DbField> fileds = new ArrayList<DbField>();

		while (rs.next()) {
			DbField field = new DbField();

			field = field.setRemarks(field, rs.getString("REMARKS"));
			field.setName(rs.getString("COLUMN_NAME"));
			field.setType(rs.getString("TYPE_NAME"));
			field.setSize(rs.getString("COLUMN_SIZE"));
			field.setDefaultValue(rs.getString("COLUMN_DEF"));
			fileds.add(field);
		}
		return fileds;
	}

	@Override
	public void saveField(List<DbField> fields, String tableName) throws Exception {
		
		Statement smt = getConn().createStatement();
		
		StringBuffer buffer = new StringBuffer();
		buffer.append("ALTER TABLE " + tableName + " ADD (");
		for (int i = 0; i < fields.size(); i++) {
			DbField field = fields.get(i);

			buffer.append(field.getName() + " " + field.getType());
			buffer.append(getSizeStr(field.getSize()));
			buffer.append(getDefaultValueStr(field.getDefaultValue()));

			if (fields.size() != 1 && i != fields.size() - 1) {
				buffer.append(",");
			}
		}
		buffer.append(")");
		
		logger.info(buffer.toString());
		smt.addBatch(buffer.toString());

		// 添加字段注释
		for (int i = 0; i < fields.size(); i++) {
			DbField field = fields.get(i);
			String sql = "comment on column " + tableName + "." + field.getName() + " is '" + field.getRemarks() + "'";
			
			logger.info(sql);
			smt.addBatch(sql);
		}
		smt.executeBatch();
	}

	@Override
	public void deleteField(String tableName, String fieldName) throws Exception {
		PreparedStatement stmt = getConn().prepareStatement("ALTER TABLE " + tableName + " DROP COLUMN " + fieldName);
		stmt.executeUpdate();
	}

	@Override
	public DbField getField(String tableName, String fieldName) throws Exception {
		Connection conn = getConn();
		DatabaseMetaData dbmd = conn.getMetaData();
		String schemaPattern = dbmd.getUserName().toUpperCase();
		ResultSet rs = dbmd.getColumns(conn.getCatalog(), schemaPattern, tableName, "%");
		DbField field = new DbField();
		while (rs.next()) {
			if (fieldName.equals(rs.getString("COLUMN_NAME"))) {
				field = field.setRemarks(field, rs.getString("REMARKS"));
				field.setName(rs.getString("COLUMN_NAME"));
				field.setType(rs.getString("TYPE_NAME"));
				field.setSize(rs.getString("COLUMN_SIZE"));
				field.setDefaultValue(rs.getString("COLUMN_DEF"));
			}

		}
		return field;
	}

	@Override
	public void updateField(String tableName, DbField field) throws Exception {

		Statement smt = getConn().createStatement();
		
		StringBuffer buffer = new StringBuffer();
		
		buffer.append("ALTER TABLE " + tableName + " MODIFY (");
		buffer.append(field.getName() + " " + field.getType());
		buffer.append(getSizeStr(field.getSize()));
		buffer.append(getDefaultValueStr(field.getDefaultValue()));
		buffer.append(")");
		
		logger.info(buffer.toString());
		smt.addBatch(buffer.toString());

		// 添加字段注释
		String sql = "comment on column " + tableName + "." + field.getName() + " is '" + field.getRemarks() + "'";
		
		logger.info(sql);
		smt.addBatch(sql);

		smt.executeBatch();
	}

	/**
	 * 某些字段类型长度必填的，如果为空，设置默认长度
	 * 
	 * @param type
	 * @param size
	 * @return
	 */
	private String getSizeStr(String size) {
		if (StringUtils.isNotBlank(size)){
			return "(" + size + ")";
		}
		return "";
	}
	
	
	private String getDefaultValueStr(String defaultValue) {
		if(StringUtils.isNotBlank(defaultValue)){
			return  " DEFAULT " + defaultValue;
		}
		return "";
	}
}
