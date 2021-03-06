package com.pinhuba.core.daoimpl;

import org.springframework.stereotype.Repository;

import com.pinhuba.core.pojo.*;
import com.pinhuba.core.dao.*;
/**
 * 表：SYS_COLUMN_CONTROL 对应daoImpl
 */
@Repository
public class SysColumnControlDaoImpl extends BaseHapiDaoimpl<SysColumnControl, Long> implements ISysColumnControlDao {

   public SysColumnControlDaoImpl(){
      super(SysColumnControl.class);
   }
}