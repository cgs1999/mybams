package com.pinhuba.common.code.service;

import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import org.apache.commons.lang.StringUtils;
import com.pinhuba.common.code.bean.DbDatabase;
import com.pinhuba.common.code.bean.DbField;
import com.pinhuba.common.code.bean.DbTable;
import com.pinhuba.common.code.database.MysqlHandler;

public class MysqlDesignService implements DbDesignService{

	private Connection getConn() throws Exception {
		return new MysqlHandler().getConn();
	}
	
	@Override
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
		PreparedStatement stmt = getConn().prepareStatement("SHOW TABLE STATUS");
		ResultSet rs = stmt.executeQuery();
		
		List<DbTable> tables = new ArrayList<DbTable>();

		while (rs.next()) {
			DbTable table = new DbTable();
			table.setName(rs.getString("name"));
			table.setRows(rs.getInt("rows"));
			table.setComment(rs.getString("comment"));
			tables.add(table);
		}
		return tables;
	}

	@Override
	public void createTable(DbTable table) throws Exception {
		PreparedStatement ps = getConn().prepareStatement("" +
				"create table " + table.getName() + " (id varchar(50),PRIMARY KEY (id)) " +
				"ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='"+table.getComment()+"'");
		ps.executeUpdate();
	}
	
	@Override
	public void updateTable(String oldName, DbTable table) throws Exception {
		Statement smt = getConn().createStatement();

		// 如果新、旧表名相同，只更新表注释
		if (!oldName.equals(table.getName())) {
			smt.addBatch("ALTER TABLE " + oldName + " RENAME TO " + table.getName());
		}

		smt.addBatch("ALTER TABLE "+table.getName()+" COMMENT '"+table.getComment()+"'");
		smt.executeBatch();
	}

	@Override
	public void deleteTable(String name) throws Exception {
		PreparedStatement ps = getConn().prepareStatement("drop table " + name);
		ps.executeUpdate();
	}

	@Override
	public List<DbField> listField(String tableName) throws Exception {
		Connection conn = getConn();
		DatabaseMetaData dbmd = conn.getMetaData();
		ResultSet rs = dbmd.getColumns(null, "%", tableName, "%");
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
	public void saveField(List<DbField> fields, String tableName) throws Exception{
		
		Statement smt = getConn().createStatement();
		
		for (int i = 0; i < fields.size(); i++) {
			DbField field = fields.get(i);
			StringBuffer buffer = new StringBuffer();
			buffer.append("ALTER TABLE " + tableName + " ADD ");
			buffer.append(field.getName() + " " + field.getType());
			buffer.append(getSizeStr(field.getSize()));
			buffer.append(getDefaultValueStr(field.getDefaultValue()));
			buffer.append(" COMMENT '" + field.getRemarks() + "'");
			smt.addBatch(buffer.toString());
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
		ResultSet rs = dbmd.getColumns(null, "%", tableName, "%");
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
	public void updateField(String tableName, DbField field) throws Exception{
		
		Statement smt = getConn().createStatement();
		
		StringBuffer buffer = new StringBuffer();
		
		buffer.append("ALTER TABLE " + tableName + " CHANGE ");
		buffer.append(field.getName() + " " + field.getName() + " " + field.getType());
		buffer.append(getSizeStr(field.getSize()));
		buffer.append(getDefaultValueStr(field.getDefaultValue()));
		buffer.append(" COMMENT '" + field.getRemarks() + "'");
		
		smt.addBatch(buffer.toString());
		smt.executeBatch();
	}

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
