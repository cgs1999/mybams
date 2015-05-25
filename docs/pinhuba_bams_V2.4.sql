/*
MySQL Data Transfer
Source Host: localhost
Source Database: pinhuba_bams
Target Host: localhost
Target Database: pinhuba_bams
Date: 2015/5/12 16:03:59
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for ACT_EVT_LOG
-- ----------------------------
CREATE TABLE `act_evt_log` (
  `LOG_NR_` bigint(20) NOT NULL auto_increment,
  `TYPE_` varchar(64) collate utf8_bin default NULL,
  `PROC_DEF_ID_` varchar(64) collate utf8_bin default NULL,
  `PROC_INST_ID_` varchar(64) collate utf8_bin default NULL,
  `EXECUTION_ID_` varchar(64) collate utf8_bin default NULL,
  `TASK_ID_` varchar(64) collate utf8_bin default NULL,
  `TIME_STAMP_` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `USER_ID_` varchar(255) collate utf8_bin default NULL,
  `DATA_` longblob,
  `LOCK_OWNER_` varchar(255) collate utf8_bin default NULL,
  `LOCK_TIME_` timestamp NULL default NULL,
  `IS_PROCESSED_` tinyint(4) default '0',
  PRIMARY KEY  (`LOG_NR_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for ACT_GE_BYTEARRAY
-- ----------------------------
CREATE TABLE `act_ge_bytearray` (
  `ID_` varchar(64) collate utf8_bin NOT NULL default '',
  `REV_` int(11) default NULL,
  `NAME_` varchar(255) collate utf8_bin default NULL,
  `DEPLOYMENT_ID_` varchar(64) collate utf8_bin default NULL,
  `BYTES_` longblob,
  `GENERATED_` tinyint(4) default NULL,
  PRIMARY KEY  (`ID_`),
  KEY `ACT_FK_BYTEARR_DEPL` (`DEPLOYMENT_ID_`),
  CONSTRAINT `ACT_FK_BYTEARR_DEPL` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `act_re_deployment` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for ACT_GE_PROPERTY
-- ----------------------------
CREATE TABLE `act_ge_property` (
  `NAME_` varchar(64) collate utf8_bin NOT NULL default '',
  `VALUE_` varchar(300) collate utf8_bin default NULL,
  `REV_` int(11) default NULL,
  PRIMARY KEY  (`NAME_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for ACT_HI_ACTINST
-- ----------------------------
CREATE TABLE `act_hi_actinst` (
  `ID_` varchar(64) collate utf8_bin NOT NULL,
  `PROC_DEF_ID_` varchar(64) collate utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) collate utf8_bin NOT NULL,
  `EXECUTION_ID_` varchar(64) collate utf8_bin NOT NULL,
  `ACT_ID_` varchar(255) collate utf8_bin NOT NULL,
  `TASK_ID_` varchar(64) collate utf8_bin default NULL,
  `CALL_PROC_INST_ID_` varchar(64) collate utf8_bin default NULL,
  `ACT_NAME_` varchar(255) collate utf8_bin default NULL,
  `ACT_TYPE_` varchar(255) collate utf8_bin NOT NULL,
  `ASSIGNEE_` varchar(255) collate utf8_bin default NULL,
  `START_TIME_` datetime NOT NULL,
  `END_TIME_` datetime default NULL,
  `DURATION_` bigint(20) default NULL,
  `TENANT_ID_` varchar(255) collate utf8_bin default '',
  PRIMARY KEY  (`ID_`),
  KEY `ACT_IDX_HI_ACT_INST_START` (`START_TIME_`),
  KEY `ACT_IDX_HI_ACT_INST_END` (`END_TIME_`),
  KEY `ACT_IDX_HI_ACT_INST_PROCINST` (`PROC_INST_ID_`,`ACT_ID_`),
  KEY `ACT_IDX_HI_ACT_INST_EXEC` (`EXECUTION_ID_`,`ACT_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for ACT_HI_ATTACHMENT
-- ----------------------------
CREATE TABLE `act_hi_attachment` (
  `ID_` varchar(64) collate utf8_bin NOT NULL,
  `REV_` int(11) default NULL,
  `USER_ID_` varchar(255) collate utf8_bin default NULL,
  `NAME_` varchar(255) collate utf8_bin default NULL,
  `DESCRIPTION_` varchar(4000) collate utf8_bin default NULL,
  `TYPE_` varchar(255) collate utf8_bin default NULL,
  `TASK_ID_` varchar(64) collate utf8_bin default NULL,
  `PROC_INST_ID_` varchar(64) collate utf8_bin default NULL,
  `URL_` varchar(4000) collate utf8_bin default NULL,
  `CONTENT_ID_` varchar(64) collate utf8_bin default NULL,
  PRIMARY KEY  (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for ACT_HI_COMMENT
-- ----------------------------
CREATE TABLE `act_hi_comment` (
  `ID_` varchar(64) collate utf8_bin NOT NULL,
  `TYPE_` varchar(255) collate utf8_bin default NULL,
  `TIME_` datetime NOT NULL,
  `USER_ID_` varchar(255) collate utf8_bin default NULL,
  `TASK_ID_` varchar(64) collate utf8_bin default NULL,
  `PROC_INST_ID_` varchar(64) collate utf8_bin default NULL,
  `ACTION_` varchar(255) collate utf8_bin default NULL,
  `MESSAGE_` varchar(4000) collate utf8_bin default NULL,
  `FULL_MSG_` longblob,
  PRIMARY KEY  (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for ACT_HI_DETAIL
-- ----------------------------
CREATE TABLE `act_hi_detail` (
  `ID_` varchar(64) collate utf8_bin NOT NULL,
  `TYPE_` varchar(255) collate utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) collate utf8_bin default NULL,
  `EXECUTION_ID_` varchar(64) collate utf8_bin default NULL,
  `TASK_ID_` varchar(64) collate utf8_bin default NULL,
  `ACT_INST_ID_` varchar(64) collate utf8_bin default NULL,
  `NAME_` varchar(255) collate utf8_bin NOT NULL,
  `VAR_TYPE_` varchar(255) collate utf8_bin default NULL,
  `REV_` int(11) default NULL,
  `TIME_` datetime NOT NULL,
  `BYTEARRAY_ID_` varchar(64) collate utf8_bin default NULL,
  `DOUBLE_` double default NULL,
  `LONG_` bigint(20) default NULL,
  `TEXT_` varchar(4000) collate utf8_bin default NULL,
  `TEXT2_` varchar(4000) collate utf8_bin default NULL,
  PRIMARY KEY  (`ID_`),
  KEY `ACT_IDX_HI_DETAIL_PROC_INST` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_DETAIL_ACT_INST` (`ACT_INST_ID_`),
  KEY `ACT_IDX_HI_DETAIL_TIME` (`TIME_`),
  KEY `ACT_IDX_HI_DETAIL_NAME` (`NAME_`),
  KEY `ACT_IDX_HI_DETAIL_TASK_ID` (`TASK_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for ACT_HI_IDENTITYLINK
-- ----------------------------
CREATE TABLE `act_hi_identitylink` (
  `ID_` varchar(64) collate utf8_bin NOT NULL default '',
  `GROUP_ID_` varchar(255) collate utf8_bin default NULL,
  `TYPE_` varchar(255) collate utf8_bin default NULL,
  `USER_ID_` varchar(255) collate utf8_bin default NULL,
  `TASK_ID_` varchar(64) collate utf8_bin default NULL,
  `PROC_INST_ID_` varchar(64) collate utf8_bin default NULL,
  PRIMARY KEY  (`ID_`),
  KEY `ACT_IDX_HI_IDENT_LNK_USER` (`USER_ID_`),
  KEY `ACT_IDX_HI_IDENT_LNK_TASK` (`TASK_ID_`),
  KEY `ACT_IDX_HI_IDENT_LNK_PROCINST` (`PROC_INST_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for ACT_HI_PROCINST
-- ----------------------------
CREATE TABLE `act_hi_procinst` (
  `ID_` varchar(64) collate utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) collate utf8_bin NOT NULL,
  `BUSINESS_KEY_` varchar(255) collate utf8_bin default NULL,
  `PROC_DEF_ID_` varchar(64) collate utf8_bin NOT NULL,
  `START_TIME_` datetime NOT NULL,
  `END_TIME_` datetime default NULL,
  `DURATION_` bigint(20) default NULL,
  `START_USER_ID_` varchar(255) collate utf8_bin default NULL,
  `START_ACT_ID_` varchar(255) collate utf8_bin default NULL,
  `END_ACT_ID_` varchar(255) collate utf8_bin default NULL,
  `SUPER_PROCESS_INSTANCE_ID_` varchar(64) collate utf8_bin default NULL,
  `DELETE_REASON_` varchar(4000) collate utf8_bin default NULL,
  `TENANT_ID_` varchar(255) collate utf8_bin default '',
  `NAME_` varchar(255) collate utf8_bin default NULL,
  PRIMARY KEY  (`ID_`),
  UNIQUE KEY `PROC_INST_ID_` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_PRO_INST_END` (`END_TIME_`),
  KEY `ACT_IDX_HI_PRO_I_BUSKEY` (`BUSINESS_KEY_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for ACT_HI_TASKINST
-- ----------------------------
CREATE TABLE `act_hi_taskinst` (
  `ID_` varchar(64) collate utf8_bin NOT NULL,
  `PROC_DEF_ID_` varchar(64) collate utf8_bin default NULL,
  `TASK_DEF_KEY_` varchar(255) collate utf8_bin default NULL,
  `PROC_INST_ID_` varchar(64) collate utf8_bin default NULL,
  `EXECUTION_ID_` varchar(64) collate utf8_bin default NULL,
  `NAME_` varchar(255) collate utf8_bin default NULL,
  `PARENT_TASK_ID_` varchar(64) collate utf8_bin default NULL,
  `DESCRIPTION_` varchar(4000) collate utf8_bin default NULL,
  `OWNER_` varchar(255) collate utf8_bin default NULL,
  `ASSIGNEE_` varchar(255) collate utf8_bin default NULL,
  `START_TIME_` datetime NOT NULL,
  `CLAIM_TIME_` datetime default NULL,
  `END_TIME_` datetime default NULL,
  `DURATION_` bigint(20) default NULL,
  `DELETE_REASON_` varchar(4000) collate utf8_bin default NULL,
  `PRIORITY_` int(11) default NULL,
  `DUE_DATE_` datetime default NULL,
  `FORM_KEY_` varchar(255) collate utf8_bin default NULL,
  `CATEGORY_` varchar(255) collate utf8_bin default NULL,
  `TENANT_ID_` varchar(255) collate utf8_bin default '',
  PRIMARY KEY  (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for ACT_HI_VARINST
-- ----------------------------
CREATE TABLE `act_hi_varinst` (
  `ID_` varchar(64) collate utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) collate utf8_bin default NULL,
  `EXECUTION_ID_` varchar(64) collate utf8_bin default NULL,
  `TASK_ID_` varchar(64) collate utf8_bin default NULL,
  `NAME_` varchar(255) collate utf8_bin NOT NULL,
  `VAR_TYPE_` varchar(100) collate utf8_bin default NULL,
  `REV_` int(11) default NULL,
  `BYTEARRAY_ID_` varchar(64) collate utf8_bin default NULL,
  `DOUBLE_` double default NULL,
  `LONG_` bigint(20) default NULL,
  `TEXT_` varchar(4000) collate utf8_bin default NULL,
  `TEXT2_` varchar(4000) collate utf8_bin default NULL,
  `CREATE_TIME_` datetime default NULL,
  `LAST_UPDATED_TIME_` datetime default NULL,
  PRIMARY KEY  (`ID_`),
  KEY `ACT_IDX_HI_PROCVAR_PROC_INST` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_PROCVAR_NAME_TYPE` (`NAME_`,`VAR_TYPE_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for ACT_ID_GROUP
-- ----------------------------
CREATE TABLE `act_id_group` (
  `ID_` varchar(64) collate utf8_bin NOT NULL default '',
  `REV_` int(11) default NULL,
  `NAME_` varchar(255) collate utf8_bin default NULL,
  `TYPE_` varchar(255) collate utf8_bin default NULL,
  PRIMARY KEY  (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for ACT_ID_INFO
-- ----------------------------
CREATE TABLE `act_id_info` (
  `ID_` varchar(64) collate utf8_bin NOT NULL default '',
  `REV_` int(11) default NULL,
  `USER_ID_` varchar(64) collate utf8_bin default NULL,
  `TYPE_` varchar(64) collate utf8_bin default NULL,
  `KEY_` varchar(255) collate utf8_bin default NULL,
  `VALUE_` varchar(255) collate utf8_bin default NULL,
  `PASSWORD_` longblob,
  `PARENT_ID_` varchar(255) collate utf8_bin default NULL,
  PRIMARY KEY  (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for ACT_ID_MEMBERSHIP
-- ----------------------------
CREATE TABLE `act_id_membership` (
  `USER_ID_` varchar(64) collate utf8_bin NOT NULL default '',
  `GROUP_ID_` varchar(64) collate utf8_bin NOT NULL default '',
  PRIMARY KEY  (`USER_ID_`,`GROUP_ID_`),
  KEY `ACT_FK_MEMB_GROUP` (`GROUP_ID_`),
  CONSTRAINT `ACT_FK_MEMB_GROUP` FOREIGN KEY (`GROUP_ID_`) REFERENCES `act_id_group` (`ID_`),
  CONSTRAINT `ACT_FK_MEMB_USER` FOREIGN KEY (`USER_ID_`) REFERENCES `act_id_user` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for ACT_ID_USER
-- ----------------------------
CREATE TABLE `act_id_user` (
  `ID_` varchar(64) collate utf8_bin NOT NULL default '',
  `REV_` int(11) default NULL,
  `FIRST_` varchar(255) collate utf8_bin default NULL,
  `LAST_` varchar(255) collate utf8_bin default NULL,
  `EMAIL_` varchar(255) collate utf8_bin default NULL,
  `PWD_` varchar(255) collate utf8_bin default NULL,
  `PICTURE_ID_` varchar(64) collate utf8_bin default NULL,
  PRIMARY KEY  (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for ACT_RE_DEPLOYMENT
-- ----------------------------
CREATE TABLE `act_re_deployment` (
  `ID_` varchar(64) collate utf8_bin NOT NULL default '',
  `NAME_` varchar(255) collate utf8_bin default NULL,
  `CATEGORY_` varchar(255) collate utf8_bin default NULL,
  `TENANT_ID_` varchar(255) collate utf8_bin default '',
  `DEPLOY_TIME_` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for ACT_RE_MODEL
-- ----------------------------
CREATE TABLE `act_re_model` (
  `ID_` varchar(64) collate utf8_bin NOT NULL,
  `REV_` int(11) default NULL,
  `NAME_` varchar(255) collate utf8_bin default NULL,
  `KEY_` varchar(255) collate utf8_bin default NULL,
  `CATEGORY_` varchar(255) collate utf8_bin default NULL,
  `CREATE_TIME_` timestamp NULL default NULL,
  `LAST_UPDATE_TIME_` timestamp NULL default NULL,
  `VERSION_` int(11) default NULL,
  `META_INFO_` varchar(4000) collate utf8_bin default NULL,
  `DEPLOYMENT_ID_` varchar(64) collate utf8_bin default NULL,
  `EDITOR_SOURCE_VALUE_ID_` varchar(64) collate utf8_bin default NULL,
  `EDITOR_SOURCE_EXTRA_VALUE_ID_` varchar(64) collate utf8_bin default NULL,
  `TENANT_ID_` varchar(255) collate utf8_bin default '',
  PRIMARY KEY  (`ID_`),
  KEY `ACT_FK_MODEL_SOURCE` (`EDITOR_SOURCE_VALUE_ID_`),
  KEY `ACT_FK_MODEL_SOURCE_EXTRA` (`EDITOR_SOURCE_EXTRA_VALUE_ID_`),
  KEY `ACT_FK_MODEL_DEPLOYMENT` (`DEPLOYMENT_ID_`),
  CONSTRAINT `ACT_FK_MODEL_DEPLOYMENT` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `act_re_deployment` (`ID_`),
  CONSTRAINT `ACT_FK_MODEL_SOURCE` FOREIGN KEY (`EDITOR_SOURCE_VALUE_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_MODEL_SOURCE_EXTRA` FOREIGN KEY (`EDITOR_SOURCE_EXTRA_VALUE_ID_`) REFERENCES `act_ge_bytearray` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for ACT_RE_PROCDEF
-- ----------------------------
CREATE TABLE `act_re_procdef` (
  `ID_` varchar(64) collate utf8_bin NOT NULL,
  `REV_` int(11) default NULL,
  `CATEGORY_` varchar(255) collate utf8_bin default NULL,
  `NAME_` varchar(255) collate utf8_bin default NULL,
  `KEY_` varchar(255) collate utf8_bin NOT NULL,
  `VERSION_` int(11) NOT NULL,
  `DEPLOYMENT_ID_` varchar(64) collate utf8_bin default NULL,
  `RESOURCE_NAME_` varchar(4000) collate utf8_bin default NULL,
  `DGRM_RESOURCE_NAME_` varchar(4000) collate utf8_bin default NULL,
  `DESCRIPTION_` varchar(4000) collate utf8_bin default NULL,
  `HAS_START_FORM_KEY_` tinyint(4) default NULL,
  `SUSPENSION_STATE_` int(11) default NULL,
  `TENANT_ID_` varchar(255) collate utf8_bin default '',
  PRIMARY KEY  (`ID_`),
  UNIQUE KEY `ACT_UNIQ_PROCDEF` (`KEY_`,`VERSION_`,`TENANT_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for ACT_RU_EVENT_SUBSCR
-- ----------------------------
CREATE TABLE `act_ru_event_subscr` (
  `ID_` varchar(64) collate utf8_bin NOT NULL,
  `REV_` int(11) default NULL,
  `EVENT_TYPE_` varchar(255) collate utf8_bin NOT NULL,
  `EVENT_NAME_` varchar(255) collate utf8_bin default NULL,
  `EXECUTION_ID_` varchar(64) collate utf8_bin default NULL,
  `PROC_INST_ID_` varchar(64) collate utf8_bin default NULL,
  `ACTIVITY_ID_` varchar(64) collate utf8_bin default NULL,
  `CONFIGURATION_` varchar(255) collate utf8_bin default NULL,
  `CREATED_` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `PROC_DEF_ID_` varchar(64) collate utf8_bin default NULL,
  `TENANT_ID_` varchar(255) collate utf8_bin default '',
  PRIMARY KEY  (`ID_`),
  KEY `ACT_IDX_EVENT_SUBSCR_CONFIG_` (`CONFIGURATION_`),
  KEY `ACT_FK_EVENT_EXEC` (`EXECUTION_ID_`),
  CONSTRAINT `ACT_FK_EVENT_EXEC` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for ACT_RU_EXECUTION
-- ----------------------------
CREATE TABLE `act_ru_execution` (
  `ID_` varchar(64) collate utf8_bin NOT NULL default '',
  `REV_` int(11) default NULL,
  `PROC_INST_ID_` varchar(64) collate utf8_bin default NULL,
  `BUSINESS_KEY_` varchar(255) collate utf8_bin default NULL,
  `PARENT_ID_` varchar(64) collate utf8_bin default NULL,
  `PROC_DEF_ID_` varchar(64) collate utf8_bin default NULL,
  `SUPER_EXEC_` varchar(64) collate utf8_bin default NULL,
  `ACT_ID_` varchar(255) collate utf8_bin default NULL,
  `IS_ACTIVE_` tinyint(4) default NULL,
  `IS_CONCURRENT_` tinyint(4) default NULL,
  `IS_SCOPE_` tinyint(4) default NULL,
  `IS_EVENT_SCOPE_` tinyint(4) default NULL,
  `SUSPENSION_STATE_` int(11) default NULL,
  `CACHED_ENT_STATE_` int(11) default NULL,
  `TENANT_ID_` varchar(255) collate utf8_bin default '',
  `NAME_` varchar(255) collate utf8_bin default NULL,
  PRIMARY KEY  (`ID_`),
  KEY `ACT_IDX_EXEC_BUSKEY` (`BUSINESS_KEY_`),
  KEY `ACT_FK_EXE_PROCINST` (`PROC_INST_ID_`),
  KEY `ACT_FK_EXE_PARENT` (`PARENT_ID_`),
  KEY `ACT_FK_EXE_SUPER` (`SUPER_EXEC_`),
  KEY `ACT_FK_EXE_PROCDEF` (`PROC_DEF_ID_`),
  CONSTRAINT `ACT_FK_EXE_PARENT` FOREIGN KEY (`PARENT_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_EXE_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `ACT_FK_EXE_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ACT_FK_EXE_SUPER` FOREIGN KEY (`SUPER_EXEC_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for ACT_RU_IDENTITYLINK
-- ----------------------------
CREATE TABLE `act_ru_identitylink` (
  `ID_` varchar(64) collate utf8_bin NOT NULL default '',
  `REV_` int(11) default NULL,
  `GROUP_ID_` varchar(255) collate utf8_bin default NULL,
  `TYPE_` varchar(255) collate utf8_bin default NULL,
  `USER_ID_` varchar(255) collate utf8_bin default NULL,
  `TASK_ID_` varchar(64) collate utf8_bin default NULL,
  `PROC_INST_ID_` varchar(64) collate utf8_bin default NULL,
  `PROC_DEF_ID_` varchar(64) collate utf8_bin default NULL,
  PRIMARY KEY  (`ID_`),
  KEY `ACT_IDX_IDENT_LNK_USER` (`USER_ID_`),
  KEY `ACT_IDX_IDENT_LNK_GROUP` (`GROUP_ID_`),
  KEY `ACT_IDX_ATHRZ_PROCEDEF` (`PROC_DEF_ID_`),
  KEY `ACT_FK_TSKASS_TASK` (`TASK_ID_`),
  KEY `ACT_FK_IDL_PROCINST` (`PROC_INST_ID_`),
  CONSTRAINT `ACT_FK_ATHRZ_PROCEDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `ACT_FK_IDL_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_TSKASS_TASK` FOREIGN KEY (`TASK_ID_`) REFERENCES `act_ru_task` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for ACT_RU_JOB
-- ----------------------------
CREATE TABLE `act_ru_job` (
  `ID_` varchar(64) collate utf8_bin NOT NULL,
  `REV_` int(11) default NULL,
  `TYPE_` varchar(255) collate utf8_bin NOT NULL,
  `LOCK_EXP_TIME_` timestamp NULL default NULL,
  `LOCK_OWNER_` varchar(255) collate utf8_bin default NULL,
  `EXCLUSIVE_` tinyint(1) default NULL,
  `EXECUTION_ID_` varchar(64) collate utf8_bin default NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) collate utf8_bin default NULL,
  `PROC_DEF_ID_` varchar(64) collate utf8_bin default NULL,
  `RETRIES_` int(11) default NULL,
  `EXCEPTION_STACK_ID_` varchar(64) collate utf8_bin default NULL,
  `EXCEPTION_MSG_` varchar(4000) collate utf8_bin default NULL,
  `DUEDATE_` timestamp NULL default NULL,
  `REPEAT_` varchar(255) collate utf8_bin default NULL,
  `HANDLER_TYPE_` varchar(255) collate utf8_bin default NULL,
  `HANDLER_CFG_` varchar(4000) collate utf8_bin default NULL,
  `TENANT_ID_` varchar(255) collate utf8_bin default '',
  PRIMARY KEY  (`ID_`),
  KEY `ACT_FK_JOB_EXCEPTION` (`EXCEPTION_STACK_ID_`),
  CONSTRAINT `ACT_FK_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `act_ge_bytearray` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for ACT_RU_TASK
-- ----------------------------
CREATE TABLE `act_ru_task` (
  `ID_` varchar(64) collate utf8_bin NOT NULL default '',
  `REV_` int(11) default NULL,
  `EXECUTION_ID_` varchar(64) collate utf8_bin default NULL,
  `PROC_INST_ID_` varchar(64) collate utf8_bin default NULL,
  `PROC_DEF_ID_` varchar(64) collate utf8_bin default NULL,
  `NAME_` varchar(255) collate utf8_bin default NULL,
  `PARENT_TASK_ID_` varchar(64) collate utf8_bin default NULL,
  `DESCRIPTION_` varchar(4000) collate utf8_bin default NULL,
  `TASK_DEF_KEY_` varchar(255) collate utf8_bin default NULL,
  `OWNER_` varchar(255) collate utf8_bin default NULL,
  `ASSIGNEE_` varchar(255) collate utf8_bin default NULL,
  `DELEGATION_` varchar(64) collate utf8_bin default NULL,
  `PRIORITY_` int(11) default NULL,
  `CREATE_TIME_` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `DUE_DATE_` datetime default NULL,
  `CATEGORY_` varchar(255) collate utf8_bin default NULL,
  `SUSPENSION_STATE_` int(11) default NULL,
  `TENANT_ID_` varchar(255) collate utf8_bin default '',
  `FORM_KEY_` varchar(255) collate utf8_bin default NULL,
  PRIMARY KEY  (`ID_`),
  KEY `ACT_IDX_TASK_CREATE` (`CREATE_TIME_`),
  KEY `ACT_FK_TASK_EXE` (`EXECUTION_ID_`),
  KEY `ACT_FK_TASK_PROCINST` (`PROC_INST_ID_`),
  KEY `ACT_FK_TASK_PROCDEF` (`PROC_DEF_ID_`),
  CONSTRAINT `ACT_FK_TASK_EXE` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_TASK_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `ACT_FK_TASK_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for ACT_RU_VARIABLE
-- ----------------------------
CREATE TABLE `act_ru_variable` (
  `ID_` varchar(64) collate utf8_bin NOT NULL,
  `REV_` int(11) default NULL,
  `TYPE_` varchar(255) collate utf8_bin NOT NULL,
  `NAME_` varchar(255) collate utf8_bin NOT NULL,
  `EXECUTION_ID_` varchar(64) collate utf8_bin default NULL,
  `PROC_INST_ID_` varchar(64) collate utf8_bin default NULL,
  `TASK_ID_` varchar(64) collate utf8_bin default NULL,
  `BYTEARRAY_ID_` varchar(64) collate utf8_bin default NULL,
  `DOUBLE_` double default NULL,
  `LONG_` bigint(20) default NULL,
  `TEXT_` varchar(4000) collate utf8_bin default NULL,
  `TEXT2_` varchar(4000) collate utf8_bin default NULL,
  PRIMARY KEY  (`ID_`),
  KEY `ACT_IDX_VARIABLE_TASK_ID` (`TASK_ID_`),
  KEY `ACT_FK_VAR_EXE` (`EXECUTION_ID_`),
  KEY `ACT_FK_VAR_PROCINST` (`PROC_INST_ID_`),
  KEY `ACT_FK_VAR_BYTEARRAY` (`BYTEARRAY_ID_`),
  CONSTRAINT `ACT_FK_VAR_BYTEARRAY` FOREIGN KEY (`BYTEARRAY_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_VAR_EXE` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_VAR_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for fro_config
-- ----------------------------
CREATE TABLE `fro_config` (
  `id` varchar(50) NOT NULL COMMENT '登录、注册是否使用注册码',
  `is_show_code` int(11) default NULL,
  `register_info` text COMMENT '注册时的注意事项',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for fro_member
-- ----------------------------
CREATE TABLE `fro_member` (
  `id` varchar(50) NOT NULL default '',
  `username` varchar(50) default NULL,
  `password` varchar(50) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for fro_news
-- ----------------------------
CREATE TABLE `fro_news` (
  `id` varchar(50) NOT NULL,
  `title` varchar(200) default NULL COMMENT '题标|2|2|1|1',
  `news_type` int(11) unsigned default NULL COMMENT '类别|2|2|5|2',
  `content` longtext COMMENT '内容|2|2|11|1',
  `createdate` varchar(50) default NULL,
  `attachment` varchar(100) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for fro_project
-- ----------------------------
CREATE TABLE `fro_project` (
  `id` varchar(50) NOT NULL default '',
  `project_name` varchar(50) default NULL,
  `project_type` int(11) default NULL,
  `is_high_tec` int(11) default NULL,
  `project_plan` varchar(255) default NULL,
  `project_begin` varchar(20) default NULL,
  `project_end` varchar(20) default NULL,
  `budget_total` double default NULL,
  `project_file` varchar(255) default NULL,
  `member_id` varchar(50) default NULL,
  `project_intro_one` text,
  `project_intro_two` text,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for fro_project_manager
-- ----------------------------
CREATE TABLE `fro_project_manager` (
  `project_id` varchar(50) NOT NULL default '',
  `manager_name` varchar(50) default NULL,
  `manager_sex` int(11) default NULL,
  `manager_age` int(11) default NULL,
  `manager_degree` int(11) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for hrm_contract
-- ----------------------------
CREATE TABLE `hrm_contract` (
  `contract_id` varchar(50) NOT NULL,
  `contract_code` varchar(100) default NULL COMMENT '合同编号|1|1|1|1',
  `contract_name` varchar(100) default NULL COMMENT '合同名称|1|1|1|1',
  `contract_limit_type` int(11) default NULL COMMENT '期限类型|2|1|6|1',
  `contract_status` int(11) default NULL COMMENT '合同类别|2|1|5|1',
  `contract_type_id` varchar(50) default NULL COMMENT '合同类别|2|1|5|1',
  `contract_begindate` varchar(50) default NULL COMMENT '开始日期|2|1|4|1',
  `contract_enddate` varchar(50) default NULL COMMENT '开始日期|2|1|4|2',
  `contract_content` text COMMENT '合同内容|2|2|11|1',
  `contract_file` varchar(1000) default NULL COMMENT '合同附件|2|2|13|2',
  `emp_id` varchar(50) default NULL COMMENT '人员|1|1|8|1',
  `record_id` varchar(50) default NULL,
  `record_date` datetime default NULL,
  `lastmodi_id` varchar(50) default NULL,
  `lastmodi_date` datetime default NULL,
  `company_id` int(11) default '-1',
  PRIMARY KEY  (`contract_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for hrm_contract_type
-- ----------------------------
CREATE TABLE `hrm_contract_type` (
  `type_id` varchar(50) NOT NULL,
  `type_name` varchar(100) default NULL COMMENT '类别名称|1|1|1|1',
  `type_file` varchar(100) default NULL COMMENT '合同模板|2|2|13|2',
  `type_desc` varchar(500) default NULL COMMENT '类别描述|2|2|10|2',
  `record_id` varchar(50) default NULL,
  `record_date` datetime default NULL,
  `lastmodi_id` varchar(50) default NULL,
  `lastmodi_date` datetime default NULL,
  `company_id` int(11) default '-1',
  PRIMARY KEY  (`type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for hrm_department
-- ----------------------------
CREATE TABLE `hrm_department` (
  `dep_id` int(11) NOT NULL auto_increment,
  `hrm_dep_id` varchar(50) NOT NULL,
  `hrm_dep_code` varchar(50) default NULL,
  `hrm_dep_name` varchar(100) default NULL,
  `hrm_dep_engname` varchar(100) default NULL,
  `hrm_dep_upid` varchar(50) default NULL,
  `hrm_emp_id` varchar(50) default NULL,
  `hrm_dep_desc` varchar(500) default NULL,
  `record_id` varchar(50) default NULL,
  `record_date` datetime default NULL,
  `lastmodi_id` varchar(50) default NULL,
  `lastmodi_date` datetime default NULL,
  `company_id` int(11) default '-1',
  `hrm_dep_showrow` int(11) NOT NULL default '99',
  PRIMARY KEY  (`dep_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for hrm_employee
-- ----------------------------
CREATE TABLE `hrm_employee` (
  `hrm_employee_id` varchar(50) NOT NULL,
  `hrm_employee_name` varchar(100) default NULL,
  `hrm_employee_engname` varchar(100) default NULL,
  `hrm_employee_simple` varchar(100) default NULL,
  `hrm_employee_code` varchar(50) default NULL COMMENT '员工工号|1|2|2|0',
  `hrm_employee_pattern_id` varchar(20) default NULL COMMENT '用工形式',
  `hrm_employee_birthday` varchar(20) default NULL COMMENT '生日',
  `hrm_employee_sex` varchar(20) default NULL COMMENT '性别',
  `hrm_employee_marriage` varchar(20) default NULL COMMENT '婚姻状况',
  `hrm_employee_politics` varchar(20) default NULL,
  `hrm_employee_nationality` varchar(20) default NULL,
  `hrm_employee_blood_type` varchar(20) default NULL,
  `hrm_employee_height` varchar(20) default NULL,
  `hrm_employee_weight` varchar(20) default NULL,
  `hrm_employee_image_info_id` int(11) default NULL,
  `hrm_employee_school` varchar(100) default NULL,
  `hrm_employee_professional` varchar(100) default NULL,
  `hrm_employee_degree` varchar(20) default NULL,
  `hrm_employee_identitycard` varchar(20) default NULL,
  `hrm_employee_hometown` varchar(200) default NULL,
  `hrm_employee_house_phone` varchar(50) default NULL,
  `hrm_employee_house_address` varchar(200) default NULL,
  `hrm_employee_mobile_tele` varchar(50) default NULL,
  `hrm_employee_work_tele` varchar(50) default NULL,
  `hrm_employee_in_time` varchar(20) default NULL,
  `hrm_employee_depid` int(11) default NULL,
  `hrm_employee_workareaid` int(11) default NULL,
  `hrm_employee_post_id` int(11) default NULL,
  `hrm_employee_squad_id` int(11) default NULL,
  `hrm_employee_email` varchar(100) default NULL,
  `hrm_employee_urgent_preson` varchar(200) default NULL,
  `hrm_employee_urgent_phone` varchar(200) default NULL,
  `hrm_employee_adderss` varchar(200) default NULL,
  `hrm_employee_appendid` varchar(5000) default NULL,
  `record_id` varchar(50) default NULL,
  `record_date` datetime default NULL,
  `lastmodi_id` varchar(50) default NULL,
  `lastmodi_date` datetime default NULL,
  `company_id` int(11) default '-1',
  `hrm_employee_work_time` varchar(20) default NULL,
  `hrm_part_post` varchar(100) default NULL,
  `hrm_employee_status` int(11) default NULL,
  `hrm_other_attachmen` varchar(500) default NULL,
  `hrm_employee_active` int(11) default NULL,
  PRIMARY KEY  (`hrm_employee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for hrm_post
-- ----------------------------
CREATE TABLE `hrm_post` (
  `post_id` int(11) NOT NULL auto_increment,
  `hrm_post_id` varchar(50) default NULL,
  `hrm_post_name` varchar(100) default NULL,
  `hrm_post_engname` varchar(100) default NULL,
  `hrm_post_upid` varchar(50) default NULL,
  `hrm_post_mang` varchar(50) default NULL,
  `hrm_post_desc` varchar(500) default NULL,
  `record_id` varchar(50) default NULL,
  `record_date` datetime default NULL,
  `lastmodi_id` varchar(50) default NULL,
  `lastmodi_date` datetime default NULL,
  `company_id` int(11) default '-1',
  `hrm_post_showrow` int(11) NOT NULL default '99',
  PRIMARY KEY  (`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for hrm_timedrecord
-- ----------------------------
CREATE TABLE `hrm_timedrecord` (
  `timed_id` int(11) NOT NULL auto_increment,
  `timed_type` int(11) default NULL,
  `timed_date` varchar(50) default NULL,
  `timed_description` varchar(2000) default NULL,
  `record_id` varchar(50) default NULL,
  `record_date` datetime default NULL,
  `lastmodi_id` varchar(50) default NULL,
  `lastmodi_date` datetime default NULL,
  `company_id` int(11) default NULL,
  PRIMARY KEY  (`timed_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for hrm_workarea
-- ----------------------------
CREATE TABLE `hrm_workarea` (
  `hrm_area_id` int(11) NOT NULL auto_increment,
  `hrm_area_name` varchar(100) default NULL,
  `hrm_area_engname` varchar(100) default NULL,
  `hrm_area_desc` varchar(500) default NULL,
  `record_id` varchar(50) default NULL,
  `record_date` datetime default NULL,
  `lastmodi_id` varchar(50) default NULL,
  `lastmodi_date` datetime default NULL,
  `company_id` int(11) default '-1',
  PRIMARY KEY  (`hrm_area_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for oa_adversaria
-- ----------------------------
CREATE TABLE `oa_adversaria` (
  `oa_adver_id` int(11) NOT NULL auto_increment,
  `oa_adver_title` varchar(200) default NULL,
  `oa_adver_level` int(11) default NULL,
  `oa_adver_text` longtext,
  `oa_adver_emp` varchar(50) default NULL,
  `oa_adver_time` varchar(50) default NULL,
  `oa_adver_status` int(11) default NULL,
  `oa_adver_acce` varchar(50) default NULL,
  `record_id` varchar(50) default NULL,
  `record_date` varchar(50) default NULL,
  `lastmodi_id` varchar(50) default NULL,
  `lastmodi_date` varchar(50) default NULL,
  `company_id` int(11) default NULL,
  PRIMARY KEY  (`oa_adver_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for oa_album
-- ----------------------------
CREATE TABLE `oa_album` (
  `album_id` int(11) NOT NULL auto_increment,
  `album_name` varchar(50) default NULL,
  `album_create_employee` varchar(50) default NULL,
  `album_time` varchar(50) default NULL,
  `album_type` int(11) default NULL,
  `album_photo_id` int(11) default NULL,
  `album_photo_count` int(11) default '0',
  `album_desc` longtext,
  `album_emps` longtext,
  `album_deps` longtext,
  `record_id` varchar(50) default NULL,
  `record_date` datetime default NULL,
  `lastmodi_id` varchar(50) default NULL,
  `lastmodi_date` datetime default NULL,
  `company_id` int(11) default NULL,
  PRIMARY KEY  (`album_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for oa_announcement
-- ----------------------------
CREATE TABLE `oa_announcement` (
  `oa_anno_id` int(11) NOT NULL auto_increment,
  `oa_anno_name` varchar(200) default NULL,
  `oa_anno_type` int(11) default NULL,
  `oa_anno_text` longtext,
  `oa_anno_emp` varchar(50) default NULL,
  `oa_anno_time` varchar(50) default NULL,
  `oa_anno_level` int(11) default NULL,
  `oa_anno_status` int(11) default NULL,
  `oa_anno_acce` varchar(50) default NULL,
  `record_id` varchar(50) default NULL,
  `record_date` varchar(50) default NULL,
  `lastmodi_id` varchar(50) default NULL,
  `lastmodi_date` varchar(50) default NULL,
  `company_id` int(11) default NULL,
  PRIMARY KEY  (`oa_anno_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for oa_boardroom
-- ----------------------------
CREATE TABLE `oa_boardroom` (
  `oa_boardroom_id` int(11) NOT NULL auto_increment,
  `oa_boardroom_name` varchar(200) default NULL,
  `oa_boardroom_capacity` int(11) default NULL,
  `oa_boardroom_equipment` varchar(500) default NULL,
  `oa_boardroom_describe` varchar(2000) default NULL,
  `oa_boardroom_address` varchar(500) default NULL,
  `record_id` varchar(50) default NULL,
  `record_date` datetime default NULL,
  `lastmodi_id` varchar(50) default NULL,
  `lastmodi_date` datetime default NULL,
  `company_id` int(11) default NULL,
  PRIMARY KEY  (`oa_boardroom_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for oa_book
-- ----------------------------
CREATE TABLE `oa_book` (
  `oa_book_id` int(11) NOT NULL auto_increment,
  `oa_book_name` varchar(100) default NULL,
  `oa_book_dep` int(11) default NULL,
  `oa_book_code` varchar(50) default NULL,
  `oa_book_type` int(11) default NULL,
  `oa_book_author` varchar(20) default NULL,
  `oa_book_isbn` varchar(100) default NULL,
  `oa_book_concern` varchar(100) default NULL,
  `oa_publish_date` varchar(50) default NULL,
  `oa_book_address` varchar(100) default NULL,
  `oa_book_count` int(11) default NULL,
  `oa_book_remain` int(11) default NULL,
  `oa_book_price` double default NULL,
  `oa_buy_date` varchar(50) default NULL,
  `oa_book_synopsis` longtext,
  `oa_registy_date` varchar(50) default NULL,
  `oa_book_booker` varchar(50) default NULL,
  `oa_book_remark` longtext,
  `oa_book_acce` varchar(50) default NULL,
  `record_id` varchar(50) default NULL,
  `record_date` varchar(50) default NULL,
  `lastmodi_id` varchar(50) default NULL,
  `lastmodi_date` varchar(50) default NULL,
  `company_id` int(11) default NULL,
  PRIMARY KEY  (`oa_book_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for oa_book_br
-- ----------------------------
CREATE TABLE `oa_book_br` (
  `oa_br_id` int(11) NOT NULL auto_increment,
  `oa_br_bookid` int(11) default NULL,
  `oa_br_lendn` varchar(50) default NULL,
  `oa_br_lendw` varchar(50) default NULL,
  `oa_br_bdate` varchar(50) default NULL,
  `oa_br_rdate` varchar(50) default NULL,
  `oa_br_date` varchar(50) default NULL,
  `oa_br_count` int(11) default NULL,
  `oa_br_booker` varchar(50) default NULL,
  `oa_br_status` int(11) default NULL,
  `oa_br_remark` longtext,
  `record_id` varchar(50) default NULL,
  `record_date` varchar(50) default NULL,
  `lastmodi_id` varchar(50) default NULL,
  `lastmodi_date` varchar(50) default NULL,
  `company_id` int(11) default NULL,
  PRIMARY KEY  (`oa_br_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for oa_book_type
-- ----------------------------
CREATE TABLE `oa_book_type` (
  `oa_booktype_id` int(11) NOT NULL auto_increment,
  `oa_booktype_name` varchar(100) default NULL,
  `oa_booktype_remark` longtext,
  `record_id` varchar(50) default NULL,
  `record_date` varchar(50) default NULL,
  `lastmodi_id` varchar(50) default NULL,
  `lastmodi_date` varchar(50) default NULL,
  `company_id` int(11) default NULL,
  PRIMARY KEY  (`oa_booktype_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for oa_calender
-- ----------------------------
CREATE TABLE `oa_calender` (
  `oa_calender_id` int(11) NOT NULL auto_increment,
  `oa_calender_level` int(11) default NULL,
  `oa_calender_type` int(11) default NULL,
  `oa_calender_start` varchar(20) default NULL,
  `oa_calender_end` varchar(20) default NULL,
  `oa_calender_status` int(11) default NULL,
  `oa_calender_content` longtext,
  `oa_calender_emp` varchar(100) default NULL,
  `record_id` varchar(100) default NULL,
  `record_date` datetime default NULL,
  `lastmodi_id` varchar(100) default NULL,
  `lastmodi_date` datetime default NULL,
  `company_id` int(11) default NULL,
  PRIMARY KEY  (`oa_calender_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for oa_car
-- ----------------------------
CREATE TABLE `oa_car` (
  `oa_car_id` int(11) NOT NULL auto_increment,
  `oa_car_name` varchar(50) default NULL,
  `oa_car_cards` varchar(200) default NULL,
  `oa_car_model` varchar(200) default NULL,
  `oa_car_sta` int(11) default NULL,
  `oa_car_type` int(11) default NULL,
  `oa_car_mete` varchar(200) default NULL,
  `oa_car_max` varchar(200) default NULL,
  `oa_car_motorman` varchar(200) default NULL,
  `oa_car_price` double default NULL,
  `oa_car_photo` varchar(200) default NULL,
  `oa_car_buydate` varchar(20) default NULL,
  `oa_car_remark` varchar(2000) default NULL,
  `record_id` varchar(50) default NULL,
  `record_date` datetime default NULL,
  `lastmodi_id` varchar(50) default NULL,
  `lastmodi_date` datetime default NULL,
  `company_id` int(11) default NULL,
  PRIMARY KEY  (`oa_car_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for oa_car_apply
-- ----------------------------
CREATE TABLE `oa_car_apply` (
  `apply_id` int(11) NOT NULL auto_increment,
  `apply_section` int(11) default NULL,
  `apply_user` varchar(50) default NULL,
  `apply_phone` varchar(25) default NULL,
  `apply_task` varchar(1000) default NULL,
  `apply_begindate` varchar(20) default NULL,
  `apply_enddate` varchar(20) default NULL,
  `apply_num` int(11) default NULL,
  `car_id` int(11) default NULL,
  `RECORD_ID` varchar(50) default NULL,
  `RECORD_DATE` datetime default NULL,
  `LASTMODI_ID` varchar(50) default NULL,
  `LASTMODI_DATE` datetime default NULL,
  `COMPANY_ID` int(11) default NULL,
  `apply_appendnews` varchar(50) default NULL,
  `oa_car_status` int(11) default NULL,
  PRIMARY KEY  (`apply_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for oa_car_maintain
-- ----------------------------
CREATE TABLE `oa_car_maintain` (
  `maintain_id` int(11) NOT NULL auto_increment,
  `car_id` int(11) default NULL,
  `maintain_user` varchar(50) default NULL,
  `maintain_money` varchar(50) default NULL,
  `maintain_date` varchar(20) default NULL,
  `maintain_type` int(11) default NULL,
  `maintain_appendnews` longtext,
  `RECORD_ID` varchar(50) default NULL,
  `RECORD_DATE` datetime default NULL,
  `LASTMODI_ID` varchar(50) default NULL,
  `LASTMODI_DATE` datetime default NULL,
  `COMPANY_ID` int(11) default NULL,
  PRIMARY KEY  (`maintain_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for oa_chat_groups
-- ----------------------------
CREATE TABLE `oa_chat_groups` (
  `oa_chatgp_id` int(11) NOT NULL auto_increment,
  `oa_chatgp_name` varchar(50) default NULL,
  `oa_chatgp_detail` longtext,
  `record_id` varchar(50) default NULL,
  `record_date` varchar(50) default NULL,
  `lastmodi_id` varchar(50) default NULL,
  `lastmodi_date` varchar(50) default NULL,
  `company_id` int(11) default NULL,
  PRIMARY KEY  (`oa_chatgp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for oa_chatters
-- ----------------------------
CREATE TABLE `oa_chatters` (
  `oa_chat_id` int(11) NOT NULL auto_increment,
  `oa_chat_emp` varchar(50) default NULL,
  `oa_chat_sex` int(11) default NULL,
  `oa_chat_com` varchar(100) default NULL,
  `oa_chat_group` int(11) default NULL,
  `oa_chat_address` varchar(100) default NULL,
  `oa_home_tel` varchar(20) default NULL,
  `oa_chat_mobile` varchar(20) default NULL,
  `oa_work_tel` varchar(20) default NULL,
  `oa_chat_qq` varchar(20) default NULL,
  `oa_chat_msn` varchar(100) default NULL,
  `oa_chat_email` varchar(100) default NULL,
  `oa_chat_photos` varchar(50) default NULL,
  `oa_is_share` int(11) default NULL,
  `oa_share_emp` longtext,
  `oa_check_id` int(11) default NULL,
  `record_id` varchar(50) default NULL,
  `record_date` varchar(50) default NULL,
  `lastmodi_id` varchar(50) default NULL,
  `lastmodi_date` varchar(50) default NULL,
  `company_id` int(11) default NULL,
  PRIMARY KEY  (`oa_chat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for oa_desktop_set
-- ----------------------------
CREATE TABLE `oa_desktop_set` (
  `oa_desktop_id` int(11) NOT NULL auto_increment,
  `oa_desktop_empid` varchar(50) default NULL,
  `oa_desktop_type` int(11) default NULL,
  `oa_desktop_isshow` int(11) default NULL,
  `oa_desktop_value` varchar(50) default NULL,
  `company_id` int(11) default NULL,
  `record_id` varchar(50) default NULL,
  `record_date` datetime default NULL,
  `lastmodi_id` varchar(50) default NULL,
  `lastmodi_date` datetime default NULL,
  PRIMARY KEY  (`oa_desktop_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for oa_forms
-- ----------------------------
CREATE TABLE `oa_forms` (
  `oa_form_id` int(11) NOT NULL auto_increment,
  `oa_form_name` varchar(100) default NULL,
  `oa_form_type` int(11) default NULL,
  `oa_form_text` longtext,
  `oa_form_emp` varchar(50) default NULL,
  `oa_form_time` varchar(20) default NULL,
  `oa_form_acce` longtext,
  `record_id` varchar(50) default NULL,
  `record_date` datetime default NULL,
  `lastmodi_id` varchar(50) default NULL,
  `lastmodi_date` datetime default NULL,
  `company_id` int(11) default NULL,
  PRIMARY KEY  (`oa_form_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for oa_forums
-- ----------------------------
CREATE TABLE `oa_forums` (
  `oa_forum_id` int(11) NOT NULL auto_increment,
  `oa_forum_name` varchar(30) default NULL,
  `oa_forum_text` longtext,
  `oa_forum_emp` varchar(50) default NULL,
  `oa_forum_admin` varchar(50) default NULL,
  `oa_forum_time` varchar(50) default NULL,
  `oa_forum_image` varchar(50) default NULL,
  `record_id` varchar(50) default NULL,
  `record_date` varchar(50) default NULL,
  `lastmodi_id` varchar(50) default NULL,
  `lastmodi_date` varchar(50) default NULL,
  `company_id` int(11) default NULL,
  PRIMARY KEY  (`oa_forum_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for oa_journals
-- ----------------------------
CREATE TABLE `oa_journals` (
  `journals_id` int(11) NOT NULL auto_increment,
  `journals_type_id` int(11) default NULL,
  `journals_count` varchar(50) default NULL,
  `journals_code` varchar(100) default NULL,
  `journals_context` longtext,
  `journals_face` int(11) default '-1',
  `journals_affix` longtext,
  `record_id` varchar(50) default NULL,
  `record_date` datetime default NULL,
  `lastmodi_id` varchar(50) default NULL,
  `lastmodi_date` datetime default NULL,
  `company_id` int(11) default NULL,
  PRIMARY KEY  (`journals_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for oa_journals_type
-- ----------------------------
CREATE TABLE `oa_journals_type` (
  `journals_type_id` int(11) NOT NULL auto_increment,
  `journals_type_name` varchar(200) default NULL,
  `journals_type_proper` longtext,
  `journals_type_press` varchar(200) default NULL,
  `record_id` varchar(50) default NULL,
  `record_date` datetime default NULL,
  `lastmodi_id` varchar(50) default NULL,
  `lastmodi_date` datetime default NULL,
  `company_id` int(11) default NULL,
  PRIMARY KEY  (`journals_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for oa_leaveregistration
-- ----------------------------
CREATE TABLE `oa_leaveregistration` (
  `id` int(11) NOT NULL auto_increment,
  `process_instance_id` varchar(64) default NULL,
  `applyuser` varchar(50) default NULL,
  `leavereason` varchar(2000) default NULL,
  `leavetype` int(11) default NULL,
  `startdata` varchar(20) default NULL,
  `enddata` varchar(20) default NULL,
  `record_id` varchar(50) default NULL,
  `record_date` datetime default NULL,
  `lastmodi_id` varchar(50) default NULL,
  `lastmodi_date` datetime default NULL,
  `company_id` int(11) default NULL,
  `status` int(11) default NULL,
  `applydata` varchar(20) default NULL,
  `reality_start_time` varchar(20) default NULL,
  `reality_end_time` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for oa_mail_emp
-- ----------------------------
CREATE TABLE `oa_mail_emp` (
  `oa_mail_emp_id` int(11) NOT NULL auto_increment,
  `oa_mail_emp_inboxid` int(11) default NULL,
  `oa_mail_emp_empid` varchar(50) default NULL,
  `oa_mail_emp_empname` varchar(50) default NULL,
  `oa_mail_emp_type` int(11) default NULL,
  `oa_mail_emp_isread` int(11) default NULL,
  `oa_mail_emp_status` int(11) default NULL,
  `record_id` varchar(50) default NULL,
  `record_date` datetime default NULL,
  `company_id` int(11) default NULL,
  PRIMARY KEY  (`oa_mail_emp_id`),
  KEY `FK_OA_MAIL_EMP_OA_MAIL_INBOX` (`oa_mail_emp_inboxid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for oa_mail_inbox
-- ----------------------------
CREATE TABLE `oa_mail_inbox` (
  `oa_mail_inbox_id` int(11) NOT NULL auto_increment,
  `oa_mail_inbox_sendid` varchar(50) default NULL,
  `oa_mail_inbox_sendName` varchar(100) default NULL,
  `oa_mail_inbox_senderdep` varchar(50) default NULL,
  `oa_mail_inbox_sendtime` varchar(20) default NULL,
  `oa_mail_inbox_isurgent` int(11) default NULL,
  `oa_mail_inbox_title` varchar(500) default NULL,
  `oa_mail_inbox_content` longtext,
  `oa_mail_inbox_affix` varchar(500) default NULL,
  `oa_mail_inbox_intime` varchar(20) default NULL,
  `oa_mail_receipt` int(11) default NULL,
  `oa_mail_inbox_EmpNames` longtext,
  `oa_mail_inbox_Empids` longtext,
  `oa_mail_inbox_EmpCSNames` longtext,
  `oa_mail_inbox_EmpCSids` longtext,
  `oa_mail_inbox_EmpMSNames` longtext,
  `record_id` varchar(50) default NULL,
  `record_date` datetime default NULL,
  `company_id` int(11) default NULL,
  PRIMARY KEY  (`oa_mail_inbox_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for oa_mail_send
-- ----------------------------
CREATE TABLE `oa_mail_send` (
  `oa_mail_send_id` int(11) NOT NULL auto_increment,
  `oa_mail_send_senderid` varchar(50) default NULL,
  `oa_mail_send_senddep` varchar(50) default NULL,
  `oa_mail_send_empids` longtext,
  `oa_mail_send_empNames` longtext,
  `oa_mail_send_empCSids` longtext,
  `oa_mail_send_empCSNames` longtext,
  `oa_mail_send_empMSids` longtext,
  `oa_mail_send_empMSNames` longtext,
  `oa_mail_receipt` int(11) default NULL,
  `oa_mail_send_time` varchar(20) default NULL,
  `oa_mail_send_savetime` varchar(20) default NULL,
  `oa_mail_send_isurgent` int(11) default NULL,
  `oa_mail_send_title` varchar(500) default NULL,
  `oa_mail_send_content` longtext,
  `oa_mail_send_affix` varchar(500) default NULL,
  `oa_mail_send_type` int(11) default NULL,
  `record_id` varchar(50) default NULL,
  `record_date` datetime default NULL,
  `company_id` int(11) default NULL,
  PRIMARY KEY  (`oa_mail_send_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for oa_meetapply
-- ----------------------------
CREATE TABLE `oa_meetapply` (
  `oa_meetapply_id` int(11) NOT NULL auto_increment,
  `oa_meetapply_name` varchar(200) default NULL,
  `oa_meetapply_emp` varchar(50) default NULL,
  `oa_meetapply_theme` varchar(200) default NULL,
  `oa_meetapply_date` varchar(50) default NULL,
  `oa_meetapply_dep` varchar(500) default NULL,
  `oa_meetapply_empw` longtext,
  `oa_meetapply_empn` longtext,
  `oa_meetapply_summary` longtext,
  `oa_meetapply_room` int(11) default NULL,
  `oa_meetapply_star` varchar(50) default NULL,
  `oa_meetapply_end` varchar(50) default NULL,
  `oa_meetapply_res` varchar(500) default NULL,
  `oa_meetapply_type` int(11) default NULL,
  `oa_meetapply_status` int(11) default NULL,
  `oa_meetapply_describe` varchar(2000) default NULL,
  `oa_meetapply_affix` varchar(50) default NULL,
  `oa_meetapply_awoke` varchar(50) default NULL,
  `oa_meetapply_degree` int(11) default NULL,
  `record_id` varchar(50) default NULL,
  `record_date` varchar(50) default NULL,
  `lastmodi_id` varchar(50) default NULL,
  `lastmodi_date` varchar(50) default NULL,
  `company_id` int(11) default NULL,
  PRIMARY KEY  (`oa_meetapply_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for oa_netdisk_config
-- ----------------------------
CREATE TABLE `oa_netdisk_config` (
  `id` int(11) NOT NULL auto_increment,
  `hrm_employee_id` varchar(50) default NULL,
  `used_space` double default NULL,
  `total_space` int(11) default NULL,
  `RECORD_ID` varchar(50) default NULL,
  `RECORD_DATE` datetime default NULL,
  `LASTMODI_ID` varchar(50) default NULL,
  `LASTMODI_DATE` datetime default NULL,
  `COMPANY_ID` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for oa_netdisk_share
-- ----------------------------
CREATE TABLE `oa_netdisk_share` (
  `id` int(11) NOT NULL auto_increment,
  `hrm_employee_id` varchar(50) default NULL,
  `folder_name` varchar(255) default NULL,
  `folder_path` varchar(5000) default NULL,
  `netdisk_emps` longtext,
  `netdisk_deps` longtext,
  `share_desc` longtext,
  `record_id` varchar(50) default NULL,
  `record_date` datetime default NULL,
  `lastmodi_id` varchar(50) default NULL,
  `lastmodi_date` datetime default NULL,
  `company_id` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for oa_netmail_inbox
-- ----------------------------
CREATE TABLE `oa_netmail_inbox` (
  `oa_netmail_inbox_id` int(11) NOT NULL auto_increment,
  `oa_netmail_inbox_sender` varchar(200) default NULL,
  `oa_netmail_inbox_time` varchar(50) default NULL,
  `oa_netmail_inbox_title` varchar(1000) default NULL,
  `oa_netmail_inbox_content` longtext,
  `oa_netmail_set_from` varchar(200) default NULL,
  `oa_netmail_inbox_affix` varchar(500) default NULL,
  `oa_netmail_inbox_other` varchar(1000) default NULL,
  `oa_netmail_inbox_empid` varchar(50) default NULL,
  `record_id` varchar(50) default NULL,
  `record_date` varchar(20) default NULL,
  `company_id` int(11) default NULL,
  `oa_netmail_isread` int(11) default NULL,
  `oa_netmail_urgent` int(11) default NULL,
  `oa_netmail_type` int(11) default NULL,
  `oa_netmail_messageId` varchar(500) default NULL,
  `oa_netmail_setid` varchar(100) default NULL,
  `oa_netmail_replysign` int(11) default NULL,
  PRIMARY KEY  (`oa_netmail_inbox_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for oa_netmail_person
-- ----------------------------
CREATE TABLE `oa_netmail_person` (
  `oa_netmail_empid` int(11) NOT NULL auto_increment,
  `oa_netmail_empname` varchar(50) default NULL,
  `oa_netmail_empmail` varchar(100) default NULL,
  `hrm_employee_id` varchar(50) default NULL,
  `company_id` int(11) default NULL,
  `oa_netmail_date` varchar(20) default NULL,
  PRIMARY KEY  (`oa_netmail_empid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for oa_netmail_sendbox
-- ----------------------------
CREATE TABLE `oa_netmail_sendbox` (
  `oa_netmail_sendid` int(11) NOT NULL auto_increment,
  `oa_netmail_set_from` varchar(100) default NULL,
  `oa_netmail_send_time` varchar(20) default NULL,
  `oa_netmail_send_adders` longtext,
  `oa_netmail_send_empids` longtext,
  `oa_netmail_send_isurgent` int(11) default NULL,
  `oa_netmail_send_title` varchar(100) default NULL,
  `oa_netmail_send_content` longtext,
  `oa_netmail_send_affix` varchar(500) default NULL,
  `oa_netmail_send_type` int(11) default NULL,
  `record_id` varchar(50) default NULL,
  `record_date` datetime default NULL,
  `company_id` int(11) default NULL,
  `oa_netmail_send_empid` varchar(50) default NULL,
  `oa_netmail_receipt` int(11) default NULL,
  PRIMARY KEY  (`oa_netmail_sendid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for oa_netmail_set
-- ----------------------------
CREATE TABLE `oa_netmail_set` (
  `oa_netmail_id` int(11) NOT NULL auto_increment,
  `oa_netmail_name` varchar(50) default NULL,
  `oa_netmail_from` varchar(100) default NULL,
  `oa_netmail_smtp` varchar(100) default NULL,
  `oa_netmail_smtpprot` varchar(10) default NULL,
  `oa_netmail_pop3` varchar(100) default NULL,
  `oa_netmail_pop3prot` varchar(10) default NULL,
  `oa_netmail_isssl` int(11) default '2',
  `oa_netmail_user` varchar(100) default NULL,
  `oa_netmail_password` varchar(100) default NULL,
  `oa_netmail_isverify` varchar(10) default NULL,
  `hrm_employee_id` varchar(50) default NULL,
  `company_id` int(11) default NULL,
  `record_id` varchar(50) default NULL,
  `record_date` datetime default NULL,
  `lastmodi_id` varchar(50) default NULL,
  `lastmodi_date` datetime default NULL,
  `oa_netmail_issend` int(11) default NULL,
  `oa_netmail_isaccp` int(11) default NULL,
  `oa_netmail_isdefault` int(11) default '2',
  `oa_netmail_count` int(11) default NULL,
  PRIMARY KEY  (`oa_netmail_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for oa_netmail_uid
-- ----------------------------
CREATE TABLE `oa_netmail_uid` (
  `oa_mail_id` int(11) NOT NULL auto_increment,
  `oa_mail_uid` varchar(100) default NULL,
  `oa_mail_set_id` varchar(100) default NULL,
  `oa_mail_time` varchar(20) default NULL,
  `oa_mail_empId` varchar(50) default NULL,
  `company_id` int(11) default NULL,
  PRIMARY KEY  (`oa_mail_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for oa_notebook
-- ----------------------------
CREATE TABLE `oa_notebook` (
  `oa_notebook_id` int(11) NOT NULL auto_increment,
  `oa_notebook_context` varchar(500) default NULL,
  `oa_notebook_creattime` varchar(50) default NULL,
  `oa_notebook_emp` varchar(50) default NULL,
  `company_id` int(11) default NULL,
  PRIMARY KEY  (`oa_notebook_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for oa_notice
-- ----------------------------
CREATE TABLE `oa_notice` (
  `oa_noti_id` int(11) NOT NULL auto_increment,
  `oa_noti_name` varchar(200) default NULL,
  `oa_noti_type` int(11) default NULL,
  `oa_noti_emp` varchar(50) default NULL,
  `oa_noti_time` varchar(50) default NULL,
  `oa_obj_emp` longtext,
  `oa_obj_dep` longtext,
  `oa_noti_text` longtext,
  `oa_noti_status` int(11) default NULL,
  `oa_noti_acce` varchar(50) default NULL,
  `record_id` varchar(50) default NULL,
  `record_date` varchar(50) default NULL,
  `lastmodi_id` varchar(50) default NULL,
  `lastmodi_date` varchar(50) default NULL,
  `company_id` int(11) default NULL,
  PRIMARY KEY  (`oa_noti_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for oa_photo
-- ----------------------------
CREATE TABLE `oa_photo` (
  `photo_id` int(11) NOT NULL auto_increment,
  `photo_name` varchar(50) default NULL,
  `photo_time` varchar(20) default NULL,
  `photo_desc` longtext,
  `album_id` int(11) default NULL,
  `image_id` int(11) default NULL,
  `record_id` varchar(50) default NULL,
  `record_date` datetime default NULL,
  `lastmodi_id` varchar(50) default NULL,
  `lastmodi_date` datetime default NULL,
  `company_id` int(11) default NULL,
  PRIMARY KEY  (`photo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for oa_posts
-- ----------------------------
CREATE TABLE `oa_posts` (
  `oa_post_id` int(11) NOT NULL auto_increment,
  `oa_post_name` varchar(100) default NULL,
  `oa_post_text` longtext,
  `oa_post_forum` int(11) default NULL,
  `oa_post_emp` varchar(50) default NULL,
  `oa_post_time` varchar(50) default NULL,
  `oa_post_lastregter` varchar(50) default NULL,
  `oa_last_reg_emp` varchar(50) default NULL,
  `oa_read_count` int(11) default NULL,
  `oa_is_post` int(11) default NULL,
  `oa_post_reg` int(11) default NULL,
  `oa_is_boutique` int(11) default NULL,
  `record_id` varchar(50) default NULL,
  `record_date` varchar(50) default NULL,
  `last_modi_id` varchar(50) default NULL,
  `last_modi_date` varchar(50) default NULL,
  `company_id` int(11) default NULL,
  PRIMARY KEY  (`oa_post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for oa_regulations
-- ----------------------------
CREATE TABLE `oa_regulations` (
  `oa_regulations_id` int(11) NOT NULL auto_increment,
  `oa_regulations_title` varchar(100) default NULL,
  `oa_regulations_type` int(11) default NULL,
  `oa_regulations_emp` varchar(50) default NULL,
  `oa_regulations_time` varchar(20) default NULL,
  `oa_regulations_attachs` longtext,
  `record_id` varchar(50) default NULL,
  `record_date` datetime default NULL,
  `lastmodi_id` varchar(50) default NULL,
  `lastmodi_date` datetime default NULL,
  `company_id` int(11) default NULL,
  `oa_regulations_status` int(11) default NULL,
  `oa_regulations_starttime` varchar(20) default NULL,
  `oa_regulations_context` longtext,
  PRIMARY KEY  (`oa_regulations_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for oa_sms_inbox
-- ----------------------------
CREATE TABLE `oa_sms_inbox` (
  `oa_sms_inbox_id` int(11) NOT NULL auto_increment,
  `oa_sms_inbox_senderId` varchar(100) default NULL,
  `oa_sms_inbox_sender_name` varchar(400) default NULL,
  `oa_sms_inbox_sendTime` varchar(20) default NULL,
  `oa_sms_inbox_content` longtext,
  `oa_sms_inbox_emp` varchar(100) default NULL,
  `oa_sms_inbox_isread` int(11) default NULL,
  `oa_sms_type` int(11) default NULL,
  `record_id` varchar(100) default NULL,
  `record_date` datetime default NULL,
  `company_id` int(11) default NULL,
  PRIMARY KEY  (`oa_sms_inbox_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for oa_sms_send
-- ----------------------------
CREATE TABLE `oa_sms_send` (
  `oa_sms_send_id` int(11) NOT NULL auto_increment,
  `oa_sms_send_emp` varchar(100) default NULL,
  `oa_sms_send_acpemp` longtext,
  `oa_sms_send_acpemp_name` longtext,
  `oa_sms_send_time` varchar(20) default NULL,
  `oa_sms_type` int(11) default NULL,
  `oa_sms_send_content` longtext,
  `record_id` varchar(100) default NULL,
  `record_date` datetime default NULL,
  `company_id` int(11) default NULL,
  PRIMARY KEY  (`oa_sms_send_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for oa_summary
-- ----------------------------
CREATE TABLE `oa_summary` (
  `id` int(11) NOT NULL auto_increment,
  `oa_summary_name` varchar(200) default NULL,
  `oa_summary_recorder` varchar(50) default NULL,
  `oa_summary_date` varchar(50) default NULL,
  `oa_summary_meet_id` int(11) default NULL,
  `oa_summary_reader` longtext,
  `oa_summary_neirong` varchar(500) default NULL,
  `oa_summary_content` longtext,
  `record_id` varchar(50) default NULL,
  `record_date` varchar(50) default NULL,
  `lastmodi_id` varchar(50) default NULL,
  `lastmodi_date` varchar(50) default NULL,
  `company_id` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for oa_tools
-- ----------------------------
CREATE TABLE `oa_tools` (
  `oa_tool_id` int(11) NOT NULL auto_increment,
  `oa_tool_type` int(11) default NULL,
  `oa_tool_text` varchar(20) default NULL,
  `oa_tool_emp` varchar(50) default NULL,
  `oa_tool_image` varchar(50) default NULL,
  `oa_tool_imageid` int(11) default NULL,
  `oa_tool_path` varchar(1000) default NULL,
  `record_id` varchar(50) default NULL,
  `record_date` varchar(50) default NULL,
  `lastmodi_id` varchar(50) default NULL,
  `lastmodi_date` varchar(50) default NULL,
  `company_id` int(11) default NULL,
  PRIMARY KEY  (`oa_tool_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for oa_trsvel
-- ----------------------------
CREATE TABLE `oa_trsvel` (
  `id` int(11) NOT NULL auto_increment,
  `process_instance_id` varchar(64) default NULL,
  `trsvel_area` varchar(100) default NULL,
  `trsvel_begindata` varchar(20) default NULL,
  `trsvel_enddata` varchar(20) default NULL,
  `trsvel_cause` longtext,
  `trsvel_applyuser` varchar(50) default NULL,
  `record_id` varchar(50) default NULL,
  `record_date` datetime default NULL,
  `lastmodi_id` varchar(50) default NULL,
  `lastmodi_date` datetime default NULL,
  `company_id` int(11) default NULL,
  `applydata` varchar(20) default NULL,
  `status` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for oa_vote
-- ----------------------------
CREATE TABLE `oa_vote` (
  `oa_vote_id` int(11) NOT NULL auto_increment,
  `oa_vote_name` varchar(200) default NULL,
  `oa_vote_emp` varchar(50) default NULL,
  `oa_vote_text` longtext,
  `oa_vote_type` int(11) default NULL,
  `oa_choose_type` int(11) default NULL,
  `oa_vote_start` varchar(50) default NULL,
  `oa_vote_end` varchar(50) default NULL,
  `oa_range_dep` longtext,
  `oa_range_emp` longtext,
  `oa_is_anonymous` int(11) default NULL,
  `oa_vote_status` int(11) default NULL,
  `record_id` varchar(50) default NULL,
  `record_date` varchar(50) default NULL,
  `lastmodi_id` varchar(50) default NULL,
  `lastmodi_date` varchar(50) default NULL,
  `company_id` int(11) default NULL,
  PRIMARY KEY  (`oa_vote_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for oa_vote_option
-- ----------------------------
CREATE TABLE `oa_vote_option` (
  `oa_option_id` int(11) NOT NULL auto_increment,
  `oa_vote_id` int(11) default NULL,
  `oa_option_name` varchar(200) default NULL,
  `oa_option_count` int(11) default NULL,
  `record_id` varchar(50) default NULL,
  `record_date` varchar(50) default NULL,
  `lastmodi_id` varchar(50) default NULL,
  `lastmodi_date` varchar(50) default NULL,
  `company_id` int(11) default NULL,
  PRIMARY KEY  (`oa_option_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for oa_vote_status
-- ----------------------------
CREATE TABLE `oa_vote_status` (
  `oa_record_id` int(11) NOT NULL auto_increment,
  `oa_vote_rec` varchar(50) default NULL,
  `oa_vote_emp` varchar(50) default NULL,
  `oa_is_anonymous` int(11) default NULL,
  `record_id` varchar(50) default NULL,
  `record_date` varchar(50) default NULL,
  `lastmodi_id` varchar(50) default NULL,
  `lastmodi_date` varchar(50) default NULL,
  `company_id` int(11) default NULL,
  PRIMARY KEY  (`oa_record_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for oa_ware_type
-- ----------------------------
CREATE TABLE `oa_ware_type` (
  `oa_type_id` int(11) NOT NULL auto_increment,
  `oa_type_name` varchar(50) default NULL,
  `oa_type_text` varchar(500) default NULL,
  `record_id` varchar(50) default NULL,
  `record_date` datetime default NULL,
  `lastmodi_id` varchar(50) default NULL,
  `lastmodi_date` datetime default NULL,
  `company_id` int(11) default NULL,
  `formsorware` int(11) default NULL,
  `premcount` int(11) default NULL,
  PRIMARY KEY  (`oa_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for oa_warehouse
-- ----------------------------
CREATE TABLE `oa_warehouse` (
  `oa_ware_id` int(11) NOT NULL auto_increment,
  `oa_ware_name` varchar(100) default NULL,
  `oa_ware_type` int(11) default NULL,
  `oa_keyword` varchar(100) default NULL,
  `oa_ware_emp` varchar(50) default NULL,
  `oa_ware_text` longtext,
  `oa_ware_time` varchar(20) default NULL,
  `oa_ware_acce` longtext,
  `record_id` varchar(50) default NULL,
  `record_date` datetime default NULL,
  `lastmodi_id` varchar(50) default NULL,
  `lastmodi_date` datetime default NULL,
  `company_id` int(11) default NULL,
  PRIMARY KEY  (`oa_ware_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for oa_waretype_range
-- ----------------------------
CREATE TABLE `oa_waretype_range` (
  `oa_waretype_reange_id` int(11) NOT NULL auto_increment,
  `oa_ware_type_id` int(11) default NULL,
  `hrm_employee_id` varchar(50) default NULL,
  `company_id` int(11) default NULL,
  `range_type` int(11) default NULL,
  PRIMARY KEY  (`oa_waretype_reange_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for oa_work_log
-- ----------------------------
CREATE TABLE `oa_work_log` (
  `oa_worklog_id` int(11) NOT NULL auto_increment,
  `oa_worklog_title` varchar(500) default NULL,
  `oa_worklog_type` int(11) default NULL,
  `oa_worklog_date` varchar(20) default NULL,
  `oa_worklog_range` int(11) default NULL,
  `oa_worklog_deps` longtext,
  `oa_worklog_emps` longtext,
  `oa_worklog_content` longtext,
  `oa_worklog_logger` varchar(50) default NULL,
  `oa_worklog_tankid` longtext,
  `oa_worklog_annexid` longtext,
  `record_id` varchar(50) default NULL,
  `record_date` datetime default NULL,
  `lastmodi_id` varchar(50) default NULL,
  `lastmodi_date` datetime default NULL,
  `company_id` int(11) NOT NULL,
  PRIMARY KEY  (`oa_worklog_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for sys_attachment_info
-- ----------------------------
CREATE TABLE `sys_attachment_info` (
  `attachment_id` int(11) NOT NULL auto_increment,
  `attachment_filename` varchar(500) default NULL,
  `attachment_name` varchar(100) default NULL,
  `attachment_rename` varchar(100) default NULL,
  `attachment_description` varchar(500) default NULL,
  `attachment_remark` varchar(500) default NULL,
  `record_id` varchar(50) default NULL,
  `record_date` datetime default NULL,
  `lastmodi_id` varchar(50) default NULL,
  `lastmodi_date` datetime default NULL,
  `company_id` int(11) default '-1',
  PRIMARY KEY  (`attachment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for sys_column_control
-- ----------------------------
CREATE TABLE `sys_column_control` (
  `column_control_id` int(11) NOT NULL auto_increment,
  `column_code` varchar(100) default NULL,
  `column_name` varchar(100) default NULL,
  `is_show` int(11) default '0',
  `table_name` varchar(50) default NULL,
  `isshow_simple` int(11) default NULL,
  `isshow_advanced` int(11) default NULL,
  `column_strcount` int(11) default '0',
  `priority` int(11) default NULL,
  PRIMARY KEY  (`column_control_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for sys_company_info
-- ----------------------------
CREATE TABLE `sys_company_info` (
  `company_info_id` int(11) NOT NULL auto_increment,
  `province_code` varchar(100) default NULL,
  `district_code` varchar(100) default NULL,
  `company_area` varchar(100) default NULL,
  `company_info_name` varchar(100) default NULL,
  `company_info_shortname` varchar(100) default NULL,
  `company_info_adder` varchar(100) default NULL,
  `company_info_post` varchar(10) default NULL,
  `company_info_employee` varchar(50) default NULL,
  `company_info_employee_position` varchar(50) default NULL,
  `company_info_email` varchar(50) default NULL,
  `company_info_phone` varchar(50) default NULL,
  `company_info_fax` varchar(50) default NULL,
  `company_info_status` int(11) default NULL,
  `company_info_type` int(11) default NULL,
  `company_info_code` varchar(20) default NULL,
  `company_info_sdate` varchar(20) default NULL,
  `company_info_edate` varchar(20) default NULL,
  `company_info_usercount` int(11) default '0',
  `company_info_warehousecount` int(11) default '0',
  `company_info_context` longtext,
  `company_info_regdate` varchar(20) default NULL,
  `company_info_lastdate` varchar(20) default NULL,
  `company_info_login` int(11) default '-1',
  `company_info_title` varchar(100) default NULL,
  `company_info_entitle` varchar(100) default NULL,
  PRIMARY KEY  (`company_info_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for sys_company_methods
-- ----------------------------
CREATE TABLE `sys_company_methods` (
  `company_method_id` int(11) NOT NULL auto_increment,
  `method_info_id` varchar(10) default NULL,
  `company_id` int(11) default NULL,
  PRIMARY KEY  (`company_method_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for sys_component
-- ----------------------------
CREATE TABLE `sys_component` (
  `com_id` varchar(50) NOT NULL,
  `com_input` varchar(50) default NULL COMMENT '普通文本框|1|1|1|1',
  `com_numform` int(11) default NULL COMMENT '数字框|2|2|2|1',
  `com_rmbform` double default NULL COMMENT '金额框|2|2|3|1',
  `com_dateform` varchar(50) default NULL COMMENT '日期框|2|2|4|1',
  `com_select` int(11) default NULL COMMENT '下拉框|2|2|5|1',
  `com_radio` int(11) default NULL COMMENT '单选框|2|2|6|1',
  `com_checkbox` varchar(50) default NULL COMMENT '多选框|2|2|7|1',
  `com_takeform_text` varchar(50) default NULL COMMENT '弹出单选框|2|2|8|1',
  `com_takeform_textarea` varchar(1000) default NULL COMMENT '弹出多选框|2|2|9|1',
  `com_textarea` varchar(1000) default NULL COMMENT '文本域|2|2|10|1',
  `com_fck` text COMMENT '富文本|2|2|11|1',
  `com_uploadimg` int(11) default NULL COMMENT '上传图片|2|2|12|1',
  `com_uploadfile` varchar(500) default NULL COMMENT '上传附件|2|2|13|1',
  `emp_id` varchar(50) default NULL,
  `record_id` varchar(50) default NULL,
  `record_date` varchar(50) default NULL,
  `lastmodi_id` varchar(50) default NULL,
  `lastmodi_date` varchar(50) default NULL,
  PRIMARY KEY  (`com_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
CREATE TABLE `sys_config` (
  `config_id` int(11) NOT NULL auto_increment,
  `method_id` varchar(50) default NULL,
  `project_name` varchar(100) default NULL,
  `project_egname` varchar(200) default NULL,
  `project_view` varchar(200) default NULL,
  PRIMARY KEY  (`config_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for sys_exception
-- ----------------------------
CREATE TABLE `sys_exception` (
  `exception_id` int(11) NOT NULL auto_increment,
  `user_id` int(11) default NULL,
  `company_id` int(11) default '-1',
  `exception_date` datetime default NULL,
  `exception_msg` text,
  `exception_class` varchar(200) default NULL,
  `exception_context` longtext,
  `process_name` varchar(50) default NULL,
  `process_date` varchar(20) default NULL,
  `process_context` longtext,
  `exception_status` int(11) default NULL,
  PRIMARY KEY  (`exception_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for sys_help
-- ----------------------------
CREATE TABLE `sys_help` (
  `help_id` int(11) NOT NULL auto_increment,
  `help_keyword` varchar(50) default NULL,
  `help_title` varchar(200) default NULL,
  `help_context` longtext,
  `help_date` varchar(20) default NULL,
  `method_code` varchar(20) default NULL,
  `find_sign` varchar(20) default NULL,
  PRIMARY KEY  (`help_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for sys_image_info
-- ----------------------------
CREATE TABLE `sys_image_info` (
  `image_info_id` int(11) NOT NULL auto_increment,
  `image_info_filename` varchar(500) default NULL,
  `image_info_filepath` varchar(500) default NULL,
  `image_info_name` varchar(100) default NULL,
  `image_info_rename` varchar(100) default NULL,
  `image_info_description` varchar(500) default NULL,
  `image_info_remark` varchar(200) default NULL,
  `record_id` varchar(50) default NULL,
  `record_date` datetime default NULL,
  `lastmodi_id` varchar(50) default NULL,
  `lastmodi_date` datetime default NULL,
  `company_id` int(11) default '-1',
  PRIMARY KEY  (`image_info_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for sys_library_info
-- ----------------------------
CREATE TABLE `sys_library_info` (
  `library_id` int(11) NOT NULL auto_increment,
  `library_info_code` varchar(20) default NULL,
  `library_info_name` varchar(50) default NULL,
  `library_info_engname` varchar(100) default NULL,
  `library_info_upcode` varchar(20) default NULL,
  `library_info_isedit` int(11) NOT NULL default '1',
  `library_info_isvalid` int(11) default '1',
  `library_info_desc` varchar(500) default NULL,
  PRIMARY KEY  (`library_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for sys_library_standard
-- ----------------------------
CREATE TABLE `sys_library_standard` (
  `library_id` int(11) NOT NULL auto_increment,
  `library_code` varchar(20) default NULL,
  `library_name` varchar(50) default NULL,
  `library_upcode` varchar(20) default NULL,
  `library_stand_code` int(11) default NULL,
  `library_desc` varchar(500) default NULL,
  PRIMARY KEY  (`library_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
CREATE TABLE `sys_log` (
  `log_id` int(11) NOT NULL auto_increment,
  `user_id` int(11) default NULL,
  `log_date` datetime default NULL,
  `log_detail` varchar(500) default NULL,
  `company_id` int(11) default '-1',
  `request_addr` varchar(20) default NULL,
  PRIMARY KEY  (`log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for sys_log_runtime
-- ----------------------------
CREATE TABLE `sys_log_runtime` (
  `id` int(11) NOT NULL auto_increment,
  `class_name` varchar(255) default NULL COMMENT '类名|2|2|1|2',
  `method_name` varchar(100) default NULL COMMENT '方法名|2|2|1|2',
  `create_time` varchar(20) default NULL COMMENT '生成时间|2|1|1|2',
  `log_level` varchar(20) default NULL COMMENT '日志级别|2|1|1|2',
  `msg` text COMMENT '运行信息|2|2|1|2',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for sys_method_btn
-- ----------------------------
CREATE TABLE `sys_method_btn` (
  `btn_id` int(11) NOT NULL auto_increment,
  `btn_name` varchar(50) default NULL,
  `btn_img` varchar(50) default NULL COMMENT '提示图标',
  `btn_fun` varchar(50) default NULL,
  `btn_desc` varchar(255) default NULL COMMENT '提示内容',
  `method_id` varchar(10) default NULL COMMENT '功能模块ID',
  `priority` int(11) default NULL,
  PRIMARY KEY  (`btn_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='功能模块操作提示';

-- ----------------------------
-- Table structure for sys_method_help
-- ----------------------------
CREATE TABLE `sys_method_help` (
  `help_id` int(11) NOT NULL auto_increment,
  `help_img` varchar(255) default NULL,
  `help_desc` varchar(255) default NULL,
  `method_id` varchar(10) default NULL,
  `priority` int(11) default NULL,
  PRIMARY KEY  (`help_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for sys_method_info
-- ----------------------------
CREATE TABLE `sys_method_info` (
  `method_info_id` varchar(20) NOT NULL COMMENT '功能编号',
  `method_info_name` varchar(20) default NULL COMMENT '功能名称',
  `method_info_engname` varchar(50) default NULL COMMENT '功能英文',
  `method_uri` varchar(500) default NULL COMMENT '请求路径',
  `method_no` int(11) default NULL COMMENT '功能序号',
  `image_src` varchar(100) default NULL COMMENT '图标',
  `method_level` int(11) default NULL COMMENT '功能层级',
  `level_unit` varchar(20) default NULL COMMENT '功能上级编号',
  `is_action` int(11) default '1' COMMENT '是否有效',
  `method_sign` varchar(20) default NULL COMMENT '顶级模块标识',
  `is_default` int(11) default '0' COMMENT '否是默认',
  `default_page` varchar(100) default NULL COMMENT '默认页面',
  `method_msg` varchar(1000) default NULL COMMENT '备注',
  `method_pages` varchar(1000) default NULL COMMENT '功能模块包含的页面',
  PRIMARY KEY  (`method_info_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='功能模块表';

-- ----------------------------
-- Table structure for sys_method_shortcut
-- ----------------------------
CREATE TABLE `sys_method_shortcut` (
  `id` int(11) NOT NULL auto_increment,
  `method_id` varchar(20) default NULL,
  `emp_id` varchar(50) default NULL,
  `company_id` int(11) default NULL,
  `auto_open` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for sys_msg
-- ----------------------------
CREATE TABLE `sys_msg` (
  `msg_id` int(11) NOT NULL auto_increment,
  `msg_title` varchar(200) default NULL,
  `msg_context` longtext,
  `msg_date` varchar(50) default NULL,
  `msg_vsdate` varchar(50) default NULL,
  `msg_vedate` varchar(50) default NULL,
  `msg_person` varchar(50) default NULL,
  PRIMARY KEY  (`msg_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for sys_param
-- ----------------------------
CREATE TABLE `sys_param` (
  `param_id` int(11) NOT NULL auto_increment,
  `param_index` varchar(50) default NULL,
  `param_title` varchar(100) default NULL,
  `param_value` varchar(50) default NULL,
  `param_remark` varchar(500) default NULL,
  `record_id` varchar(50) default NULL,
  `record_date` datetime default NULL,
  `lastmodi_id` varchar(50) default NULL,
  `lastmodi_date` datetime default NULL,
  `company_id` int(11) default NULL,
  `param_type` int(11) default NULL,
  `param_type_value` varchar(500) default NULL,
  PRIMARY KEY  (`param_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for sys_process_config
-- ----------------------------
CREATE TABLE `sys_process_config` (
  `process_id` varchar(50) NOT NULL,
  `process_type_id` varchar(50) default NULL,
  `process_desc` varchar(1000) default NULL,
  `start_page` varchar(255) default NULL,
  `handle_page` varchar(255) default NULL,
  `detail_page` varchar(255) default NULL,
  PRIMARY KEY  (`process_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for sys_process_type
-- ----------------------------
CREATE TABLE `sys_process_type` (
  `type_id` varchar(50) NOT NULL,
  `type_name` varchar(100) default NULL COMMENT '分类名称|1|2|1|1',
  `type_desc` varchar(500) default NULL COMMENT '分类描述|2|2|10|2',
  `type_priority` int(11) default NULL,
  `record_id` varchar(50) default NULL,
  `record_date` datetime default NULL,
  `lastmodi_id` varchar(50) default NULL,
  `lastmodi_date` datetime default NULL,
  PRIMARY KEY  (`type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
CREATE TABLE `sys_role` (
  `role_id` int(11) NOT NULL auto_increment,
  `role_name` varchar(100) default NULL,
  `role_desc` varchar(500) default NULL,
  `record_id` varchar(50) default NULL,
  `record_date` datetime default NULL,
  `lastmodi_id` varchar(50) default NULL,
  `lastmodi_date` datetime default NULL,
  `company_id` int(11) default NULL,
  PRIMARY KEY  (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for sys_role_bind
-- ----------------------------
CREATE TABLE `sys_role_bind` (
  `bind_id` int(11) NOT NULL auto_increment,
  `bind_type` int(11) default NULL,
  `role_id` int(11) default NULL,
  `company_id` int(11) default NULL,
  `bind_value` varchar(100) default NULL,
  PRIMARY KEY  (`bind_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for sys_role_btn
-- ----------------------------
CREATE TABLE `sys_role_btn` (
  `role_btn_id` int(11) NOT NULL auto_increment,
  `role_id` int(11) default NULL COMMENT '角色ID',
  `btn_id` int(11) default NULL COMMENT '功能模块ID',
  `company_id` int(11) default NULL,
  PRIMARY KEY  (`role_btn_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色功能明细表';

-- ----------------------------
-- Table structure for sys_role_detail
-- ----------------------------
CREATE TABLE `sys_role_detail` (
  `role_detail_id` int(11) NOT NULL auto_increment,
  `role_id` int(11) default NULL,
  `method_id` varchar(10) default NULL,
  `company_id` int(11) default NULL,
  PRIMARY KEY  (`role_detail_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for sys_user_btns
-- ----------------------------
CREATE TABLE `sys_user_btns` (
  `user_btn_id` int(11) NOT NULL auto_increment,
  `user_id` int(11) default NULL COMMENT '用户ID',
  `user_btn_detail` longtext COMMENT '用户的功能模块',
  `company_id` int(11) default '-1',
  PRIMARY KEY  (`user_btn_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户对应的功能模块表';

-- ----------------------------
-- Table structure for sys_user_group
-- ----------------------------
CREATE TABLE `sys_user_group` (
  `group_id` int(11) NOT NULL auto_increment,
  `group_name` varchar(100) default NULL,
  `group_decp` varchar(500) default NULL,
  `record_id` varchar(50) default NULL,
  `record_date` datetime default NULL,
  `lastmodi_id` varchar(50) default NULL,
  `lastmode_date` datetime default NULL,
  `company_id` int(11) default NULL,
  PRIMARY KEY  (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for sys_user_group_detail
-- ----------------------------
CREATE TABLE `sys_user_group_detail` (
  `group_detail_id` int(11) NOT NULL auto_increment,
  `user_id` int(11) default NULL,
  `group_id` int(11) default NULL,
  `company_id` int(11) default NULL,
  PRIMARY KEY  (`group_detail_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for sys_user_info
-- ----------------------------
CREATE TABLE `sys_user_info` (
  `user_id` int(11) NOT NULL auto_increment,
  `hrm_employee_id` varchar(50) default NULL,
  `user_name` varchar(100) default NULL,
  `userpassword` varchar(100) default NULL,
  `user_action` int(11) default NULL,
  `record_id` varchar(50) default NULL,
  `record_date` datetime default NULL,
  `lastmodi_id` varchar(50) default NULL,
  `lastmodi_date` datetime default NULL,
  `company_id` int(11) default '-1',
  `user_type` int(11) default '1',
  PRIMARY KEY  (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for sys_user_methods
-- ----------------------------
CREATE TABLE `sys_user_methods` (
  `user_method_id` int(11) NOT NULL auto_increment,
  `user_id` int(11) default NULL,
  `user_method_detail` longtext,
  `company_id` int(11) default '-1',
  PRIMARY KEY  (`user_method_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for sys_user_view
-- ----------------------------
CREATE TABLE `sys_user_view` (
  `view_id` int(11) NOT NULL auto_increment,
  `user_id` int(11) default NULL,
  `view_isdown` int(11) default NULL,
  `dept_id` int(11) default NULL,
  `part_post_isview` int(11) default NULL,
  `add_dept_view` varchar(500) default NULL,
  `record_id` varchar(50) default NULL,
  `record_date` datetime default NULL,
  `lastmodi_id` varchar(50) default NULL,
  `lastmodi_date` datetime default NULL,
  `company_id` int(11) default NULL,
  PRIMARY KEY  (`view_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records 
-- ----------------------------
INSERT INTO `ACT_GE_BYTEARRAY` VALUES ('2502', '1', 'leave.bpmn', '2501', 0x3C3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D225554462D38223F3E0A3C646566696E6974696F6E7320786D6C6E733D22687474703A2F2F7777772E6F6D672E6F72672F737065632F42504D4E2F32303130303532342F4D4F44454C2220786D6C6E733A7873693D22687474703A2F2F7777772E77332E6F72672F323030312F584D4C536368656D612D696E7374616E63652220786D6C6E733A7873643D22687474703A2F2F7777772E77332E6F72672F323030312F584D4C536368656D612220786D6C6E733A61637469766974693D22687474703A2F2F61637469766974692E6F72672F62706D6E2220786D6C6E733A62706D6E64693D22687474703A2F2F7777772E6F6D672E6F72672F737065632F42504D4E2F32303130303532342F44492220786D6C6E733A6F6D6764633D22687474703A2F2F7777772E6F6D672E6F72672F737065632F44442F32303130303532342F44432220786D6C6E733A6F6D6764693D22687474703A2F2F7777772E6F6D672E6F72672F737065632F44442F32303130303532342F44492220747970654C616E67756167653D22687474703A2F2F7777772E77332E6F72672F323030312F584D4C536368656D61222065787072657373696F6E4C616E67756167653D22687474703A2F2F7777772E77332E6F72672F313939392F585061746822207461726765744E616D6573706163653D22687474703A2F2F7777772E65617A797465632E636F6D2F61637469766974692F6C65617665223E0A20203C70726F636573732069643D226C6561766522206E616D653D22E8AFB7E58187E6B581E7A88B2220697345786563757461626C653D2274727565223E0A202020203C646F63756D656E746174696F6E3EE8AFB7E58187E6B581E7A88BE6BC94E7A4BA3C2F646F63756D656E746174696F6E3E0A202020203C73746172744576656E742069643D2273746172746576656E743122206E616D653D225374617274222061637469766974693A696E69746961746F723D226170706C79557365724964223E3C2F73746172744576656E743E0A202020203C757365725461736B2069643D227375626D69744F724D6F6469667922206E616D653D22E68F90E4BAA42FE4BFAEE694B9E794B3E8AFB7222061637469766974693A61737369676E65653D22247B6170706C795573657249647D223E3C2F757365725461736B3E0A202020203C73657175656E6365466C6F772069643D22666C6F77312220736F757263655265663D2273746172746576656E743122207461726765745265663D227375626D69744F724D6F64696679223E3C2F73657175656E6365466C6F773E0A202020203C757365725461736B2069643D22646570744C6561646572417564697422206E616D653D22E983A8E997A8E9A286E5AFBCE5AEA1E689B9222061637469766974693A61737369676E65653D22247B646570744C656164657249647D223E3C2F757365725461736B3E0A202020203C73657175656E6365466C6F772069643D22666C6F77322220736F757263655265663D227375626D69744F724D6F6469667922207461726765745265663D22646570744C65616465724175646974223E3C2F73657175656E6365466C6F773E0A202020203C6578636C7573697665476174657761792069643D226578636C7573697665676174657761793122206E616D653D224578636C75736976652047617465776179223E3C2F6578636C7573697665476174657761793E0A202020203C73657175656E6365466C6F772069643D22666C6F77332220736F757263655265663D22646570744C6561646572417564697422207461726765745265663D226578636C75736976656761746577617931223E3C2F73657175656E6365466C6F773E0A202020203C757365725461736B2069643D226872417564697422206E616D653D22E4BABAE4BA8BE5AEA1E689B9222061637469766974693A63616E64696461746547726F7570733D226872223E3C2F757365725461736B3E0A202020203C73657175656E6365466C6F772069643D22666C6F77342220736F757263655265663D226578636C7573697665676174657761793122207461726765745265663D2268724175646974223E0A2020202020203C636F6E646974696F6E45787072657373696F6E207873693A747970653D2274466F726D616C45787072657373696F6E223E3C215B43444154415B247B646570744C6561646572506173737D5D5D3E3C2F636F6E646974696F6E45787072657373696F6E3E0A202020203C2F73657175656E6365466C6F773E0A202020203C6578636C7573697665476174657761792069643D226578636C7573697665676174657761793222206E616D653D224578636C75736976652047617465776179223E3C2F6578636C7573697665476174657761793E0A202020203C73657175656E6365466C6F772069643D22666C6F77352220736F757263655265663D226872417564697422207461726765745265663D226578636C75736976656761746577617932223E3C2F73657175656E6365466C6F773E0A202020203C656E644576656E742069643D22656E646576656E743122206E616D653D22456E64223E0A2020202020203C657874656E73696F6E456C656D656E74733E0A20202020202020203C61637469766974693A657865637574696F6E4C697374656E6572206576656E743D22656E64222064656C656761746545787072657373696F6E3D22247B6C6561766546696E69736850726F636573736F727D223E3C2F61637469766974693A657865637574696F6E4C697374656E65723E0A2020202020203C2F657874656E73696F6E456C656D656E74733E0A202020203C2F656E644576656E743E0A202020203C73657175656E6365466C6F772069643D22666C6F77362220736F757263655265663D226578636C7573697665676174657761793222207461726765745265663D22656E646576656E7431223E0A2020202020203C636F6E646974696F6E45787072657373696F6E207873693A747970653D2274466F726D616C45787072657373696F6E223E3C215B43444154415B247B6872506173737D5D5D3E3C2F636F6E646974696F6E45787072657373696F6E3E0A202020203C2F73657175656E6365466C6F773E0A202020203C73657175656E6365466C6F772069643D22666C6F77372220736F757263655265663D226578636C7573697665676174657761793222207461726765745265663D227375626D69744F724D6F64696679223E0A2020202020203C636F6E646974696F6E45787072657373696F6E207873693A747970653D2274466F726D616C45787072657373696F6E223E3C215B43444154415B247B216872506173737D5D5D3E3C2F636F6E646974696F6E45787072657373696F6E3E0A202020203C2F73657175656E6365466C6F773E0A202020203C73657175656E6365466C6F772069643D22666C6F77382220736F757263655265663D226578636C7573697665676174657761793122207461726765745265663D227375626D69744F724D6F64696679223E0A2020202020203C636F6E646974696F6E45787072657373696F6E207873693A747970653D2274466F726D616C45787072657373696F6E223E3C215B43444154415B247B21646570744C6561646572506173737D5D5D3E3C2F636F6E646974696F6E45787072657373696F6E3E0A202020203C2F73657175656E6365466C6F773E0A20203C2F70726F636573733E0A20203C62706D6E64693A42504D4E4469616772616D2069643D2242504D4E4469616772616D5F6C65617665223E0A202020203C62706D6E64693A42504D4E506C616E652062706D6E456C656D656E743D226C65617665222069643D2242504D4E506C616E655F6C65617665223E0A2020202020203C62706D6E64693A42504D4E53686170652062706D6E456C656D656E743D2273746172746576656E7431222069643D2242504D4E53686170655F73746172746576656E7431223E0A20202020202020203C6F6D6764633A426F756E6473206865696768743D2233352E30222077696474683D2233352E302220783D22302E302220793D2231302E30223E3C2F6F6D6764633A426F756E64733E0A2020202020203C2F62706D6E64693A42504D4E53686170653E0A2020202020203C62706D6E64693A42504D4E53686170652062706D6E456C656D656E743D227375626D69744F724D6F64696679222069643D2242504D4E53686170655F7375626D69744F724D6F64696679223E0A20202020202020203C6F6D6764633A426F756E6473206865696768743D2235352E30222077696474683D223130352E302220783D2238302E302220793D22302E30223E3C2F6F6D6764633A426F756E64733E0A2020202020203C2F62706D6E64693A42504D4E53686170653E0A2020202020203C62706D6E64693A42504D4E53686170652062706D6E456C656D656E743D22646570744C65616465724175646974222069643D2242504D4E53686170655F646570744C65616465724175646974223E0A20202020202020203C6F6D6764633A426F756E6473206865696768743D2235352E30222077696474683D223130352E302220783D223233302E302220793D22302E30223E3C2F6F6D6764633A426F756E64733E0A2020202020203C2F62706D6E64693A42504D4E53686170653E0A2020202020203C62706D6E64693A42504D4E53686170652062706D6E456C656D656E743D226578636C75736976656761746577617931222069643D2242504D4E53686170655F6578636C75736976656761746577617931223E0A20202020202020203C6F6D6764633A426F756E6473206865696768743D2234302E30222077696474683D2234302E302220783D223338302E302220793D22382E30223E3C2F6F6D6764633A426F756E64733E0A2020202020203C2F62706D6E64693A42504D4E53686170653E0A2020202020203C62706D6E64693A42504D4E53686170652062706D6E456C656D656E743D2268724175646974222069643D2242504D4E53686170655F68724175646974223E0A20202020202020203C6F6D6764633A426F756E6473206865696768743D2235352E30222077696474683D223130352E302220783D223436352E302220793D22312E30223E3C2F6F6D6764633A426F756E64733E0A2020202020203C2F62706D6E64693A42504D4E53686170653E0A2020202020203C62706D6E64693A42504D4E53686170652062706D6E456C656D656E743D226578636C75736976656761746577617932222069643D2242504D4E53686170655F6578636C75736976656761746577617932223E0A20202020202020203C6F6D6764633A426F756E6473206865696768743D2234302E30222077696474683D2234302E302220783D223631352E302220793D22392E30223E3C2F6F6D6764633A426F756E64733E0A2020202020203C2F62706D6E64693A42504D4E53686170653E0A2020202020203C62706D6E64693A42504D4E53686170652062706D6E456C656D656E743D22656E646576656E7431222069643D2242504D4E53686170655F656E646576656E7431223E0A20202020202020203C6F6D6764633A426F756E6473206865696768743D2233352E30222077696474683D2233352E302220783D223730302E302220793D2231322E30223E3C2F6F6D6764633A426F756E64733E0A2020202020203C2F62706D6E64693A42504D4E53686170653E0A2020202020203C62706D6E64693A42504D4E456467652062706D6E456C656D656E743D22666C6F7731222069643D2242504D4E456467655F666C6F7731223E0A20202020202020203C6F6D6764693A776179706F696E7420783D2233352E302220793D2232372E30223E3C2F6F6D6764693A776179706F696E743E0A20202020202020203C6F6D6764693A776179706F696E7420783D2238302E302220793D2232372E30223E3C2F6F6D6764693A776179706F696E743E0A2020202020203C2F62706D6E64693A42504D4E456467653E0A2020202020203C62706D6E64693A42504D4E456467652062706D6E456C656D656E743D22666C6F7732222069643D2242504D4E456467655F666C6F7732223E0A20202020202020203C6F6D6764693A776179706F696E7420783D223138352E302220793D2232372E30223E3C2F6F6D6764693A776179706F696E743E0A20202020202020203C6F6D6764693A776179706F696E7420783D223233302E302220793D2232372E30223E3C2F6F6D6764693A776179706F696E743E0A2020202020203C2F62706D6E64693A42504D4E456467653E0A2020202020203C62706D6E64693A42504D4E456467652062706D6E456C656D656E743D22666C6F7733222069643D2242504D4E456467655F666C6F7733223E0A20202020202020203C6F6D6764693A776179706F696E7420783D223333352E302220793D2232372E30223E3C2F6F6D6764693A776179706F696E743E0A20202020202020203C6F6D6764693A776179706F696E7420783D223338302E302220793D2232382E30223E3C2F6F6D6764693A776179706F696E743E0A2020202020203C2F62706D6E64693A42504D4E456467653E0A2020202020203C62706D6E64693A42504D4E456467652062706D6E456C656D656E743D22666C6F7734222069643D2242504D4E456467655F666C6F7734223E0A20202020202020203C6F6D6764693A776179706F696E7420783D223432302E302220793D2232382E30223E3C2F6F6D6764693A776179706F696E743E0A20202020202020203C6F6D6764693A776179706F696E7420783D223436352E302220793D2232382E30223E3C2F6F6D6764693A776179706F696E743E0A2020202020203C2F62706D6E64693A42504D4E456467653E0A2020202020203C62706D6E64693A42504D4E456467652062706D6E456C656D656E743D22666C6F7735222069643D2242504D4E456467655F666C6F7735223E0A20202020202020203C6F6D6764693A776179706F696E7420783D223537302E302220793D2232382E30223E3C2F6F6D6764693A776179706F696E743E0A20202020202020203C6F6D6764693A776179706F696E7420783D223631352E302220793D2232392E30223E3C2F6F6D6764693A776179706F696E743E0A2020202020203C2F62706D6E64693A42504D4E456467653E0A2020202020203C62706D6E64693A42504D4E456467652062706D6E456C656D656E743D22666C6F7736222069643D2242504D4E456467655F666C6F7736223E0A20202020202020203C6F6D6764693A776179706F696E7420783D223635352E302220793D2232392E30223E3C2F6F6D6764693A776179706F696E743E0A20202020202020203C6F6D6764693A776179706F696E7420783D223730302E302220793D2232392E30223E3C2F6F6D6764693A776179706F696E743E0A2020202020203C2F62706D6E64693A42504D4E456467653E0A2020202020203C62706D6E64693A42504D4E456467652062706D6E456C656D656E743D22666C6F7737222069643D2242504D4E456467655F666C6F7737223E0A20202020202020203C6F6D6764693A776179706F696E7420783D223633352E302220793D2234392E30223E3C2F6F6D6764693A776179706F696E743E0A20202020202020203C6F6D6764693A776179706F696E7420783D223633342E302220793D223130312E30223E3C2F6F6D6764693A776179706F696E743E0A20202020202020203C6F6D6764693A776179706F696E7420783D223133322E302220793D223130312E30223E3C2F6F6D6764693A776179706F696E743E0A20202020202020203C6F6D6764693A776179706F696E7420783D223133322E302220793D2235352E30223E3C2F6F6D6764693A776179706F696E743E0A2020202020203C2F62706D6E64693A42504D4E456467653E0A2020202020203C62706D6E64693A42504D4E456467652062706D6E456C656D656E743D22666C6F7738222069643D2242504D4E456467655F666C6F7738223E0A20202020202020203C6F6D6764693A776179706F696E7420783D223430302E302220793D2234382E30223E3C2F6F6D6764693A776179706F696E743E0A20202020202020203C6F6D6764693A776179706F696E7420783D223339392E302220793D2239342E30223E3C2F6F6D6764693A776179706F696E743E0A20202020202020203C6F6D6764693A776179706F696E7420783D223133322E302220793D2239342E30223E3C2F6F6D6764693A776179706F696E743E0A20202020202020203C6F6D6764693A776179706F696E7420783D223133322E302220793D2235352E30223E3C2F6F6D6764693A776179706F696E743E0A2020202020203C2F62706D6E64693A42504D4E456467653E0A202020203C2F62706D6E64693A42504D4E506C616E653E0A20203C2F62706D6E64693A42504D4E4469616772616D3E0A3C2F646566696E6974696F6E733E, '0');
INSERT INTO `ACT_GE_BYTEARRAY` VALUES ('2503', '1', 'leave.png', '2501', 0x89504E470D0A1A0A0000000D494844520000030F0000016B0802000000184422E400001D6349444154789CEDDD7D8C5D679D1FF0C90B605011AEB42DA1FF3055916289361E6D56B2F9A731958AA752958C2882D9FDC38C1425585A355855C58E5A395E1552572AE9684B226F5BC2A8555613AD4C2D2D645D48C02D4E70139218426048E2CD7893B00349C069DE6EFC129F3E33D7B9BEBE2FBFFBE29939E799F97CF4C8BA737DCF9973CEEF39CFF3BD6F67468A0DAF56ABCDCDCD4D4E4EEED8B16374747464A34AFB9E8EC0C4C4C4ECECECA953A7CA2ECB0054B02EDF0A0254DC48D91B50B2C3870FA739264DB4F7DE7BEF030F3EF8EC891367CE9EDD982DED7B3A02070F1EDCB56B573A2669C62DBB387D51C1DC2B88B85F27EE53651B372DA5B3716A6A6AE7CE9DCFBFF0FC99B367B4E6F6D2CB2FA519371D9CC5C5C5B20BD5950AE65E410A715FDC27131B342DA589766C6CECEBF7FCB733674F6BDDDAB7BEFDAD6DDBB62D2C2C945DAE0E5430F70A22EE8BFB646483A6A534482D4FB46F6B717BE0C1EFDE70C33F2EBB5C1DA860EE15DCE0C47D719FBC6CC4B474F8F0E19D3B3F75F65C4DEBA77DE98FFEF51D777CB9ECA25D420573AF20E2BEB84F5E365C5AAAD56AA3A3A32FBCB870F6DC5B5A3FEDF5377EBB75EB75F3F3F36597EE0215CCBD8288FBE23ED9D97069697676363DAB3B7BEECD46FBE4F83FEFF32B1BCD4B6DA876C71DFF6E7A7ABAECD25DA082B957708313F7C57D72B4E1D2D2C4C4C4C16FCE9D3DF746BD7DF2533BFFA6284EBE533C73B6F8D9E9E2C7A78B1FBD7E6EE69BDFFBCE8BAF3E72A6F8BFB5E2915A71F4CDE2BB6F177F72F4C95B777FA1B1E0866A8F3DFEC3B1B1B1B24B77810AE65EC10D4EDC17F7C9D1864B4B5BB66C79EAA9271AB3481A805E2F8A37CE17AF9E2B7E73A678B328FED5BFB97DE4CABFB5FD53132F9E2D9E3F5D3CFF76B1502B9E3D57FCF90F7FBC3C5A953FF3AD7D7BFD8D57366DDA5476E92E50C1DC2B38B4FA97C872BF128FB83F4413F7295D5F69A956AB1D3A7468DFBE7DE93CDFF1AEF1F1F174CFDCDC5C5E83D7E6CD9B5F7EE5C5B3E75EAFB7347DBEF94E71FA9DA5FF3A777EE9DFBFB8FF7FFDBD7FF00FFFED57BE7AAE285E3B57BC7AB6F8CDD922EDE1771FFDC9F25CFBFAC66C69DFCB2D5C830AE65EC1E1A471E6861B6EF8FA3DF7A4C127AF31A785B83F4413F7295D8F013485A4948A52374D392965A38307BFF9C083DFABB76F7DFBFEBD7B6F9F9C9C4CB3D7F6EDDB73B992D8F270F35AA3A51FDF3857BCF25671E69D0B0F485DF93F7DED4FBFFC1FBFF6FC2F97AEF371F67C7166790E7EF8B11FB72CBBA15A75E65A15CCBD8243A847A51F3DF6F899B3E7D2BF590726715FDCCFB7F76E645DFBDFF1E3C7EB17A14FA9288D50713BFAD0C3BB767D7E6C6CECC891236BB8F1C3581E6EFE5FA32DCDB5EF142FBD59FCEAF5E26C519C397D7ACBB5D78E8C5C3532B2E933BFBFAB79C11F3DFE44CBB21BAA5567A852C1DC2B38A8E6A8546F590726715FDCCFB7F7F629783F6A767636D32B8E76EE7FFBF7EF4FD1E78107BFD7332735B7D4095287D8BD7B773A526BBC1BFD5B1E6E5E6DB4FA13BB3454FDF2B5E2D76F173F7AEAAF3EFCE10F5F75F57BDFFFA1DF99FC834BE6DA471F7BBC65D90DD5AA3354A960EE151C487B54CA3D3089FBE27EBEBDB7A714925242EAF97D8514300E1C3850E5A8D0AEB5FFA5AD9F9C9C9C9E9E1E282735B7BBEEBE3BF583CA86C7E5E1E654A3A51FDF3A5FFCA6B63454BDF476F1E0A3F3FF68EBF5BFF377FEEE8736FFED3FFDEF7FFE7651BC7EBA78F3F4D282478F3DDAB2EC866AD519AA5430F70AF6AF5B54CA7ACA11F7C5FD7C7B6FE0C89123DBB76FEFF3DB9D75A3A3A3295D95BDE1FDBAA4FFA5A894F6766E6E6EE8A8D478632EADA79A97AB4F153A77EEB78D563F03D374FBEAD9E2B767D28075F6E12717B6FEEEEF7DF29FFEB35F9F2E7E552B7E5D2B5E395DA4D9F6E8238FB62CBBA15A75862A15CCBD827D8AA352BE538EB82FEEE7DB7B3B4AC9616A6AAAFDD5A32F7DE98F9A3FEB9CDADEBDB7EFDCB9B3E591131313591C844BFADFE4E4E4E547A5463F4881A982AFB32DCF97BF69B41D9FBCE1273F7FE6474FCE1F3B3EFFD0E3F30F3DF1F4C33F39F1FD477EF6C3279FFB3F8F3FFD83C77FF1D013BF38F6E3A79F7CE6AFEFFE2FF77CF6739F6D5E7643B5EA0C552A987B05FBD14F54CA74CA11F7C5FD7C7B6FBBC5C5C59697946EBBED8BCF9E3811ECF54B2FBF72D7DD775F73CD35CD2F321D3F7EBCEC5DE9E162FFDBBF7FFFE5BC01D7DE52A84C99B1C47DEB6879B879A5B9FDE11F7EA19FD70CFFC5673ED3B2E0866AD519AA5430F70AF6D47F54CA71CA11F7C5FD7C7B6F8B85858514741A63ECF8F8789C935A32D3DEBDB73796DDB469D3B163C7CADEA1C885FE9762DDD8D8D80A46A57ABBF5D62F1C3870A0DC3D6CD13ED76A79CDB52A987B05638346A5ECA61C717F7D77E062BDC7FD86FA47771AFDF32B77DC314448B8F7DE3F4B39A9BE8614BC2AFB89E7A2919652541A7478EAA73DFFC28B1FFDE868A5DE8F5B1AAADE79591BB45567A852C1DC2B18182E2AE535E588FBEB3B2DADFBB8DF303939D9884A070F7E73E89C90F67DF3E6CDF5F5A48350F66E75B5D4FFEA5FF95BF1A8546FB7DDF6C5999999B277F3A2E5B9F6256DD0569DA14A0573AF6037EDD3CCB7BE7DFFB5D76EE9F6DAFE4B2FBFB275EBD6AFDF734F5E538EB82FEEAF83C09462C365BEAAD4DCD299DE585BA50243B3A5FE972A34E8A595FA6FCFBFF0E235D75C53F66E5EB43C54FD5A1BB45567A852C1DC2BD851C7A8547F89FEA31F1D6D0F4CF5A8541F5EF30A4CE2BEB89F75DCAF1B1B1B6B7C566945A242E3334C293054EAFDA886915498CD9B37AF5254AAB76DDBB655E7D35BCB43D5AFB4415B75862A15CCBD82ED82A854D712989AA352768149DC17F7B38EFBC9DCDC5C7DCBD30E3EFFC28B2B92135E7BFD8DC6B7E4F6ECD953F62E7630323B3B3B3535B5AA69E92B77DC313D3DBD967B956AD9ED6A4FCB43D5A236685BE3A14A0573AF601116B159FB34D33C6EB607A6F6A8D43E6A5779CA11F7C5FDACE37EB1FC7E547DB36FBBED8B2B1815D241A8AF76F3E6CD65EF620723BB77EF3E70E0C0AAA6A5071EFCDE5A7E74EBE9A79FAE1FF10F7EF083070F1E6CDDE1A5A1EA6FB441DB5A0E552A987B057B16B121B8D271E3839FCD53CEE34F3CD1312AB5FF39CB72A71C715FDC5FAF713F6D5563B357EA85A5464B47A9BEE60AFECDD9A5371DFBF9BBB997D35217498760CD76A956AB5D79E595F523FE9EF7BCE7E31FFF78738F4F77BEF3CE2F076A8D455AFA77F0C83E57D8E7223D1FD3E7C60CB1EFCDCBE65BC17E76BF5B955B6ADD4F2DBA1968AB9AB7E7F2CBB7C615EC59C4BA9E573A6E0F4CEF7DEF7BDBA7996E235859538EB82FEEAFE3B83F3B3B5BDFECB4792B9E166EBDF5C2D534D6F8FDA87E8CACD2B5039A5B0ADAA937ACE55EB5E4FAF7BFFFFD37DF7C73FD8363CB53CE8B03B5C622CDCB765B4F3FEB6F594FD36CDAF59EFE57D87EFF4817831E84AC2BD8B2E31D8F433F35ED56BB9EC5EA58DFA02EC18DE1DA1A57302E62D1F7958EDBA79C6641542A71CA59A5B8BF524F0C2EFF31232B1DE5C5FDEAF4DEA25752DCBD7B77FD7F2FFFAB70EDED8107BF575FF9F6EDDBD778AF7B5AFAFCF98ABF98D6DE46967368CF79626D0C31CDC4B3637FBFEEA1994F5C3FF34C34F506BFB76702E8670787D8F7E665F3AD605CD3411FDCB248FB8FF166C7BFB1FD61C18D7C2B38D0958EBB05A69E51A9C4296765E3FED0DDBBCF9E59D7E76356B04F0EBA536B59C1B888C5068EFBE3E3E3F5FF5A8D77A59E3D71A2BEF2D1D1B57B3FAA4F235BB66CF9E9534FAD415A5ACBBDFAD0873ED4E88E13CB52879B9F9F2F2E0C552FF4D93A0D1617FFABFFF52CB567FEF8139FF8E367DE5DB0B178FB9ADB7F45C76DE8B631DD56D56D47FA3F143956B0DBF1693F8CC16A5B1689971A74F3E27A0DBAA9D5A9605CC434CDF47FD592EF1FF9DF575D75554B07BEE28A2BEEB9E71B7DAEA1FED1C9EA84C552D2523F4127DEB660D98E6B5BF19DAA4E053772DC6F5C3B6095DE956AFCD2B5DCDF7E8CACEAC596EA6D8D3FB7D4F80C5A0A82B7DC724BFA776E6EEEE20E2F9DCCCF0FD41A8BB4F4F56E0F6BB95D6FCFCC5CFF89991F34166C5F49FB3A1B8FECF92B3ADEEEB6C2E1DA5AF6DD15AF60FBC18C8F6D3F956D1FFBFA5F4FC7A1B3BD3FB43FF8728AB8C6A34F5CC4E3C78FA7C9E6A5975FE9397A74FC486C5DC72F66775C431AE5D6F86F76AE6CDCBF9CA707DD82F8A5FDAAE4282FEEC7AD5271BF11A4FAFF937003B5C6FAD7B8DC3D8D4C4D4D357F777135DAD1871EDEB66DDB9AEDD2C9932753661F1F1F1F1D1D9D9E9E6E89E4234B27F35F0FD4FA59A4FD312DF7DC7FCBF533CF5CBCBFE57F9B7F6CE99ACDFF1B3CAC6591E6C7F77C589F0721D30A06BBDF7EACFA296EB772F45F9A60C1E0B70C51B5B22AD8B388457F8129884A753D035329516935E2FE10CF0D867B4CD87B572BCA8BFB55EBC341524C87A27EFF2ABD2BD5B8F2C25AEE6F3F96AE32BEB2974C686F298DEDDAF5F9B5DCAB43870ECDCECE76FC48FFF2F97C72A0F6EE5870B2D3F071E1018D7FBBDC337BCBC81FDC1F3EB8DB8FCDF7745BAAE7ED9EBFA29F83906F053BEE4E7C88DA1FDC5EFAF67F07EA511D75EC754357ADC40AC645AC8BA79C8ED34C7A46DE724F30E59432CD14ABF0846DD058DC2DFD871DAFDFF8BE1A515EDCAF54548A9362E325AED578572AED6F7DE515BCE4D2481ACB526F58D5B4B473E7CEC3870F97BDA7172C9DD2E717FA6C1787924BEF0C1EDFF901F7FFFEC8ADB3ED8F695E79FB8D78B5CD3FF6BCDD6170ECFB2034D65076E92E186EE35BF6BD9FC31E54BCA588F1E243D4AECF8E9169059B759B72BA5D93E64FFEF3D73A7E31BBE3B5924B894A75AB1DF77B3E13E8F95B9A1FD072BB9BD58BF2E27E75A252D12B294E4D4DD5B7FCAEBBEF5EF1B4F0D3A79EAAAF7C6C6C6C8DF7BAA7A5FEB7AA1FF47EEDF537D2E8569D3FFBB23CE53C37506B2C52BF7171EC081FDCDCEEBF75E496FB9F6B5949F3222D3FB6AFAA7DB5D1A016AEAADB46F63C086597EE82CBA960FBF1EF768882C3D5DE1FDAFB465C9AE16A37C48E57B3822DDAA79C6E51A9FE91D86E57B269B95672895129367279A9B767260E327AAFCE595A9417F7338AFBFBF7EFAF6FF6AE5D9F5FF1C0F0953BEEA8AF7C727272CD77BA87A5FEB7AA6FC67DF5CE3BD3CACBDECD8B96CFEABF1AA83516A9DF08D6D0E501DF9FF9C4EFCE3CDBE131EF8E3B9DFF2B5E6DFB0382DB9D46C6810F42D9A5BBE0722AD872E4BB1DB7813A40FB823DEF19B4762D5D65882350A90AB66B9F72D240DC32CD347F7BA83D30EDDCB9333D31ABC234D3D3C8E5A5DE419F180CFAC8F6B1A2E96459AD282FEE6714F7E7E7E7EBDB9CF6A271D2AD544B47B2BEF294D5CADED1564BFDAF56AB8D8E8EAEC65597D2A14C9D607171B1ECDDBC68F9AC3E31506B2C52BFD1710DEF8E269D7FECB8B66E8BB7AF2A5E36BEBFE3360F7710CA2EDD05C36DFCA5837E872310AC3628419F6BEB73E51DEF6FDFE6218E40A52AD8511098BA5DE9B831E56414958AA1E2FE10CF0ABAC5F46ECA8DF2E27E5E7D380586FA661F3CF8CD150C0C8D8B2D8D2C5FA3A1ECBD6C75A1FFCDCDCD7DF6739F5BF1B454B517968AC1E7DA96B9AAE3BC1B4C78C13CDAB29E7EE6E66E3365B0011DD739C4745B9DA16AB88D6FB9DDFF810D0A14572A58439FBFB75BED86380295AA60371DA79CF84AC769CAC96B9A2986EAC08376F2CBB97FA0655B86C73E573BF40E965DBAC8C689FBC9F4F4747DCBB76EDDBA822F2FDD78D34DF5D54E4C4C94BD8B1D5CEC7F6943573627FEF4A9A7EA87B2C4DD6BB77C323FAB0DDAAA3354A960EE150CB44F39F115F0D22093D73453AC4E5A8AD7D9F1B9C1D0696935A2FC3A484BC58689FBC5F297E61A57455AA9BF7F72F4A1871B5DA89A47E062FF4BFBBF6DDBB695FAB877FD8DDB674F9C2871DF3A5A3E999FD1066DD519AA5430F70AC6FABF924DCB8093C5345388FBE27EE671BF6E6666A6F1CAD9E55F4A20458546FCDABD7B77D93BD7D925FD6F7E7E3E05A6CBBF4067AAFA8D37DD940275597B1548C5387FFE696DD0569DA14A0573AF604F8306A6BCA619715FDCCFBD0FD76DDFBEBD9E6F52D0B99CD890F262E343F1695595FAA073B3D6FE97AA95B6FBE8430F0FBDE7292CA7C855CDA8545C986B7FA10DDAAA3354A960EE15ECC740D74ACE6B9A11F7C5FDDCFB70DDC2C242E3A35729E50CF767E39E7FE1C54654DAB469D3912347CADEADAE3AF4BFFADF0BDCBBF7F641D3714A885FBDF3CEFADB796BBF277D5A1EAAE6B5415B75862A15CCBD827DEAF35AC9D94D33E2BEB89F7B1F6E48E1A6F161A3947506BD5EE5D1871E6EFEF3BD33333365EF50A473FFABD56A292D5D7BED96947EFAFCC4FBD7EFB9273DFEB6DBBE986ABFC6FB3090E5A1EAE7DAA0AD3A43950AE65EC1FEF5BC56728ED38CB82FEEE7DE879B1D3A74A8F96A085BB76EEDF6A9F69697943EFBB9CF8D34A978542ABAA5A5BAC5C5C53D7BF6A40371E34D37A530D4FE3A5BBAE7DE7BFF2CED737ACCAE5D9F0FAE105F1DCB43D5CFB4415B75862A15CCBD820309AE959CE93423EE8BFBB9F7E116F3F3F38D3FB5DBC84C7BF7DEDEFEA5B11492EEBAFBEE9D3B77363F38E5872ABF01D7D0BBFFD56AB5141EA7A6A6C6C6C6462E95EE999C9C9C9B9BABE085A4BAD9B469D35B6F3D7EFEFC53DA40AD3A43950AE65EC14175BC5672BED38CB82FEEE7DE87DBA50CB06FDFBE34388F74B26DDBB66EFF952244653FD6DD22CBFE77394647479F7BEE3BA54F5DD9B5EA0C552A987B0587D03CE5E43ECD88FB1BAD03AFB3B81F48B9A7F137777B4A47E0D8B163656FF20072ED7F431B1F1FFFCBC307CE173FD5FA6F3F9FFF8B2D5BB6945DBA0B5430F70A0EA73EE53C7BE244EED38CB8BFD1D252B1BEE27E4FB55A6D6E6EAEE3FB51A9F34F4C4C1C38702097D7939A65DCFF86B37FFFFEE9E99BCF174F6AFDB76FCC7E3975FDB24B77810AE65EC1A1DD78E38D69B4CD7D9A11F7C5FDDCFBF0C6B4E1D2D2C2C2C2962D7FFFADDAA3E78B9F687DB689897F72E8D0A1B24B77810AE65EC1A165FDEA4283B82FEE97BD210C633D8C3E83DAB7647751FC58EBA7CDCDFD87C9C9F1B28B760915CCBD82C3591F6949DC17F7C9D1462C5EAD56DBB1E3F78E1DFB1F45715C8BDBE2E2835BB68C9E3AF583B28B760915CCBD82C35937938DB82FEE939D0D5ABCF9F9F9B1B16BE7E7FF67513CA1756B8B8B0FA45072E4C87F2DBB5C1DA860EE151CC2BA996CC47D719FEC6CDCE21D3B762C4DB7FBF7FFCBA2785C6B6F870EDD9906A92A4FB42A987B0507B59E261B715FDC272F1BBA78E919DEF4F4D48E1DD7CFCEEE5B5CFC4E513CA69D3A75646EEEDF4F4E7E6A626247BA5D76897A50C1DC2B38907536D988FBE23E1951BCA5BF0B383535D5FCB7FD36B2CD9B37D7AFCF5E765906A082CD72AC609F46D6DD6423EE8BFBE442F12AE4631FFB58D99B00D5B55E271B71BF99B84F35295E557CE31BDF48E7D2C99327CBDE10A828930D59D381B3A6785571F5D557A773E9BAEBAE2B7B43A0A24C36644D07CE9AE255C2A73FFDE9FAABD0575E79E57DF7DD57F6E64015996CC89A0E9C35C52BDFC993279BDFB6FFC0073E50F6164115996CC89A0E9C35C52BDF473EF291E6B474D55557DD7CF3CD656F14548EC986ACE9C05953BC92B5BCB0D4084CA74E9D2A7BD3A05A4C36644D07CE9AE2956CD7AE5DF584F4BEF7BDAF9196D2ED999999B2370DAAC56443D674E0AC295EC9EEBAEBAE2BAEB8E2EAABAF4EFFD63FE55D272D410B930D59D381B3A678E5BBEFBEFB8E1E3D5ABC7B2EA5DBBE1607ED4C36644D07CE9AE255887309024E10B2A603674DF12AC4B90401270859D381B3A67815E25C82801384ACE9C05953BC0A712E41C00942D674E0AC295E85389720E004216B3A70D614AF429C4B10708290351D386B8A5721CE25083841C89A0E9C35C5AB10E712049C20644D07CE9AE255887309024E10B2A603674DF12AC4B90401270859D381B3A67815E25C82801384ACE9C05953BC0A712E41C00942D674E0AC295E85389720E004216B3A70D614AF429C4B10708290351D386B8A5721E95CAAD56A656F055494C986ACE9C05953BC0A49E7D2C2C242D95B011565B2216B3A70D614AF42D2B974FCF8F1B2B702AA687171F19A6BAE297B2B6078D252D614AF42D2B974E4C891B2B702AA686161617474B4ECAD80E1494B5953BC0A49E7D2ECEC6CD95B015574F8F0E1F1F1F1B2B70286272D654DF12A249D4B535353656F0554D1BE65656F050C4F5ACA9AE255483A97B66CD952F65640158D8F8F1F3E7CB8ECAD80E1494B5953BC0AD9B469D375D75DE783DED0627171717474D4F535C89AB49435C5AB90341FECDDBB77CF9E3D656F0854CBCCCC8CF382DC494B5953BC0A191B1B7BE4914752664ACFA4CBDE16A88A5AADE6A420772E81913B69A94276ECD8716459BA51F6B640554C4D4DF9AE28B973098CDC494B15D29815F6EDDBE77D072896DF83DBBD7B77D95B0197CB253072272D55488A4A8D2B084C4F4FA753EBD4A953E56E1294A556ABA5D34154627D70098CDC494B15323F3FDF7C0581F45C647474349D603EB1C186929E24CCCCCCA4CEEF0D38D60D97C0C89DB4542D636363CD571048D3464A4B69DA48675ABAE1EFA2B08EA5EEBD7FFFFE898989D4E1F7ECD9E34902EB864B60AC03D252B574FCA6743AC7D29392949676ECD83102EB54EADED3D3D3870E1DF20634EB8C4B60AC03D252B5F8B234C07A62545F1FA4A5CA7105018075C32530D60769A98A5C4100601D70098C75435AAA28571000C8974B60AC33D25275B9820040765C02635D92962ACD150400B2E01218EB9BB49401571000A83897C058DFA425008088B40400109196000022D2120040445A020088484B00001169090020222D010044A425008088B40400109196000022D2120040445A020088484B00001169090020222D010044A425008088B40400109196000022D2120040445A020088484B00001169090020222D010044A425008088B40400109196000022D2120040445A020088484B00001169090020222D010044A425008088B40400109196000022D2120040445A020088484B00001169090020222D010044A425008088B40400109196000022D2120040445A020088484B00001169090020222D010044A425008088B40400109196000022D2120040445A020088484B00001169090020222D010044A425008088B40400109196000022D2120040445A020088484B00001169090020222D010044A425008088B40400109196000022D2120040445A020088484B00001169090020222D010044A425008088B40400109196000022D2120040445A020088484B00001169090020222D010044A425008088B40400109196000022D2120040445A020088484B00001169090020222D010044A425008088B40400109196000022D2120040445A020088484B00001169090020222D010044A425008088B40400109196000022D2120040445A020088484B00001169090020222D010044A425008088B40400109196000022D2120040445A020088484B00001169090020222D010044A425008088B40400109196000022D2120040445A020088484B00001169090020222D010044A425008088B40400109196000022D2120040445A020088484B00001169090020222D010044A425008088B40400109196000022D2120040445A020088484B00001169090020222D010044A425008088B40400109196000022D2120040445A020088484B00001169090020222D010044A425008088B40400109196000022D2120040445A020088484B00001169090020222D010044A425008088B40400109196000022D2120040445A020088484B00001169090020222D010044A425008088B40400109196000022D2120040445A020088484B00001169090020222D010044A425008088B40400109196000022D2120040445A020088484B00001169090020222D010044A425008088B40400109196000022D2120040445A020088484B00001169090020222D010044A425008088B40400109196000022D2120040445A020088484B00001169090020222D010044A425008088B40400109196000022D2120040445A020088484B00001169090020222D010044A425008088B40400109196000022D2120040445A020088484B00001169090020222D010044A425008088B40400109196000022D2120040445A020088484B00001169090020222D010044A425008088B40400109196000022D2120040445A020088484B00001169090020222D010044A425008088B40400109196000022D2120040445A020088484B00001169090020222D010044A425008088B40400109196000022D2120040445A020088484B00001169090020222D010044A425008088B40400109196000022D2120040445A020088484B00001169090020222D010044A425008088B40400109196000022D2120040445A020088484B00001169090020222D010044A425008088B40400109196000022D2120040445A020088FC7FA920844261C51E5F0000000049454E44AE426082, '0');
INSERT INTO `ACT_GE_BYTEARRAY` VALUES ('2529', '1', 'trsvel.png', '2528', 0x89504E470D0A1A0A0000000D494844520000027900000139080200000063DBA1070000208849444154789CEDDD7F6C1BE77DC771E66795224534AC8BDDA24859F40F0BED12134B01FBAF590ED04803BA95408358DD1F2E81A0898B76A9310CADBA21F1B0C4D3863573BB2C70BBC4155A78E3503815D024D392B8D512DBD16C4796E33A611CBB56623B55623B9167D9A6254A7AF688E75CCE47F27447DDC3C7F7BDF70B5F18347577BAE3C3EFF3E151FC9151588472B95C2C167B7A7A3A3B3BB3D96C26ADF4B1EB5B209FCFF7F7F74F4C4CD81E16A4083DE8A007AF7019DB3B9060838383FAFEAD9B7CEBD6ADCF6FDF7EF8C891E94A259DA58F5DDF02DBB66D5BBB76ADBE4D74B7DB1E1CA4023D480F260559DB0CFDB0B150287475751D3B7E6CBA324D79EBE4A993BADBF58D333E3E6E7BA020163D480F260B591B996EF25C2EF7C496C7A72B5354A37AEAE9A756AC58313636667BB820103D480F260E591B997E345D6DF28B54703DBFFDB955ABFED8F67041207A901E4C1CB2369AC1C1C1AEAE3B2B33652A4C7DE7BB7FB571E343B6070DA2D083F4601291B51194CBE56C367BFCC45865E60215A626CFBDBF7CF96DA552C9F6D041087A901E4C28B23682FEFEFE42A1509939EFD6EAEE2F857C45BE77AD54D5C68D7FD7DBDB6B7BE820043D480F2614591B413E9FDFF664B13273CEA9D57776FD4EA93767D51B15F5EA94DA3FA5F64ECE6C7AF257CF9E38B37B5AFD6F59ED2EAB1DE7D57317D50F771CB877DD7DEE8AA9AA97475ECAE572B6872E799CD7D9F246491F7A901E4C28B236828E8E8E8307F7B9F760FD487952A97373EACC8C7A6F5A9D57EA2FFFFAC1CCD537AEBC337FA2A28E4DA96317D558591D9E513F7F697FF561B5FDAE6B7D4D9E3BDDD6D6667BE8124647ECAA55AB9ED8B2A5B3B393B8F5A207E9C1840A95B5E57279606060C3860DFA4165E707BABBBBF535C562313D73417B7BFBA9D3272A33934EE9D63D3FABA666E77F343337FFEF2F9FF9EF4F7EF60FFFE6E1EFCF287576469DA9A8F72A4ADF3ACFED79A5DAE793E92C7DEC76072E599CA0DDFBF2C8746546FF4BDC7AD183F460401EF5F7F75FB16F295E6000F421E963D08F89F451E923D9B6EDC9E7B7FFCAA9A79E7EE681071EECE9E9D1F7FE952B57A6E1634AAABD7AD62DFDDF7333EAF405353D7B69013D27FEF3A33F7AE89F1E3DF6F6FC7857E6D474B5FF77BDBCDFB76EAA4A529F9BE60D5AA71214B72D18687A30CD3DA8F34827D1827F98CFE5729B376FD6916C7B7F2FD370004647479D4FD7D499EAB67DA3DAB173D7DAB55FD347383434D4C29D6FB56AAFFE9F5BF37D3EAB4E9E57EF4CAA8A52D353531DCB966532D764326D777D75AD77C5BD23FB7CEBA6AA64F4790BD406ADDDB80D9ED1165CC6D02ED18329EC419D2CFA8C6EC194F5CA66B33A9B6DEFF887EA0F405F5F9F0E4E7DF2BA60CAFA66043D53AC5BB7EE4A7B4011976AAF9E712B537DFE4A3FA67EFBAC7AF7A2DA7BF0B74B962CB9E6DAEB6FB8E9E33D7F7E599FEF7979C4B76EAA2AE97DDE1A8D82D662DC060C9CEF47DEFF1A1D6E7A306D3DA8D3A45028F87254C7D377BEF35DEFF3ACBA1E78E0C1AEAE2EDF92FA74F10A794EC83F00FAC07A7A7A7A7B7B23A5ACB7FEF5B1C7F4A470C53E69BE18D55E9D704BFFF7C29C7AAF3CFF98FAE445B57D4FE9D6E5B77FFC0F6EBEA9FDF77EF4D39F5F546A724A9D9F9A5F71C7F01EDFBAA9AAE4F679CB0407ADADB87506AEEE096BA31FD52E19FB2ED183E9E9419D23BED3D9FBEFFF76F51B261AB6C9C953A775062D5DBAD47B823B3A3A6AFB502ECF5A1DB4FAC08AC562D341EB3EA5ACB723EF7338F5B0CDCCBCEF9673F7D5AD7EA6A2DE9FD68FAC2BBB0E8C2DFFA32FACFEE29FBC3BA5DE29AB77CBEAF494D29DBE63F71EDFBAA9AA84F679CB84095A2B711BF2BCB6763173234E0FA6A707758278BF24B1BBBB3B38657D89AB4F73DD75DBDADA868787ED1ECE6503A0CF68171FB4EEA4A0E356D893C9D55E7DCFADCED5AB5E79ED8DBD074AC3A3A59D23A59DFB0EED7AE5C8AF77BFFAD281A32F8C1C7A71E4F59DFB5E1FDE7FE8C01B6F3DF6E32D77AFB9DBBB6EAA2A897DDE32E183B6F571BBE079ADBB580BCE68DDDF450FA6A1079D133FF7EEF4F0C68D4DC4D0D6ADFFAE53D63DBBB5FB6CEB8703D0D7D7B798A78E6B6BDBB627F3F9BCC5638B5DB5CF4F7BEB9BDFBC2FF029B44BBE72D75DBE15535589EBF396891AB42D8EDBDA58AD7B65CBCF6BE941F93DA84FFCDCB1D351B298B3BEF6F676673BBA6B2C1ED1A501181D1DCDE5723106AD53F7DE7BDFE6CD9B2D1E5EBC6AFB9C12D9E7ADD15CD0B6326EC3676D6BCF6BEDDFA51357C9EAC1818181459ED17AEBA9A79F71B7B669D3265B0775690074D036D7F3C175ECF8894F7F3A2BE699E4F93E9F3D4545AD64F5796BD406AD9E11962DEB68F417A993A74E2F5FBEFC892D5B5A19B79970CF21FB96378A1E4C430FEA3C72EE69DDDDDDB12491FBB7DBA54B97DACAA3F90170DE201C7BD03A75FFFDDFB6F850225ED53E3F4945AD64F5790BD40D5AE70F4BFAB1696DDC3A41EB4C16AD8CDB8081737FE48BDEDA0BB1EF92F5FB73122B413D582C169DBBBAEE087DB6164B0C9D9D3CE7BE3279FDFAF5568E6B7E0074BB467D2B6DA4535B7D90568E2D76D53E7F978A5A09EAF31608085A872F6EBD41DBE2B86D226B03AE8C6B97ACDF9F935809EA417D7F76EEE7FA3C2DC624D25DE36CB6BDBDDDCA71657497EADF6D28689D5AB16285F5D75BC7A2DAE7EF50512B417D6E5A6DD07A1F71D7C66D6DD0D63EDE3717B78D9E28AEFB4C72C8E79917BF4BD6EFCF49ACA4F4A0BE1BBB77A1B84E6ADDD26DE56CD9CAE71B669CEF83349AB50F6FDC98A06F4F2C168B8DDE195CEDF3712A6A25A5CF1723E06EE30AF80846F7A592DEB81DD9B7AF6ED0D67E6C6A823E33390C7A50760F068CAFCE23E77EAEEFCFB127D1BDF75E7AC9BA953CCAAC5BB76EF3E6CD46B3F6F9EDBFB2FB62EBF00E1D3AE40CC6C73EF6B16DDBB6F97E5AEDF3DF5151EB8AEA731382EF368E053F82B1366EAFBFFEFA30412B2C6EE941D93D183CBE3A8F9C9F2EFEE5C77593C8D9F8CA952B5B7FE0F32FF40AF3ED028BA9C3478EE807E9AD3FB62694CBE5ABAFBEDA198FEBAEBBEEF39FFFBCF7F197BE7276F6ED262A7845F7A7997A426EA4D1EABE8D84D92BEFFE84FCD50BEE98BD216D85E0BB8D0AFD118CB5711B326825C5ADA11E8CAB5B237574C8055A7350F686F432C1E3ABF3C8F9918954D249E46C3C9BB590471943EFF6F1D6D9C97309FAA662DF1FCF6EB8E1867BEEB9C7799978B5254E44AA9ACC3BE1FBAFBB58A3D51B5DAEDDCE821B0998C7EB6E67C12D87BF116C8FAA7101779B481FC1D8286E170C5A49711B6F0F3671775DB0911BF58E770B01CBB80BC4DB6849E9C180F175DFED632895DC5FDAFAA39E7FBF51EC7F82AE7B84EEABCB122DC64E0EB335DFC2997A2D1D663A08F31B6B170BB810F590658C7E7374D0867F9DFFAF87FEE79A6BAEF16DE1AAABAEDAB2E52721B7E0FCC946F00D6E288D1AB555C81E59B04D0296CCD4EBEED80F2A1177093786C37FF471A472B76F216B3B3A3A7E73F0600BB2B6F5C7D69C9B6EBAC91DF87C95BE8F964A2575E931F5F148E55DC5B9EC5E537BA1D1EAB51BA9BB56D4DDABBBBC7BEC517735F817D91E55E302EE36A3A3A33A6E4F9E3ABD609BD47DD5B1A3EEFB6EEB6E41FFDE2BE15B4D1623DE1E5C4CCF36EA0EAF30BDE9EDE580158D1E94ED51FD50C0F8EA3C72AE37944AEE9BEB5A7FD419A36FAE752A417FAF755F71AE87FCEB5FFFBAFEB7582CBA3FADB6C4B1A8E5ACE5AEEBFBAFEF72DD757D97EB757BD8EDD49D2CBC1B69B470F0F617BC052C8E690B04DF6D54B8B80D085AC782712B23684DF460130DDBC432C19D58DB62C16D18FB41591C53AFE0F1754FBE4DA4926E1067E356DE629B29140ADEB7C69BA81D3B77AD58B1A2F5C7D68437DF7C533FF0E9EEEECE66B3BDBDBDBEBF7B553BE1ADF0D538D5DEF26E2A60B3BE1FB9FF6DB47AC04CBDE08A01BFC5BB8526EACAE9734382EF368EE0B8AD1BB4575D7595EF9A80B89511B42AEE1E6CE2BEDAA825C33797AF716A176B7414E68EEECAE9C1E0F175BF16FE5F1F7B2CF624D2E7CACEC673B95CEB0F7CFEB398E3FD788EDAD259BE76EDD75A7F6CCD191818E8EFEFAFFBF6AF6A27BCB9C87237527BA1D1C2351DFB66EDBFE17F7BE3F9E2B26542EE61C85FDAF2616CB580BB8DAB51DC36FAC08A1FFECBA375DF775BF7431C6504ADC3740F2ED89E0BFE165FBF84E968EF4F7D1D5777B3B11F57CB87B1A180F1EDEBEB736E1C1D19B127D1C31B373A1BEFE9E969F941AB8CF37DBC46B3B6ABAB6B7070B0F5C716BBF94E981B8B54FE3CAB5EE3FEC877A1EEEA75AFA9FD37E416BCFFAD7BD9DDCF907B18F246B03D74578ADAB86D14B4CEAB8E1B7DCC85EF431C25056DB045DE1517BCA306344EB005FBA56ECFD6DD8EA143B33D74A1944A25E776D077FBB393E7E24D22DD7ACEC675D2B7FED0E607C0E8CBA3F4EDA56F35195FF553ED84A391CABB8A73D9BDA6F642F0EAB5ABF8FE5D682E381ABC58A3DF12BC87216F04DB437705A98D5BFD10DE3B10BEB7F7D4C6AD7EF0EA4E43A90A5AD5540F2EA65B232D19DC2F61366EEEE812D483FADCCFB99F2FE66B6B6BCB7D73AD66E54D71F30360F469E4EF3FF288DE78EB0FCC846A27FC36527957712E7BB2ADCE328D5677D76DB4F190D734FABD752F7B7778C15D0DBE116C0FDD9525206E1B7D04A31BB7690E5AD5540F36D1AA8D7AA7F1E3D4A0ED04B75B987563393ADB4317566F6FAF73AB2E5FBE3CC653DB3FFBF2979DCDE6F3792BC7353F00FAA4533F9430F12E5B7D4B7DFAD3D9F1F1712BC716BB6A271C8954353D79A47623019BF5FEC8B758C8AD85DC78DDEB6BF7B9895BC059CBF6D05D71EAC66DF04730EAB84D79D0AAA67A30E45D3496EB6BDBC7D7FEBEE60D5826F603B43D7461E9934EF75DB0717D52E38E9DBBDC5BD856CB5C1A8062B178F79A359CD4066B2E6B6B1B2C4CDFD6EDBDBA9917301D04776FC0EFADFB5B9A9E0B12D4E7AD541BB7C19F95F39B8307531EB4CA4CD6066FB36EC32E2683837B36F6A34B620F6EDAB4C9B991F5A3CFC5BFF9E7F091236E78AF5BB7CED6417D3800FA143BDEE7C7F5D4E03C0960EBD86257ED84C354D44A569FB752F88FB9F0566A8356D183A9E9C1952B573AE9A86372319F21A503C87DEDA1DE94C527593F1C007DE6BE62C58AB85E24E5BCBA52DF46B60ECC846A9FBF4145ADC4F5792B458DDB3407ADA20753D383636363EE6B14744636F7F1C8C78E9F7083569F225BF9DA5AD76503502A9574DC2EFE8328F574A0CF929F7AFA195B4765881EB0B9B94354D44A5C9FB758A40F714C73D02A7A304D3DA8A3D1FDD3954ECAA89F6EB163E72EEF971C6CDAB4C9EEE1F80740B7B17E20A0F7B2E9A0D567C63AB0E505ADBAD4E7AF53512B897DDE62213FC431E541ABE8C194F5E0C0C080F70D6F3A9BC27CDB953E9DBD7BCD9A8C87F5A055B559AB3EF80AB0071E7830EA9F91CE4E9EFBFE238F384F44B7FE485AA0DAE7252A6A25B4CF5B6CC10F712468153D98BE1E2C954AEE1712B889ABE3A9F6CF9D3A62F5B96F57579777611DD5769F3A76D51F8072B9AC0F66D9B20E9D9D21DFE1F4C4962D7AF9FBEFFFB69E145A7C0C2D53EDF3D7A8A895DC3E6FB1800F7124681DF4600A7B509FFE6DD8B0C1FD8A1E1F7D76D7E8473D3D3D57CE3B4E830640EFE5FAF5EBF5E3823FFBF2977594D6FE755A5FB375EBBFEBB375BDCCDAB55F0BFE305801AA7DFE2A15B512DDE72D56F7431C095A173D98DA1ED479E47E33C18274CB0C0F0FDBDEE5CB2C3C00FA1C776060401F642E97F31D8FBE463F7028168B563EF2AAF5F4A3A70B1746E6E60E52914A409FB792376E095A1F7A30E53DA8F348274EDD3CCA66B3F97C7EF3E6CD57CEB9AC979001680D3D96478F3E6BBD6D125762FABC659CB83D7CE40841EB430FD28309C50044D0DDDDFD5F839BE7D46FA8F0F55AE9971D1D1DB6872E7974C4EA5C21687DE8417A30A1C8DA08FAFAFA7A7BEF995307A8F0F593FE870A8582EDA14B246EB75AF4203D9850646D046363631D1D9FB950DE33A75EA142563E7FC7C0C080EDA14B249EF7AB450FD28309453347B361DE3AA5F65361AA58FC879E9E6EDB839654646D5DF4203D9844347334E572B9B3F30BC3C33F536A940AAEF1F1ED1D1DD98989176D0F5A5291B575D183F46012D1CC91954AA55C6E59A9F40BA5F6518D6A7CFC793D210E0DFD9BEDE14A30B2B6117A901E4C1C9AB919C3C3C3BAD5FBFAFE42A911AAB606061ED18FA669F245226B03D083F460B2D0CC4D2A97CBBDBD85CECEDBFBFB378C8F3FABD4CBD4C4C450B1F8F73D3D77E6F39DFAB2ED214A3CB236183D480F2608CDBC284343438542C1FBCD4D69D6DEDEEE7C8E98ED61112243D686400F7AD183572C9A5908DE3F274F86AC05A4A09925D8BD7BB79E9753F2A9D4E941D60262D0CC12DC72CB2D7A5EFED6B7BE657B471027B2161083664EBC1FFCE007CE9F6A3EF1894FF0F1B99290B580183473B24D4C4CB8DF937CFDF5D7DF7EFBEDB6F708B1216B013168E664CBE7F3DE5721DE72CB2DFDFDFDB6770AF1206B013168E604D327B5B52FFAFFD4A73E552E976DEF1A6240D60262D0CC09F6F8E38F3BF97AEBADB7BA59FBB9CF7D6E6868C8F6AE2106642D2006CD9C602FBEF8E28D37DE98CD66DBDBDBF5BCBCB4EAE69B6F266B65206B013168E6641B1D1D1D1B1B531FCCCBFA322F451683AC05C4A09985605E96873105C4A09985605E96873105C4A09985605E96873105C4A09985605E96873105C4A09985605E96873105C4A09985605E96873105C4A09985605E96873105C4A09985605E96873105C4A09985605E96873105C4A09985605E96873105C4A09985605E96873105C4A09985605E96873105C4A09985605E96873105C4A09985605E96873105C4A09985605E96873105C4A09985605E96873105C4A09985605E96873105C4A09985605E96873105C4A09985605E96873105C4A09985605E96873105C4A09985605E96873105C4A09985605E96873105C4A09985605E96873105C4A09985605E96873105C4A09985605E96873105C4A09985605E96873105C4A09985605E96C7E298727702E2454709C1E4284F9831CD2C24CC620B2E63F0208174A08B84604294A7B931ADBB56C0A67C3FF2FE973B1510177A4908A6457962CFDABA27AC8D7EC4A92D10235A48086643799A18D346AB843CAFAD5D8CFB15100B1A4908E64479A28EA9EF54B5765301E7B5DE2D70460BC48E46128239519E4863EA0BCEBA7F855DF04ACE6B01436824219813E5093FA67523B6F67298ACE5BC16308146128239519E3063EA8BC3BA69AA54D8E79023FD6A00E1D151423039CAD3E2D746357A169ABB16B0787491104C88F2D8CDDA802B0144450B09C16C288FE9AC0DF96AE4E6F60480172D2404B3A13C8C292006CD2C04F3B23C8C292006CD2C04F3B23C8C292006CD2C04F3B23C8C292006CD2C04F3B23C8C292006CD2C04F3B23C8C292006CD2C04F3B23C8C292006CD2C04F3B23C8C292006CD2C04F3B23C8C292006CD2C04F3B23C8C292006CD2C04F3B23C8C292006CD2C04F3B23C8C292006CD2C04F3B23C8C292006CD2C04F3B23C8C292006CD2C04F3B23C8C292006CD2C04F3B23C8C292006CD2C04F3B23C8C292006CD2C04F3B23C8C292006CD2C04F3B23C8C292006CD2C04F3B23C8C292006CD2C04F3B23C8C292006CD2C04F3B23C8C292006CD2C04F3B23C8C292006CD2C04F3B23C8C292006CD2C04F3B23C8C292006CD2C04F3B23C8C292006CD2C04F3B23C8C292006CD2C04F3B23C8C292006CD2C04F3B20CC562510F655B5B5B2E97D317962E5DAAFFFDE8473F5A2A956CEF1A80E631410B41D6CAF08B5FFC225363F5EAD5030303B6770D40F398A085206B652897CB1FF9C847BC417BDB6DB7E9B3DB898909DBBB06A0794CD04290B5627CEF7BDFBBF6DA6BDDACFDC637BED1DBDB6B7BA7002C0A13B41064AD244B962C718276CD9A35D96C569FECDADE23008BC2042D04592BC90B2FBC70DD75D7E931EDEEEEE62FB580004CD04290B5C2DC71C71D4ED6DADE11003160821682AC15667C7C5C8F296FF5016460821682AC95873105C4A09985605E8E4BB95C2E168B3D3D3D9D9D9DD96CB6F6DDAE29A18F5DDF02F97CBEBFBF9F771C018BC4042D4486AC8DC3E0E0A0CE181DB45BB76E7D7EFBF6C3478E4C572AE92C7DECFA16D8B66DDBDAB56BF56DA213D7F6E00009C6042D0459BB48FAD4AD50287475751D3B7E6CBA324D79EBE4A9933A71F58D333E3E6E7BA0804462821682AC5D0C1DB4B95CEE892D8F4F57A6A846F5D4D34FAD58B1626C6CCCF67001C9C3042D0459BB18FA8CB61AB417A9E07A7EFB73AB56FDB1EDE1029287095A08B2B6698383835D5D775666CA5498FACE77FF6AE3C6876C0F1A90304CD04290B5CD2997CBD96CF6F889B1CACC052A4C4D9E7B7FF9F2DB78E32F100913B410646D73FAFBFB0B854265E6BC5BABBBBF14F25D31DEB552551B37FE1D5F870044C2042D0459DB9C7C3EBFEDC9FFFC3068EFECFA9D526FCEAA372AEAD529B57F4AED9D9CD9F4E4AF9E3D7166F7B4FADFB2DA5D563BCEABE72EAA1FEE3870EFBAFBACC79E957A79643897CBD91E3A204998A085206B9BD3D1D171F0E0BECACC39A7F4CD38A9D4B939756646BD37ADCE2BF5977FFD60E6EA1B57DE993F5151C7A6D4B18B6AACAC0ECFA89FBFB4BF7A6A7B2E853579EE745B5B9BEDA1039284095A08B2B639EDEDEDA74E9FA8CC4C3AA56FC6F3B36A6A76FE473373F3FFFEF299FFFEE467FFF06F1EFEFE8C526767D4998A7AAFA226947A6ECF2BD5AC9D4C67717F0322A1618460EE6B4E352FCFBAA5FF7B6E469DBEA0A6672F2D303131F1CF8FFEE8A17F7AF4D8DBF31FE3509953D3D50CDEF5F27EDFBAA92AEE6F4024348C106D6D6D7CA37813AA79F97F6ECD67EDAC3A795EBD33A92A4A4D4F4D752C5B96C95C93C9B4DDF5D5B5DE15F78EECF3AD9BAA226B8148681821B2D92C1FE8D3846A5E9E71CB790E599FD7BE7D56BD7B51ED3DF8DB254B965C73EDF537DCF4F19E3FBF2C6BF7BC3CE25B375545D60291D03042E472B9D1D151DB7B913CD5BC9C704BFFF7C29C7AAF3C7F5E7BF2A2DABEA774EBF2DB3FFE0737DFD4FE7B3FFAE9CF2F2A3539A5CE4FCDAFB863788F6FDD5415590B4442C308D1D9D9393434647B2F924767C6CCCCFB6E3911A2E3F64C45BD3FADCF6E2BBB0E8C2DFFA32FACFEE29FBC3BA5DE29AB77CBEAF494D269BB63F71EDFBAA92AB21688848611A25028F0AD674DF0E565E7EA55AFBCF6C6DE03A5E1D1D2CE91D2CE7D8776BD72E4D7BB5F7DE9C0D117460EBD38F2FACE7DAF0FEF3F74E08DB71EFBF196BBD7DC6D3DF3C85A20116818219CCF3FB2BD17C953CDDAF7BCF5CD6FDE17E643A3BE72D75DBE155355642D10090D2344A954EAE8E8B0BD17C953CDDAD354D4226B814868183978795413E6B376F61415B5C85A20121A468E4D9B36AD5FBFDEF65E244C356B4F52518BAC0522A161E470BE1E6E7C7CDCF68E2449356BDFA5A216590B4442C388323434D4D9D9697B2F92A49AB5EF50518BAC0522A161A4D9B06103CF248757CDDA712A6A91B54024348C40BDBDBDDDDDDD131313B6772401C85AB21668011A46A6C1C1C16C36ABCF71F9F36DB06AD6FE2EDEF26EB3EE7B7303160EB9D9802B4D1C51DDDF6B7BE88024A161C4D2E7B53A6B75E2EA735C7D814F70AC4B67C6ECECDBB197BBD9DAED3BD7D406B0EFCA806D86DC60A3EDC47580B6870E48121A46B872B9ACCF7175D67676762EF4514829353B7BC25CB9DB6F74C1FDB77601F7FA48BB6DFA88DCDF62FBAE0D24090D8354AB26D37173E56CDF1390C7DDDF58939DC77D0B84BCECBDB2769BE68ECBF6D0014942C320D5AA81742CDEFA20E72E5D6E74C15DD2778D6F53C1977DABD76EC15091B54024340C52AD9A4C6FC55EEE661B3CFDFBE1328DFE0D58DDBB11EF5AC18BC57E80B6870E48121A06A9D682ACADFBA3DA056AE3B3D1956116AEFBABC95AC0161A06A9560DA437632F77B3CE05CF59A6FF9AC6E7A3976D27CCE5461B317480B6870E48121A06A9361F487363B197BB59E742EDBF8D96AFBDBE611837F85D0B6E33AE03B43D744092D03048B56A201D8DBD3E88C3A3EEBFBE6BDCC5BCCB7B17F32D10E672BD3C8EFFD0DCDF657BE88024A161906AD540FA6DECE56EB676FBDE6B02160BD866EDF5CE8F7C0B183A3477E3B6870E48121A06A9560DA42386CAB771CFE9E687971B3F45BCC0D66AAFF72ED06823311E9AEDA10392848641AA5503E93015B5C85A20121A06A956CDDA37A8A845D60291D0304835B296AC055A808641AAE9CC989B3B44452DB21688848641AA55B3F6752A6A91B54024340C52AD9AB5252A6A91B54024340C52AD9AB5AF51518BAC0522A161906A6D6D6D172EEC9B9B7B958A54642D10090D8354CB66B3478F3E3B3777908A54642D10090D8354EBEEEEFEAFC1CD73EA3754F87AADF4CB8E8E0EDB43072409598B54EBEBEBEBEDBDC77A7A25AB7ED2FF70A150B03D74409290B548B5B1B1B18E8ECF5C28EF9D5307A89095CFDF313030607BE88024216B91761BE6AD9B53AF5061EA3F8AFFD8D3D36D7BD08084216B9176E572B9B3F30BC3C33F536A3F155CE3E3DB3B3A3E3331B1C3F6A0010943D602AA542AE572CB4AA501A546A946A583563F28191A7ADCF67001C943D602F386878775DCF6F5FD8552FBA8DA1A1878A4A3233B34F46FB6070A4824B216B8A45C2EF7F6163A3B6FEFEFFFDBF1F1E7941AA12626FEA758FCFB9E9EAE7CBE535FB63D44405291B5C0658686860A853F5DBAF4F733C864DADB3FD6D373A78E5BDBC302241B590B008059642D00006691B500009845D602006016590B008059642D00006691B500009845D602006016590B008059642D00006691B500009845D602006016590B008059642D00006691B500009845D602006016590B008059642D00006691B500009845D602006016590B008059642D00006691B500009845D602006016590B008059642D00006691B500009845D602006016590B008059642D00006691B500009845D602006016590B008059642D00006691B500009845D602006016590B008059642D00006691B500009845D602006016590B008059642D00006691B500009845D602006016590B008059642D00006691B500009845D602006016590B008059642D00006691B500009845D602006016590B008059642D00006691B500009845D602006016590B008059642D00006691B500009845D602006016590B008059642D00006691B500009845D602006016590B008059642D00006691B500009845D602006016590B008059642D00006691B500009845D602006016590B008059642D00006691B500009845D602006016590B008059642D00006691B500009845D602006016590B008059642D00006691B500009845D602006016590B008059642D00006691B500009845D602006016590B008059642D00006691B500009845D602006016590B008059642D00006691B500009845D602006016590B008059642D00006691B500009845D602006016590B008059642D00006691B500009845D602006016590B008059642D00006691B500009845D602006016590B008059642D00006691B500009845D602006016590B008059642D00006691B500009845D602006016590B008059642D000066FD3F8828824E23AE0FC10000000049454E44AE426082, '0');
INSERT INTO `ACT_GE_BYTEARRAY` VALUES ('2530', '1', 'trsvel.bpmn', '2528', 0x3C3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D225554462D38223F3E0A3C646566696E6974696F6E7320786D6C6E733D22687474703A2F2F7777772E6F6D672E6F72672F737065632F42504D4E2F32303130303532342F4D4F44454C2220786D6C6E733A7873693D22687474703A2F2F7777772E77332E6F72672F323030312F584D4C536368656D612D696E7374616E63652220786D6C6E733A7873643D22687474703A2F2F7777772E77332E6F72672F323030312F584D4C536368656D612220786D6C6E733A61637469766974693D22687474703A2F2F61637469766974692E6F72672F62706D6E2220786D6C6E733A62706D6E64693D22687474703A2F2F7777772E6F6D672E6F72672F737065632F42504D4E2F32303130303532342F44492220786D6C6E733A6F6D6764633D22687474703A2F2F7777772E6F6D672E6F72672F737065632F44442F32303130303532342F44432220786D6C6E733A6F6D6764693D22687474703A2F2F7777772E6F6D672E6F72672F737065632F44442F32303130303532342F44492220747970654C616E67756167653D22687474703A2F2F7777772E77332E6F72672F323030312F584D4C536368656D61222065787072657373696F6E4C616E67756167653D22687474703A2F2F7777772E77332E6F72672F313939392F585061746822207461726765744E616D6573706163653D22687474703A2F2F7777772E61637469766974692E6F72672F74657374223E0A20203C70726F636573732069643D2274727376656C22206E616D653D22E587BAE5B7AEE794B3E8AFB7E6B581E7A88B2220697345786563757461626C653D2274727565223E0A202020203C73746172744576656E742069643D2273746172746576656E743122206E616D653D225374617274222061637469766974693A696E69746961746F723D226170706C79557365724964223E3C2F73746172744576656E743E0A202020203C757365725461736B2069643D22646570744C6561646572417564697422206E616D653D22E983A8E997A8E9A286E5AFBCE5AEA1E689B9222061637469766974693A61737369676E65653D22247B646570744C656164657249647D223E3C2F757365725461736B3E0A202020203C73657175656E6365466C6F772069643D22666C6F77312220736F757263655265663D2273746172746576656E743122207461726765745265663D22646570744C65616465724175646974223E3C2F73657175656E6365466C6F773E0A202020203C6578636C7573697665476174657761792069643D226578636C7573697665676174657761793122206E616D653D224578636C75736976652047617465776179223E3C2F6578636C7573697665476174657761793E0A202020203C73657175656E6365466C6F772069643D22666C6F77322220736F757263655265663D22646570744C6561646572417564697422207461726765745265663D226578636C75736976656761746577617931223E3C2F73657175656E6365466C6F773E0A202020203C757365725461736B2069643D226872417564697422206E616D653D22E4BABAE4BA8BE5BD92E6A1A3222061637469766974693A63616E64696461746547726F7570733D226872223E3C2F757365725461736B3E0A202020203C73657175656E6365466C6F772069643D22666C6F773322206E616D653D22E5908CE6848F2220736F757263655265663D226578636C7573697665676174657761793122207461726765745265663D2268724175646974223E0A2020202020203C636F6E646974696F6E45787072657373696F6E207873693A747970653D2274466F726D616C45787072657373696F6E223E3C215B43444154415B247B646570744C6561646572506173737D5D5D3E3C2F636F6E646974696F6E45787072657373696F6E3E0A202020203C2F73657175656E6365466C6F773E0A202020203C757365725461736B2069643D226D6F646966794170706C7922206E616D653D22E8B083E695B4E794B3E8AFB7222061637469766974693A61737369676E65653D22247B6170706C795573657249647D223E3C2F757365725461736B3E0A202020203C73657175656E6365466C6F772069643D22666C6F773422206E616D653D22E4B88DE5908CE6848F2220736F757263655265663D226578636C7573697665676174657761793122207461726765745265663D226D6F646966794170706C79223E0A2020202020203C636F6E646974696F6E45787072657373696F6E207873693A747970653D2274466F726D616C45787072657373696F6E223E3C215B43444154415B247B21646570744C6561646572506173737D5D5D3E3C2F636F6E646974696F6E45787072657373696F6E3E0A202020203C2F73657175656E6365466C6F773E0A202020203C73657175656E6365466C6F772069643D22666C6F77352220736F757263655265663D226D6F646966794170706C7922207461726765745265663D22646570744C65616465724175646974223E3C2F73657175656E6365466C6F773E0A202020203C656E644576656E742069643D22656E646576656E743122206E616D653D22456E64223E3C2F656E644576656E743E0A202020203C73657175656E6365466C6F772069643D22666C6F77362220736F757263655265663D226872417564697422207461726765745265663D22656E646576656E7431223E3C2F73657175656E6365466C6F773E0A20203C2F70726F636573733E0A20203C62706D6E64693A42504D4E4469616772616D2069643D2242504D4E4469616772616D5F74727376656C223E0A202020203C62706D6E64693A42504D4E506C616E652062706D6E456C656D656E743D2274727376656C222069643D2242504D4E506C616E655F74727376656C223E0A2020202020203C62706D6E64693A42504D4E53686170652062706D6E456C656D656E743D2273746172746576656E7431222069643D2242504D4E53686170655F73746172746576656E7431223E0A20202020202020203C6F6D6764633A426F756E6473206865696768743D2233352E30222077696474683D2233352E302220783D22302E302220793D2231302E30223E3C2F6F6D6764633A426F756E64733E0A2020202020203C2F62706D6E64693A42504D4E53686170653E0A2020202020203C62706D6E64693A42504D4E53686170652062706D6E456C656D656E743D22646570744C65616465724175646974222069643D2242504D4E53686170655F646570744C65616465724175646974223E0A20202020202020203C6F6D6764633A426F756E6473206865696768743D2235352E30222077696474683D223130352E302220783D223130302E302220793D22302E30223E3C2F6F6D6764633A426F756E64733E0A2020202020203C2F62706D6E64693A42504D4E53686170653E0A2020202020203C62706D6E64693A42504D4E53686170652062706D6E456C656D656E743D226578636C75736976656761746577617931222069643D2242504D4E53686170655F6578636C75736976656761746577617931223E0A20202020202020203C6F6D6764633A426F756E6473206865696768743D2234302E30222077696474683D2234302E302220783D223238382E302220793D22372E30223E3C2F6F6D6764633A426F756E64733E0A2020202020203C2F62706D6E64693A42504D4E53686170653E0A2020202020203C62706D6E64693A42504D4E53686170652062706D6E456C656D656E743D2268724175646974222069643D2242504D4E53686170655F68724175646974223E0A20202020202020203C6F6D6764633A426F756E6473206865696768743D2235352E30222077696474683D223130352E302220783D223430302E302220793D22302E30223E3C2F6F6D6764633A426F756E64733E0A2020202020203C2F62706D6E64693A42504D4E53686170653E0A2020202020203C62706D6E64693A42504D4E53686170652062706D6E456C656D656E743D226D6F646966794170706C79222069643D2242504D4E53686170655F6D6F646966794170706C79223E0A20202020202020203C6F6D6764633A426F756E6473206865696768743D2235352E30222077696474683D223130352E302220783D223235362E302220793D223134302E30223E3C2F6F6D6764633A426F756E64733E0A2020202020203C2F62706D6E64693A42504D4E53686170653E0A2020202020203C62706D6E64693A42504D4E53686170652062706D6E456C656D656E743D22656E646576656E7431222069643D2242504D4E53686170655F656E646576656E7431223E0A20202020202020203C6F6D6764633A426F756E6473206865696768743D2233352E30222077696474683D2233352E302220783D223536302E302220793D2231302E30223E3C2F6F6D6764633A426F756E64733E0A2020202020203C2F62706D6E64693A42504D4E53686170653E0A2020202020203C62706D6E64693A42504D4E456467652062706D6E456C656D656E743D22666C6F7731222069643D2242504D4E456467655F666C6F7731223E0A20202020202020203C6F6D6764693A776179706F696E7420783D2233352E302220793D2232372E30223E3C2F6F6D6764693A776179706F696E743E0A20202020202020203C6F6D6764693A776179706F696E7420783D223130302E302220793D2232372E30223E3C2F6F6D6764693A776179706F696E743E0A2020202020203C2F62706D6E64693A42504D4E456467653E0A2020202020203C62706D6E64693A42504D4E456467652062706D6E456C656D656E743D22666C6F7732222069643D2242504D4E456467655F666C6F7732223E0A20202020202020203C6F6D6764693A776179706F696E7420783D223230352E302220793D2232372E30223E3C2F6F6D6764693A776179706F696E743E0A20202020202020203C6F6D6764693A776179706F696E7420783D223238382E302220793D2232372E30223E3C2F6F6D6764693A776179706F696E743E0A2020202020203C2F62706D6E64693A42504D4E456467653E0A2020202020203C62706D6E64693A42504D4E456467652062706D6E456C656D656E743D22666C6F7733222069643D2242504D4E456467655F666C6F7733223E0A20202020202020203C6F6D6764693A776179706F696E7420783D223332382E302220793D2232372E30223E3C2F6F6D6764693A776179706F696E743E0A20202020202020203C6F6D6764693A776179706F696E7420783D223430302E302220793D2232372E30223E3C2F6F6D6764693A776179706F696E743E0A20202020202020203C62706D6E64693A42504D4E4C6162656C3E0A202020202020202020203C6F6D6764633A426F756E6473206865696768743D2231342E30222077696474683D2232342E302220783D223334392E302220793D2231302E30223E3C2F6F6D6764633A426F756E64733E0A20202020202020203C2F62706D6E64693A42504D4E4C6162656C3E0A2020202020203C2F62706D6E64693A42504D4E456467653E0A2020202020203C62706D6E64693A42504D4E456467652062706D6E456C656D656E743D22666C6F7734222069643D2242504D4E456467655F666C6F7734223E0A20202020202020203C6F6D6764693A776179706F696E7420783D223330382E302220793D2234372E30223E3C2F6F6D6764693A776179706F696E743E0A20202020202020203C6F6D6764693A776179706F696E7420783D223330382E302220793D223134302E30223E3C2F6F6D6764693A776179706F696E743E0A20202020202020203C62706D6E64693A42504D4E4C6162656C3E0A202020202020202020203C6F6D6764633A426F756E6473206865696768743D2231342E30222077696474683D2233362E302220783D223332302E302220793D2238392E30223E3C2F6F6D6764633A426F756E64733E0A20202020202020203C2F62706D6E64693A42504D4E4C6162656C3E0A2020202020203C2F62706D6E64693A42504D4E456467653E0A2020202020203C62706D6E64693A42504D4E456467652062706D6E456C656D656E743D22666C6F7735222069643D2242504D4E456467655F666C6F7735223E0A20202020202020203C6F6D6764693A776179706F696E7420783D223235362E302220793D223136372E30223E3C2F6F6D6764693A776179706F696E743E0A20202020202020203C6F6D6764693A776179706F696E7420783D223135322E302220793D223136372E30223E3C2F6F6D6764693A776179706F696E743E0A20202020202020203C6F6D6764693A776179706F696E7420783D223135322E302220793D2235352E30223E3C2F6F6D6764693A776179706F696E743E0A2020202020203C2F62706D6E64693A42504D4E456467653E0A2020202020203C62706D6E64693A42504D4E456467652062706D6E456C656D656E743D22666C6F7736222069643D2242504D4E456467655F666C6F7736223E0A20202020202020203C6F6D6764693A776179706F696E7420783D223530352E302220793D2232372E30223E3C2F6F6D6764693A776179706F696E743E0A20202020202020203C6F6D6764693A776179706F696E7420783D223536302E302220793D2232372E30223E3C2F6F6D6764693A776179706F696E743E0A2020202020203C2F62706D6E64693A42504D4E456467653E0A202020203C2F62706D6E64693A42504D4E506C616E653E0A20203C2F62706D6E64693A42504D4E4469616772616D3E0A3C2F646566696E6974696F6E733E, '0');
INSERT INTO `ACT_GE_PROPERTY` VALUES ('next.dbid', '5001', '3');
INSERT INTO `ACT_GE_PROPERTY` VALUES ('schema.history', 'create(5.16)', '1');
INSERT INTO `ACT_GE_PROPERTY` VALUES ('schema.version', '5.16', '1');
INSERT INTO `ACT_HI_ACTINST` VALUES ('2509', 'leave:1:2504', '2505', '2505', 'startevent1', null, null, 'Start', 'startEvent', null, '2015-05-12 15:24:02', '2015-05-12 15:24:02', '28', '');
INSERT INTO `ACT_HI_ACTINST` VALUES ('2511', 'leave:1:2504', '2505', '2505', 'submitOrModify', '2512', null, '提交/修改申请', 'userTask', '182013052121033133083', '2015-05-12 15:24:02', '2015-05-12 15:24:02', '473', '');
INSERT INTO `ACT_HI_ACTINST` VALUES ('2516', 'leave:1:2504', '2505', '2505', 'deptLeaderAudit', '2517', null, '部门领导审批', 'userTask', '182013052121033133083', '2015-05-12 15:24:02', '2015-05-12 15:24:24', '22095', '');
INSERT INTO `ACT_HI_ACTINST` VALUES ('2523', 'leave:1:2504', '2505', '2505', 'exclusivegateway1', null, null, 'Exclusive Gateway', 'exclusiveGateway', null, '2015-05-12 15:24:24', '2015-05-12 15:24:24', '0', '');
INSERT INTO `ACT_HI_ACTINST` VALUES ('2524', 'leave:1:2504', '2505', '2505', 'hrAudit', '2525', null, '人事审批', 'userTask', null, '2015-05-12 15:24:24', null, null, '');
INSERT INTO `ACT_HI_COMMENT` VALUES ('2518', 'comment', '2015-05-12 15:24:24', null, '2517', '2505', 'AddComment', '同意！', 0xE5908CE6848FEFBC81);
INSERT INTO `ACT_HI_DETAIL` VALUES ('2507', 'VariableUpdate', '2505', '2505', null, null, 'applyUserId', 'string', '0', '2015-05-12 15:24:02', null, null, null, '182013052121033133083', null);
INSERT INTO `ACT_HI_DETAIL` VALUES ('2510', 'VariableUpdate', '2505', '2505', null, '2509', 'applyUserId', 'string', '0', '2015-05-12 15:24:02', null, null, null, '182013052121033133083', null);
INSERT INTO `ACT_HI_DETAIL` VALUES ('2513', 'VariableUpdate', '2505', '2505', null, '2511', 'applyUserId', 'string', '1', '2015-05-12 15:24:02', null, null, null, '182013052121033133083', null);
INSERT INTO `ACT_HI_DETAIL` VALUES ('2515', 'VariableUpdate', '2505', '2505', null, '2511', 'deptLeaderId', 'string', '0', '2015-05-12 15:24:02', null, null, null, '182013052121033133083', null);
INSERT INTO `ACT_HI_DETAIL` VALUES ('2519', 'VariableUpdate', '2505', '2505', null, '2516', 'applyUserId', 'string', '1', '2015-05-12 15:24:24', null, null, null, '182013052121033133083', null);
INSERT INTO `ACT_HI_DETAIL` VALUES ('2521', 'VariableUpdate', '2505', '2505', null, '2516', 'deptLeaderPass', 'boolean', '0', '2015-05-12 15:24:24', null, null, '1', null, null);
INSERT INTO `ACT_HI_DETAIL` VALUES ('2522', 'VariableUpdate', '2505', '2505', null, '2516', 'deptLeaderId', 'string', '1', '2015-05-12 15:24:24', null, null, null, '182013052121033133083', null);
INSERT INTO `ACT_HI_IDENTITYLINK` VALUES ('2508', null, 'starter', '182013052121033133083', null, '2505');
INSERT INTO `ACT_HI_IDENTITYLINK` VALUES ('2526', 'hr', 'candidate', null, '2525', null);
INSERT INTO `ACT_HI_PROCINST` VALUES ('2505', '2505', '7', 'leave:1:2504', '2015-05-12 15:24:02', null, null, '182013052121033133083', 'startevent1', null, null, null, '', null);
INSERT INTO `ACT_HI_TASKINST` VALUES ('2512', 'leave:1:2504', 'submitOrModify', '2505', '2505', '提交/修改申请', null, null, null, '182013052121033133083', '2015-05-12 15:24:02', null, '2015-05-12 15:24:02', '464', 'completed', '50', null, null, null, '');
INSERT INTO `ACT_HI_TASKINST` VALUES ('2517', 'leave:1:2504', 'deptLeaderAudit', '2505', '2505', '部门领导审批', null, null, null, '182013052121033133083', '2015-05-12 15:24:02', null, '2015-05-12 15:24:24', '22089', 'completed', '50', null, null, null, '');
INSERT INTO `ACT_HI_TASKINST` VALUES ('2525', 'leave:1:2504', 'hrAudit', '2505', '2505', '人事审批', null, null, null, null, '2015-05-12 15:24:24', null, null, null, null, '50', null, null, null, '');
INSERT INTO `ACT_HI_VARINST` VALUES ('2506', '2505', '2505', null, 'applyUserId', 'string', '2', null, null, null, '182013052121033133083', null, '2015-05-12 15:24:02', '2015-05-12 15:24:24');
INSERT INTO `ACT_HI_VARINST` VALUES ('2514', '2505', '2505', null, 'deptLeaderId', 'string', '1', null, null, null, '182013052121033133083', null, '2015-05-12 15:24:02', '2015-05-12 15:24:24');
INSERT INTO `ACT_HI_VARINST` VALUES ('2520', '2505', '2505', null, 'deptLeaderPass', 'boolean', '0', null, null, '1', null, null, '2015-05-12 15:24:24', '2015-05-12 15:24:24');
INSERT INTO `ACT_ID_GROUP` VALUES ('hr', '1', '人事', '人事');
INSERT INTO `ACT_ID_MEMBERSHIP` VALUES ('182013052121033133083', 'hr');
INSERT INTO `ACT_ID_USER` VALUES ('182013052121033133083', '1', null, null, null, null, null);
INSERT INTO `ACT_RE_DEPLOYMENT` VALUES ('2501', null, null, '', '2015-05-12 15:22:57');
INSERT INTO `ACT_RE_DEPLOYMENT` VALUES ('2528', null, null, '', '2015-05-12 15:34:54');
INSERT INTO `ACT_RE_PROCDEF` VALUES ('leave:1:2504', '1', 'http://www.eazytec.com/activiti/leave', '请假流程', 'leave', '1', '2501', 'leave.bpmn', 'leave.png', '请假流程演示', '0', '1', '');
INSERT INTO `ACT_RE_PROCDEF` VALUES ('trsvel:1:2531', '1', 'http://www.activiti.org/test', '出差申请流程', 'trsvel', '1', '2528', 'trsvel.bpmn', 'trsvel.png', null, '0', '1', '');
INSERT INTO `ACT_RU_EXECUTION` VALUES ('2505', '3', '2505', '7', null, 'leave:1:2504', null, 'hrAudit', '1', '0', '1', '0', '1', '2', '', null);
INSERT INTO `ACT_RU_IDENTITYLINK` VALUES ('2508', '1', null, 'starter', '182013052121033133083', null, '2505', null);
INSERT INTO `ACT_RU_IDENTITYLINK` VALUES ('2526', '1', 'hr', 'candidate', null, '2525', null, null);
INSERT INTO `ACT_RU_TASK` VALUES ('2525', '1', '2505', '2505', 'leave:1:2504', '人事审批', null, null, 'hrAudit', null, null, null, '50', '2015-05-12 15:24:24', null, null, '1', '', null);
INSERT INTO `ACT_RU_VARIABLE` VALUES ('2506', '1', 'string', 'applyUserId', '2505', '2505', null, null, null, null, '182013052121033133083', null);
INSERT INTO `ACT_RU_VARIABLE` VALUES ('2514', '1', 'string', 'deptLeaderId', '2505', '2505', null, null, null, null, '182013052121033133083', null);
INSERT INTO `ACT_RU_VARIABLE` VALUES ('2520', '1', 'boolean', 'deptLeaderPass', '2505', '2505', null, null, null, '1', null, null);
INSERT INTO `fro_member` VALUES ('227BA6B6-00F5-42F5-A453-E182DF3F3FB9', 'demo', 'MTExMTEx');
INSERT INTO `fro_member` VALUES ('2F6F8643-AB2C-477F-B982-C736A6BCA413', 'admin', 'MTExMTEx');
INSERT INTO `fro_member` VALUES ('5687E6FE-0598-4F47-883C-91D454CAAE46', 'jiangc', 'MTExMTEx');
INSERT INTO `fro_member` VALUES ('568D9E62-FA90-4F2A-ADFF-2BB7C61710C5', '123456', 'MTExMTEx');
INSERT INTO `fro_member` VALUES ('63B61D0C-3985-402F-9B26-2D007A466126', 'jiangc123', 'MTExMTEx');
INSERT INTO `fro_member` VALUES ('6598F3D0-DB1B-4269-B50F-5A2DBE81DF27', 'jiangchao', 'MTExMTEx');
INSERT INTO `fro_member` VALUES ('CF7653BD-763E-4C71-A77C-4E000B7AD468', 'lisi', 'MTExMTEx');
INSERT INTO `fro_news` VALUES ('61577577-F5C1-45F8-916E-23753AC0818E', '项目申报书下载及首次登陆说明', '2343', '<p><font size=\"4\" style=\"margin: 0px; padding: 0px; color: rgb(98, 98, 98); font-family: Simsun; line-height: 18px;\"><font color=\"#ff0000\" style=\"margin: 0px; padding: 0px;\">一般用户遇到的常规性问题，已基本将有关说明放在下方的&ldquo;在线帮助&rdquo;部分，请仔细查看后再联系我们。<font size=\"3\" style=\"margin: 0px; padding: 0px;\">&nbsp;</font><br style=\"margin: 0px; padding: 0px;\" /><br style=\"margin: 0px; padding: 0px;\" /></font>项目申报书下载说明：<br style=\"margin: 0px; padding: 0px;\" />&nbsp; 注册单位或个人账号--申报人员身份登陆系统--申报新项目--填写项目信息表第一页并保存--出现整个申报书结构--到申报书上报页下载申报书模板。<br style=\"margin: 0px; padding: 0px;\" /><br style=\"margin: 0px; padding: 0px;\" />注册单位或个人账号的说明：<br style=\"margin: 0px; padding: 0px;\" /><br style=\"margin: 0px; padding: 0px;\" />1、该系统完全继承了上一代信息系统的账户系统，所有账户名密码与上一代系统一致。<br style=\"margin: 0px; padding: 0px;\" /><br style=\"margin: 0px; padding: 0px;\" />2、如您已在上一代系统注册，首次登陆请重新选择主管部门（到县科技局或区），但区非项目主管部门，项目主管部门仍为省辖市科技局，请仔细查看主管部门修改说明。登陆以后，请更新本年度单位信息，企业类更新企业类单位信息表，非企业类也需更新单位信息表，相关内容与企业类不同，更新后即可申报新项目。<br style=\"margin: 0px; padding: 0px;\" /><br style=\"margin: 0px; padding: 0px;\" />3、如您是新注册单位用户，请首先注册单位用户信息，并联系相关主管部门（计划处）激活账号，单位管理员账号也可用项目申报人员身份登陆并申报项目。如您是新注册个人用户，只能选择已激活的注册单位名称，并联系单位管理员激活账号。</font><span style=\"color: rgb(98, 98, 98); font-family: Simsun; line-height: 18px;\">&nbsp;</span></p>', '2014-11-06 14:35:13', null);
INSERT INTO `fro_news` VALUES ('7478D956-7062-4579-9F81-B24FF2CBA999', '江苏省聚焦问题确保教育实践活动不“走神”', '2343', '<p>&nbsp;<a href=\"http://www.jstd.gov.cn/ztzl/ddqzlxjysjhd/swbs/2013/08/02161218796.html\" target=\"_blank\" style=\"font-family: 宋体; color: rgb(51, 51, 51); text-decoration: none;\">江苏省聚焦问题确保教育实践活动不&ldquo;走神&rdquo;</a></p>', '2014-11-06 17:00:11', '');
INSERT INTO `fro_news` VALUES ('9A493479-37D8-4B67-9319-9ECD7F560001', '中共江苏省科技厅党组坚决反对“四风”加强作风建设五项承诺', '2343', '<p>&nbsp;<a href=\"http://www.jstd.gov.cn/ztzl/ddqzlxjysjhd/gzdt/2013/07/15154231890.html\" target=\"_blank\" style=\"font-family: 宋体; color: rgb(51, 51, 51); text-decoration: none;\">中共江苏省科技厅党组坚决反对&ldquo;四风&rdquo;加强作风建设五项承诺</a></p>', '2014-11-06 16:59:54', '');
INSERT INTO `fro_news` VALUES ('A2192619-E253-4277-8A36-88D6D130FFA1', '省委常委会强调教育实践与当前经济工作要“两手抓两促进”', '2343', '<p>&nbsp;省委常委会强调教育实践与当前经济工作要&ldquo;两手抓两促进&rdquo;</p><p>&nbsp;省委常委会强调教育实践与当前经济工作要&ldquo;两手抓两促进&rdquo;</p><p>&nbsp;省委常委会强调教育实践与当前经济工作要&ldquo;两手抓两促进&rdquo;</p><p>&nbsp;省委常委会强调教育实践与当前经济工作要&ldquo;两手抓两促进&rdquo;</p><p>&nbsp;省委常委会强调教育实践与当前经济工作要&ldquo;两手抓两促进&rdquo;</p>', '2014-12-09 08:36:44', '551');
INSERT INTO `fro_news` VALUES ('BAE6DB97-31F8-489C-B2AE-2417F2BF2994', '关于主管部门选择区的说明', '2343', '<p><span style=\"color: rgb(98, 98, 98); font-family: Simsun; font-size: medium; line-height: 18px;\">&nbsp; &nbsp;&nbsp;</span><span style=\"color: rgb(255, 0, 0); font-size: medium; font-family: Simsun; line-height: 18px;\">申报单位选择主管部门时注意，如您选择的二级主管部门是科技局或者科学技术局结尾的，该主管部门具有项目审核权限，如仅是区结尾，区级无项目审核流程，仅是区域信息登记，项目审核仍由省辖市（大市）完成，请放心选择，区信息仅在省成果转化资金项目申报时使用。</span></p><div style=\"margin: 0px; padding: 0px; color: rgb(98, 98, 98); font-family: Simsun; line-height: 18px;\"><font size=\"3\" style=\"margin: 0px; padding: 0px;\"><font color=\"#ff0000\" style=\"margin: 0px; padding: 0px;\"><br style=\"margin: 0px; padding: 0px;\" /></font>&nbsp;&nbsp;&nbsp; 申报单位账户由其主管部门激活，请务必认真正确选择。市辖区申报单位账号由省辖市科学技术局激活；县级市、县申报单位账号由县级市、县科学技术局激活；国家级高新技术产业开发区申报单位账号由所在高新区科技局激活；相关厅局下属科研单位账号由厅局科技部门激活。区主管部门（如玄武区、新北区、广陵区等）无账号激活权限，仅用于省成果转化资金项目审核。<br style=\"margin: 0px; padding: 0px;\" /></font></div><div style=\"margin: 0px; padding: 0px; color: rgb(98, 98, 98); font-family: Simsun; line-height: 18px;\"><font size=\"3\" style=\"margin: 0px; padding: 0px;\">&nbsp;&nbsp;&nbsp;&nbsp;<br style=\"margin: 0px; padding: 0px;\" />&nbsp;&nbsp;&nbsp; 例1：无锡滨湖区申报单位，选择主管部门时首先选择一级主管部门无锡市科学技术局，然后选择二级主管部门滨湖区，账号激活由一级主管部门无锡市科学技术局（计划处账号）激活；</font></div><div style=\"margin: 0px; padding: 0px; color: rgb(98, 98, 98); font-family: Simsun; line-height: 18px;\"><font size=\"3\" style=\"margin: 0px; padding: 0px;\">&nbsp;&nbsp;&nbsp;&nbsp;<br style=\"margin: 0px; padding: 0px;\" />&nbsp;&nbsp;&nbsp; 例2：无锡江阴市申报单位，选择主管部门时首先选择一级主管部门无锡市科学技术局，然后选择二级主管部门江阴市科学技术局，账号激活由二级主管部门江阴市科学技术局（计划处账号）激活；</font></div><div style=\"margin: 0px; padding: 0px; color: rgb(98, 98, 98); font-family: Simsun; line-height: 18px;\"><font size=\"3\" style=\"margin: 0px; padding: 0px;\">&nbsp;&nbsp;&nbsp;&nbsp;<br style=\"margin: 0px; padding: 0px;\" />&nbsp;&nbsp;&nbsp; 例3：无锡高新技术产业开发区申报单位，选择主管部门时首先选择一级主管部门无锡市科学技术局，然后选择二级主管部门无锡高新技术产业开发区科技局，账号激活由二级主管部门无锡高新技术产业开发区科技局（计划处账号）激活。</font></div><div style=\"margin: 0px; padding: 0px; color: rgb(98, 98, 98); font-family: Simsun; line-height: 18px;\"><font size=\"3\" style=\"margin: 0px; padding: 0px;\">&nbsp;&nbsp;&nbsp;&nbsp;<br style=\"margin: 0px; padding: 0px;\" />&nbsp;&nbsp;&nbsp; 另：在宁部省属大学（南京理工大学、南京航空航天大学、河海大学、南京工业大学、南京邮电大学、南京师范大学、南京医科大学、南京中医药大学、南京林业大学、南京信息工程大学、南京财经大学）现已调整为教育厅的二级项目主管部门，在系统软件申报流程中可以直接推荐项目至省科学技术厅，但项目材料和项目汇总表必须由省教育厅盖章方能生效，如有项目申报限项事宜，仍由省教育厅统一协调。</font></div>', '2014-11-06 16:08:30', '544,545');
INSERT INTO `fro_news` VALUES ('C88CE8DC-2543-4646-B7DE-3F749908467E', '关于项目申报截止时间的说明', '2343', '<p>关于项目申报截止时间的说明</p><p>关于项目申报截止时间的说明</p><p>关于项目申报截止时间的说明</p><p>关于项目申报截止时间的说明</p><p>关于项目申报截止时间的说明</p><p>关于项目申报截止时间的说明</p>', '2014-11-06 15:34:51', '543');
INSERT INTO `fro_news` VALUES ('E9F8E7C2-BD17-4591-8319-98C729E301F5', '江苏省科技厅：找准“工作短板”增强服务能力', '2343', '<p>&nbsp;<a href=\"http://www.jstd.gov.cn/ztzl/ddqzlxjysjhd/gzdt/2013/08/18112445578.html\" target=\"_blank\" style=\"font-family: 宋体; color: rgb(51, 51, 51); text-decoration: none;\">江苏省科技厅：找准&ldquo;工作短板&rdquo;增强服务能力</a></p>', '2014-11-06 17:00:03', '');
INSERT INTO `fro_project_manager` VALUES ('6525904F-54BF-40C7-BF2A-1FA9F12D30F4', '1', '1', '3', '2265');
INSERT INTO `fro_project_manager` VALUES ('6F0153B7-036F-4F9B-B337-536E49F7AB11', '1', '1', '3', '2265');
INSERT INTO `fro_project_manager` VALUES ('6F0153B7-036F-4F9B-B337-536E49F7AB11', '2', '1', '4', '2265');
INSERT INTO `hrm_contract` VALUES ('1AF2A57A-AB76-483D-82D1-B5BEBF111E2D', '312', '蒋超的合同', '1', '1', 'C1332BE7-7497-4EC8-88E2-3D8E72B143CC', '2014-07-28', '2015-07-28', '<p>&nbsp;<span style=\"color: rgb(37, 37, 37); font-family: Simsun; line-height: 25px; text-align: right; white-space: nowrap;\">合同内容</span></p>', '', '182014052421084820990', '182013052121033133083', '2014-07-28 13:26:35', '182013052121033133083', '2014-07-28 13:26:35', '18');
INSERT INTO `hrm_contract` VALUES ('6BDB7EB0-880A-4900-9731-89F7470AE829', '123', '合同名称', '1', '3', 'F33F84D0-5F6E-4DA2-9F56-A162EDBD222B', '2014-07-19', '2014-07-24', '', '530', '182013052121033133083', null, null, '182013052121033133083', '2014-07-28 13:26:50', '18');
INSERT INTO `hrm_contract_type` VALUES ('506219CE-7319-42BA-A9A6-B7FF763D7C7B', '培训合同', '', '', '182013052121033133083', '2014-07-19 14:55:15', '182013052121033133083', '2014-07-19 14:55:15', '18');
INSERT INTO `hrm_contract_type` VALUES ('918E42D5-7E2C-43F8-B206-ED7A7441310D', '试用期合同', '539', '', null, null, '182013052121033133083', '2014-08-22 15:18:40', '18');
INSERT INTO `hrm_contract_type` VALUES ('C1332BE7-7497-4EC8-88E2-3D8E72B143CC', '劳动合同', '', '', '182013052121033133083', '2014-07-19 14:55:33', '182013052121033133083', '2014-07-19 14:55:33', '18');
INSERT INTO `hrm_contract_type` VALUES ('F33F84D0-5F6E-4DA2-9F56-A162EDBD222B', '正式合同', '', '', '182013052121033133083', '2014-07-19 14:55:26', '182013052121033133083', '2014-07-19 14:55:26', '18');
INSERT INTO `hrm_department` VALUES ('56', '01', '000001', '总经办', 'ZJB', '00', '182014052421104440246', '', '51', '2013-05-21 15:27:11', '182013052121033133083', '2014-10-05 14:11:20', '18', '1');
INSERT INTO `hrm_department` VALUES ('57', '0101', '', '开发一部', '', '01', null, '', '182013072730085454643', '2013-07-27 13:14:48', '182013052121033133083', '2014-03-28 16:27:13', '18', '1');
INSERT INTO `hrm_department` VALUES ('59', '0103', '', '财务部', '', '01', null, '', '182013072730085454643', '2013-07-27 13:19:41', '182013072730085454643', '2013-07-27 13:19:41', '18', '3');
INSERT INTO `hrm_department` VALUES ('60', '0104', '', '市场部', '', '01', null, '', '182013072730085454643', '2013-07-27 13:23:44', '182013072730085454643', '2013-07-27 13:23:44', '18', '4');
INSERT INTO `hrm_department` VALUES ('61', '0105', '', '研发部', '', '01', null, '', '182013072730085454643', '2013-07-27 13:25:21', '182013072730085454643', '2013-07-27 13:25:21', '18', '6');
INSERT INTO `hrm_department` VALUES ('62', '0106', '', '运维部', '', '01', null, '', '182013072730085454643', '2013-07-27 13:27:06', '182013052121033133083', '2014-07-07 10:12:44', '18', '5');
INSERT INTO `hrm_department` VALUES ('63', '0107', '', '开发三部', '', '01', null, '', '182013072730085454643', '2013-07-27 13:28:42', '182013072730085454643', '2013-07-27 13:28:42', '18', '7');
INSERT INTO `hrm_department` VALUES ('64', '010301', '', '开发四部', '', '0103', null, '', '182013072730085454643', '2013-07-27 13:28:58', '182013072730085454643', '2013-07-27 13:56:14', '18', '1');
INSERT INTO `hrm_department` VALUES ('65', '010101', '', '开发一组', '', '0101', null, '', '182013072730085454643', '2013-07-27 13:41:25', '182013072730085454643', '2013-07-27 13:41:25', '18', '1');
INSERT INTO `hrm_department` VALUES ('66', '010102', '', '开发二组', '', '0101', null, '', '182013072730085454643', '2013-07-28 15:13:08', '182013072730085454643', '2013-07-28 15:13:08', '18', '2');
INSERT INTO `hrm_department` VALUES ('67', '010103', '', '开发三组', '', '0101', null, '', '182013072730085454643', '2013-07-28 15:13:21', '182013072730085454643', '2013-07-28 15:13:21', '18', '3');
INSERT INTO `hrm_department` VALUES ('68', '010104', '', '开发四组', '', '0101', null, '', '182013072730085454643', '2013-07-28 15:13:31', '182013072730085454643', '2013-07-28 15:13:31', '18', '4');
INSERT INTO `hrm_department` VALUES ('69', '0108', '', '证券投资部', '', '01', null, '', '182013052121033133083', '2013-09-20 10:34:04', '182013052121033133083', '2013-09-20 10:34:04', '18', '8');
INSERT INTO `hrm_department` VALUES ('70', '0109', '', '电子工程部', '', '01', null, '', '182013052121033133083', '2013-09-20 10:47:31', '182013052121033133083', '2013-09-20 10:47:31', '18', '9');
INSERT INTO `hrm_department` VALUES ('71', '0110', '', '市场服务部', '', '01', null, '', '182013052121033133083', '2013-09-20 11:24:19', '182013052121033133083', '2014-03-28 16:27:29', '18', '10');
INSERT INTO `hrm_department` VALUES ('72', '010501', '', '研发一部', '', '0105', null, '', '182013052121033133083', '2013-09-20 11:26:33', '182013052121033133083', '2013-09-20 11:26:33', '18', '1');
INSERT INTO `hrm_department` VALUES ('73', '0111', '', '电子商务部', '', '01', null, '', '182013052121033133083', '2013-09-20 11:46:19', '182013052121033133083', '2013-09-20 11:46:19', '18', '11');
INSERT INTO `hrm_department` VALUES ('75', '01010301', '', '三组第一小组', '', '010103', null, '', '182013072730085454643', '2013-10-28 22:49:43', '182013052121033133083', '2014-08-10 17:02:50', '18', '1');
INSERT INTO `hrm_department` VALUES ('76', '02', '', '造价部', '', '00', null, '', '182013052121033133083', '2014-04-13 18:34:32', '182013052121033133083', '2014-04-13 18:34:32', '18', '2');
INSERT INTO `hrm_department` VALUES ('77', '0201', '', '报价部', '', '02', null, '', '182013052121033133083', '2014-04-13 18:34:55', '182013052121033133083', '2014-04-13 18:34:55', '18', '1');
INSERT INTO `hrm_employee` VALUES ('182013052121033133083', '狄晓靖', 'DXJ', 'DXJ', '000005', '2142', '1990-05-21', '1', '2146', '2197', '2208', '2202', '', '', '70', '', '', '2265', '237273788356789876', '江苏宜兴', '0510-807167483', '江苏宜兴红塔新苑15栋507', '18061563967', '', '2013-05-21', '76', '15', '23', null, '', '小丁', '18061563967', '江苏宜兴红塔新苑15栋507', '', '51', '2013-05-21 15:31:33', '182013052121033133083', '2014-12-11 14:04:34', '18', '2013-05-21', '25,', '2', '605', '1');
INSERT INTO `hrm_employee` VALUES ('182013072730040551054', '李四', '', 'LS', '123456', '2142', '1988-06-03', '1', '2145', '2197', '2208', '2202', '', '', '47', '', '', '2265', '123', '', '', '', '', '', '2013-07-27', '65', '15', '26', null, '', '', '', '', '', '182013072730085454643', '2013-07-27 16:05:50', '182013072730085454643', '2014-03-14 09:44:52', '18', '2013-07-27', '25,26,', null, '', '1');
INSERT INTO `hrm_employee` VALUES ('182013072730085454643', '张三', '', 'ZS', '123', '2142', '2013-01-27', '1', '2145', '2197', '2208', '2202', '', '', '57', '', '', '2265', '123', '', '', '', '', '', '2013-07-08', '56', '15', '0', null, '', '', '', '', '', '182013052121033133083', '2013-07-27 08:54:54', '182013072931083905862', '2014-05-24 00:31:45', '18', '2013-08-30', '', '2', '454', '1');
INSERT INTO `hrm_employee` VALUES ('182013072931083905862', '王五', '', 'WW', '1234', '2142', '2008-09-01', '1', '2145', '2197', '2208', '2202', '', '', '0', '', '', '2265', '23256532565', '', '', '江苏无锡', '123456', '123456', '2010-09-01', '60', '15', null, null, '', '', '', '', '', '182013072730085454643', '2013-07-29 08:39:00', '182013052121033133083', '2014-09-06 19:09:14', '18', '2013-09-19', '', '1', '', '1');
INSERT INTO `hrm_employee` VALUES ('18201401285024208188', '马六', '', 'ML', '1233', '2142', '1989-01-28', '1', '2145', '2197', '2208', '2202', '', '', '51', '', '', '2265', '123', '', '', '', '', '', '2014-01-28', '65', '15', null, null, '', '', '', '', '', '182013072730085454643', '2014-01-28 14:42:08', '182013052121033133083', '2014-03-14 10:35:58', '18', '2014-01-28', '', '2', '', '1');
INSERT INTO `hrm_employee` VALUES ('182014032913033222840', '小七', '', 'XQ', '111', '2142', '2009-03-29', '1', '2145', '2197', '2208', '2202', '', '', '55', '', '', '2265', '123', '', '', '', '', '', '2014-03-29', '62', '15', '26', null, '', '', '', '', '', '182013052121033133083', '2014-03-29 15:32:22', '182013072931083905862', '2014-05-24 01:23:08', '18', '2014-03-29', '', '2', '305', '1');
INSERT INTO `hrm_employee` VALUES ('182014052421084820990', '蒋超', '', 'JC', '员工编号', '2142', '1988-06-03', '1', '2145', '2197', '2208', '2202', '', '', '0', '', '', '2265', '320282198806030695', '', '', '', '', '', '2014-03-24', '57', '15', '28', null, '', '', '', '', '', '182013052121033133083', '2014-05-24 20:48:20', '182013052121033133083', '2014-08-08 13:22:12', '18', '2014-05-24', '25,', '2', '', '1');
INSERT INTO `hrm_employee` VALUES ('182014052421102129560', '张艳', '', 'ZY', '员工编号2', '2142', '1988-09-25', '2', '2145', '2197', '2208', '2202', '', '', '0', '', '', '2265', '320282198896929101', '', '', '', '', '', '2014-02-24', '59', '15', '26', null, '', '', '', '', '', '182014052421084820990', '2014-05-24 22:21:29', '182014052421084820990', '2014-05-24 22:21:29', '18', '2014-05-24', '33,', '2', '', '1');
INSERT INTO `hrm_employee` VALUES ('182014052421104440246', '张亮', '', 'ZL', '员工编号3', '2142', '1989-05-24', '1', '2145', '2197', '2208', '2202', '', '', '0', '', '', '2265', '321123123123123123', '', '', '', '', '', '2014-05-24', '56', '15', '23', null, '', '', '', '', '', '182013072931083905862', '2014-05-24 22:44:40', '182013072931083905862', '2014-05-24 22:44:40', '18', '2014-05-24', '33,', '2', '', '1');
INSERT INTO `hrm_employee` VALUES ('182014061625041124312', '1111中午', '', '1111ZW', '11111', '2142', '1999-06-16', '1', '2145', '2197', '2208', '2202', '', '', '0', '', '', '2265', '121212121212', '', '', '', '', '', '2014-06-16', '76', '15', '0', null, '', '', '', '', '', '182013052121033133083', '2014-06-16 16:11:24', '182013052121033133083', '2014-12-12 10:06:07', '18', '2014-06-16', '', '2', '', '1');
INSERT INTO `hrm_post` VALUES ('23', '01', '董事长', '', '00', null, '', '182013052121033133083', '2013-07-27 15:58:18', '182013052121033133083', '2013-07-27 15:58:18', '18', '1');
INSERT INTO `hrm_post` VALUES ('24', '0107', '总经理', '', '01', null, '', '182013052121033133083', '2013-07-27 15:58:40', '182013072730040551054', '2014-05-24 16:06:43', '18', '7');
INSERT INTO `hrm_post` VALUES ('25', '0102', '财务总监', '', '01', null, '', '182013072730085454643', '2013-07-27 15:58:57', '182013072730040551054', '2014-05-24 16:06:33', '18', '3');
INSERT INTO `hrm_post` VALUES ('26', '0103', '销售总监', '', '01', null, '', '182013072730085454643', '2013-07-27 15:59:08', '182013072730085454643', '2013-07-27 15:59:08', '18', '2');
INSERT INTO `hrm_post` VALUES ('27', '0104', '销售员', '', '01', null, '', '182013052121033133083', '2013-09-20 09:59:50', '182013052121033133083', '2013-09-20 09:59:50', '18', '5');
INSERT INTO `hrm_post` VALUES ('28', '0105', '研发工程师', '', '01', null, '', '182013072730085454643', '2013-09-20 11:29:06', '182013072730085454643', '2013-09-20 11:29:06', '18', '6');
INSERT INTO `hrm_post` VALUES ('29', '010501', '一级研发工程师', '', '0105', null, '', '182013052121033133083', '2013-09-20 11:34:31', '182013052121033133083', '2013-09-20 11:34:31', '18', '1');
INSERT INTO `hrm_post` VALUES ('30', '010502', '二级研发工程师', '', '0105', null, '', '182013052121033133083', '2013-09-20 11:48:56', '182013052121033133083', '2013-09-20 11:48:56', '18', '2');
INSERT INTO `hrm_post` VALUES ('31', '010503', '二级研发工程师', '', '0105', null, '', '182013052121033133083', '2013-09-20 11:55:14', '182013052121033133083', '2013-09-20 11:55:14', '18', '3');
INSERT INTO `hrm_post` VALUES ('32', '010401', '初级销售员', '', '0104', null, '', '182013052121033133083', '2013-09-20 12:01:25', '182013052121033133083', '2013-09-20 12:01:25', '18', '1');
INSERT INTO `hrm_post` VALUES ('33', '0106', '人事经理', '', '01', null, '', '182013052121033133083', '2013-09-20 12:05:24', '182013052121033133083', '2013-09-20 12:05:24', '18', '4');
INSERT INTO `hrm_workarea` VALUES ('15', '南京', 'nanjing', '', '51', '2013-05-21 15:31:01', '182013052121033133083', '2014-06-21 11:26:02', '18');
INSERT INTO `hrm_workarea` VALUES ('16', '北京', '', '', '182013052121033133083', '2014-10-22 08:48:47', '182013052121033133083', '2014-10-22 08:48:47', '18');
INSERT INTO `hrm_workarea` VALUES ('17', '地区名称', '', '', '182013052121033133083', '2014-12-04 16:43:28', '182013052121033133083', '2014-12-04 16:43:28', '18');
INSERT INTO `oa_adversaria` VALUES ('1', '宜兴市人民南路52号经信委307办公室', '1', '<p>&nbsp; <span style=\"line-height: 28px; text-indent: 28px; font-family: Arial, Verdana, Helvetica, sans-serif; color: rgb(51,51,51); font-size: 14px\">宜兴市人民南路52号经信委307办公室</span></p>', '182013052121033133083', '2014-03-14 16:30', '1', '', '182013052121033133083', '2013-09-18 15:34:05', '182013052121033133083', '2014-03-14 16:30:36', '18');
INSERT INTO `oa_adversaria` VALUES ('2', '记事', '2', '<p>记事记事记事记事记事记事</p>', '182013072730085454643', '2014-01-23 23:21', '1', '', '182013072730085454643', '2014-01-23 23:21:43', '182013072730085454643', ' 2014-01-23 23:22:11 ', '18');
INSERT INTO `oa_album` VALUES ('1', '龙背山一日游', '182013052121033133083', '2013-09-20 22:50:55.0', '2168', '16', '14', '龙背山一日游', '182013052121033133083,182014032913033222840,182014061625041124312,182013072730085454643,18201401285024208188,182013072931083905862,182013072730040551054,182014052421084820990,182014052421102129560,182014052421104440246,', '56,65,66,67,68,57,64,59,60,62,72,61,63,69,70,71,73,', '182013052121033133083', '2013-09-20 22:50:55', '182013052121033133083', '2014-07-04 13:19:20', '18');
INSERT INTO `oa_album` VALUES ('2', '狄小静的相册', '182013052121033133083', '2014-07-04', '2168', null, '0', '', '', '56,65,66,75,67,68,57,64,59,60,62,72,61,63,69,70,71,73,', '182013052121033133083', '2014-07-04 13:12:12', '182013052121033133083', '2014-07-04 13:12:12', '18');
INSERT INTO `oa_boardroom` VALUES ('1', '会议室一', '10', null, '10号楼', '10号楼', '182013072730040551054', null, '182013072730040551054', '2014-08-08 12:25:40', '18');
INSERT INTO `oa_boardroom` VALUES ('2', '会议室名称', '11', null, '', '会议室地址', '182013052121033133083', null, '182013052121033133083', '2014-04-29 20:03:21', '18');
INSERT INTO `oa_book` VALUES ('1', '图书名称', '77', '', '1', '', '', '', '', '', '1', '1', null, '', '', ' 2014-05-24 16:10:20 ', '182013072730040551054', '', '', '182013072730040551054', ' 2014-05-24 16:10:20 ', '182013072730040551054', ' 2014-05-24 16:10:20 ', '18');
INSERT INTO `oa_book_type` VALUES ('1', '类别名称', '', '182013072730040551054', ' 2014-05-24 16:10:07 ', '182013072730040551054', ' 2014-05-24 16:10:07 ', '18');
INSERT INTO `oa_calender` VALUES ('2', '4', '2174', '2013-09-16 15:26:00', '2013-09-16 16:26:00', '1', ' style=\"display: none;\"', '182013072730085454643', '182013072730085454643', '2013-09-16 15:26:06', '182013072730085454643', '2013-09-16 15:26:06', '18');
INSERT INTO `oa_calender` VALUES ('4', '1', '2174', '2013-09-18 15:28:20', '2013-09-18 16:28:20', '2', '您可以在此处添加您想要发布的工作安排', '182013052121033133083', '182013052121033133083', '2013-09-18 15:28:28', '182013052121033133083', '2014-05-25 07:50:40', '18');
INSERT INTO `oa_calender` VALUES ('5', '4', '2174', '2013-09-18 15:29:52', '2013-09-18 16:29:52', '2', '版权声明\n', '182013052121033133083', '182013052121033133083', '2013-09-18 15:30:06', '182013052121033133083', '2013-09-18 15:30:06', '18');
INSERT INTO `oa_calender` VALUES ('15', '4', '2174', '2014-08-01 13:27:53', '2014-08-14 13:28:36', '2', '11111111111111111', '182013052121033133083', '182013052121033133083', '2014-08-14 13:28:38', '182013052121033133083', '2014-08-14 13:28:38', '18');
INSERT INTO `oa_chat_groups` VALUES ('1', '我的好友', '通讯分组默认分组！', '182013052121033133083', ' 2013-07-26 10:05:42 ', '182013052121033133083', ' 2013-10-07 17:19:39 ', '18');
INSERT INTO `oa_chat_groups` VALUES ('2', '我的好友', '通讯分组默认分组！', '182013072730085454643', ' 2013-07-27 12:50:43 ', '182013072730085454643', ' 2013-07-27 12:50:43 ', '18');
INSERT INTO `oa_chat_groups` VALUES ('3', '我的好友', '通讯分组默认分组！', '182013072730040551054', ' 2013-09-20 17:22:22 ', '182013072730040551054', ' 2013-09-20 17:22:22 ', '18');
INSERT INTO `oa_chatters` VALUES ('1', '姓 名', '1', '', '1', '', '家庭电话', '', '', '', '', '', '', '2', '', null, '182013052121033133083', ' 2014-05-24 10:52:19 ', '182013052121033133083', ' 2014-05-24 10:52:19 ', '18');
INSERT INTO `oa_chatters` VALUES ('2', '姓 名', '1', '', '1', '', '', '移动电话', '', '', '', '', '', '2', null, null, '182013052121033133083', ' 2014-05-24 10:53:38 ', '182013052121033133083', ' 2014-05-24 10:53:48 ', '18');
INSERT INTO `oa_desktop_set` VALUES ('715', '182013052121033133083', '1', '2', '101190101,101190201', '18', '182013052121033133083', '2013-07-26 09:02:40', '182013052121033133083', '2014-02-08 15:24:53');
INSERT INTO `oa_desktop_set` VALUES ('716', '182013052121033133083', '2', '1', '5', '18', '182013052121033133083', '2013-07-26 09:02:40', '182013052121033133083', '2014-12-26 11:02:55');
INSERT INTO `oa_desktop_set` VALUES ('717', '182013052121033133083', '3', '1', '5', '18', '182013052121033133083', '2013-07-26 09:02:40', '182013052121033133083', '2014-12-26 11:02:55');
INSERT INTO `oa_desktop_set` VALUES ('718', '182013052121033133083', '4', '1', '5', '18', '182013052121033133083', '2013-07-26 09:02:40', '182013052121033133083', '2014-12-26 11:02:55');
INSERT INTO `oa_desktop_set` VALUES ('719', '182013052121033133083', '5', '1', '5', '18', '182013052121033133083', '2013-07-26 09:02:40', '182013052121033133083', '2014-12-26 11:02:55');
INSERT INTO `oa_desktop_set` VALUES ('720', '182013052121033133083', '6', '1', '5', '18', '182013052121033133083', '2013-07-26 09:02:40', '182013052121033133083', '2014-12-26 11:02:55');
INSERT INTO `oa_desktop_set` VALUES ('721', '182013052121033133083', '7', '1', '5', '18', '182013052121033133083', '2013-07-26 09:02:40', '182013052121033133083', '2014-12-26 11:02:55');
INSERT INTO `oa_desktop_set` VALUES ('722', '182013052121033133083', '8', '1', '5', '18', '182013052121033133083', '2013-07-26 09:02:40', '182013052121033133083', '2014-12-26 11:02:55');
INSERT INTO `oa_desktop_set` VALUES ('723', '182013052121033133083', '9', '1', '5', '18', '182013052121033133083', '2013-07-26 09:02:40', '182013052121033133083', '2014-12-26 11:02:55');
INSERT INTO `oa_desktop_set` VALUES ('724', '182013052121033133083', '10', '1', '5', '18', '182013052121033133083', '2013-07-26 09:02:40', '182013052121033133083', '2014-12-26 11:02:55');
INSERT INTO `oa_desktop_set` VALUES ('725', '182013052121033133083', '11', '1', '5', '18', '182013052121033133083', '2013-07-26 09:02:40', '182013052121033133083', '2014-12-26 11:02:55');
INSERT INTO `oa_desktop_set` VALUES ('726', '182013052121033133083', '12', '1', '5', '18', '182013052121033133083', '2013-07-26 09:02:40', '182013052121033133083', '2014-12-26 11:02:55');
INSERT INTO `oa_desktop_set` VALUES ('727', '182013052121033133083', '13', '1', '5', '18', '182013052121033133083', '2013-07-26 09:02:40', '182013052121033133083', '2014-12-26 11:02:55');
INSERT INTO `oa_desktop_set` VALUES ('731', '182013072730085454643', '1', '1', '101190101,101190201', '18', '182013072730085454643', '2013-07-27 08:55:43', '182013072730085454643', '2014-01-27 23:11:27');
INSERT INTO `oa_desktop_set` VALUES ('732', '182013072730085454643', '2', '1', '5', '18', '182013072730085454643', '2013-07-27 08:55:43', '182013072730085454643', '2014-01-27 23:11:27');
INSERT INTO `oa_desktop_set` VALUES ('733', '182013072730085454643', '3', '1', '5', '18', '182013072730085454643', '2013-07-27 08:55:43', '182013072730085454643', '2014-01-27 23:11:27');
INSERT INTO `oa_desktop_set` VALUES ('734', '182013072730085454643', '4', '1', '5', '18', '182013072730085454643', '2013-07-27 08:55:43', '182013072730085454643', '2014-01-27 23:11:27');
INSERT INTO `oa_desktop_set` VALUES ('735', '182013072730085454643', '5', '1', '5', '18', '182013072730085454643', '2013-07-27 08:55:43', '182013072730085454643', '2014-01-27 23:11:27');
INSERT INTO `oa_desktop_set` VALUES ('736', '182013072730085454643', '6', '1', '5', '18', '182013072730085454643', '2013-07-27 08:55:43', '182013072730085454643', '2014-01-27 23:11:27');
INSERT INTO `oa_desktop_set` VALUES ('737', '182013072730085454643', '7', '1', '5', '18', '182013072730085454643', '2013-07-27 08:55:43', '182013072730085454643', '2014-01-27 23:11:27');
INSERT INTO `oa_desktop_set` VALUES ('738', '182013072730085454643', '8', '1', '5', '18', '182013072730085454643', '2013-07-27 08:55:43', '182013072730085454643', '2014-01-27 23:11:27');
INSERT INTO `oa_desktop_set` VALUES ('739', '182013072730085454643', '9', '1', '5', '18', '182013072730085454643', '2013-07-27 08:55:43', '182013072730085454643', '2014-01-27 23:11:27');
INSERT INTO `oa_desktop_set` VALUES ('740', '182013072730085454643', '10', '1', '5', '18', '182013072730085454643', '2013-07-27 08:55:43', '182013072730085454643', '2014-01-27 23:11:27');
INSERT INTO `oa_desktop_set` VALUES ('741', '182013072730085454643', '11', '1', '5', '18', '182013072730085454643', '2013-07-27 08:55:43', '182013072730085454643', '2014-01-27 23:11:27');
INSERT INTO `oa_desktop_set` VALUES ('742', '182013072730085454643', '12', '1', '5', '18', '182013072730085454643', '2013-07-27 08:55:43', '182013072730085454643', '2014-01-27 23:11:27');
INSERT INTO `oa_desktop_set` VALUES ('743', '182013072730085454643', '13', '1', '5', '18', '182013072730085454643', '2013-07-27 08:55:43', '182013072730085454643', '2014-01-27 23:11:27');
INSERT INTO `oa_desktop_set` VALUES ('747', '1', '1', '1', null, '1', '1', '2013-07-29 15:08:08', '1', '2013-07-29 15:08:08');
INSERT INTO `oa_desktop_set` VALUES ('748', '1', '2', '1', null, '1', '1', '2013-07-29 15:08:08', '1', '2013-07-29 15:08:08');
INSERT INTO `oa_desktop_set` VALUES ('749', '1', '3', '1', null, '1', '1', '2013-07-29 15:08:08', '1', '2013-07-29 15:08:08');
INSERT INTO `oa_desktop_set` VALUES ('750', '1', '4', '1', null, '1', '1', '2013-07-29 15:08:08', '1', '2013-07-29 15:08:08');
INSERT INTO `oa_desktop_set` VALUES ('751', '1', '5', '1', null, '1', '1', '2013-07-29 15:08:08', '1', '2013-07-29 15:08:08');
INSERT INTO `oa_desktop_set` VALUES ('752', '1', '6', '1', null, '1', '1', '2013-07-29 15:08:08', '1', '2013-07-29 15:08:08');
INSERT INTO `oa_desktop_set` VALUES ('753', '1', '7', '1', null, '1', '1', '2013-07-29 15:08:08', '1', '2013-07-29 15:08:08');
INSERT INTO `oa_desktop_set` VALUES ('754', '1', '8', '1', null, '1', '1', '2013-07-29 15:08:08', '1', '2013-07-29 15:08:08');
INSERT INTO `oa_desktop_set` VALUES ('755', '1', '9', '1', null, '1', '1', '2013-07-29 15:08:08', '1', '2013-07-29 15:08:08');
INSERT INTO `oa_desktop_set` VALUES ('756', '1', '10', '1', null, '1', '1', '2013-07-29 15:08:08', '1', '2013-07-29 15:08:08');
INSERT INTO `oa_desktop_set` VALUES ('757', '1', '11', '1', null, '1', '1', '2013-07-29 15:08:08', '1', '2013-07-29 15:08:08');
INSERT INTO `oa_desktop_set` VALUES ('758', '1', '12', '1', null, '1', '1', '2013-07-29 15:08:08', '1', '2013-07-29 15:08:08');
INSERT INTO `oa_desktop_set` VALUES ('759', '1', '13', '1', null, '1', '1', '2013-07-29 15:08:08', '1', '2013-07-29 15:08:08');
INSERT INTO `oa_desktop_set` VALUES ('763', '182013072730040551054', '1', '1', null, '18', '182013072730040551054', '2013-09-20 16:32:33', '182013072730040551054', '2013-09-20 16:32:33');
INSERT INTO `oa_desktop_set` VALUES ('764', '182013072730040551054', '2', '1', '5', '18', '182013072730040551054', '2013-09-20 16:32:33', '182013072730040551054', '2014-05-24 20:28:49');
INSERT INTO `oa_desktop_set` VALUES ('765', '182013072730040551054', '3', '1', '5', '18', '182013072730040551054', '2013-09-20 16:32:33', '182013072730040551054', '2014-05-24 20:28:49');
INSERT INTO `oa_desktop_set` VALUES ('766', '182013072730040551054', '4', '1', '5', '18', '182013072730040551054', '2013-09-20 16:32:33', '182013072730040551054', '2014-05-24 20:28:49');
INSERT INTO `oa_desktop_set` VALUES ('767', '182013072730040551054', '5', '1', '5', '18', '182013072730040551054', '2013-09-20 16:32:33', '182013072730040551054', '2014-05-24 20:28:49');
INSERT INTO `oa_desktop_set` VALUES ('768', '182013072730040551054', '6', '1', '5', '18', '182013072730040551054', '2013-09-20 16:32:33', '182013072730040551054', '2014-05-24 20:28:49');
INSERT INTO `oa_desktop_set` VALUES ('769', '182013072730040551054', '7', '1', '5', '18', '182013072730040551054', '2013-09-20 16:32:33', '182013072730040551054', '2014-05-24 20:28:49');
INSERT INTO `oa_desktop_set` VALUES ('770', '182013072730040551054', '8', '1', '5', '18', '182013072730040551054', '2013-09-20 16:32:33', '182013072730040551054', '2014-05-24 20:28:49');
INSERT INTO `oa_desktop_set` VALUES ('771', '182013072730040551054', '9', '1', '5', '18', '182013072730040551054', '2013-09-20 16:32:33', '182013072730040551054', '2014-05-24 20:28:49');
INSERT INTO `oa_desktop_set` VALUES ('772', '182013072730040551054', '10', '1', '5', '18', '182013072730040551054', '2013-09-20 16:32:33', '182013072730040551054', '2014-05-24 20:28:49');
INSERT INTO `oa_desktop_set` VALUES ('773', '182013072730040551054', '11', '1', '5', '18', '182013072730040551054', '2013-09-20 16:32:33', '182013072730040551054', '2014-05-24 20:28:49');
INSERT INTO `oa_desktop_set` VALUES ('774', '182013072730040551054', '12', '1', '5', '18', '182013072730040551054', '2013-09-20 16:32:33', '182013072730040551054', '2014-05-24 20:28:49');
INSERT INTO `oa_desktop_set` VALUES ('775', '182013072730040551054', '13', '1', '5', '18', '182013072730040551054', '2013-09-20 16:32:33', '182013072730040551054', '2014-05-24 20:28:49');
INSERT INTO `oa_desktop_set` VALUES ('776', '182013072931083905862', '1', '1', null, '18', '182013072931083905862', '2014-01-27 23:13:11', '182013072931083905862', '2014-01-27 23:13:11');
INSERT INTO `oa_desktop_set` VALUES ('777', '182013072931083905862', '2', '1', null, '18', '182013072931083905862', '2014-01-27 23:13:11', '182013072931083905862', '2014-01-27 23:13:11');
INSERT INTO `oa_desktop_set` VALUES ('778', '182013072931083905862', '3', '1', null, '18', '182013072931083905862', '2014-01-27 23:13:11', '182013072931083905862', '2014-01-27 23:13:11');
INSERT INTO `oa_desktop_set` VALUES ('779', '182013072931083905862', '4', '1', null, '18', '182013072931083905862', '2014-01-27 23:13:11', '182013072931083905862', '2014-01-27 23:13:11');
INSERT INTO `oa_desktop_set` VALUES ('780', '182013072931083905862', '5', '1', null, '18', '182013072931083905862', '2014-01-27 23:13:11', '182013072931083905862', '2014-01-27 23:13:11');
INSERT INTO `oa_desktop_set` VALUES ('781', '182013072931083905862', '6', '1', null, '18', '182013072931083905862', '2014-01-27 23:13:11', '182013072931083905862', '2014-01-27 23:13:11');
INSERT INTO `oa_desktop_set` VALUES ('782', '182013072931083905862', '7', '1', null, '18', '182013072931083905862', '2014-01-27 23:13:11', '182013072931083905862', '2014-01-27 23:13:11');
INSERT INTO `oa_desktop_set` VALUES ('783', '182013072931083905862', '8', '1', null, '18', '182013072931083905862', '2014-01-27 23:13:11', '182013072931083905862', '2014-01-27 23:13:11');
INSERT INTO `oa_desktop_set` VALUES ('784', '182013072931083905862', '9', '1', null, '18', '182013072931083905862', '2014-01-27 23:13:11', '182013072931083905862', '2014-01-27 23:13:11');
INSERT INTO `oa_desktop_set` VALUES ('785', '182013072931083905862', '10', '1', null, '18', '182013072931083905862', '2014-01-27 23:13:11', '182013072931083905862', '2014-01-27 23:13:11');
INSERT INTO `oa_desktop_set` VALUES ('786', '182013072931083905862', '11', '1', null, '18', '182013072931083905862', '2014-01-27 23:13:11', '182013072931083905862', '2014-01-27 23:13:11');
INSERT INTO `oa_desktop_set` VALUES ('787', '182013072931083905862', '12', '1', null, '18', '182013072931083905862', '2014-01-27 23:13:11', '182013072931083905862', '2014-01-27 23:13:11');
INSERT INTO `oa_desktop_set` VALUES ('788', '182013072931083905862', '13', '1', null, '18', '182013072931083905862', '2014-01-27 23:13:11', '182013072931083905862', '2014-01-27 23:13:11');
INSERT INTO `oa_desktop_set` VALUES ('789', '18201401285024208188', '1', '1', null, '18', '18201401285024208188', '2014-01-28 14:46:51', '18201401285024208188', '2014-01-28 14:46:51');
INSERT INTO `oa_desktop_set` VALUES ('790', '18201401285024208188', '2', '1', null, '18', '18201401285024208188', '2014-01-28 14:46:51', '18201401285024208188', '2014-01-28 14:46:51');
INSERT INTO `oa_desktop_set` VALUES ('791', '18201401285024208188', '3', '1', null, '18', '18201401285024208188', '2014-01-28 14:46:51', '18201401285024208188', '2014-01-28 14:46:51');
INSERT INTO `oa_desktop_set` VALUES ('792', '18201401285024208188', '4', '1', null, '18', '18201401285024208188', '2014-01-28 14:46:51', '18201401285024208188', '2014-01-28 14:46:51');
INSERT INTO `oa_desktop_set` VALUES ('793', '18201401285024208188', '5', '1', null, '18', '18201401285024208188', '2014-01-28 14:46:51', '18201401285024208188', '2014-01-28 14:46:51');
INSERT INTO `oa_desktop_set` VALUES ('794', '18201401285024208188', '6', '1', null, '18', '18201401285024208188', '2014-01-28 14:46:51', '18201401285024208188', '2014-01-28 14:46:51');
INSERT INTO `oa_desktop_set` VALUES ('795', '18201401285024208188', '7', '1', null, '18', '18201401285024208188', '2014-01-28 14:46:51', '18201401285024208188', '2014-01-28 14:46:51');
INSERT INTO `oa_desktop_set` VALUES ('796', '18201401285024208188', '8', '1', null, '18', '18201401285024208188', '2014-01-28 14:46:51', '18201401285024208188', '2014-01-28 14:46:51');
INSERT INTO `oa_desktop_set` VALUES ('797', '18201401285024208188', '9', '1', null, '18', '18201401285024208188', '2014-01-28 14:46:51', '18201401285024208188', '2014-01-28 14:46:51');
INSERT INTO `oa_desktop_set` VALUES ('798', '18201401285024208188', '10', '1', null, '18', '18201401285024208188', '2014-01-28 14:46:51', '18201401285024208188', '2014-01-28 14:46:51');
INSERT INTO `oa_desktop_set` VALUES ('799', '18201401285024208188', '11', '1', null, '18', '18201401285024208188', '2014-01-28 14:46:51', '18201401285024208188', '2014-01-28 14:46:51');
INSERT INTO `oa_desktop_set` VALUES ('800', '18201401285024208188', '12', '1', null, '18', '18201401285024208188', '2014-01-28 14:46:51', '18201401285024208188', '2014-01-28 14:46:51');
INSERT INTO `oa_desktop_set` VALUES ('801', '18201401285024208188', '13', '1', null, '18', '18201401285024208188', '2014-01-28 14:46:51', '18201401285024208188', '2014-01-28 14:46:51');
INSERT INTO `oa_desktop_set` VALUES ('802', '51', '1', '1', null, '18', '51', '2014-04-04 12:57:41', '51', '2014-04-04 12:57:41');
INSERT INTO `oa_desktop_set` VALUES ('803', '51', '2', '1', null, '18', '51', '2014-04-04 12:57:41', '51', '2014-04-04 12:57:41');
INSERT INTO `oa_desktop_set` VALUES ('804', '51', '3', '1', null, '18', '51', '2014-04-04 12:57:41', '51', '2014-04-04 12:57:41');
INSERT INTO `oa_desktop_set` VALUES ('805', '51', '4', '1', null, '18', '51', '2014-04-04 12:57:41', '51', '2014-04-04 12:57:41');
INSERT INTO `oa_desktop_set` VALUES ('806', '51', '5', '1', null, '18', '51', '2014-04-04 12:57:41', '51', '2014-04-04 12:57:41');
INSERT INTO `oa_desktop_set` VALUES ('807', '51', '6', '1', null, '18', '51', '2014-04-04 12:57:41', '51', '2014-04-04 12:57:41');
INSERT INTO `oa_desktop_set` VALUES ('808', '51', '7', '1', null, '18', '51', '2014-04-04 12:57:41', '51', '2014-04-04 12:57:41');
INSERT INTO `oa_desktop_set` VALUES ('809', '51', '8', '1', null, '18', '51', '2014-04-04 12:57:41', '51', '2014-04-04 12:57:41');
INSERT INTO `oa_desktop_set` VALUES ('810', '51', '9', '1', null, '18', '51', '2014-04-04 12:57:41', '51', '2014-04-04 12:57:41');
INSERT INTO `oa_desktop_set` VALUES ('811', '51', '10', '1', null, '18', '51', '2014-04-04 12:57:41', '51', '2014-04-04 12:57:41');
INSERT INTO `oa_desktop_set` VALUES ('812', '51', '11', '1', null, '18', '51', '2014-04-04 12:57:41', '51', '2014-04-04 12:57:41');
INSERT INTO `oa_desktop_set` VALUES ('813', '51', '12', '1', null, '18', '51', '2014-04-04 12:57:41', '51', '2014-04-04 12:57:41');
INSERT INTO `oa_desktop_set` VALUES ('814', '51', '13', '1', null, '18', '51', '2014-04-04 12:57:41', '51', '2014-04-04 12:57:41');
INSERT INTO `oa_desktop_set` VALUES ('815', '182014052421084820990', '1', '1', null, '18', '182014052421084820990', '2014-05-24 20:49:45', '182014052421084820990', '2014-05-24 20:49:45');
INSERT INTO `oa_desktop_set` VALUES ('816', '182014052421084820990', '2', '1', null, '18', '182014052421084820990', '2014-05-24 20:49:45', '182014052421084820990', '2014-05-24 20:49:45');
INSERT INTO `oa_desktop_set` VALUES ('817', '182014052421084820990', '3', '1', null, '18', '182014052421084820990', '2014-05-24 20:49:45', '182014052421084820990', '2014-05-24 20:49:45');
INSERT INTO `oa_desktop_set` VALUES ('818', '182014052421084820990', '4', '1', null, '18', '182014052421084820990', '2014-05-24 20:49:45', '182014052421084820990', '2014-05-24 20:49:45');
INSERT INTO `oa_desktop_set` VALUES ('819', '182014052421084820990', '5', '1', null, '18', '182014052421084820990', '2014-05-24 20:49:45', '182014052421084820990', '2014-05-24 20:49:45');
INSERT INTO `oa_desktop_set` VALUES ('820', '182014052421084820990', '6', '1', null, '18', '182014052421084820990', '2014-05-24 20:49:45', '182014052421084820990', '2014-05-24 20:49:45');
INSERT INTO `oa_desktop_set` VALUES ('821', '182014052421084820990', '7', '1', null, '18', '182014052421084820990', '2014-05-24 20:49:45', '182014052421084820990', '2014-05-24 20:49:45');
INSERT INTO `oa_desktop_set` VALUES ('822', '182014052421084820990', '8', '1', null, '18', '182014052421084820990', '2014-05-24 20:49:45', '182014052421084820990', '2014-05-24 20:49:45');
INSERT INTO `oa_desktop_set` VALUES ('823', '182014052421084820990', '9', '1', null, '18', '182014052421084820990', '2014-05-24 20:49:45', '182014052421084820990', '2014-05-24 20:49:45');
INSERT INTO `oa_desktop_set` VALUES ('824', '182014052421084820990', '10', '1', null, '18', '182014052421084820990', '2014-05-24 20:49:45', '182014052421084820990', '2014-05-24 20:49:45');
INSERT INTO `oa_desktop_set` VALUES ('825', '182014052421084820990', '11', '1', null, '18', '182014052421084820990', '2014-05-24 20:49:45', '182014052421084820990', '2014-05-24 20:49:45');
INSERT INTO `oa_desktop_set` VALUES ('826', '182014052421084820990', '12', '1', null, '18', '182014052421084820990', '2014-05-24 20:49:45', '182014052421084820990', '2014-05-24 20:49:45');
INSERT INTO `oa_desktop_set` VALUES ('827', '182014052421084820990', '13', '1', null, '18', '182014052421084820990', '2014-05-24 20:49:45', '182014052421084820990', '2014-05-24 20:49:45');
INSERT INTO `oa_desktop_set` VALUES ('828', '182014052421102129560', '1', '1', null, '18', '182014052421102129560', '2014-05-24 22:22:13', '182014052421102129560', '2014-05-24 22:22:13');
INSERT INTO `oa_desktop_set` VALUES ('829', '182014052421102129560', '2', '1', null, '18', '182014052421102129560', '2014-05-24 22:22:13', '182014052421102129560', '2014-05-24 22:22:13');
INSERT INTO `oa_desktop_set` VALUES ('830', '182014052421102129560', '3', '1', null, '18', '182014052421102129560', '2014-05-24 22:22:13', '182014052421102129560', '2014-05-24 22:22:13');
INSERT INTO `oa_desktop_set` VALUES ('831', '182014052421102129560', '4', '1', null, '18', '182014052421102129560', '2014-05-24 22:22:13', '182014052421102129560', '2014-05-24 22:22:13');
INSERT INTO `oa_desktop_set` VALUES ('832', '182014052421102129560', '5', '1', null, '18', '182014052421102129560', '2014-05-24 22:22:13', '182014052421102129560', '2014-05-24 22:22:13');
INSERT INTO `oa_desktop_set` VALUES ('833', '182014052421102129560', '6', '1', null, '18', '182014052421102129560', '2014-05-24 22:22:13', '182014052421102129560', '2014-05-24 22:22:13');
INSERT INTO `oa_desktop_set` VALUES ('834', '182014052421102129560', '7', '1', null, '18', '182014052421102129560', '2014-05-24 22:22:13', '182014052421102129560', '2014-05-24 22:22:13');
INSERT INTO `oa_desktop_set` VALUES ('835', '182014052421102129560', '8', '1', null, '18', '182014052421102129560', '2014-05-24 22:22:13', '182014052421102129560', '2014-05-24 22:22:13');
INSERT INTO `oa_desktop_set` VALUES ('836', '182014052421102129560', '9', '1', null, '18', '182014052421102129560', '2014-05-24 22:22:13', '182014052421102129560', '2014-05-24 22:22:13');
INSERT INTO `oa_desktop_set` VALUES ('837', '182014052421102129560', '10', '1', null, '18', '182014052421102129560', '2014-05-24 22:22:13', '182014052421102129560', '2014-05-24 22:22:13');
INSERT INTO `oa_desktop_set` VALUES ('838', '182014052421102129560', '11', '1', null, '18', '182014052421102129560', '2014-05-24 22:22:13', '182014052421102129560', '2014-05-24 22:22:13');
INSERT INTO `oa_desktop_set` VALUES ('839', '182014052421102129560', '12', '1', null, '18', '182014052421102129560', '2014-05-24 22:22:13', '182014052421102129560', '2014-05-24 22:22:13');
INSERT INTO `oa_desktop_set` VALUES ('840', '182014052421102129560', '13', '1', null, '18', '182014052421102129560', '2014-05-24 22:22:13', '182014052421102129560', '2014-05-24 22:22:13');
INSERT INTO `oa_desktop_set` VALUES ('841', '182014052421104440246', '1', '1', null, '18', '182014052421104440246', '2014-05-24 22:45:24', '182014052421104440246', '2014-05-24 22:45:24');
INSERT INTO `oa_desktop_set` VALUES ('842', '182014052421104440246', '2', '1', null, '18', '182014052421104440246', '2014-05-24 22:45:24', '182014052421104440246', '2014-05-24 22:45:24');
INSERT INTO `oa_desktop_set` VALUES ('843', '182014052421104440246', '3', '1', null, '18', '182014052421104440246', '2014-05-24 22:45:24', '182014052421104440246', '2014-05-24 22:45:24');
INSERT INTO `oa_desktop_set` VALUES ('844', '182014052421104440246', '4', '1', null, '18', '182014052421104440246', '2014-05-24 22:45:24', '182014052421104440246', '2014-05-24 22:45:24');
INSERT INTO `oa_desktop_set` VALUES ('845', '182014052421104440246', '5', '1', null, '18', '182014052421104440246', '2014-05-24 22:45:24', '182014052421104440246', '2014-05-24 22:45:24');
INSERT INTO `oa_desktop_set` VALUES ('846', '182014052421104440246', '6', '1', null, '18', '182014052421104440246', '2014-05-24 22:45:24', '182014052421104440246', '2014-05-24 22:45:24');
INSERT INTO `oa_desktop_set` VALUES ('847', '182014052421104440246', '7', '1', null, '18', '182014052421104440246', '2014-05-24 22:45:24', '182014052421104440246', '2014-05-24 22:45:24');
INSERT INTO `oa_desktop_set` VALUES ('848', '182014052421104440246', '8', '1', null, '18', '182014052421104440246', '2014-05-24 22:45:24', '182014052421104440246', '2014-05-24 22:45:24');
INSERT INTO `oa_desktop_set` VALUES ('849', '182014052421104440246', '9', '1', null, '18', '182014052421104440246', '2014-05-24 22:45:24', '182014052421104440246', '2014-05-24 22:45:24');
INSERT INTO `oa_desktop_set` VALUES ('850', '182014052421104440246', '10', '1', null, '18', '182014052421104440246', '2014-05-24 22:45:24', '182014052421104440246', '2014-05-24 22:45:24');
INSERT INTO `oa_desktop_set` VALUES ('851', '182014052421104440246', '11', '1', null, '18', '182014052421104440246', '2014-05-24 22:45:24', '182014052421104440246', '2014-05-24 22:45:24');
INSERT INTO `oa_desktop_set` VALUES ('852', '182014052421104440246', '12', '1', null, '18', '182014052421104440246', '2014-05-24 22:45:24', '182014052421104440246', '2014-05-24 22:45:24');
INSERT INTO `oa_desktop_set` VALUES ('853', '182014052421104440246', '13', '1', null, '18', '182014052421104440246', '2014-05-24 22:45:24', '182014052421104440246', '2014-05-24 22:45:24');
INSERT INTO `oa_desktop_set` VALUES ('854', '2', '1', '1', null, '1', '2', '2014-10-23 12:54:33', '2', '2014-10-23 12:54:33');
INSERT INTO `oa_desktop_set` VALUES ('855', '2', '2', '1', null, '1', '2', '2014-10-23 12:54:33', '2', '2014-10-23 12:54:33');
INSERT INTO `oa_desktop_set` VALUES ('856', '2', '3', '1', null, '1', '2', '2014-10-23 12:54:33', '2', '2014-10-23 12:54:33');
INSERT INTO `oa_desktop_set` VALUES ('857', '2', '4', '1', null, '1', '2', '2014-10-23 12:54:33', '2', '2014-10-23 12:54:33');
INSERT INTO `oa_desktop_set` VALUES ('858', '2', '5', '1', null, '1', '2', '2014-10-23 12:54:33', '2', '2014-10-23 12:54:33');
INSERT INTO `oa_desktop_set` VALUES ('859', '2', '6', '1', null, '1', '2', '2014-10-23 12:54:33', '2', '2014-10-23 12:54:33');
INSERT INTO `oa_desktop_set` VALUES ('860', '2', '7', '1', null, '1', '2', '2014-10-23 12:54:33', '2', '2014-10-23 12:54:33');
INSERT INTO `oa_desktop_set` VALUES ('861', '2', '8', '1', null, '1', '2', '2014-10-23 12:54:33', '2', '2014-10-23 12:54:33');
INSERT INTO `oa_desktop_set` VALUES ('862', '2', '9', '1', null, '1', '2', '2014-10-23 12:54:33', '2', '2014-10-23 12:54:33');
INSERT INTO `oa_desktop_set` VALUES ('863', '2', '10', '1', null, '1', '2', '2014-10-23 12:54:33', '2', '2014-10-23 12:54:33');
INSERT INTO `oa_desktop_set` VALUES ('864', '2', '11', '1', null, '1', '2', '2014-10-23 12:54:33', '2', '2014-10-23 12:54:33');
INSERT INTO `oa_desktop_set` VALUES ('865', '2', '12', '1', null, '1', '2', '2014-10-23 12:54:33', '2', '2014-10-23 12:54:33');
INSERT INTO `oa_desktop_set` VALUES ('866', '2', '13', '1', null, '1', '2', '2014-10-23 12:54:33', '2', '2014-10-23 12:54:33');
INSERT INTO `oa_forums` VALUES ('3', '程序发布公', '程序、补丁发布区，请随时关注新版本动态!', '182013052121033133083', '182013052121033133083', '2013-09-17', '59', '182013052121033133083', '2013-09-17 16:37:36', '182013052121033133083', '2014-05-25 07:58:09', '18');
INSERT INTO `oa_forums` VALUES ('5', 'BUG反馈', '专门收集网友反馈的系统bug信息，及时提供bug解决方案。', '182013052121033133083', '182013052121033133083', '2013-09-17', null, '182013052121033133083', '2013-09-17 16:37:56', '182013052121033133083', '2014-01-26 10:40:05', '18');
INSERT INTO `oa_forums` VALUES ('7', '安装与使用', '安装或使用中出现问题，请描述下您的系统使用环境，如操作系统，JDK版本，tocmat版本，mysql版本等', '182013072730085454643', '182013072730085454643', '2013-09-17', null, '182013072730085454643', '2013-09-17 16:46:22', '182013052121033133083', '2014-01-26 10:40:28', '18');
INSERT INTO `oa_leaveregistration` VALUES ('4', '75001', '182013052121033133083', '出去喝喜酒了！', '2280', '2015-01-14 15:05', '2015-01-15 15:05', '182013052121033133083', '2015-01-14 15:05:35', '182013052121033133083', '2015-01-14 15:20:50', '18', '3', '2015-01-14 15:05:35', null, null);
INSERT INTO `oa_leaveregistration` VALUES ('6', '75115', '182013072730085454643', '请假事由', '2280', '2015-01-14 15:37', '2015-01-14 15:37', '182013072730085454643', '2015-01-14 15:37:39', '182013072730085454643', '2015-01-14 15:37:39', '18', '3', '2015-01-14 15:37:39', null, null);
INSERT INTO `oa_leaveregistration` VALUES ('7', '2505', '182013052121033133083', '请假事由', '2280', '2015-05-12 15:23', '2015-05-12 15:23', '182013052121033133083', '2015-05-12 15:24:02', '182013052121033133083', '2015-05-12 15:24:02', '18', '2', '2015-05-12 15:24:02', null, null);
INSERT INTO `oa_mail_emp` VALUES ('1', '1', '182013052121033133083', null, null, '1', '2', null, null, '18');
INSERT INTO `oa_mail_emp` VALUES ('2', '2', '182013072730085454643', null, null, '1', '2', null, null, '18');
INSERT INTO `oa_mail_emp` VALUES ('3', '3', '182013072730040551054', null, null, '1', '1', null, null, '18');
INSERT INTO `oa_mail_emp` VALUES ('4', '4', '182013072730085454643', null, null, '1', '1', null, null, '18');
INSERT INTO `oa_mail_emp` VALUES ('5', '5', '182013052121033133083', null, null, '1', '1', null, null, '18');
INSERT INTO `oa_mail_emp` VALUES ('6', '6', '182013052121033133083', null, null, '1', '1', null, null, '18');
INSERT INTO `oa_mail_emp` VALUES ('7', '6', '182014032913033222840', null, null, '2', '1', null, null, '18');
INSERT INTO `oa_mail_emp` VALUES ('8', '6', '182013072730085454643', null, null, '1', '1', null, null, '18');
INSERT INTO `oa_mail_emp` VALUES ('9', '6', '18201401285024208188', null, null, '2', '1', null, null, '18');
INSERT INTO `oa_mail_emp` VALUES ('10', '6', '182013072931083905862', null, null, '1', '1', null, null, '18');
INSERT INTO `oa_mail_emp` VALUES ('11', '6', '182013072730040551054', null, null, '1', '1', null, null, '18');
INSERT INTO `oa_mail_inbox` VALUES ('1', '182013072730085454643', '张三', '总经办', '2013-09-19 00:00:05', '4', '您可以在此处发送内部邮件！, 系统内部人员可以查阅！', '<p>您可以在此处发送内部邮件！, 系统内部人员可以查阅！</p>', '', '2013-09-19 00:00:05', '2', '狄晓靖,', '182013052121033133083,', '', '', '', '182013072730085454643', '2013-09-19 00:00:05', '18');
INSERT INTO `oa_mail_inbox` VALUES ('2', '182013052121033133083', '狄晓靖', '总经办', '2013-09-19 00:27:42', '4', 'Re:您可以在此处发送内部邮件！, 系统内部人员可以查阅！', '<p>===============张三在2013-09-19 00:00:05的来信中写道：==============</p><p>您可以在此处发送内部邮件！, 系统内部人员可以查阅！</p><p>&nbsp;</p><p>&nbsp;</p><p>desktop_showtimer.jsp</p>', '', '2013-09-19 00:27:42', '2', '张三,', '182013072730085454643,', '', '', '', '182013052121033133083', '2013-09-19 00:27:42', '18');
INSERT INTO `oa_mail_inbox` VALUES ('3', '182013072730085454643', '张三', '总经办', '2013-09-20 22:07:02', '4', 'height=\"25px\" ', '<p>height=&quot;25px&quot;</p>', '', '2013-09-20 22:07:02', '2', '李四,', '182013072730040551054,', '', '', '', '182013072730085454643', '2013-09-20 22:07:02', '18');
INSERT INTO `oa_mail_inbox` VALUES ('4', '182013052121033133083', '狄晓靖', '总经办', '2013-10-28 23:12:23', '4', '测试', '<p>&nbsp;box.dialogIdbox.dialogId</p>', '', '2013-10-28 23:12:23', '2', '张三,', '182013072730085454643,', '', '', '', '182013052121033133083', '2013-10-28 23:12:23', '18');
INSERT INTO `oa_mail_inbox` VALUES ('5', '182013072730085454643', '张三', '总经办', '2013-10-28 23:16:08', '4', '测试一下', '', '', '2013-10-28 23:16:08', '2', '狄晓靖,', '182013052121033133083,', '', '', '', '182013072730085454643', '2013-10-28 23:16:08', '18');
INSERT INTO `oa_mail_inbox` VALUES ('6', '182013052121033133083', '狄晓靖', '造价部', '2014-05-24 20:45:42', '4', '邮件主题', '', '', '2014-05-24 20:45:42', '2', '狄晓靖,小七,张三,马六,王五,李四,', '182013052121033133083,182014032913033222840,182013072730085454643,18201401285024208188,182013072931083905862,182013072730040551054,', '', '', '', '182013052121033133083', '2014-05-24 20:45:42', '18');
INSERT INTO `oa_mail_send` VALUES ('2', '182013052121033133083', '总经办', '182013072730085454643,', '张三,', '', '', '', '', '2', '2013-09-19 00:27:42', '2013-09-19 00:27:42', '4', 'Re:您可以在此处发送内部邮件！, 系统内部人员可以查阅！', '<p>===============张三在2013-09-19 00:00:05的来信中写道：==============</p><p>您可以在此处发送内部邮件！, 系统内部人员可以查阅！</p><p>&nbsp;</p><p>&nbsp;</p><p>desktop_showtimer.jsp</p>', '', '1', '182013052121033133083', '2013-09-19 00:27:42', '18');
INSERT INTO `oa_mail_send` VALUES ('3', '182013072730085454643', '总经办', '182013072730040551054,', '李四,', '', '', '', '', '2', '2013-09-20 22:07:02', '2013-09-20 22:07:02', '4', 'height=\"25px\" ', '<p>height=&quot;25px&quot;</p>', '', '1', '182013072730085454643', '2013-09-20 22:07:02', '18');
INSERT INTO `oa_mail_send` VALUES ('4', '182013052121033133083', '总经办', '182013072730085454643,', '张三,', '', '', '', '', '2', '2013-10-28 23:12:23', '2013-10-28 23:12:23', '4', '测试', '<p>&nbsp;box.dialogIdbox.dialogId</p>', '', '1', '182013052121033133083', '2013-10-28 23:12:23', '18');
INSERT INTO `oa_mail_send` VALUES ('5', '182013072730085454643', '总经办', '182013052121033133083,', '狄晓靖,', '', '', '', '', '2', '2013-10-28 23:16:08', '2013-10-28 23:16:08', '4', '测试一下', '', '', '1', '182013072730085454643', '2013-10-28 23:16:08', '18');
INSERT INTO `oa_mail_send` VALUES ('6', '182013072730085454643', '总经办', '182013052121033133083,', '狄晓靖,', '', '', '', '', '2', '2013-10-28 23:28:21', '2013-10-28 23:28:21', '4', '草稿', '', '', '2', '182013072730085454643', '2013-10-28 23:28:21', '18');
INSERT INTO `oa_mail_send` VALUES ('7', '182013072730085454643', '总经办', '182013052121033133083,', '狄晓靖,', '', '', '', '', '2', '2014-03-30 09:24:09', '2014-03-30 09:24:09', '4', '邮件主题', '', '', '2', '182013072730085454643', '2014-03-30 09:24:09', '18');
INSERT INTO `oa_mail_send` VALUES ('8', '182013072730085454643', '总经办', '182013052121033133083,', '狄晓靖,', '', '', '', '', '2', '2014-03-30 09:24:57', '2014-03-30 09:24:57', '4', '邮件主题', '', '', '2', '182013072730085454643', '2014-03-30 09:24:57', '18');
INSERT INTO `oa_mail_send` VALUES ('9', '182013072730085454643', '总经办', '182013052121033133083,', '狄晓靖,', '', '', '', '', '2', '2014-03-30 09:25:13', '2014-03-30 09:25:13', '4', '邮件主题', '', '', '2', '182013072730085454643', '2014-03-30 09:25:13', '18');
INSERT INTO `oa_mail_send` VALUES ('10', '182013052121033133083', '造价部', '182013052121033133083,182014032913033222840,182013072730085454643,18201401285024208188,182013072931083905862,182013072730040551054,', '狄晓靖,小七,张三,马六,王五,李四,', '', '', '', '', '2', '2014-05-24 20:45:35', '2014-05-24 20:45:35', '4', '邮件主题', '', '', '2', '182013052121033133083', '2014-05-24 20:45:35', '18');
INSERT INTO `oa_mail_send` VALUES ('11', '182013052121033133083', '造价部', '182013052121033133083,182014032913033222840,182013072730085454643,18201401285024208188,182013072931083905862,182013072730040551054,', '狄晓靖,小七,张三,马六,王五,李四,', '', '', '', '', '2', '2014-05-24 20:45:42', '2014-05-24 20:45:42', '4', '邮件主题', '', '', '1', '182013052121033133083', '2014-05-24 20:45:42', '18');
INSERT INTO `oa_meetapply` VALUES ('1', '年终大会', '182013052121033133083', '年终大会', '2013-10-07 20:03:40', '56,65,66,67,68,57,64,59,60,62,72,61,63,69,70,71,73,', '', '182013052121033133083,182013072730085454643,182013072931083905862,182013072730040551054,', '182013052121033133083,', '1', '2013-10-07 20:03', '2013-10-08 20:03', null, '2180', '3', '', '', 'false', '1', '182013052121033133083', '2013-10-07 20:03:40', '182013052121033133083', '2013-10-07 20:03:40', '18');
INSERT INTO `oa_meetapply` VALUES ('2', '会议', '182013072730085454643', '会议', '2014-01-21 10:45:10', '65,', '', '182013052121033133083,182013072730085454643,182013072931083905862,182013072730040551054,', '182013052121033133083,', '1', '2014-01-21 10:44', '2014-01-30 10:44', null, '2180', '3', '会议', '', 'false', '1', '182013072730085454643', '2014-01-21 10:45:10', '182013072730085454643', '2014-01-21 10:45:10', '18');
INSERT INTO `oa_meetapply` VALUES ('3', '会议名称', '182013052121033133083', '会议主题', '2014-04-29 19:38:48', '76,77,', '', '182013052121033133083,182014032913033222840,182013072730085454643,18201401285024208188,182013072931083905862,182013072730040551054,', '182013052121033133083,182014032913033222840,182013072730085454643,18201401285024208188,182013072931083905862,182013072730040551054,', '1', '2014-04-29 19:38', '2014-04-30 19:38', null, '2180', '3', '会议描述', '449', 'false', '1', '182013052121033133083', '2014-04-29 19:38:48', '182013052121033133083', '2014-04-29 19:38:48', '18');
INSERT INTO `oa_meetapply` VALUES ('4', '会议名称2', '182013052121033133083', '会议主题2', '2014-04-29 20:04:06', '76,77,', '', '182013052121033133083,182014032913033222840,182013072730085454643,18201401285024208188,182013072931083905862,182013072730040551054,', '182013052121033133083,182014032913033222840,182013072730085454643,18201401285024208188,182013072931083905862,182013072730040551054,', '2', '2014-04-29 20:03', '2014-04-30 20:03', null, '2180', '3', '会议描述会议描述', '451,452', 'false', '2', '182013052121033133083', '2014-04-29 20:04:06', '182013052121033133083', '2014-04-29 20:04:06', '18');
INSERT INTO `oa_netdisk_config` VALUES ('1', '182013052121033133083', '1.97047042846687', '50', '182013072730085454643', '2013-07-27 09:46:20', '182013052121033133083', '2015-01-03 13:56:02', '18');
INSERT INTO `oa_netdisk_config` VALUES ('2', '182013072730085454643', '14.5856313705445', '50', '182013072730085454643', '2013-07-27 09:46:20', '182013052121033133083', '2014-06-21 10:14:04', '18');
INSERT INTO `oa_netdisk_config` VALUES ('3', '182013072730040551054', '0', '50', '182013052121033133083', '2013-08-29 08:44:40', '182013052121033133083', '2013-08-29 08:44:40', '18');
INSERT INTO `oa_netdisk_config` VALUES ('4', '182013072931083905862', '0', '50', '182013052121033133083', '2013-08-29 08:44:40', '182013052121033133083', '2013-08-29 08:44:40', '18');
INSERT INTO `oa_netdisk_config` VALUES ('5', '18201401285024208188', '0', '50', '182013072730085454643', '2014-02-08 16:25:22', '182013072730085454643', '2014-02-08 16:25:22', '18');
INSERT INTO `oa_netdisk_config` VALUES ('6', '182014032913033222840', '0', '50', '182013072730085454643', '2014-04-03 15:14:39', '182013072730085454643', '2014-04-03 15:14:39', '18');
INSERT INTO `oa_netdisk_config` VALUES ('7', '182014052421084820990', '0', '50', '182014052421104440246', '2014-05-24 22:48:23', '182014052421104440246', '2014-05-24 22:48:23', '18');
INSERT INTO `oa_netdisk_config` VALUES ('8', '182014052421102129560', '0', '50', '182014052421104440246', '2014-05-24 22:48:23', '182014052421104440246', '2014-05-24 22:48:23', '18');
INSERT INTO `oa_netdisk_config` VALUES ('9', '182014052421104440246', '0', '50', '182014052421104440246', '2014-05-24 22:48:23', '182014052421104440246', '2014-05-24 22:48:23', '18');
INSERT INTO `oa_netdisk_config` VALUES ('10', '182014061625041124312', '0', '50', '182013052121033133083', '2014-06-19 20:15:22', '182013052121033133083', '2014-06-19 20:15:22', '18');
INSERT INTO `oa_netdisk_share` VALUES ('1', '182013052121033133083', '%E6%96%87%E4%BB%B6%E5%A4%B9%E4%B8%80', '\\文件夹一', '182013052121033133083,182014032913033222840,182014061625041124312,182013072730085454643,18201401285024208188,182013072931083905862,182013072730040551054,182014052421084820990,182014052421102129560,182014052421104440246,', '', '', '182013052121033133083', '2014-10-21 14:28:18', '182013052121033133083', '2014-10-21 14:28:18', '18');
INSERT INTO `oa_netmail_person` VALUES ('3', '网易', 'yangdajiangchao@163.com', '182013072730085454643', '18', '2013-09-19 22:32:03');
INSERT INTO `oa_netmail_person` VALUES ('4', '网易2', 'yangdajiangchao@163.com', '182013072730085454643', '18', '2013-09-19 22:32:25');
INSERT INTO `oa_netmail_person` VALUES ('5', '网易3', '123@123.com', '182013072730085454643', '18', '2013-09-19 22:32:48');
INSERT INTO `oa_netmail_person` VALUES ('7', '小李', '123@123.com', '182013072730085454643', '18', '2013-10-01 21:40:11');
INSERT INTO `oa_netmail_person` VALUES ('8', '小一', '123@123.com', '182013072730085454643', '18', '2014-01-24 11:13:45');
INSERT INTO `oa_netmail_person` VALUES ('13', 'QQ', '344359951@qq.com', '182013072730085454643', '18', '2014-01-26 12:37:59');
INSERT INTO `oa_netmail_person` VALUES ('15', '123', '123@1.com', '182013052121033133083', '18', '2014-05-24 20:40:21');
INSERT INTO `oa_netmail_person` VALUES ('16', '123', '1@1.com', '182013052121033133083', '18', '2014-05-24 23:00:30');
INSERT INTO `oa_netmail_person` VALUES ('17', '1', '1@1.com', '182013052121033133083', '18', '2014-05-24 23:01:11');
INSERT INTO `oa_netmail_person` VALUES ('18', '2', '2@2.com', '182013052121033133083', '18', '2014-05-24 23:01:24');
INSERT INTO `oa_netmail_person` VALUES ('19', '3', '3@3.com', '182013052121033133083', '18', '2014-05-24 23:03:58');
INSERT INTO `oa_netmail_person` VALUES ('20', '4', '4@4.com', '182013052121033133083', '18', '2014-05-24 23:06:01');
INSERT INTO `oa_netmail_person` VALUES ('21', '5', '5@5.com', '182013052121033133083', '18', '2014-05-24 23:06:58');
INSERT INTO `oa_netmail_person` VALUES ('22', '6', '6@6.com', '182013052121033133083', '18', '2014-05-24 23:07:51');
INSERT INTO `oa_netmail_person` VALUES ('23', '7@7.com', '7@7.com', '182013052121033133083', '18', '2014-05-24 23:08:05');
INSERT INTO `oa_notice` VALUES ('1', '宜兴市人民南路52号经信委307办公室宜兴市人民南路52号经信委307办公室', '1', '182013052121033133083', '2014-04-06 15:50', '', '56,65,66,67,68,57,64,59,60,62,61,63,', '<p>&nbsp; <span style=\"color: rgb(51, 51, 51); font-family: Arial, Verdana, Helvetica, sans-serif; font-size: 14px; line-height: 28px; text-indent: 28px; \">宜兴市人民南路52号经信委307办公室</span></p>', '1', '', '182013052121033133083', '2013-09-18 15:33:56', '182013052121033133083', ' 2014-04-06 15:50:17 ', '18');
INSERT INTO `oa_notice` VALUES ('2', '活动截止时间至8月8号', '1', '182013052121033133083', '2013-09-18 15:39', '', '56,65,66,67,68,57,64,59,60,62,61,63,', '<p>&nbsp; <span style=\"color: rgb(51, 51, 51); font-family: Arial, Verdana, Helvetica, sans-serif; font-size: 14px; line-height: 28px; text-indent: 28px; \">活动截止时间至8月8号</span></p>', '1', '', '182013052121033133083', '2013-09-18 15:39:08', '182013052121033133083', '2013-09-18 15:39:08', '18');
INSERT INTO `oa_notice` VALUES ('4', '通知标题', '1', '182013072730085454643', '2014-01-23 22:09', '182013052121033133083,182013072730085454643,182013072931083905862,182013072730040551054,', '56,65,66,75,67,68,57,64,59,60,62,72,61,63,69,70,71,73,', '<p>通知标题标题标题标题标题标题标题标题</p>', '1', '', '182013072730085454643', '2014-01-23 22:08:04', '182013072730085454643', ' 2014-03-29 16:24:30 ', '18');
INSERT INTO `oa_photo` VALUES ('6', '2.jpg', '2013-09-20', '', '1', '11', '182013052121033133083', '2013-09-20 22:51:58', '182013052121033133083', '2013-09-20 22:51:58', '18');
INSERT INTO `oa_photo` VALUES ('7', '3.jpg', '2013-09-20', '', '1', '12', '182013052121033133083', '2013-09-20 22:51:58', '182013052121033133083', '2013-09-20 22:51:58', '18');
INSERT INTO `oa_photo` VALUES ('8', '10.jpg', '2013-09-20', '', '1', '13', '182013072730085454643', '2013-09-20 22:52:53', '182013072730085454643', '2013-09-20 22:52:53', '18');
INSERT INTO `oa_photo` VALUES ('9', '12.jpg', '2013-09-20', '', '1', '14', '182013072730085454643', '2013-09-20 22:52:53', '182013072730085454643', '2013-09-20 22:52:53', '18');
INSERT INTO `oa_photo` VALUES ('10', '11.jpg', '2013-09-20', '', '1', '15', '182013072730085454643', '2013-09-20 22:52:53', '182013072730085454643', '2013-09-20 22:52:53', '18');
INSERT INTO `oa_photo` VALUES ('11', '9.jpg', '2013-09-20', '', '1', '16', '182013072730085454643', '2013-09-20 22:52:53', '182013072730085454643', '2013-09-20 22:52:53', '18');
INSERT INTO `oa_photo` VALUES ('12', 'powed.jpg', '2014-01-23', '', '1', '17', '182013052121033133083', '2014-01-23 16:59:01', '182013052121033133083', '2014-01-23 16:59:01', '18');
INSERT INTO `oa_photo` VALUES ('13', 'untitled_20140313231609820.bmp', '2014-03-13', '', '1', '29', '182013072730085454643', '2014-03-13 23:16:11', '182013072730085454643', '2014-03-13 23:16:11', '18');
INSERT INTO `oa_photo` VALUES ('14', 'QQ图片20140312084658_20140313231609817.jpg', '2014-03-13', '', '1', '30', '182013072730085454643', '2014-03-13 23:16:11', '182013072730085454643', '2014-03-13 23:16:11', '18');
INSERT INTO `oa_photo` VALUES ('15', 'untitled_20140313232243624.bmp', '2014-03-13', '', '1', '31', '182013072730085454643', '2014-03-13 23:23:28', '182013072730085454643', '2014-03-13 23:23:28', '18');
INSERT INTO `oa_photo` VALUES ('16', '1.png', '2014-07-04', '', '1', '62', '182013052121033133083', '2014-07-04 13:14:04', '182013052121033133083', '2014-07-04 13:14:04', '18');
INSERT INTO `oa_photo` VALUES ('17', '2.png', '2014-07-04', '', '1', '63', '182013052121033133083', '2014-07-04 13:14:04', '182013052121033133083', '2014-07-04 13:14:04', '18');
INSERT INTO `oa_photo` VALUES ('18', '4.png', '2014-07-04', '', '1', '64', '182013052121033133083', '2014-07-04 13:14:04', '182013052121033133083', '2014-07-04 13:14:04', '18');
INSERT INTO `oa_photo` VALUES ('19', 'QQ图片20140808132559.jpg', '2014-08-22', '', '1', '69', '182013052121033133083', '2014-08-22 14:55:42', '182013052121033133083', '2014-08-22 14:55:42', '18');
INSERT INTO `oa_sms_inbox` VALUES ('8', '182013072730040551054', '李四', '2014-05-24 20:37:34', 'Pinhuba Basic Application Management System V1.0', '182014032913033222840', '2', '1', '182014032913033222840', '2014-05-24 20:37:34', '18');
INSERT INTO `oa_sms_inbox` VALUES ('10', '182013072730040551054', '李四', '2014-05-24 20:37:34', 'Pinhuba Basic Application Management System V1.0', '18201401285024208188', '2', '1', '18201401285024208188', '2014-05-24 20:37:34', '18');
INSERT INTO `oa_sms_inbox` VALUES ('11', '182013072730040551054', '李四', '2014-05-24 20:37:34', 'Pinhuba Basic Application Management System V1.0', '182013072931083905862', '1', '1', '182013072931083905862', '2014-05-24 20:37:34', '18');
INSERT INTO `oa_sms_inbox` VALUES ('14', '182013072730040551054', '李四', '2014-05-24 20:38:21', 'Pinhuba Basic Application Management System V1.0', '182014032913033222840', '2', '1', '182014032913033222840', '2014-05-24 20:38:21', '18');
INSERT INTO `oa_sms_inbox` VALUES ('16', '182013072730040551054', '李四', '2014-05-24 20:38:21', 'Pinhuba Basic Application Management System V1.0', '18201401285024208188', '2', '1', '18201401285024208188', '2014-05-24 20:38:21', '18');
INSERT INTO `oa_sms_inbox` VALUES ('17', '182013072730040551054', '李四', '2014-05-24 20:38:21', 'Pinhuba Basic Application Management System V1.0', '182013072931083905862', '1', '1', '182013072931083905862', '2014-05-24 20:38:21', '18');
INSERT INTO `oa_sms_inbox` VALUES ('20', '182013072730040551054', '李四', '2014-05-24 20:38:30', 'Pinhuba Basic Application Management System V1.0', '182014032913033222840', '2', '1', '182014032913033222840', '2014-05-24 20:38:30', '18');
INSERT INTO `oa_sms_inbox` VALUES ('22', '182013072730040551054', '李四', '2014-05-24 20:38:30', 'Pinhuba Basic Application Management System V1.0', '18201401285024208188', '2', '1', '18201401285024208188', '2014-05-24 20:38:30', '18');
INSERT INTO `oa_sms_inbox` VALUES ('23', '182013072730040551054', '李四', '2014-05-24 20:38:30', 'Pinhuba Basic Application Management System V1.0', '182013072931083905862', '1', '1', '182013072931083905862', '2014-05-24 20:38:30', '18');
INSERT INTO `oa_summary` VALUES ('1', '会议', '182013052121033133083', '2014-01-21 10:46:33', '1', '182013052121033133083,182013072730085454643,182013072931083905862,182013072730040551054,', '会议', '', '182013052121033133083', '2014-01-21 10:46:33', '182013052121033133083', '2014-01-21 10:46:33', '18');
INSERT INTO `oa_summary` VALUES ('2', '纪要名称', '182013052121033133083', '2014-04-29 20:11:05', '4', '18201401285024208188,182013052121033133083,182014032913033222840,182013072730085454643,182013072931083905862,182013072730040551054,', '纪要内容', '', '182013052121033133083', '2014-04-29 20:11:05', '182013052121033133083', '2014-04-29 20:11:05', '18');
INSERT INTO `oa_summary` VALUES ('3', '纪要名称', '182013052121033133083', '2014-04-29 20:11:47', '4', '182013052121033133083,182014032913033222840,182013072730085454643,18201401285024208188,182013072931083905862,182013072730040551054,', '纪要内容', '453', '182013052121033133083', '2014-04-29 20:11:47', '182013052121033133083', '2014-04-29 20:11:47', '18');
INSERT INTO `oa_tools` VALUES ('339', '2283', '各地天气预报', '182013052121033133083', 'tianqi.png', null, 'http://flash.weather.com.cn/wmaps/index.swf?url1=http%3A%2F%2Fwww%2Eweather%2Ecom%2Ecn%2Fweather%2F&url2=%2Eshtml&from=cn', '182013052121033133083', '2013-05-21 15:52:24', '182013052121033133083', '2013-05-21 15:52:24', '18');
INSERT INTO `oa_tools` VALUES ('340', '2283', '酒店查询', '182013052121033133083', 'jiudian.png', null, 'http://www.ctrip.com/', '182013052121033133083', '2013-05-21 15:52:24', '182013052121033133083', '2013-05-21 15:52:24', '18');
INSERT INTO `oa_tools` VALUES ('341', '2283', '公交线路查询', '182013052121033133083', 'gjxl.png', null, 'http://www.bus84.com/', '182013052121033133083', '2013-05-21 15:52:24', '182013052121033133083', '2013-05-21 15:52:24', '18');
INSERT INTO `oa_tools` VALUES ('342', '2283', '列车时刻查询', '182013052121033133083', 'lcsk.png', null, 'http://qq.ip138.com/train/', '182013052121033133083', '2013-05-21 15:52:24', '182013052121033133083', '2013-05-21 15:52:24', '18');
INSERT INTO `oa_tools` VALUES ('343', '2283', '航班查询', '182013052121033133083', 'hbcx.png', null, 'http://flights.ctrip.com/Domestic/SearchFlights.aspx', '182013052121033133083', '2013-05-21 15:52:24', '182013052121033133083', '2013-05-21 15:52:24', '18');
INSERT INTO `oa_tools` VALUES ('344', '2284', '长途区号查询', '182013052121033133083', 'dhqh.png', null, 'http://www.ip138.com/post/', '182013052121033133083', '2014-07-09 08:03:48', '182013052121033133083', '2014-07-09 08:03:48', '18');
INSERT INTO `oa_tools` VALUES ('345', '2284', '邮政编码查询', '182013052121033133083', 'yzbm.png', null, 'http://www.ip138.com/post/', '182013052121033133083', '2013-05-21 15:52:24', '182013052121033133083', '2013-05-21 15:52:24', '18');
INSERT INTO `oa_tools` VALUES ('346', '2284', '电子地图', '182013052121033133083', 'zxdt.png', null, 'http://www.edushi.com/', '182013052121033133083', '2013-05-21 15:52:24', '182013052121033133083', '2013-05-21 15:52:24', '18');
INSERT INTO `oa_tools` VALUES ('347', '2285', 'IP所属地查询', '182013052121033133083', 'ipcx.png', null, 'http://www.whatchina.com/html/sip.asp', '182013052121033133083', '2013-05-21 15:52:24', '182013052121033133083', '2013-05-21 15:52:24', '18');
INSERT INTO `oa_tools` VALUES ('348', '2285', '手机所属地查询', '182013052121033133083', 'sjsd.png', null, 'http://www.whatchina.com/html/smp.html', '182013052121033133083', '2013-05-21 15:52:24', '182013052121033133083', '2013-05-21 15:52:24', '18');
INSERT INTO `oa_tools` VALUES ('349', '2285', '固定电话查询', '182013052121033133083', 'dhsd.png', null, 'http://www.whatchina.com/html/stel.html', '182013052121033133083', '2013-05-21 15:52:24', '182013052121033133083', '2013-05-21 15:52:24', '18');
INSERT INTO `oa_tools` VALUES ('351', '2286', '全球时间', '182013052121033133083', 'qqsj.png', null, 'http://www.hao123.com/haoserver/wotime.htm', '182013052121033133083', '2013-05-21 15:52:24', '182013052121033133083', '2013-05-21 15:52:24', '18');
INSERT INTO `oa_tools` VALUES ('352', '2286', '万年历', '182013052121033133083', 'wnl.png', null, 'http://qq.ip138.com/day/', '182013052121033133083', '2013-05-21 15:52:24', '182013052121033133083', '2013-05-21 15:52:24', '18');
INSERT INTO `oa_tools` VALUES ('353', '2286', '全球节日查询', '182013052121033133083', 'jjr.png', null, 'http://www.360doc.com/content/07/0915/18/44521_746777.shtml', '182013052121033133083', '2013-05-21 15:52:24', '182013052121033133083', '2013-05-21 15:52:24', '18');
INSERT INTO `oa_tools` VALUES ('354', '2287', '长度换算', '182013052121033133083', 'cdhs.png', null, 'http://qq.ip138.com/converter8.htm', '182013052121033133083', '2013-05-21 15:52:24', '182013052121033133083', '2013-05-21 15:52:24', '18');
INSERT INTO `oa_tools` VALUES ('355', '2287', '面积换算', '182013052121033133083', 'mjhs.png', null, 'http://qq.ip138.com/converter2.htm', '182013052121033133083', '2014-08-14 09:31:32', '182013052121033133083', '2014-08-14 09:31:32', '18');
INSERT INTO `oa_tools` VALUES ('356', '2288', '快递查询', '182013052121033133083', 'kdcx.png', null, 'http://www.ip138.com/ems/', '182013052121033133083', '2013-05-21 15:52:24', '182013052121033133083', '2013-05-21 15:52:24', '18');
INSERT INTO `oa_tools` VALUES ('357', '2288', '在线翻译', '182013052121033133083', 'zxfy.png', null, 'http://www.iciba.com/', '182013052121033133083', '2013-05-21 15:52:24', '182013052121033133083', '2013-05-21 15:52:24', '18');
INSERT INTO `oa_tools` VALUES ('358', '2288', '百度搜索', '182013052121033133083', 'baidu.png', null, 'http://www.baidu.com', '182013052121033133083', '2013-05-21 15:52:24', '182013052121033133083', '2013-05-21 15:52:24', '18');
INSERT INTO `oa_tools` VALUES ('360', '2283', '各地天气预报', '182013072730085454643', 'tianqi.png', null, 'http://flash.weather.com.cn/wmaps/index.swf?url1=http%3A%2F%2Fwww%2Eweather%2Ecom%2Ecn%2Fweather%2F&url2=%2Eshtml&from=cn', '182013072730085454643', '2013-07-27 09:29:00', '182013072730085454643', '2013-07-27 09:29:00', '18');
INSERT INTO `oa_tools` VALUES ('361', '2283', '酒店查询', '182013072730085454643', 'jiudian.png', null, 'http://www.ctrip.com/', '182013072730085454643', '2013-07-27 09:29:00', '182013072730085454643', '2013-07-27 09:29:00', '18');
INSERT INTO `oa_tools` VALUES ('362', '2283', '公交线路查询', '182013072730085454643', 'gjxl.png', null, 'http://www.bus84.com/', '182013072730085454643', '2013-07-27 09:29:00', '182013072730085454643', '2013-07-27 09:29:00', '18');
INSERT INTO `oa_tools` VALUES ('363', '2283', '列车时刻查询', '182013072730085454643', 'lcsk.png', null, 'http://qq.ip138.com/train/', '182013072730085454643', '2013-07-27 09:29:00', '182013072730085454643', '2013-07-27 09:29:00', '18');
INSERT INTO `oa_tools` VALUES ('364', '2283', '航班查询', '182013072730085454643', 'hbcx.png', null, 'http://flights.ctrip.com/Domestic/SearchFlights.aspx', '182013072730085454643', '2013-07-27 09:29:00', '182013072730085454643', '2013-07-27 09:29:00', '18');
INSERT INTO `oa_tools` VALUES ('365', '2284', '长途区号查询', '182013072730085454643', 'dhqh.png', null, 'http://www.ip138.com/post/', '182013072730085454643', '2013-07-27 09:29:00', '182013072730085454643', '2013-07-27 09:29:00', '18');
INSERT INTO `oa_tools` VALUES ('366', '2284', '邮政编码查询', '182013072730085454643', 'yzbm.png', null, 'http://www.ip138.com/post/', '182013072730085454643', '2013-07-27 09:29:00', '182013072730085454643', '2013-07-27 09:29:00', '18');
INSERT INTO `oa_tools` VALUES ('367', '2284', '电子地图', '182013072730085454643', 'zxdt.png', null, 'http://www.edushi.com/', '182013072730085454643', '2013-07-27 09:29:00', '182013072730085454643', '2013-07-27 09:29:00', '18');
INSERT INTO `oa_tools` VALUES ('368', '2285', 'IP所属地查询', '182013072730085454643', 'ipcx.png', null, 'http://www.whatchina.com/html/sip.asp', '182013072730085454643', '2013-07-27 09:29:00', '182013072730085454643', '2013-07-27 09:29:00', '18');
INSERT INTO `oa_tools` VALUES ('369', '2285', '手机所属地查询', '182013072730085454643', 'sjsd.png', null, 'http://www.whatchina.com/html/smp.html', '182013072730085454643', '2013-07-27 09:29:00', '182013072730085454643', '2013-07-27 09:29:00', '18');
INSERT INTO `oa_tools` VALUES ('370', '2285', '固定电话查询', '182013072730085454643', 'dhsd.png', null, 'http://www.whatchina.com/html/stel.html', '182013072730085454643', '2013-07-27 09:29:00', '182013072730085454643', '2013-07-27 09:29:00', '18');
INSERT INTO `oa_tools` VALUES ('371', '2285', '身份证所属地查询', '182013072730085454643', 'sfzh.png', null, 'http://qq.ip138.com/idsearch/', '182013072730085454643', '2013-07-27 09:29:00', '182013072730085454643', '2013-07-27 09:29:00', '18');
INSERT INTO `oa_tools` VALUES ('372', '2286', '全球时间', '182013072730085454643', 'qqsj.png', null, 'http://www.hao123.com/haoserver/wotime.htm', '182013072730085454643', '2013-07-27 09:29:00', '182013072730085454643', '2013-07-27 09:29:00', '18');
INSERT INTO `oa_tools` VALUES ('373', '2286', '万年历', '182013072730085454643', 'wnl.png', null, 'http://qq.ip138.com/day/', '182013072730085454643', '2013-07-27 09:29:00', '182013072730085454643', '2013-07-27 09:29:00', '18');
INSERT INTO `oa_tools` VALUES ('374', '2286', '全球节日查询', '182013072730085454643', 'jjr.png', null, 'http://www.360doc.com/content/07/0915/18/44521_746777.shtml', '182013072730085454643', '2013-07-27 09:29:00', '182013072730085454643', '2013-07-27 09:29:00', '18');
INSERT INTO `oa_tools` VALUES ('375', '2287', '长度换算', '182013072730085454643', 'cdhs.png', null, 'http://qq.ip138.com/converter8.htm', '182013072730085454643', '2013-07-27 09:29:00', '182013072730085454643', '2013-07-27 09:29:00', '18');
INSERT INTO `oa_tools` VALUES ('376', '2287', '面积换算', '182013072730085454643', 'mjhs.png', null, 'http://qq.ip138.com/converter2.htm', '182013072730085454643', '2013-07-27 09:29:00', '182013072730085454643', '2013-07-27 09:29:00', '18');
INSERT INTO `oa_tools` VALUES ('377', '2288', '快递查询', '182013072730085454643', 'kdcx.png', null, 'http://www.ip138.com/ems/', '182013072730085454643', '2013-07-27 09:29:00', '182013072730085454643', '2013-07-27 09:29:00', '18');
INSERT INTO `oa_tools` VALUES ('378', '2288', '在线翻译', '182013072730085454643', 'zxfy.png', null, 'http://www.iciba.com/', '182013072730085454643', '2013-07-27 09:29:00', '182013072730085454643', '2013-07-27 09:29:00', '18');
INSERT INTO `oa_tools` VALUES ('379', '2288', '百度搜索', '182013072730085454643', 'baidu.png', null, 'http://www.baidu.com', '182013072730085454643', '2013-07-27 09:29:00', '182013072730085454643', '2013-07-27 09:29:00', '18');
INSERT INTO `oa_tools` VALUES ('380', '2288', '谷歌搜索', '182013072730085454643', 'google.png', null, 'http://www.google.com', '182013072730085454643', '2013-07-27 09:29:00', '182013072730085454643', '2013-07-27 09:29:00', '18');
INSERT INTO `oa_tools` VALUES ('381', '2283', '各地天气预报', '182013072730040551054', 'tianqi.png', null, 'http://flash.weather.com.cn/wmaps/index.swf?url1=http%3A%2F%2Fwww%2Eweather%2Ecom%2Ecn%2Fweather%2F&url2=%2Eshtml&from=cn', '182013072730040551054', '2013-09-04 16:24:57', '182013072730040551054', '2013-09-04 16:24:57', '18');
INSERT INTO `oa_tools` VALUES ('382', '2283', '酒店查询', '182013072730040551054', 'jiudian.png', null, 'http://www.ctrip.com/', '182013072730040551054', '2013-09-04 16:24:57', '182013072730040551054', '2013-09-04 16:24:57', '18');
INSERT INTO `oa_tools` VALUES ('383', '2283', '公交线路查询', '182013072730040551054', 'gjxl.png', null, 'http://www.bus84.com/', '182013072730040551054', '2013-09-04 16:24:57', '182013072730040551054', '2013-09-04 16:24:57', '18');
INSERT INTO `oa_tools` VALUES ('384', '2283', '列车时刻查询', '182013072730040551054', 'lcsk.png', null, 'http://qq.ip138.com/train/', '182013072730040551054', '2013-09-04 16:24:57', '182013072730040551054', '2013-09-04 16:24:57', '18');
INSERT INTO `oa_tools` VALUES ('385', '2283', '航班查询', '182013072730040551054', 'hbcx.png', null, 'http://flights.ctrip.com/Domestic/SearchFlights.aspx', '182013072730040551054', '2013-09-04 16:24:57', '182013072730040551054', '2013-09-04 16:24:57', '18');
INSERT INTO `oa_tools` VALUES ('386', '2284', '长途区号查询', '182013072730040551054', 'dhqh.png', null, 'http://www.ip138.com/post/', '182013072730040551054', '2013-09-04 16:24:57', '182013072730040551054', '2013-09-04 16:24:57', '18');
INSERT INTO `oa_tools` VALUES ('387', '2284', '邮政编码查询', '182013072730040551054', 'yzbm.png', null, 'http://www.ip138.com/post/', '182013072730040551054', '2013-09-04 16:24:57', '182013072730040551054', '2013-09-04 16:24:57', '18');
INSERT INTO `oa_tools` VALUES ('388', '2284', '电子地图', '182013072730040551054', 'zxdt.png', null, 'http://www.edushi.com/', '182013072730040551054', '2013-09-04 16:24:57', '182013072730040551054', '2013-09-04 16:24:57', '18');
INSERT INTO `oa_tools` VALUES ('389', '2285', 'IP所属地查询', '182013072730040551054', 'ipcx.png', null, 'http://www.whatchina.com/html/sip.asp', '182013072730040551054', '2013-09-04 16:24:57', '182013072730040551054', '2013-09-04 16:24:57', '18');
INSERT INTO `oa_tools` VALUES ('390', '2285', '手机所属地查询', '182013072730040551054', 'sjsd.png', null, 'http://www.whatchina.com/html/smp.html', '182013072730040551054', '2013-09-04 16:24:57', '182013072730040551054', '2013-09-04 16:24:57', '18');
INSERT INTO `oa_tools` VALUES ('391', '2285', '固定电话查询', '182013072730040551054', 'dhsd.png', null, 'http://www.whatchina.com/html/stel.html', '182013072730040551054', '2013-09-04 16:24:57', '182013072730040551054', '2013-09-04 16:24:57', '18');
INSERT INTO `oa_tools` VALUES ('392', '2285', '身份证所属地查询', '182013072730040551054', 'sfzh.png', null, 'http://qq.ip138.com/idsearch/', '182013072730040551054', '2013-09-04 16:24:57', '182013072730040551054', '2013-09-04 16:24:57', '18');
INSERT INTO `oa_tools` VALUES ('393', '2286', '全球时间', '182013072730040551054', 'qqsj.png', null, 'http://www.hao123.com/haoserver/wotime.htm', '182013072730040551054', '2013-09-04 16:24:57', '182013072730040551054', '2013-09-04 16:24:57', '18');
INSERT INTO `oa_tools` VALUES ('394', '2286', '万年历', '182013072730040551054', 'wnl.png', null, 'http://qq.ip138.com/day/', '182013072730040551054', '2013-09-04 16:24:57', '182013072730040551054', '2013-09-04 16:24:57', '18');
INSERT INTO `oa_tools` VALUES ('395', '2286', '全球节日查询', '182013072730040551054', 'jjr.png', null, 'http://www.360doc.com/content/07/0915/18/44521_746777.shtml', '182013072730040551054', '2013-09-04 16:24:57', '182013072730040551054', '2013-09-04 16:24:57', '18');
INSERT INTO `oa_tools` VALUES ('396', '2287', '长度换算', '182013072730040551054', 'cdhs.png', null, 'http://qq.ip138.com/converter8.htm', '182013072730040551054', '2013-09-04 16:24:57', '182013072730040551054', '2013-09-04 16:24:57', '18');
INSERT INTO `oa_tools` VALUES ('397', '2287', '面积换算', '182013072730040551054', 'mjhs.png', null, 'http://qq.ip138.com/converter2.htm', '182013072730040551054', '2013-09-04 16:24:57', '182013072730040551054', '2013-09-04 16:24:57', '18');
INSERT INTO `oa_tools` VALUES ('398', '2288', '快递查询', '182013072730040551054', 'kdcx.png', null, 'http://www.ip138.com/ems/', '182013072730040551054', '2013-09-04 16:24:57', '182013072730040551054', '2013-09-04 16:24:57', '18');
INSERT INTO `oa_tools` VALUES ('399', '2288', '在线翻译', '182013072730040551054', 'zxfy.png', null, 'http://www.iciba.com/', '182013072730040551054', '2013-09-04 16:24:57', '182013072730040551054', '2013-09-04 16:24:57', '18');
INSERT INTO `oa_tools` VALUES ('400', '2288', '百度搜索', '182013072730040551054', 'baidu.png', null, 'http://www.baidu.com', '182013072730040551054', '2013-09-04 16:24:57', '182013072730040551054', '2013-09-04 16:24:57', '18');
INSERT INTO `oa_tools` VALUES ('401', '2288', '谷歌搜索', '182013072730040551054', 'google.png', null, 'http://www.google.com', '182013072730040551054', '2013-09-04 16:24:57', '182013072730040551054', '2013-09-04 16:24:57', '18');
INSERT INTO `oa_tools` VALUES ('403', '2283', '各地天气预报', '18201401285024208188', 'tianqi.png', null, 'http://flash.weather.com.cn/wmaps/index.swf?url1=http%3A%2F%2Fwww%2Eweather%2Ecom%2Ecn%2Fweather%2F&url2=%2Eshtml&from=cn', '18201401285024208188', '2014-01-28 14:47:09', '18201401285024208188', '2014-01-28 14:47:09', '18');
INSERT INTO `oa_tools` VALUES ('404', '2283', '酒店查询', '18201401285024208188', 'jiudian.png', null, 'http://www.ctrip.com/', '18201401285024208188', '2014-01-28 14:47:09', '18201401285024208188', '2014-01-28 14:47:09', '18');
INSERT INTO `oa_tools` VALUES ('405', '2283', '公交线路查询', '18201401285024208188', 'gjxl.png', null, 'http://www.bus84.com/', '18201401285024208188', '2014-01-28 14:47:09', '18201401285024208188', '2014-01-28 14:47:09', '18');
INSERT INTO `oa_tools` VALUES ('406', '2283', '列车时刻查询', '18201401285024208188', 'lcsk.png', null, 'http://qq.ip138.com/train/', '18201401285024208188', '2014-01-28 14:47:09', '18201401285024208188', '2014-01-28 14:47:09', '18');
INSERT INTO `oa_tools` VALUES ('407', '2283', '航班查询', '18201401285024208188', 'hbcx.png', null, 'http://flights.ctrip.com/Domestic/SearchFlights.aspx', '18201401285024208188', '2014-01-28 14:47:09', '18201401285024208188', '2014-01-28 14:47:09', '18');
INSERT INTO `oa_tools` VALUES ('408', '2284', '长途区号查询', '18201401285024208188', 'dhqh.png', null, 'http://www.ip138.com/post/', '18201401285024208188', '2014-01-28 14:47:09', '18201401285024208188', '2014-01-28 14:47:09', '18');
INSERT INTO `oa_tools` VALUES ('409', '2284', '邮政编码查询', '18201401285024208188', 'yzbm.png', null, 'http://www.ip138.com/post/', '18201401285024208188', '2014-01-28 14:47:09', '18201401285024208188', '2014-01-28 14:47:09', '18');
INSERT INTO `oa_tools` VALUES ('410', '2284', '电子地图', '18201401285024208188', 'zxdt.png', null, 'http://www.edushi.com/', '18201401285024208188', '2014-01-28 14:47:09', '18201401285024208188', '2014-01-28 14:47:09', '18');
INSERT INTO `oa_tools` VALUES ('411', '2285', 'IP所属地查询', '18201401285024208188', 'ipcx.png', null, 'http://www.whatchina.com/html/sip.asp', '18201401285024208188', '2014-01-28 14:47:09', '18201401285024208188', '2014-01-28 14:47:09', '18');
INSERT INTO `oa_tools` VALUES ('412', '2285', '手机所属地查询', '18201401285024208188', 'sjsd.png', null, 'http://www.whatchina.com/html/smp.html', '18201401285024208188', '2014-01-28 14:47:09', '18201401285024208188', '2014-01-28 14:47:09', '18');
INSERT INTO `oa_tools` VALUES ('413', '2285', '固定电话查询', '18201401285024208188', 'dhsd.png', null, 'http://www.whatchina.com/html/stel.html', '18201401285024208188', '2014-01-28 14:47:09', '18201401285024208188', '2014-01-28 14:47:09', '18');
INSERT INTO `oa_tools` VALUES ('414', '2285', '身份证所属地查询', '18201401285024208188', 'sfzh.png', null, 'http://qq.ip138.com/idsearch/', '18201401285024208188', '2014-01-28 14:47:09', '18201401285024208188', '2014-01-28 14:47:09', '18');
INSERT INTO `oa_tools` VALUES ('415', '2286', '全球时间', '18201401285024208188', 'qqsj.png', null, 'http://www.hao123.com/haoserver/wotime.htm', '18201401285024208188', '2014-01-28 14:47:09', '18201401285024208188', '2014-01-28 14:47:09', '18');
INSERT INTO `oa_tools` VALUES ('416', '2286', '万年历', '18201401285024208188', 'wnl.png', null, 'http://qq.ip138.com/day/', '18201401285024208188', '2014-01-28 14:47:09', '18201401285024208188', '2014-01-28 14:47:09', '18');
INSERT INTO `oa_tools` VALUES ('417', '2286', '全球节日查询', '18201401285024208188', 'jjr.png', null, 'http://www.360doc.com/content/07/0915/18/44521_746777.shtml', '18201401285024208188', '2014-01-28 14:47:09', '18201401285024208188', '2014-01-28 14:47:09', '18');
INSERT INTO `oa_tools` VALUES ('418', '2287', '长度换算', '18201401285024208188', 'cdhs.png', null, 'http://qq.ip138.com/converter8.htm', '18201401285024208188', '2014-01-28 14:47:09', '18201401285024208188', '2014-01-28 14:47:09', '18');
INSERT INTO `oa_tools` VALUES ('419', '2287', '面积换算', '18201401285024208188', 'mjhs.png', null, 'http://qq.ip138.com/converter2.htm', '18201401285024208188', '2014-01-28 14:47:09', '18201401285024208188', '2014-01-28 14:47:09', '18');
INSERT INTO `oa_tools` VALUES ('420', '2288', '快递查询', '18201401285024208188', 'kdcx.png', null, 'http://www.ip138.com/ems/', '18201401285024208188', '2014-01-28 14:47:09', '18201401285024208188', '2014-01-28 14:47:09', '18');
INSERT INTO `oa_tools` VALUES ('421', '2288', '在线翻译', '18201401285024208188', 'zxfy.png', null, 'http://www.iciba.com/', '18201401285024208188', '2014-01-28 14:47:09', '18201401285024208188', '2014-01-28 14:47:09', '18');
INSERT INTO `oa_tools` VALUES ('422', '2288', '百度搜索', '18201401285024208188', 'baidu.png', null, 'http://www.baidu.com', '18201401285024208188', '2014-01-28 14:47:09', '18201401285024208188', '2014-01-28 14:47:09', '18');
INSERT INTO `oa_tools` VALUES ('423', '2288', '谷歌搜索', '18201401285024208188', 'google.png', null, 'http://www.google.com', '18201401285024208188', '2014-01-28 14:47:09', '18201401285024208188', '2014-01-28 14:47:09', '18');
INSERT INTO `oa_tools` VALUES ('424', '2283', '各地天气预报', '182013072931083905862', 'tianqi.png', null, 'http://flash.weather.com.cn/wmaps/index.swf?url1=http%3A%2F%2Fwww%2Eweather%2Ecom%2Ecn%2Fweather%2F&url2=%2Eshtml&from=cn', '182013072931083905862', '2014-08-14 09:08:03', '182013072931083905862', '2014-08-14 09:08:03', '18');
INSERT INTO `oa_tools` VALUES ('425', '2283', '酒店查询', '182013072931083905862', 'jiudian.png', null, 'http://www.ctrip.com/', '182013072931083905862', '2014-08-14 09:08:03', '182013072931083905862', '2014-08-14 09:08:03', '18');
INSERT INTO `oa_tools` VALUES ('426', '2283', '公交线路查询', '182013072931083905862', 'gjxl.png', null, 'http://www.bus84.com/', '182013072931083905862', '2014-08-14 09:08:03', '182013072931083905862', '2014-08-14 09:08:03', '18');
INSERT INTO `oa_tools` VALUES ('427', '2283', '列车时刻查询', '182013072931083905862', 'lcsk.png', null, 'http://qq.ip138.com/train/', '182013072931083905862', '2014-08-14 09:08:04', '182013072931083905862', '2014-08-14 09:08:04', '18');
INSERT INTO `oa_tools` VALUES ('428', '2283', '航班查询', '182013072931083905862', 'hbcx.png', null, 'http://flights.ctrip.com/Domestic/SearchFlights.aspx', '182013072931083905862', '2014-08-14 09:08:04', '182013072931083905862', '2014-08-14 09:08:04', '18');
INSERT INTO `oa_tools` VALUES ('429', '2284', '长途区号查询', '182013072931083905862', 'dhqh.png', null, 'http://www.ip138.com/post/', '182013072931083905862', '2014-08-14 09:08:04', '182013072931083905862', '2014-08-14 09:08:04', '18');
INSERT INTO `oa_tools` VALUES ('430', '2284', '邮政编码查询', '182013072931083905862', 'yzbm.png', null, 'http://www.ip138.com/post/', '182013072931083905862', '2014-08-14 09:08:04', '182013072931083905862', '2014-08-14 09:08:04', '18');
INSERT INTO `oa_tools` VALUES ('431', '2284', '电子地图', '182013072931083905862', 'zxdt.png', null, 'http://www.edushi.com/', '182013072931083905862', '2014-08-14 09:08:04', '182013072931083905862', '2014-08-14 09:08:04', '18');
INSERT INTO `oa_tools` VALUES ('432', '2285', 'IP所属地查询', '182013072931083905862', 'ipcx.png', null, 'http://www.whatchina.com/html/sip.asp', '182013072931083905862', '2014-08-14 09:08:04', '182013072931083905862', '2014-08-14 09:08:04', '18');
INSERT INTO `oa_tools` VALUES ('433', '2285', '手机所属地查询', '182013072931083905862', 'sjsd.png', null, 'http://www.whatchina.com/html/smp.html', '182013072931083905862', '2014-08-14 09:08:04', '182013072931083905862', '2014-08-14 09:08:04', '18');
INSERT INTO `oa_tools` VALUES ('434', '2285', '固定电话查询', '182013072931083905862', 'dhsd.png', null, 'http://www.whatchina.com/html/stel.html', '182013072931083905862', '2014-08-14 09:08:04', '182013072931083905862', '2014-08-14 09:08:04', '18');
INSERT INTO `oa_tools` VALUES ('435', '2285', '身份证所属地查询', '182013072931083905862', 'sfzh.png', null, 'http://qq.ip138.com/idsearch/', '182013072931083905862', '2014-08-14 09:08:04', '182013072931083905862', '2014-08-14 09:08:04', '18');
INSERT INTO `oa_tools` VALUES ('436', '2286', '全球时间', '182013072931083905862', 'qqsj.png', null, 'http://www.hao123.com/haoserver/wotime.htm', '182013072931083905862', '2014-08-14 09:08:04', '182013072931083905862', '2014-08-14 09:08:04', '18');
INSERT INTO `oa_tools` VALUES ('437', '2286', '万年历', '182013072931083905862', 'wnl.png', null, 'http://qq.ip138.com/day/', '182013072931083905862', '2014-08-14 09:08:04', '182013072931083905862', '2014-08-14 09:08:04', '18');
INSERT INTO `oa_tools` VALUES ('438', '2286', '全球节日查询', '182013072931083905862', 'jjr.png', null, 'http://www.360doc.com/content/07/0915/18/44521_746777.shtml', '182013072931083905862', '2014-08-14 09:08:04', '182013072931083905862', '2014-08-14 09:08:04', '18');
INSERT INTO `oa_tools` VALUES ('439', '2287', '长度换算', '182013072931083905862', 'cdhs.png', null, 'http://qq.ip138.com/converter8.htm', '182013072931083905862', '2014-08-14 09:08:04', '182013072931083905862', '2014-08-14 09:08:04', '18');
INSERT INTO `oa_tools` VALUES ('440', '2287', '面积换算', '182013072931083905862', 'mjhs.png', null, 'http://qq.ip138.com/converter2.htm', '182013072931083905862', '2014-08-14 09:08:04', '182013072931083905862', '2014-08-14 09:08:04', '18');
INSERT INTO `oa_tools` VALUES ('441', '2288', '快递查询', '182013072931083905862', 'kdcx.png', null, 'http://www.ip138.com/ems/', '182013072931083905862', '2014-08-14 09:08:04', '182013072931083905862', '2014-08-14 09:08:04', '18');
INSERT INTO `oa_tools` VALUES ('442', '2288', '在线翻译', '182013072931083905862', 'zxfy.png', null, 'http://www.iciba.com/', '182013072931083905862', '2014-08-14 09:08:04', '182013072931083905862', '2014-08-14 09:08:04', '18');
INSERT INTO `oa_tools` VALUES ('443', '2288', '百度搜索', '182013072931083905862', 'baidu.png', null, 'http://www.baidu.com', '182013072931083905862', '2014-08-14 09:08:04', '182013072931083905862', '2014-08-14 09:08:04', '18');
INSERT INTO `oa_trsvel` VALUES ('2', '72510', '出差地点AB', '2015-01-14', '2015-01-14', '出差事由A', '182013052121033133083', '182013052121033133083', '2015-01-14 14:14:34', '182013052121033133083', '2015-01-14 14:14:34', '18', '2015-01-14 14:14:34', '2');
INSERT INTO `oa_ware_type` VALUES ('1', '类型名称', '', '182013052121033133083', '2014-05-24 11:05:34', '182013052121033133083', '2014-05-24 11:05:34', '18', '2', '6');
INSERT INTO `oa_ware_type` VALUES ('2', '类型名称2', '', '182013052121033133083', '2014-05-24 11:09:30', '182013052121033133083', '2014-05-24 11:09:30', '18', '2', '0');
INSERT INTO `oa_waretype_range` VALUES ('1', '1', '182013052121033133083', '18', '2');
INSERT INTO `oa_waretype_range` VALUES ('2', '1', '182014032913033222840', '18', '2');
INSERT INTO `oa_waretype_range` VALUES ('3', '1', '182013072730085454643', '18', '2');
INSERT INTO `oa_waretype_range` VALUES ('4', '1', '18201401285024208188', '18', '2');
INSERT INTO `oa_waretype_range` VALUES ('5', '1', '182013072931083905862', '18', '2');
INSERT INTO `oa_waretype_range` VALUES ('6', '1', '182013072730040551054', '18', '2');
INSERT INTO `oa_work_log` VALUES ('1', '可设置共享，共享状态下他人可见！', '2155', '2013-09-18', '2', '56,65,66,67,68,57,64,59,60,62,61,63,', '', '<p style=\"text-align: left; padding-bottom: 0px; widows: 2; text-transform: none; background-color: rgb(255,255,255); text-indent: 0px; margin: 0px 0px 10px; padding-left: 0px; padding-right: 0px; font: 14px/22px 微软雅黑, Verdana, sans-serif, 宋体; white-space: normal; orphans: 2; letter-spacing: normal; color: rgb(0,0,0); word-spacing: 0px; padding-top: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px\">人工智能，这我一直没有连续研究。因为属于个比较难的问题。难点在于很多基础的理论没有说清楚。而单纯的研究基础的理论又缺乏实际的工具和应用场景去验证，这些都需要时间，一个人闭门造车是扯淡的事情。所以务实的安心做些其他可短期实现的系统分析。</p><p style=\"text-align: left; padding-bottom: 0px; widows: 2; text-transform: none; background-color: rgb(255,255,255); text-indent: 0px; margin: 0px 0px 10px; padding-left: 0px; padding-right: 0px; font: 14px/22px 微软雅黑, Verdana, sans-serif, 宋体; white-space: normal; orphans: 2; letter-spacing: normal; color: rgb(0,0,0); word-spacing: 0px; padding-top: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px\">人工智能的介绍，我觉得wiki上的已经比较全面了。不过对人工神经网络的出现时间，他的表里写的是1991年，这个以我以前看到的资料，凭记忆，好像不是。也就是说，wiki也不一定全部都是正确的，但这不影响他的整体描述的正确性。</p><p style=\"text-align: left; padding-bottom: 0px; widows: 2; text-transform: none; background-color: rgb(255,255,255); text-indent: 0px; margin: 0px 0px 10px; padding-left: 0px; padding-right: 0px; font: 14px/22px 微软雅黑, Verdana, sans-serif, 宋体; white-space: normal; orphans: 2; letter-spacing: normal; color: rgb(0,0,0); word-spacing: 0px; padding-top: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px\">http://zh.wikipedia.org/wiki/人工智能</p><p style=\"text-align: left; padding-bottom: 0px; widows: 2; text-transform: none; background-color: rgb(255,255,255); text-indent: 0px; margin: 0px 0px 10px; padding-left: 0px; padding-right: 0px; font: 14px/22px 微软雅黑, Verdana, sans-serif, 宋体; white-space: normal; orphans: 2; letter-spacing: normal; color: rgb(0,0,0); word-spacing: 0px; padding-top: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px\">人工智能的定义很关键，这决定了这类问题的研究面，设计目标（能实现啥功能），这两个都不确定，鬼画符的做个算法，灌批数据，踩了别人的算法说自己好，就是扯淡，其实用他的论证方法，一样可以推倒他的结论。简单说，现在大多数不涉及更本性问题的讨论的论文，都是骗人的把戏。国内混文凭的，这类论文大把，国外也不少。</p>', '182013072730085454643', null, '8,9', '182013072730085454643', '2013-09-18 09:13:53', '182013072730085454643', '2013-09-18 09:16:15', '18');
INSERT INTO `oa_work_log` VALUES ('2', '日志标题 ', '2155', '2014-05-24', '1', null, null, '<p>日志内容</p>', '182013052121033133083', null, '', '182013052121033133083', '2014-05-24 11:48:20', '182013052121033133083', '2014-05-24 11:48:29', '18');
INSERT INTO `oa_work_log` VALUES ('3', '日志标题', '2155', '2014-05-24', '1', null, null, '<p>&nbsp;<span style=\"color: rgb(37, 37, 37); font-family: Simsun; line-height: 25px; text-align: right; white-space: nowrap;\">日志标题</span></p>', '182013072730040551054', null, '', '182013072730040551054', '2014-05-24 12:02:15', '182013072730040551054', '2014-05-24 12:02:15', '18');
INSERT INTO `oa_work_log` VALUES ('11', '日志标题', '2155', '2014-05-24', '1', null, null, '<p>日志标题</p>', '182013072931083905862', null, '', '182013072931083905862', '2014-05-24 13:54:39', '182013072931083905862', '2014-05-24 13:54:39', '18');
INSERT INTO `oa_work_log` VALUES ('14', 'qqqqq', '2155', '2014-07-09', '1', null, null, '<p>&nbsp;qqqq</p>', '182013052121033133083', null, '', '182013052121033133083', '2014-07-09 13:11:12', '182013052121033133083', '2014-07-09 13:11:12', '18');
INSERT INTO `sys_attachment_info` VALUES ('249', 'QzovQmFtc0Rvd25sb2Fkcy9pbWFnZS9jb21wMTgvcGVyc29uNTIvbnRrb29mZmljZWNvbnRyb2xfMjAxNDAzMTMyMzU1NDU1OTcuanM@3', 'ntkoofficecontrol.js', 'ntkoofficecontrol_20140313235545597.js', null, null, '182013052121033133083', '2014-03-13 23:55:48', '182013052121033133083', '2014-03-13 23:55:48', '18');
INSERT INTO `sys_attachment_info` VALUES ('250', 'QzovQmFtc0Rvd25sb2Fkcy9pbWFnZS9jb21wMTgvcGVyc29uNTIvMjAxNMTqMDHUwrmry77NqNG2wrxfMjAxNDAzMTMyMzU1NDU1NTMueGxz', '2014年01月公司通讯录.xls', '2014年01月公司通讯录_20140313235545553.xls', null, null, '182013052121033133083', '2014-03-13 23:55:48', '182013052121033133083', '2014-03-13 23:55:48', '18');
INSERT INTO `sys_attachment_info` VALUES ('251', 'QzovQmFtc0Rvd25sb2Fkcy9pbWFnZS9jb21wMTgvcGVyc29uNTIvzt63qNbQzsTR6dak08O7p8P7zqjSu9DUtKbA7V8yMDE0MDMxMzIzNTU0NTU5NS5kb2M@3', '无法中文验证用户名唯一性处理.doc', '无法中文验证用户名唯一性处理_20140313235545595.doc', null, null, '182013052121033133083', '2014-03-13 23:55:48', '182013052121033133083', '2014-03-13 23:55:48', '18');
INSERT INTO `sys_attachment_info` VALUES ('261', 'QzovQmFtc0Rvd25sb2Fkcy9pbWFnZS9jb21wMTgvcGVyc29uNTIvMjAxNMTqs8m5@19equ6/P7sS/yeqxqMrpXzIwMTQwMzE0MDAxNTMyNTY3LmRvYw@3@3', '2014年成果转化项目申报书.doc', '2014年成果转化项目申报书_20140314001532567.doc', null, null, '182013052121033133083', '2014-03-14 00:15:34', '182013052121033133083', '2014-03-14 00:15:34', '18');
INSERT INTO `sys_attachment_info` VALUES ('295', 'QzovQmFtc0Rvd25sb2Fkcy9tYWlsL2NvbXAxOC9wZXJzb241NC9nb29nbGVfMjAxNDAzMjQxMzE0MDY5MDMucG5n', 'google.png', 'google_20140324131406903.png', null, null, '182013072730085454643', '2014-03-24 13:14:08', '182013072730085454643', '2014-03-24 13:14:08', '18');
INSERT INTO `sys_attachment_info` VALUES ('296', 'QzovQmFtc0Rvd25sb2Fkcy9tYWlsL2NvbXAxOC9wZXJzb241NC9wcm9maWxlcGhvdG9fMjAxNDAzMjQxMzE0MDcwMDEucG5n', 'profilephoto.png', 'profilephoto_20140324131407001.png', null, null, '182013072730085454643', '2014-03-24 13:14:08', '182013072730085454643', '2014-03-24 13:14:08', '18');
INSERT INTO `sys_attachment_info` VALUES ('300', 'QzovQmFtc0Rvd25sb2Fkcy9tYWlsL2NvbXAxOC9wZXJzb241NC9nb29nbGVfMjAxNDAzMjkxMDUzMDE1ODIucG5n', 'google.png', 'google_20140329105301582.png', null, null, '182013072730085454643', '2014-03-29 10:53:01', '182013072730085454643', '2014-03-29 10:53:01', '18');
INSERT INTO `sys_attachment_info` VALUES ('301', 'QzovQmFtc0Rvd25sb2Fkcy9tYWlsL2NvbXAxOC9wZXJzb241NC9wcm9maWxlcGhvdG9fMjAxNDAzMjkxMDUzMDE2MjYucG5n', 'profilephoto.png', 'profilephoto_20140329105301626.png', null, null, '182013072730085454643', '2014-03-29 10:53:01', '182013072730085454643', '2014-03-29 10:53:01', '18');
INSERT INTO `sys_attachment_info` VALUES ('305', 'QzovQmFtc0Rvd25sb2Fkcy9maWxlL2NvbXAxOC9wZXJzb241Mi@15pNf3yrG85MbAucBfMjAxNDAzMjkxNTMzMzUwODkuZG9jeA@3@3', '工作时间评估.docx', '工作时间评估_20140329153335089.docx', null, null, '182013052121033133083', '2014-03-29 15:33:51', '182013052121033133083', '2014-03-29 15:33:51', '18');
INSERT INTO `sys_attachment_info` VALUES ('449', 'QzovQmFtc0Rvd25sb2Fkcy9pbWFnZS9jb21wMTgvcGVyc29uNTIvMzYwbmV0XzIwMTQwNDI5MTkzODQ1NDkxLmRsbA@3@3', '360net.dll', '360net_20140429193845491.dll', null, null, '182013052121033133083', '2014-04-29 19:38:48', '182013052121033133083', '2014-04-29 19:38:48', '18');
INSERT INTO `sys_attachment_info` VALUES ('451', 'QzovQmFtc0Rvd25sb2Fkcy9pbWFnZS9jb21wMTgvcGVyc29uNTIvyMuyxdeowLhfMjAxNDA0MjkyMDA0MDIzNzEuZG9j', '人才专栏.doc', '人才专栏_20140429200402371.doc', null, null, '182013052121033133083', '2014-04-29 20:04:06', '182013052121033133083', '2014-04-29 20:04:06', '18');
INSERT INTO `sys_attachment_info` VALUES ('452', 'QzovQmFtc0Rvd25sb2Fkcy9pbWFnZS9jb21wMTgvcGVyc29uNTIv1ti149Om08NfMjAxNDA0MjkyMDA0MDIzNzMuZG9jeA@3@3', '重点应用.docx', '重点应用_20140429200402373.docx', null, null, '182013052121033133083', '2014-04-29 20:04:06', '182013052121033133083', '2014-04-29 20:04:06', '18');
INSERT INTO `sys_attachment_info` VALUES ('453', 'QzovQmFtc0Rvd25sb2Fkcy9pbWFnZS9jb21wMTgvcGVyc29uNTIvsuLK1NPDwP0yXzIwMTQwNDI5MjAxMTM4Nzc0Lnhsc3g@3', '测试用例2.xlsx', '测试用例2_20140429201138774.xlsx', null, null, '182013052121033133083', '2014-04-29 20:11:47', '182013052121033133083', '2014-04-29 20:11:47', '18');
INSERT INTO `sys_attachment_info` VALUES ('454', 'QzovQmFtc0Rvd25sb2Fkcy9maWxlL2NvbXAxOC9wZXJzb241NS@1zybn7z@1rH6dKzz9TKvsTayN1fMjAxNDA1MjQwMDMxNDQwNTkuZG9jeA@3@3', '成果详情页显示内容.docx', '成果详情页显示内容_20140524003144059.docx', null, null, '182013072931083905862', '2014-05-24 00:31:46', '182013072931083905862', '2014-05-24 00:31:46', '18');
INSERT INTO `sys_attachment_info` VALUES ('503', 'QzovQmFtc0Rvd25sb2Fkcy9pbWFnZS9jb21wMTgvcGVyc29uNTIvRmxhc2jP7sS/0@1vK/b7dv@1LNqNDFtcTR0L6/X7v509pBU1BfTkVUvLzK9V8yMDE0MDcxOTEzNTgxMjIxMi5wZGY@3', 'Flash项目与数据库通信的研究_基于ASP_NET技术.pdf', 'Flash项目与数据库通信的研究_基于ASP_NET技术_20140719135812212.pdf', null, null, '182013052121033133083', '2014-07-19 14:55:08', '182013052121033133083', '2014-07-19 14:55:08', '18');
INSERT INTO `sys_attachment_info` VALUES ('504', 'QzovQmFtc0Rvd25sb2Fkcy9pbWFnZS9jb21wMTgvcGVyc29uNTIvss6/vMq1wP1fMjAxNDA3MTkxMzU4MTIyODAueGxz', '参考实例.xls', '参考实例_20140719135812280.xls', null, null, '182013052121033133083', '2014-07-19 14:55:08', '182013052121033133083', '2014-07-19 14:55:08', '18');
INSERT INTO `sys_attachment_info` VALUES ('530', 'QzovQmFtc0Rvd25sb2Fkcy9pbWFnZS9jb21wMTgvcGVyc29uNTIvMjQxODMxMzg4bWV0XzIwMTQwNzE5MTQ1NDI2NDg5LmRvY3g@3', '241831388met.docx', '241831388met_20140719145426489.docx', null, null, '182013052121033133083', '2014-07-28 13:26:50', '182013052121033133083', '2014-07-28 13:26:50', '18');
INSERT INTO `sys_attachment_info` VALUES ('539', 'QzovQmFtc0Rvd25sb2Fkcy9pbWFnZS9jb21wMTgvcGVyc29uNTIvwsPTzr7W0sa2r09BvdO/2tCt0ulfMjAxNDA4MjIxNTE4Mzg5NjIuZG9jeA@3@3', '旅游局移动OA接口协议.docx', '旅游局移动OA接口协议_20140822151838962.docx', null, null, '182013052121033133083', '2014-08-22 15:18:39', '182013052121033133083', '2014-08-22 15:18:39', '18');
INSERT INTO `sys_attachment_info` VALUES ('543', 'QzovQmFtc0Rvd25sb2Fkcy9maWxlL2NvbXAxOC9wZXJzb241Mi@15@1rzSv8a8vLzGu66/zszi0MXPosfpv/ax7V8yMDE0MTEwNjE0NTI0MTU5MS54bHM@3', '国家科技计划课题信息情况表.xls', '国家科技计划课题信息情况表_20141106145241591.xls', null, null, '182013052121033133083', '2014-11-06 15:34:51', '182013052121033133083', '2014-11-06 15:34:51', '18');
INSERT INTO `sys_attachment_info` VALUES ('544', 'QzovQmFtc0Rvd25sb2Fkcy9maWxlL2NvbXAxOC9wZXJzb241Mi9CQU1Tytay4V8yMDE0MTEwNjE2MDgyOTUxMi5kb2N4', 'BAMS手册.docx', 'BAMS手册_20141106160829512.docx', null, null, '182013052121033133083', '2014-11-06 16:08:30', '182013052121033133083', '2014-11-06 16:08:30', '18');
INSERT INTO `sys_attachment_info` VALUES ('545', 'QzovQmFtc0Rvd25sb2Fkcy9maWxlL2NvbXAxOC9wZXJzb241Mi9leHBvcnQyMDE0MDkyMsSjsOVfMjAxNDExMDYxNjA4Mjk1NTIueGxz', 'export20140922模板.xls', 'export20140922模板_20141106160829552.xls', null, null, '182013052121033133083', '2014-11-06 16:08:30', '182013052121033133083', '2014-11-06 16:08:30', '18');
INSERT INTO `sys_attachment_info` VALUES ('551', 'QzovQmFtc0Rvd25sb2Fkcy9maWxlL2NvbXAxOC9wZXJzb241OC9qc29ucGx1Z2luLTAuMzFfMjAxNDEyMDkwODM2NDMwMDAuamFy', 'jsonplugin-0.31.jar', 'jsonplugin-0.31_20141209083643000.jar', null, null, '182014052421084820990', '2014-12-09 08:36:44', '182014052421084820990', '2014-12-09 08:36:44', '18');
INSERT INTO `sys_attachment_info` VALUES ('556', 'QzovQmFtc0Rvd25sb2Fkcy9tZW1iZXIvQkFNU8rWsuFfMjAxNDEyMTAxNjMwMTc0MTguZG9jeA@3@3', 'BAMS手册.docx', 'BAMS手册_20141210163017418.docx', null, null, '5687E6FE-0598-4F47-883C-91D454CAAE46', '2014-12-10 16:30:29', '5687E6FE-0598-4F47-883C-91D454CAAE46', '2014-12-10 16:30:29', '-1');
INSERT INTO `sys_attachment_info` VALUES ('557', 'QzovQmFtc0Rvd25sb2Fkcy9tZW1iZXIvQkFNU8rWsuFfMjAxNDEyMTAxNjMwMTc0MTguZG9jeA@3@3', 'BAMS手册.docx', 'BAMS手册_20141210163017418.docx', null, null, '5687E6FE-0598-4F47-883C-91D454CAAE46', '2014-12-10 16:33:53', '5687E6FE-0598-4F47-883C-91D454CAAE46', '2014-12-10 16:33:53', '-1');
INSERT INTO `sys_attachment_info` VALUES ('558', 'QzovQmFtc0Rvd25sb2Fkcy9tZW1iZXIvMTIuNNDeuMRfMjAxNDEyMTAxNjMzNTAyNjAuZG9jeA@3@3', '12.4修改.docx', '12.4修改_20141210163350260.docx', null, null, '5687E6FE-0598-4F47-883C-91D454CAAE46', '2014-12-10 16:33:53', '5687E6FE-0598-4F47-883C-91D454CAAE46', '2014-12-10 16:33:53', '-1');
INSERT INTO `sys_attachment_info` VALUES ('559', 'QzovQmFtc0Rvd25sb2Fkcy9tZW1iZXIvQkFNU8rWsuFfMjAxNDEyMTAxNjMwMTc0MTguZG9jeA@3@3', 'BAMS手册.docx', 'BAMS手册_20141210163017418.docx', null, null, '5687E6FE-0598-4F47-883C-91D454CAAE46', '2014-12-10 16:34:26', '5687E6FE-0598-4F47-883C-91D454CAAE46', '2014-12-10 16:34:26', '-1');
INSERT INTO `sys_attachment_info` VALUES ('560', 'QzovQmFtc0Rvd25sb2Fkcy9tZW1iZXIvMTIuNNDeuMRfMjAxNDEyMTAxNjMzNTAyNjAuZG9jeA@3@3', '12.4修改.docx', '12.4修改_20141210163350260.docx', null, null, '5687E6FE-0598-4F47-883C-91D454CAAE46', '2014-12-10 16:34:26', '5687E6FE-0598-4F47-883C-91D454CAAE46', '2014-12-10 16:34:26', '-1');
INSERT INTO `sys_attachment_info` VALUES ('561', 'QzovQmFtc0Rvd25sb2Fkcy9tZW1iZXIvQkFNU8rWsuFfMjAxNDEyMTAxNjM0MTQ2NzYuZG9jeA@3@3', 'BAMS手册.docx', 'BAMS手册_20141210163414676.docx', null, null, '5687E6FE-0598-4F47-883C-91D454CAAE46', '2014-12-10 16:34:26', '5687E6FE-0598-4F47-883C-91D454CAAE46', '2014-12-10 16:34:26', '-1');
INSERT INTO `sys_attachment_info` VALUES ('562', 'QzovQmFtc0Rvd25sb2Fkcy9tZW1iZXIvQkFNU8rWsuFfMjAxNDEyMTAxNjMwMTc0MTguZG9jeA@3@3', 'BAMS手册.docx', 'BAMS手册_20141210163017418.docx', null, null, '5687E6FE-0598-4F47-883C-91D454CAAE46', '2014-12-10 16:34:53', '5687E6FE-0598-4F47-883C-91D454CAAE46', '2014-12-10 16:34:53', '-1');
INSERT INTO `sys_attachment_info` VALUES ('563', 'QzovQmFtc0Rvd25sb2Fkcy9tZW1iZXIvMTIuNNDeuMRfMjAxNDEyMTAxNjMzNTAyNjAuZG9jeA@3@3', '12.4修改.docx', '12.4修改_20141210163350260.docx', null, null, '5687E6FE-0598-4F47-883C-91D454CAAE46', '2014-12-10 16:34:53', '5687E6FE-0598-4F47-883C-91D454CAAE46', '2014-12-10 16:34:53', '-1');
INSERT INTO `sys_attachment_info` VALUES ('564', 'QzovQmFtc0Rvd25sb2Fkcy9tZW1iZXIvQkFNU8rWsuFfMjAxNDEyMTAxNjM0MTQ2NzYuZG9jeA@3@3', 'BAMS手册.docx', 'BAMS手册_20141210163414676.docx', null, null, '5687E6FE-0598-4F47-883C-91D454CAAE46', '2014-12-10 16:34:53', '5687E6FE-0598-4F47-883C-91D454CAAE46', '2014-12-10 16:34:53', '-1');
INSERT INTO `sys_attachment_info` VALUES ('565', 'QzovQmFtc0Rvd25sb2Fkcy9tZW1iZXIvQkFNU8rWsuFfMjAxNDEyMTAxNjMwMTc0MTguZG9jeA@3@3', 'BAMS手册.docx', 'BAMS手册_20141210163017418.docx', null, null, '5687E6FE-0598-4F47-883C-91D454CAAE46', '2014-12-10 16:40:12', '5687E6FE-0598-4F47-883C-91D454CAAE46', '2014-12-10 16:40:12', '-1');
INSERT INTO `sys_attachment_info` VALUES ('566', 'QzovQmFtc0Rvd25sb2Fkcy9tZW1iZXIvMTIuNNDeuMRfMjAxNDEyMTAxNjMzNTAyNjAuZG9jeA@3@3', '12.4修改.docx', '12.4修改_20141210163350260.docx', null, null, '5687E6FE-0598-4F47-883C-91D454CAAE46', '2014-12-10 16:40:12', '5687E6FE-0598-4F47-883C-91D454CAAE46', '2014-12-10 16:40:12', '-1');
INSERT INTO `sys_attachment_info` VALUES ('567', 'QzovQmFtc0Rvd25sb2Fkcy9tZW1iZXIvQkFNU8rWsuFfMjAxNDEyMTAxNjM0MTQ2NzYuZG9jeA@3@3', 'BAMS手册.docx', 'BAMS手册_20141210163414676.docx', null, null, '5687E6FE-0598-4F47-883C-91D454CAAE46', '2014-12-10 16:40:12', '5687E6FE-0598-4F47-883C-91D454CAAE46', '2014-12-10 16:40:12', '-1');
INSERT INTO `sys_attachment_info` VALUES ('568', 'QzovQmFtc0Rvd25sb2Fkcy9tZW1iZXIvQkFNU8rWsuFfMjAxNDEyMTAxNjM3MzIzODkuZG9jeA@3@3', 'BAMS手册.docx', 'BAMS手册_20141210163732389.docx', null, null, '5687E6FE-0598-4F47-883C-91D454CAAE46', '2014-12-10 16:40:12', '5687E6FE-0598-4F47-883C-91D454CAAE46', '2014-12-10 16:40:12', '-1');
INSERT INTO `sys_attachment_info` VALUES ('569', 'QzovQmFtc0Rvd25sb2Fkcy9tZW1iZXIvQkFNU8rWsuFfMjAxNDEyMTAxNjMwMTc0MTguZG9jeA@3@3', 'BAMS手册.docx', 'BAMS手册_20141210163017418.docx', null, null, '5687E6FE-0598-4F47-883C-91D454CAAE46', '2014-12-10 16:40:22', '5687E6FE-0598-4F47-883C-91D454CAAE46', '2014-12-10 16:40:22', '-1');
INSERT INTO `sys_attachment_info` VALUES ('570', 'QzovQmFtc0Rvd25sb2Fkcy9tZW1iZXIvMTIuNNDeuMRfMjAxNDEyMTAxNjMzNTAyNjAuZG9jeA@3@3', '12.4修改.docx', '12.4修改_20141210163350260.docx', null, null, '5687E6FE-0598-4F47-883C-91D454CAAE46', '2014-12-10 16:40:22', '5687E6FE-0598-4F47-883C-91D454CAAE46', '2014-12-10 16:40:22', '-1');
INSERT INTO `sys_attachment_info` VALUES ('571', 'QzovQmFtc0Rvd25sb2Fkcy9tZW1iZXIvQkFNU8rWsuFfMjAxNDEyMTAxNjM0MTQ2NzYuZG9jeA@3@3', 'BAMS手册.docx', 'BAMS手册_20141210163414676.docx', null, null, '5687E6FE-0598-4F47-883C-91D454CAAE46', '2014-12-10 16:40:22', '5687E6FE-0598-4F47-883C-91D454CAAE46', '2014-12-10 16:40:22', '-1');
INSERT INTO `sys_attachment_info` VALUES ('572', 'QzovQmFtc0Rvd25sb2Fkcy9tZW1iZXIvQkFNU8rWsuFfMjAxNDEyMTAxNjM3MzIzODkuZG9jeA@3@3', 'BAMS手册.docx', 'BAMS手册_20141210163732389.docx', null, null, '5687E6FE-0598-4F47-883C-91D454CAAE46', '2014-12-10 16:40:22', '5687E6FE-0598-4F47-883C-91D454CAAE46', '2014-12-10 16:40:22', '-1');
INSERT INTO `sys_attachment_info` VALUES ('573', 'QzovQmFtc0Rvd25sb2Fkcy9tZW1iZXIvQkFNU8rWsuFfMjAxNDEyMTAxNjQwMTg4MzMuZG9jeA@3@3', 'BAMS手册.docx', 'BAMS手册_20141210164018833.docx', null, null, '5687E6FE-0598-4F47-883C-91D454CAAE46', '2014-12-10 16:40:22', '5687E6FE-0598-4F47-883C-91D454CAAE46', '2014-12-10 16:40:22', '-1');
INSERT INTO `sys_attachment_info` VALUES ('574', 'QzovQmFtc0Rvd25sb2Fkcy9tZW1iZXIvQkFNU8rWsuFfMjAxNDEyMTAxNjMwMTc0MTguZG9jeA@3@3', 'BAMS手册.docx', 'BAMS手册_20141210163017418.docx', null, null, '5687E6FE-0598-4F47-883C-91D454CAAE46', '2014-12-10 16:40:34', '5687E6FE-0598-4F47-883C-91D454CAAE46', '2014-12-10 16:40:34', '-1');
INSERT INTO `sys_attachment_info` VALUES ('575', 'QzovQmFtc0Rvd25sb2Fkcy9tZW1iZXIvMTIuNNDeuMRfMjAxNDEyMTAxNjMzNTAyNjAuZG9jeA@3@3', '12.4修改.docx', '12.4修改_20141210163350260.docx', null, null, '5687E6FE-0598-4F47-883C-91D454CAAE46', '2014-12-10 16:40:34', '5687E6FE-0598-4F47-883C-91D454CAAE46', '2014-12-10 16:40:34', '-1');
INSERT INTO `sys_attachment_info` VALUES ('576', 'QzovQmFtc0Rvd25sb2Fkcy9tZW1iZXIvQkFNU8rWsuFfMjAxNDEyMTAxNjM0MTQ2NzYuZG9jeA@3@3', 'BAMS手册.docx', 'BAMS手册_20141210163414676.docx', null, null, '5687E6FE-0598-4F47-883C-91D454CAAE46', '2014-12-10 16:40:34', '5687E6FE-0598-4F47-883C-91D454CAAE46', '2014-12-10 16:40:34', '-1');
INSERT INTO `sys_attachment_info` VALUES ('577', 'QzovQmFtc0Rvd25sb2Fkcy9tZW1iZXIvQkFNU8rWsuFfMjAxNDEyMTAxNjM3MzIzODkuZG9jeA@3@3', 'BAMS手册.docx', 'BAMS手册_20141210163732389.docx', null, null, '5687E6FE-0598-4F47-883C-91D454CAAE46', '2014-12-10 16:40:34', '5687E6FE-0598-4F47-883C-91D454CAAE46', '2014-12-10 16:40:34', '-1');
INSERT INTO `sys_attachment_info` VALUES ('578', 'QzovQmFtc0Rvd25sb2Fkcy9tZW1iZXIvQkFNU8rWsuFfMjAxNDEyMTAxNjQwMTg4MzMuZG9jeA@3@3', 'BAMS手册.docx', 'BAMS手册_20141210164018833.docx', null, null, '5687E6FE-0598-4F47-883C-91D454CAAE46', '2014-12-10 16:40:34', '5687E6FE-0598-4F47-883C-91D454CAAE46', '2014-12-10 16:40:34', '-1');
INSERT INTO `sys_attachment_info` VALUES ('579', 'QzovQmFtc0Rvd25sb2Fkcy9tZW1iZXIvQkFNU8rWsuFfMjAxNDEyMTAxNjQwMjc1NjIuZG9jeA@3@3', 'BAMS手册.docx', 'BAMS手册_20141210164027562.docx', null, null, '5687E6FE-0598-4F47-883C-91D454CAAE46', '2014-12-10 16:40:34', '5687E6FE-0598-4F47-883C-91D454CAAE46', '2014-12-10 16:40:34', '-1');
INSERT INTO `sys_attachment_info` VALUES ('580', 'QzovQmFtc0Rvd25sb2Fkcy9tZW1iZXIvQkFNU8rWsuFfMjAxNDEyMTAxNjMwMTc0MTguZG9jeA@3@3', 'BAMS手册.docx', 'BAMS手册_20141210163017418.docx', null, null, '5687E6FE-0598-4F47-883C-91D454CAAE46', '2014-12-10 16:40:49', '5687E6FE-0598-4F47-883C-91D454CAAE46', '2014-12-10 16:40:49', '-1');
INSERT INTO `sys_attachment_info` VALUES ('581', 'QzovQmFtc0Rvd25sb2Fkcy9tZW1iZXIvMTIuNNDeuMRfMjAxNDEyMTAxNjMzNTAyNjAuZG9jeA@3@3', '12.4修改.docx', '12.4修改_20141210163350260.docx', null, null, '5687E6FE-0598-4F47-883C-91D454CAAE46', '2014-12-10 16:40:49', '5687E6FE-0598-4F47-883C-91D454CAAE46', '2014-12-10 16:40:49', '-1');
INSERT INTO `sys_attachment_info` VALUES ('582', 'QzovQmFtc0Rvd25sb2Fkcy9tZW1iZXIvQkFNU8rWsuFfMjAxNDEyMTAxNjM0MTQ2NzYuZG9jeA@3@3', 'BAMS手册.docx', 'BAMS手册_20141210163414676.docx', null, null, '5687E6FE-0598-4F47-883C-91D454CAAE46', '2014-12-10 16:40:49', '5687E6FE-0598-4F47-883C-91D454CAAE46', '2014-12-10 16:40:49', '-1');
INSERT INTO `sys_attachment_info` VALUES ('583', 'QzovQmFtc0Rvd25sb2Fkcy9tZW1iZXIvQkFNU8rWsuFfMjAxNDEyMTAxNjM3MzIzODkuZG9jeA@3@3', 'BAMS手册.docx', 'BAMS手册_20141210163732389.docx', null, null, '5687E6FE-0598-4F47-883C-91D454CAAE46', '2014-12-10 16:40:49', '5687E6FE-0598-4F47-883C-91D454CAAE46', '2014-12-10 16:40:49', '-1');
INSERT INTO `sys_attachment_info` VALUES ('584', 'QzovQmFtc0Rvd25sb2Fkcy9tZW1iZXIvQkFNU8rWsuFfMjAxNDEyMTAxNjQwMTg4MzMuZG9jeA@3@3', 'BAMS手册.docx', 'BAMS手册_20141210164018833.docx', null, null, '5687E6FE-0598-4F47-883C-91D454CAAE46', '2014-12-10 16:40:49', '5687E6FE-0598-4F47-883C-91D454CAAE46', '2014-12-10 16:40:49', '-1');
INSERT INTO `sys_attachment_info` VALUES ('585', 'QzovQmFtc0Rvd25sb2Fkcy9tZW1iZXIvQkFNU8rWsuFfMjAxNDEyMTAxNjQwMjc1NjIuZG9jeA@3@3', 'BAMS手册.docx', 'BAMS手册_20141210164027562.docx', null, null, '5687E6FE-0598-4F47-883C-91D454CAAE46', '2014-12-10 16:40:49', '5687E6FE-0598-4F47-883C-91D454CAAE46', '2014-12-10 16:40:49', '-1');
INSERT INTO `sys_attachment_info` VALUES ('586', 'QzovQmFtc0Rvd25sb2Fkcy9tZW1iZXIvQkFNU8rWsuFfMjAxNDEyMTAxNjQwNDM4MDUuZG9jeA@3@3', 'BAMS手册.docx', 'BAMS手册_20141210164043805.docx', null, null, '5687E6FE-0598-4F47-883C-91D454CAAE46', '2014-12-10 16:40:49', '5687E6FE-0598-4F47-883C-91D454CAAE46', '2014-12-10 16:40:49', '-1');
INSERT INTO `sys_attachment_info` VALUES ('587', 'QzovQmFtc0Rvd25sb2Fkcy9tZW1iZXIvQkFNU8rWsuFfMjAxNDEyMTAxNjMwMTc0MTguZG9jeA@3@3', 'BAMS手册.docx', '', null, null, '5687E6FE-0598-4F47-883C-91D454CAAE46', '2014-12-11 08:40:07', '5687E6FE-0598-4F47-883C-91D454CAAE46', '2014-12-11 08:40:07', '-1');
INSERT INTO `sys_attachment_info` VALUES ('588', 'QzovQmFtc0Rvd25sb2Fkcy9tZW1iZXIvMTIuNNDeuMRfMjAxNDEyMTAxNjMzNTAyNjAuZG9jeA@3@3', '12.4修改.docx', '', null, null, '5687E6FE-0598-4F47-883C-91D454CAAE46', '2014-12-11 08:40:07', '5687E6FE-0598-4F47-883C-91D454CAAE46', '2014-12-11 08:40:07', '-1');
INSERT INTO `sys_attachment_info` VALUES ('589', 'QzovQmFtc0Rvd25sb2Fkcy9tZW1iZXIvQkFNU8rWsuFfMjAxNDEyMTAxNjM0MTQ2NzYuZG9jeA@3@3', 'BAMS手册.docx', '', null, null, '5687E6FE-0598-4F47-883C-91D454CAAE46', '2014-12-11 08:40:07', '5687E6FE-0598-4F47-883C-91D454CAAE46', '2014-12-11 08:40:07', '-1');
INSERT INTO `sys_attachment_info` VALUES ('590', 'QzovQmFtc0Rvd25sb2Fkcy9tZW1iZXIvQkFNU8rWsuFfMjAxNDEyMTAxNjM3MzIzODkuZG9jeA@3@3', 'BAMS手册.docx', '', null, null, '5687E6FE-0598-4F47-883C-91D454CAAE46', '2014-12-11 08:40:07', '5687E6FE-0598-4F47-883C-91D454CAAE46', '2014-12-11 08:40:07', '-1');
INSERT INTO `sys_attachment_info` VALUES ('591', 'QzovQmFtc0Rvd25sb2Fkcy9tZW1iZXIvQkFNU8rWsuFfMjAxNDEyMTAxNjQwMTg4MzMuZG9jeA@3@3', 'BAMS手册.docx', '', null, null, '5687E6FE-0598-4F47-883C-91D454CAAE46', '2014-12-11 08:40:07', '5687E6FE-0598-4F47-883C-91D454CAAE46', '2014-12-11 08:40:07', '-1');
INSERT INTO `sys_attachment_info` VALUES ('592', 'QzovQmFtc0Rvd25sb2Fkcy9tZW1iZXIvQkFNU8rWsuFfMjAxNDEyMTAxNjQwMjc1NjIuZG9jeA@3@3', 'BAMS手册.docx', '', null, null, '5687E6FE-0598-4F47-883C-91D454CAAE46', '2014-12-11 08:40:07', '5687E6FE-0598-4F47-883C-91D454CAAE46', '2014-12-11 08:40:07', '-1');
INSERT INTO `sys_attachment_info` VALUES ('593', 'QzovQmFtc0Rvd25sb2Fkcy9tZW1iZXIvQkFNU8rWsuFfMjAxNDEyMTAxNjQwNDM4MDUuZG9jeA@3@3', 'BAMS手册.docx', '', null, null, '5687E6FE-0598-4F47-883C-91D454CAAE46', '2014-12-11 08:40:07', '5687E6FE-0598-4F47-883C-91D454CAAE46', '2014-12-11 08:40:07', '-1');
INSERT INTO `sys_attachment_info` VALUES ('594', 'QzovQmFtc0Rvd25sb2Fkcy9tZW1iZXIvQkFNU8rWsuFfMjAxNDEyMTAxNjMwMTc0MTguZG9jeA@3@3', 'BAMS手册.docx', '', null, null, '5687E6FE-0598-4F47-883C-91D454CAAE46', '2014-12-11 08:41:29', '5687E6FE-0598-4F47-883C-91D454CAAE46', '2014-12-11 08:41:29', '-1');
INSERT INTO `sys_attachment_info` VALUES ('595', 'QzovQmFtc0Rvd25sb2Fkcy9tZW1iZXIvMTIuNNDeuMRfMjAxNDEyMTAxNjMzNTAyNjAuZG9jeA@3@3', '12.4修改.docx', '', null, null, '5687E6FE-0598-4F47-883C-91D454CAAE46', '2014-12-11 08:41:29', '5687E6FE-0598-4F47-883C-91D454CAAE46', '2014-12-11 08:41:29', '-1');
INSERT INTO `sys_attachment_info` VALUES ('596', 'QzovQmFtc0Rvd25sb2Fkcy9tZW1iZXIvQkFNU8rWsuFfMjAxNDEyMTAxNjM0MTQ2NzYuZG9jeA@3@3', 'BAMS手册.docx', '', null, null, '5687E6FE-0598-4F47-883C-91D454CAAE46', '2014-12-11 08:41:29', '5687E6FE-0598-4F47-883C-91D454CAAE46', '2014-12-11 08:41:29', '-1');
INSERT INTO `sys_attachment_info` VALUES ('597', 'QzovQmFtc0Rvd25sb2Fkcy9tZW1iZXIvQkFNU8rWsuFfMjAxNDEyMTAxNjMwMTc0MTguZG9jeA@3@3', 'BAMS手册.docx', '', null, null, '5687E6FE-0598-4F47-883C-91D454CAAE46', '2014-12-11 09:06:56', '5687E6FE-0598-4F47-883C-91D454CAAE46', '2014-12-11 09:06:56', '-1');
INSERT INTO `sys_attachment_info` VALUES ('598', 'QzovQmFtc0Rvd25sb2Fkcy9tZW1iZXIvMTIuNNDeuMRfMjAxNDEyMTAxNjMzNTAyNjAuZG9jeA@3@3', '12.4修改.docx', '', null, null, '5687E6FE-0598-4F47-883C-91D454CAAE46', '2014-12-11 09:06:56', '5687E6FE-0598-4F47-883C-91D454CAAE46', '2014-12-11 09:06:56', '-1');
INSERT INTO `sys_attachment_info` VALUES ('599', 'QzovQmFtc0Rvd25sb2Fkcy9tZW1iZXIvQkFNU8rWsuFfMjAxNDEyMTAxNjM0MTQ2NzYuZG9jeA@3@3', 'BAMS手册.docx', '', null, null, '5687E6FE-0598-4F47-883C-91D454CAAE46', '2014-12-11 09:06:56', '5687E6FE-0598-4F47-883C-91D454CAAE46', '2014-12-11 09:06:56', '-1');
INSERT INTO `sys_attachment_info` VALUES ('600', 'QzovQmFtc0Rvd25sb2Fkcy9tZW1iZXIvcXVlcmVuc2h1XzIwMTQxMjExMDkwNDE2MDU4LmRvYw@3@3', 'querenshu.doc', 'querenshu_20141211090416058.doc', null, null, '5687E6FE-0598-4F47-883C-91D454CAAE46', '2014-12-11 09:06:56', '5687E6FE-0598-4F47-883C-91D454CAAE46', '2014-12-11 09:06:56', '-1');
INSERT INTO `sys_attachment_info` VALUES ('601', 'QzovQmFtc0Rvd25sb2Fkcy9tZW1iZXIvQkFNU8rWsuFfMjAxNDEyMTAxNjMwMTc0MTguZG9jeA@3@3', 'BAMS手册.docx', '', null, null, '5687E6FE-0598-4F47-883C-91D454CAAE46', '2014-12-11 13:14:39', '5687E6FE-0598-4F47-883C-91D454CAAE46', '2014-12-11 13:14:39', '-1');
INSERT INTO `sys_attachment_info` VALUES ('602', 'QzovQmFtc0Rvd25sb2Fkcy9tZW1iZXIvMTIuNNDeuMRfMjAxNDEyMTAxNjMzNTAyNjAuZG9jeA@3@3', '12.4修改.docx', '', null, null, '5687E6FE-0598-4F47-883C-91D454CAAE46', '2014-12-11 13:14:39', '5687E6FE-0598-4F47-883C-91D454CAAE46', '2014-12-11 13:14:39', '-1');
INSERT INTO `sys_attachment_info` VALUES ('603', 'QzovQmFtc0Rvd25sb2Fkcy9tZW1iZXIvQkFNU8rWsuFfMjAxNDEyMTAxNjM0MTQ2NzYuZG9jeA@3@3', 'BAMS手册.docx', '', null, null, '5687E6FE-0598-4F47-883C-91D454CAAE46', '2014-12-11 13:14:39', '5687E6FE-0598-4F47-883C-91D454CAAE46', '2014-12-11 13:14:39', '-1');
INSERT INTO `sys_attachment_info` VALUES ('604', 'QzovQmFtc0Rvd25sb2Fkcy9tZW1iZXIvcXVlcmVuc2h1XzIwMTQxMjExMDkwNDE2MDU4LmRvYw@3@3', 'querenshu.doc', 'querenshu_20141211090416058.doc', null, null, '5687E6FE-0598-4F47-883C-91D454CAAE46', '2014-12-11 13:14:39', '5687E6FE-0598-4F47-883C-91D454CAAE46', '2014-12-11 13:14:39', '-1');
INSERT INTO `sys_attachment_info` VALUES ('605', 'QzovQmFtc0Rvd25sb2Fkcy9maWxlL2NvbXAxOC9wZXJzb241Mi/W2LXj06bTw18yMDE0MDQyOTE5NDMzOTk3NC5kb2N4', '重点应用.docx', '重点应用_20140429194339974.docx', null, null, '182013052121033133083', '2014-12-11 14:04:34', '182013052121033133083', '2014-12-11 14:04:34', '18');
INSERT INTO `sys_attachment_info` VALUES ('608', 'QzovQmFtc0Rvd25sb2Fkcy9tZW1iZXIvQkFNU8rWsuFfMjAxNTAxMDIyMzM3MTc2MTYuZG9jeA@3@3', 'BAMS手册.docx', 'BAMS手册_20150102233717616.docx', null, null, '5687E6FE-0598-4F47-883C-91D454CAAE46', '2015-01-02 23:37:30', '5687E6FE-0598-4F47-883C-91D454CAAE46', '2015-01-02 23:37:30', '-1');
INSERT INTO `sys_attachment_info` VALUES ('609', 'QzovQmFtc0Rvd25sb2Fkcy9tZW1iZXIvyc@16o7f@1zvHG98/gudhfMjAxNTAxMDIyMzM3MTc3ODkuZG9jeA@3@3', '上海服务器相关.docx', '上海服务器相关_20150102233717789.docx', null, null, '5687E6FE-0598-4F47-883C-91D454CAAE46', '2015-01-02 23:37:31', '5687E6FE-0598-4F47-883C-91D454CAAE46', '2015-01-02 23:37:31', '-1');
INSERT INTO `sys_attachment_info` VALUES ('610', 'QzovQmFtc0Rvd25sb2Fkcy9tZW1iZXIv0OjH87fWzvbVqtKqXzIwMTUwMTAyMjMzNzE3ODQ3LmRvY3g@3', '需求分析摘要.docx', '需求分析摘要_20150102233717847.docx', null, null, '5687E6FE-0598-4F47-883C-91D454CAAE46', '2015-01-02 23:37:31', '5687E6FE-0598-4F47-883C-91D454CAAE46', '2015-01-02 23:37:31', '-1');
INSERT INTO `sys_attachment_info` VALUES ('611', 'QzovQmFtc0Rvd25sb2Fkcy9tZW1iZXIvQkFNU8rWsuFfMjAxNTAxMDIyMzM3MTc2MTYuZG9jeA@3@3', 'BAMS手册.docx', 'BAMS手册_20150102233717616.docx', null, null, '5687E6FE-0598-4F47-883C-91D454CAAE46', '2015-01-02 23:39:05', '5687E6FE-0598-4F47-883C-91D454CAAE46', '2015-01-02 23:39:05', '-1');
INSERT INTO `sys_attachment_info` VALUES ('612', 'QzovQmFtc0Rvd25sb2Fkcy9tZW1iZXIvyc@16o7f@1zvHG98/gudhfMjAxNTAxMDIyMzM3MTc3ODkuZG9jeA@3@3', '上海服务器相关.docx', '上海服务器相关_20150102233717789.docx', null, null, '5687E6FE-0598-4F47-883C-91D454CAAE46', '2015-01-02 23:39:05', '5687E6FE-0598-4F47-883C-91D454CAAE46', '2015-01-02 23:39:05', '-1');
INSERT INTO `sys_attachment_info` VALUES ('613', 'QzovQmFtc0Rvd25sb2Fkcy9tZW1iZXIvQkFNU8rWsuFfMjAxNTAxMDIyMzM3MTc2MTYuZG9jeA@3@3', 'BAMS手册.docx', 'BAMS手册_20150102233717616.docx', null, null, '5687E6FE-0598-4F47-883C-91D454CAAE46', '2015-01-02 23:46:01', '5687E6FE-0598-4F47-883C-91D454CAAE46', '2015-01-02 23:46:01', '-1');
INSERT INTO `sys_attachment_info` VALUES ('614', 'QzovQmFtc0Rvd25sb2Fkcy9tZW1iZXIvyc@16o7f@1zvHG98/gudhfMjAxNTAxMDIyMzM3MTc3ODkuZG9jeA@3@3', '上海服务器相关.docx', '上海服务器相关_20150102233717789.docx', null, null, '5687E6FE-0598-4F47-883C-91D454CAAE46', '2015-01-02 23:46:01', '5687E6FE-0598-4F47-883C-91D454CAAE46', '2015-01-02 23:46:01', '-1');
INSERT INTO `sys_attachment_info` VALUES ('615', 'QzovQmFtc0Rvd25sb2Fkcy9tZW1iZXIv0OjH87fWzvbVqtKqXzIwMTUwMTAyMjM0NTU2OTcxLmRvY3g@3', '需求分析摘要.docx', '需求分析摘要_20150102234556971.docx', null, null, '5687E6FE-0598-4F47-883C-91D454CAAE46', '2015-01-02 23:46:01', '5687E6FE-0598-4F47-883C-91D454CAAE46', '2015-01-02 23:46:01', '-1');
INSERT INTO `sys_attachment_info` VALUES ('616', 'QzovQmFtc0Rvd25sb2Fkcy9tZW1iZXIvQkFNU8rWsuFfMjAxNTAxMDIyMzM3MTc2MTYuZG9jeA@3@3', 'BAMS手册.docx', 'BAMS手册_20150102233717616.docx', null, null, '5687E6FE-0598-4F47-883C-91D454CAAE46', '2015-01-03 00:04:07', '5687E6FE-0598-4F47-883C-91D454CAAE46', '2015-01-03 00:04:07', '-1');
INSERT INTO `sys_attachment_info` VALUES ('617', 'QzovQmFtc0Rvd25sb2Fkcy9tZW1iZXIvyc@16o7f@1zvHG98/gudhfMjAxNTAxMDIyMzM3MTc3ODkuZG9jeA@3@3', '上海服务器相关.docx', '上海服务器相关_20150102233717789.docx', null, null, '5687E6FE-0598-4F47-883C-91D454CAAE46', '2015-01-03 00:04:07', '5687E6FE-0598-4F47-883C-91D454CAAE46', '2015-01-03 00:04:07', '-1');
INSERT INTO `sys_attachment_info` VALUES ('618', 'QzovQmFtc0Rvd25sb2Fkcy9tZW1iZXIv0OjH87fWzvbVqtKqXzIwMTUwMTAyMjM0NTU2OTcxLmRvY3g@3', '需求分析摘要.docx', '需求分析摘要_20150102234556971.docx', null, null, '5687E6FE-0598-4F47-883C-91D454CAAE46', '2015-01-03 00:04:07', '5687E6FE-0598-4F47-883C-91D454CAAE46', '2015-01-03 00:04:07', '-1');
INSERT INTO `sys_column_control` VALUES ('1', 'primaryKey', 'I D', '2', '人员列表', '2', '2', '0', '1');
INSERT INTO `sys_column_control` VALUES ('2', 'hrmEmployeeName', '员工姓名', '1', '人员列表', '1', '1', '25', '2');
INSERT INTO `sys_column_control` VALUES ('7', 'hrmEmployeeInTime', '入职日期', '1', '人员列表', '1', '1', '0', '3');
INSERT INTO `sys_column_control` VALUES ('8', 'hrmEmployeeCode', '员工编码', '1', '人员列表', '1', '1', '0', '4');
INSERT INTO `sys_column_control` VALUES ('9', 'hrmEmployeeSex', '性别', '1', '人员列表', '2', '1', '0', '5');
INSERT INTO `sys_column_control` VALUES ('10', 'primaryKey', '功能编号', '1', '系统功能列表', '1', '1', '0', '1');
INSERT INTO `sys_column_control` VALUES ('11', 'methodInfoName', '功能名称', '1', '系统功能列表', '1', '1', '25', '2');
INSERT INTO `sys_column_control` VALUES ('12', 'methodUri', '跳转路径', '1', '系统功能列表', '2', '2', '25', '3');
INSERT INTO `sys_column_control` VALUES ('13', 'methodNo', '显示顺序', '1', '系统功能列表', '2', '2', '0', '4');
INSERT INTO `sys_column_control` VALUES ('14', 'methodLevel', '等级', '1', '系统功能列表', '2', '1', '0', '5');
INSERT INTO `sys_column_control` VALUES ('15', 'upSysMethodInfo.methodInfoName', '上级功能', '1', '系统功能列表', '2', '2', '25', '6');
INSERT INTO `sys_column_control` VALUES ('16', 'isAction', '状态', '1', '系统功能列表', '2', '1', '0', '7');
INSERT INTO `sys_column_control` VALUES ('17', 'primaryKey', '机构ID', '2', '部门列表', '2', '2', '0', '1');
INSERT INTO `sys_column_control` VALUES ('18', 'hrmDepCode', '机构编码', '1', '部门列表', '1', '1', '0', '2');
INSERT INTO `sys_column_control` VALUES ('19', 'hrmDepName', '机构名称', '1', '部门列表', '1', '1', '0', '3');
INSERT INTO `sys_column_control` VALUES ('20', 'hrmDepEngname', '机构英文名称', '1', '部门列表', '1', '1', '0', '4');
INSERT INTO `sys_column_control` VALUES ('21', 'employee.hrmEmployeeName', '机构经理', '1', '部门列表', '2', '2', '0', '5');
INSERT INTO `sys_column_control` VALUES ('22', 'libraryInfoCode', '业务编码', '1', '业务字典列表', '1', '1', '0', '1');
INSERT INTO `sys_column_control` VALUES ('23', 'libraryInfoName', '业务名称', '1', '业务字典列表', '1', '1', '20', '2');
INSERT INTO `sys_column_control` VALUES ('24', 'libraryInfoUpcode', '所属编码', '1', '业务字典列表', '2', '2', '0', '3');
INSERT INTO `sys_column_control` VALUES ('25', 'libraryInfoIsedit', '是否允许修改', '1', '业务字典列表', '2', '1', '0', '4');
INSERT INTO `sys_column_control` VALUES ('26', 'libraryInfoIsvalid', '是否有效', '2', '业务字典列表', '2', '2', '0', '5');
INSERT INTO `sys_column_control` VALUES ('27', 'oaIsTop', '', '1', '新闻列表', '2', '2', '0', '1');
INSERT INTO `sys_column_control` VALUES ('28', 'oaNewsName', '新闻标题', '1', '新闻列表', '1', '1', '30', '2');
INSERT INTO `sys_column_control` VALUES ('29', 'oaTypeLib.libraryInfoName', '新闻类型', '1', '新闻列表', '2', '2', '0', '3');
INSERT INTO `sys_column_control` VALUES ('30', 'employee.hrmEmployeeName', '发布人', '1', '新闻列表', '1', '1', '0', '4');
INSERT INTO `sys_column_control` VALUES ('31', 'oaNewsTime', '发布时间', '1', '新闻列表', '2', '1', '0', '5');
INSERT INTO `sys_column_control` VALUES ('32', 'oaNewsStatus', '新闻状态', '1', '新闻列表', '2', '1', '0', '6');
INSERT INTO `sys_column_control` VALUES ('33', 'oaApprovalStatus', '审批状态', '1', '新闻列表', '2', '1', '0', '7');
INSERT INTO `sys_column_control` VALUES ('34', 'oaTypeName', '类型名称', '1', '公司资源-类型', '1', '2', '0', '1');
INSERT INTO `sys_column_control` VALUES ('35', 'oaTypeText', '类型说明', '1', '公司资源-类型', '2', '2', '30', '2');
INSERT INTO `sys_column_control` VALUES ('36', 'oaWareName', '知识标题', '1', '公司资源-知识仓库', '1', '1', '15', '1');
INSERT INTO `sys_column_control` VALUES ('37', 'wareType.oaTypeName', '类型名称', '1', '公司资源-知识仓库', '2', '2', '0', '2');
INSERT INTO `sys_column_control` VALUES ('38', 'oaKeyword', '关键字', '1', '公司资源-知识仓库', '1', '1', '0', '3');
INSERT INTO `sys_column_control` VALUES ('39', 'oaWareEmployee.hrmEmployeeName', '发布人', '1', '公司资源-知识仓库', '2', '2', '0', '4');
INSERT INTO `sys_column_control` VALUES ('40', 'oaWareTime', '发布时间', '1', '公司资源-知识仓库', '2', '1', '0', '5');
INSERT INTO `sys_column_control` VALUES ('41', 'oaWareType', '类型名称', '2', '公司资源-知识仓库', '2', '1', '0', '6');
INSERT INTO `sys_column_control` VALUES ('42', 'oaAnnoLevel', '', '1', '公告列表', '2', '2', '0', '0');
INSERT INTO `sys_column_control` VALUES ('43', 'oaAnnoName', '公告标题', '1', '公告列表', '1', '1', '30', '1');
INSERT INTO `sys_column_control` VALUES ('44', 'oaAnnoLib.libraryInfoName', '公告类型', '1', '公告列表', '2', '2', '0', '2');
INSERT INTO `sys_column_control` VALUES ('45', 'employee.hrmEmployeeName', '发布人', '1', '公告列表', '1', '1', '0', '3');
INSERT INTO `sys_column_control` VALUES ('46', 'oaAnnoTime', '公告时间', '1', '公告列表', '2', '1', '0', '4');
INSERT INTO `sys_column_control` VALUES ('47', 'oaAnnoStatus', '公告状态', '1', '公告列表', '2', '1', '0', '5');
INSERT INTO `sys_column_control` VALUES ('48', 'oaNotiType', '', '1', '通知列表', '2', '2', '0', '1');
INSERT INTO `sys_column_control` VALUES ('49', 'oaNotiName', '通知标题', '1', '通知列表', '1', '1', '30', '2');
INSERT INTO `sys_column_control` VALUES ('50', 'employee.hrmEmployeeName', '发布人', '1', '通知列表', '1', '1', '0', '3');
INSERT INTO `sys_column_control` VALUES ('51', 'oaNotiTime', '发布时间', '1', '通知列表', '2', '1', '0', '4');
INSERT INTO `sys_column_control` VALUES ('52', 'oaNotiStatus', '通知状态', '1', '通知列表', '2', '1', '0', '5');
INSERT INTO `sys_column_control` VALUES ('53', 'oaAdverLevel', '', '1', '公司记事列表', '2', '2', '0', '1');
INSERT INTO `sys_column_control` VALUES ('54', 'oaAdverTitle', '记事标题', '1', '公司记事列表', '1', '1', '50', '2');
INSERT INTO `sys_column_control` VALUES ('55', 'oaAdverTime', '记事时间', '1', '公司记事列表', '2', '1', '0', '3');
INSERT INTO `sys_column_control` VALUES ('56', 'oaAdverStatus', '记事状态', '1', '公司记事列表', '2', '1', '0', '4');
INSERT INTO `sys_column_control` VALUES ('57', 'oaFormName', '表格名称', '1', '公司资源-常用表格', '1', '1', '15', '1');
INSERT INTO `sys_column_control` VALUES ('58', 'wareType.oaTypeName', '类型名称', '1', '公司资源-常用表格', '2', '2', '15', '2');
INSERT INTO `sys_column_control` VALUES ('59', 'oaFormType', '类型名称', '2', '公司资源-常用表格', '2', '1', '15', '3');
INSERT INTO `sys_column_control` VALUES ('60', 'formEmployee.hrmEmployeeName', '创建人', '1', '公司资源-常用表格', '2', '2', '0', '4');
INSERT INTO `sys_column_control` VALUES ('61', 'oaFormTime', '创建时间', '1', '公司资源-常用表格', '2', '1', '0', '5');
INSERT INTO `sys_column_control` VALUES ('62', 'journalsTypeName', '类型名称', '1', '公司资源-期刊类型', '1', '2', '15', '1');
INSERT INTO `sys_column_control` VALUES ('63', 'journalsTypePress', '出版社', '1', '公司资源-期刊类型', '1', '2', '0', '2');
INSERT INTO `sys_column_control` VALUES ('64', 'journalsTypeProper', '期刊说明', '1', '公司资源-期刊类型', '2', '2', '20', '3');
INSERT INTO `sys_column_control` VALUES ('65', 'journalsType.journalsTypeName', '期刊类型', '1', '公司资源-期刊', '2', '2', '15', '1');
INSERT INTO `sys_column_control` VALUES ('66', 'journalsTypeId', '期刊类型', '2', '公司资源-期刊', '2', '1', '15', '2');
INSERT INTO `sys_column_control` VALUES ('67', 'journalsCount', '期刊期数', '1', '公司资源-期刊', '1', '1', '0', '3');
INSERT INTO `sys_column_control` VALUES ('68', 'journalsCode', '期刊号', '1', '公司资源-期刊', '1', '1', '0', '4');
INSERT INTO `sys_column_control` VALUES ('69', 'journalsType.journalsTypePress', '出版社', '1', '公司资源-期刊', '2', '2', '0', '5');
INSERT INTO `sys_column_control` VALUES ('70', 'albumName', '相册名称', '1', '公司相册-管理', '1', '1', '25', '1');
INSERT INTO `sys_column_control` VALUES ('71', 'libraryType.libraryInfoName', '相册类型', '1', '公司相册-管理', '2', '2', '0', '2');
INSERT INTO `sys_column_control` VALUES ('72', 'albumType', '相册类型', '2', '公司相册-管理', '2', '1', '0', '3');
INSERT INTO `sys_column_control` VALUES ('73', 'createEmployee.hrmEmployeeName', '创建人', '1', '公司相册-管理', '2', '2', '0', '4');
INSERT INTO `sys_column_control` VALUES ('74', 'albumTime', '创建时间', '1', '公司相册-管理', '2', '1', '0', '5');
INSERT INTO `sys_column_control` VALUES ('75', 'albumPhotoCount', '相片数', '1', '公司相册-管理', '2', '2', '0', '6');
INSERT INTO `sys_column_control` VALUES ('76', 'parentDepartment.hrmDepName', '上级机构', '1', '部门列表', '2', '2', '0', '6');
INSERT INTO `sys_column_control` VALUES ('77', 'primaryKey', '通讯分组ID', '2', '通讯录分组', '2', '2', '0', '1');
INSERT INTO `sys_column_control` VALUES ('78', 'oaChatgpName', '通讯分组名称', '1', '通讯录分组', '1', '1', '0', '2');
INSERT INTO `sys_column_control` VALUES ('79', 'oaChatgpDetail', '通讯分组说明', '1', '通讯录分组', '2', '2', '15', '3');
INSERT INTO `sys_column_control` VALUES ('80', 'photoName', '相片名称', '1', '公司相册-相片', '1', '2', '0', '1');
INSERT INTO `sys_column_control` VALUES ('81', 'photoTime', '上传时间', '1', '公司相册-相片', '2', '2', '0', '2');
INSERT INTO `sys_column_control` VALUES ('82', 'photoDesc', '相片描述', '1', '公司相册-相片', '2', '2', '25', '3');
INSERT INTO `sys_column_control` VALUES ('83', 'regulationsType.libraryInfoName', '规章类型', '1', '公司资源-规章制度', '2', '2', '0', '1');
INSERT INTO `sys_column_control` VALUES ('84', 'oaRegulationsType', '规章类型', '2', '公司资源-规章制度', '2', '1', '0', '2');
INSERT INTO `sys_column_control` VALUES ('85', 'oaRegulationsTitle', '规章标题', '1', '公司资源-规章制度', '1', '1', '15', '3');
INSERT INTO `sys_column_control` VALUES ('86', 'regulationsEmployee.hrmEmployeeName', '创建人', '1', '公司资源-规章制度', '2', '2', '0', '4');
INSERT INTO `sys_column_control` VALUES ('87', 'oaRegulationsTime', '创建时间', '1', '公司资源-规章制度', '2', '1', '0', '5');
INSERT INTO `sys_column_control` VALUES ('88', 'regulatStratTime', '生效日期', '1', '公司资源-规章制度', '2', '1', '0', '6');
INSERT INTO `sys_column_control` VALUES ('89', 'regulationsStatus', '规章状态', '1', '公司资源-规章制度', '2', '1', '0', '7');
INSERT INTO `sys_column_control` VALUES ('90', 'oaForumName', '版块名称', '1', '论坛版块列表', '1', '1', '0', '1');
INSERT INTO `sys_column_control` VALUES ('91', 'oaForumText', '版块描述', '1', '论坛版块列表', '2', '2', '30', '2');
INSERT INTO `sys_column_control` VALUES ('92', 'oaForumTime', '创建时间', '1', '论坛版块列表', '2', '1', '0', '3');
INSERT INTO `sys_column_control` VALUES ('93', 'employee.hrmEmployeeName', '创建人', '1', '论坛版块列表', '2', '2', '0', '4');
INSERT INTO `sys_column_control` VALUES ('94', 'employee.hrmEmployeeName', '姓名', '1', '用户管理', '1', '1', '0', '1');
INSERT INTO `sys_column_control` VALUES ('95', 'employee.hrmDepartment.hrmDepName', '部门名称', '1', '用户管理', '2', '2', '0', '2');
INSERT INTO `sys_column_control` VALUES ('96', 'userName', '用户名', '1', '用户管理', '1', '1', '0', '3');
INSERT INTO `sys_column_control` VALUES ('97', 'userpassword', '密码', '1', '用户管理', '2', '2', '0', '4');
INSERT INTO `sys_column_control` VALUES ('98', 'userAction', '是否有效', '1', '用户管理', '2', '1', '0', '5');
INSERT INTO `sys_column_control` VALUES ('99', 'groupName', '组名称', '1', '人员编组', '1', '2', '20', '1');
INSERT INTO `sys_column_control` VALUES ('100', 'groupDecp', '描述', '1', '人员编组', '2', '2', '40', '2');
INSERT INTO `sys_column_control` VALUES ('101', 'oaIsBoutique', '类型', '1', '帖子列表', '2', '1', '0', '1');
INSERT INTO `sys_column_control` VALUES ('102', 'roleName', '角色名称', '1', '角色列表', '1', '2', '20', '1');
INSERT INTO `sys_column_control` VALUES ('103', 'roleDesc', '角色描述', '1', '角色列表', '2', '2', '20', '2');
INSERT INTO `sys_column_control` VALUES ('104', 'detailCount', '权限数', '1', '角色列表', '2', '2', '0', '3');
INSERT INTO `sys_column_control` VALUES ('105', 'bindUserCount', '绑定用户', '1', '角色列表', '2', '2', '0', '4');
INSERT INTO `sys_column_control` VALUES ('106', 'bindGroupCount', '绑定组', '1', '角色列表', '2', '2', '0', '5');
INSERT INTO `sys_column_control` VALUES ('107', 'bindDeptCount', '绑定部门', '1', '角色列表', '2', '2', '0', '6');
INSERT INTO `sys_column_control` VALUES ('108', 'bindPostCount', '绑定岗位', '1', '角色列表', '2', '2', '0', '7');
INSERT INTO `sys_column_control` VALUES ('109', 'hrmPostName', '岗位名称', '1', '工作岗位', '1', '1', '10', '1');
INSERT INTO `sys_column_control` VALUES ('110', 'hrmPostEngname', '英文名称', '1', '工作岗位', '1', '1', '20', '2');
INSERT INTO `sys_column_control` VALUES ('111', 'hrmUpPost.hrmPostName', '上级岗位', '1', '工作岗位', '2', '2', '0', '4');
INSERT INTO `sys_column_control` VALUES ('112', 'mangerEmployee.hrmEmployeeName', '负责人', '1', '工作岗位', '2', '2', '0', '3');
INSERT INTO `sys_column_control` VALUES ('113', 'hrmPostDesc', '岗位描述', '1', '工作岗位', '2', '2', '25', '5');
INSERT INTO `sys_column_control` VALUES ('114', 'employeeName', '姓名', '1', '权限设置', '1', '1', '0', '1');
INSERT INTO `sys_column_control` VALUES ('115', 'employeeRole', '用户角色数', '1', '权限设置', '2', '2', '0', '2');
INSERT INTO `sys_column_control` VALUES ('116', 'deptName', '部门', '1', '权限设置', '2', '2', '20', '3');
INSERT INTO `sys_column_control` VALUES ('117', 'deptRole', '部门角色数', '1', '权限设置', '2', '2', '0', '4');
INSERT INTO `sys_column_control` VALUES ('118', 'mainPostName', '主岗位', '1', '权限设置', '2', '2', '0', '5');
INSERT INTO `sys_column_control` VALUES ('119', 'mainPostRole', '主岗位角色数', '1', '权限设置', '2', '2', '0', '6');
INSERT INTO `sys_column_control` VALUES ('120', 'partPostName', '兼职岗位', '1', '权限设置', '2', '2', '20', '7');
INSERT INTO `sys_column_control` VALUES ('121', 'partPostRole', '兼职岗位角色数', '1', '权限设置', '2', '2', '20', '8');
INSERT INTO `sys_column_control` VALUES ('122', 'groupName', '所在组', '1', '权限设置', '2', '2', '20', '9');
INSERT INTO `sys_column_control` VALUES ('123', 'groupRole', '所在组角色数', '1', '权限设置', '2', '2', '20', '10');
INSERT INTO `sys_column_control` VALUES ('124', 'userMethods', '权限数', '1', '权限设置', '2', '2', '0', '11');
INSERT INTO `sys_column_control` VALUES ('125', 'oaVoteName', '投票名称', '1', '投票列表', '1', '1', '30', '1');
INSERT INTO `sys_column_control` VALUES ('126', 'employee.hrmEmployeeName', '发起人', '2', '投票列表', '2', '2', '0', '2');
INSERT INTO `sys_column_control` VALUES ('127', 'votetypeLib.libraryInfoName', '投票类型', '1', '投票列表', '2', '2', '0', '3');
INSERT INTO `sys_column_control` VALUES ('128', 'oaChooseType', '选项类型', '1', '投票列表', '2', '1', '0', '4');
INSERT INTO `sys_column_control` VALUES ('129', 'oaVoteStart', '开始时间', '1', '投票列表', '2', '1', '0', '5');
INSERT INTO `sys_column_control` VALUES ('130', 'oaVoteEnd', '结束时间', '1', '投票列表', '2', '1', '0', '6');
INSERT INTO `sys_column_control` VALUES ('131', 'oaIsAnonymous', '是否匿名投票', '1', '投票列表', '2', '1', '0', '7');
INSERT INTO `sys_column_control` VALUES ('132', 'oaVoteStatus', '投票状态', '1', '投票列表', '2', '1', '0', '8');
INSERT INTO `sys_column_control` VALUES ('139', 'oaForumAdmin', '版主', '1', '论坛版块列表', '2', '2', '0', '5');
INSERT INTO `sys_column_control` VALUES ('140', 'oaPostName', '帖子名称', '1', '帖子列表', '1', '1', '15', '2');
INSERT INTO `sys_column_control` VALUES ('141', 'oaPostTime', '发帖时间', '1', '帖子列表', '2', '1', '0', '3');
INSERT INTO `sys_column_control` VALUES ('142', 'oaReadCount', '点击数', '1', '帖子列表', '2', '2', '0', '4');
INSERT INTO `sys_column_control` VALUES ('143', 'oaPostLastregter', '最后回复', '1', '帖子列表', '2', '2', '0', '5');
INSERT INTO `sys_column_control` VALUES ('144', 'forums.oaForumName', '所属版块', '1', '帖子列表', '2', '2', '0', '6');
INSERT INTO `sys_column_control` VALUES ('145', 'oaBooktypeName', '图书类型名称', '1', '图书类型', '1', '2', '15', '1');
INSERT INTO `sys_column_control` VALUES ('146', 'oaBooktypeRemark', '图书类型说明', '1', '图书类型', '2', '2', '30', '2');
INSERT INTO `sys_column_control` VALUES ('147', 'oaBookCode', '图书编号', '1', '图书列表', '1', '1', '10', '1');
INSERT INTO `sys_column_control` VALUES ('148', 'oaBookName', '图书名称', '1', '图书列表', '1', '1', '10', '2');
INSERT INTO `sys_column_control` VALUES ('149', 'department.hrmDepName', '所属部门', '1', '图书列表', '2', '2', '0', '3');
INSERT INTO `sys_column_control` VALUES ('150', 'oaBookAuthor', '作者', '1', '图书列表', '1', '1', '0', '4');
INSERT INTO `sys_column_control` VALUES ('151', 'oaBookConcern', '出版社', '1', '图书列表', '1', '1', '10', '5');
INSERT INTO `sys_column_control` VALUES ('152', 'bookType.oaBooktypeName', '图书类型', '1', '图书列表', '2', '2', '0', '6');
INSERT INTO `sys_column_control` VALUES ('153', 'oaBookAddress', '存放位置', '1', '图书列表', '1', '1', '10', '7');
INSERT INTO `sys_column_control` VALUES ('154', 'oaBookCount', '总数量', '1', '图书列表', '2', '2', '0', '8');
INSERT INTO `sys_column_control` VALUES ('155', 'oaBookRemain', '剩余数量', '1', '图书列表', '2', '2', '0', '9');
INSERT INTO `sys_column_control` VALUES ('156', 'employee.hrmEmployeeName', '登记人', '1', '图书列表', '1', '1', '0', '10');
INSERT INTO `sys_column_control` VALUES ('157', 'companyInfoName', '公司名称', '1', '公司信息', '1', '1', '20', '1');
INSERT INTO `sys_column_control` VALUES ('158', 'companyInfoShortname', '简称', '1', '公司信息', '1', '1', '20', '2');
INSERT INTO `sys_column_control` VALUES ('159', 'companyInfoEmployee', '联系人', '1', '公司信息', '1', '1', '20', '3');
INSERT INTO `sys_column_control` VALUES ('160', 'companyInfoPhone', '联系电话', '1', '公司信息', '2', '2', '20', '4');
INSERT INTO `sys_column_control` VALUES ('161', 'companyInfoCode', '公司编码', '1', '公司信息', '1', '1', '0', '5');
INSERT INTO `sys_column_control` VALUES ('162', 'companyInfoSdate', '有效期开始', '1', '公司信息', '2', '1', '0', '6');
INSERT INTO `sys_column_control` VALUES ('163', 'companyInfoEdate', '有效期结束', '1', '公司信息', '2', '1', '0', '7');
INSERT INTO `sys_column_control` VALUES ('164', 'companyInfoRegDate', '注册日期', '1', '公司信息', '2', '1', '0', '8');
INSERT INTO `sys_column_control` VALUES ('165', 'companyInfoType', '类型', '1', '公司信息', '2', '1', '0', '9');
INSERT INTO `sys_column_control` VALUES ('166', 'bookInfo.oaBookName', '图书名称', '1', '图书借阅列表', '1', '1', '15', '1');
INSERT INTO `sys_column_control` VALUES ('167', 'lendnEmp.hrmEmployeeName', '借书人(内部)', '1', '图书借阅列表', '2', '2', '0', '2');
INSERT INTO `sys_column_control` VALUES ('168', 'oaBrLendw', '借书人(外部)', '1', '图书借阅列表', '2', '2', '0', '3');
INSERT INTO `sys_column_control` VALUES ('169', 'oaBrBdate', '借书日期', '1', '图书借阅列表', '2', '1', '0', '4');
INSERT INTO `sys_column_control` VALUES ('170', 'oaBrRdate', '还书日期', '1', '图书借阅列表', '2', '1', '0', '5');
INSERT INTO `sys_column_control` VALUES ('171', 'oaBrCount', '数量', '1', '图书借阅列表', '2', '2', '0', '6');
INSERT INTO `sys_column_control` VALUES ('172', 'oaBrStatus', '图书状态', '1', '图书借阅列表', '2', '2', '0', '7');
INSERT INTO `sys_column_control` VALUES ('173', 'msgTitle', '系统公告标题', '1', '系统公告', '1', '1', '30', '1');
INSERT INTO `sys_column_control` VALUES ('174', 'msgDate', '发布日期', '1', '系统公告', '2', '1', '0', '2');
INSERT INTO `sys_column_control` VALUES ('175', 'msgVsdate', '有效开始时间', '2', '系统公告', '2', '2', '0', '3');
INSERT INTO `sys_column_control` VALUES ('176', 'msgVedate', '有效结束时间', '2', '系统公告', '2', '2', '0', '4');
INSERT INTO `sys_column_control` VALUES ('177', 'msgIsEffective', '公告状态', '1', '系统公告', '2', '2', '0', '5');
INSERT INTO `sys_column_control` VALUES ('178', 'helpTitle', '帮助标题', '1', '系统帮助', '1', '1', '30', '1');
INSERT INTO `sys_column_control` VALUES ('179', 'helpKeyword', '关键字', '1', '系统帮助', '1', '1', '20', '2');
INSERT INTO `sys_column_control` VALUES ('180', 'paramIndex', '参数标识', '1', '运行参数', '1', '1', '0', '1');
INSERT INTO `sys_column_control` VALUES ('181', 'paramTitle', '名称', '1', '运行参数', '1', '1', '0', '2');
INSERT INTO `sys_column_control` VALUES ('182', 'paramValue', '参数值', '1', '运行参数', '2', '2', '0', '3');
INSERT INTO `sys_column_control` VALUES ('183', 'paramRemark', '参数说明', '1', '运行参数', '2', '2', '30', '4');
INSERT INTO `sys_column_control` VALUES ('184', 'paramType', '参数类型', '1', '运行参数', '2', '1', '0', '5');
INSERT INTO `sys_column_control` VALUES ('185', 'hrmEmployee.hrmEmployeeName', '操作人员', '1', '操作日志', '1', '1', '0', '1');
INSERT INTO `sys_column_control` VALUES ('186', 'logDate', '操作时间', '1', '操作日志', '2', '1', '0', '2');
INSERT INTO `sys_column_control` VALUES ('187', 'requestAddr', '访问地址', '1', '操作日志', '2', '2', '0', '3');
INSERT INTO `sys_column_control` VALUES ('188', 'logDetail', '执行操作', '1', '操作日志', '2', '2', '0', '4');
INSERT INTO `sys_column_control` VALUES ('195', 'userInfo.userName', '用户名称', '1', '异常管理', '1', '1', '0', '1');
INSERT INTO `sys_column_control` VALUES ('196', 'companyInfo.companyInfoCode', '公司代码', '1', '异常管理', '1', '1', '80', '2');
INSERT INTO `sys_column_control` VALUES ('197', 'exceptionClass', '异常类型', '1', '异常管理', '1', '1', '30', '3');
INSERT INTO `sys_column_control` VALUES ('198', 'exceptionMsg', '异常消息', '1', '异常管理', '1', '1', '30', '4');
INSERT INTO `sys_column_control` VALUES ('199', 'exceptionDate', '异常日期', '1', '异常管理', '2', '1', '0', '5');
INSERT INTO `sys_column_control` VALUES ('200', 'exceptionStatus', '异常状态', '1', '异常管理', '2', '1', '0', '6');
INSERT INTO `sys_column_control` VALUES ('201', 'oaPostForum', '所属版块', '1', '帖子列表', '2', '1', '0', '7');
INSERT INTO `sys_column_control` VALUES ('202', 'oaVoteType', '投票类型', '2', '投票列表', '2', '1', '0', '9');
INSERT INTO `sys_column_control` VALUES ('203', 'methodId', '项目编码', '1', '系统配置', '2', '2', '0', '1');
INSERT INTO `sys_column_control` VALUES ('204', 'methodInfoName', '项目名称', '1', '系统配置', '2', '2', '0', '2');
INSERT INTO `sys_column_control` VALUES ('205', 'projectEgName', '首页英文名称', '1', '系统配置', '2', '2', '0', '3');
INSERT INTO `sys_column_control` VALUES ('206', 'projectView', '默认载入视图', '1', '系统配置', '2', '2', '0', '4');
INSERT INTO `sys_column_control` VALUES ('207', 'projectName', '首页名称', '1', '系统配置', '2', '2', '0', '5');
INSERT INTO `sys_column_control` VALUES ('208', 'oaNewsType', '新闻类型', '2', '新闻列表', '2', '1', '0', '1');
INSERT INTO `sys_column_control` VALUES ('209', 'oaAnnoType', '公告类型', '2', '公告列表', '2', '1', '0', '1');
INSERT INTO `sys_column_control` VALUES ('211', 'methodInfo.methodInfoName', '所属模块', '1', '系统帮助', '2', '2', '0', '3');
INSERT INTO `sys_column_control` VALUES ('214', 'methodCode', '所属模块', '2', '系统帮助', '2', '1', '0', '4');
INSERT INTO `sys_column_control` VALUES ('216', 'findSign', '检索标识', '1', '系统帮助', '2', '1', '0', '5');
INSERT INTO `sys_column_control` VALUES ('217', 'oaNotebookContext', '便签内容', '1', '个人便签', '1', '1', '30', '2');
INSERT INTO `sys_column_control` VALUES ('218', 'oaNotebookCreattime', '便签记录时间', '1', '个人便签', '2', '1', '20', '1');
INSERT INTO `sys_column_control` VALUES ('219', 'oaBookType', '图书类型', '2', '图书列表', '2', '1', '0', '11');
INSERT INTO `sys_column_control` VALUES ('220', 'oaBookDep', '所属部门', '2', '图书列表', '2', '1', '0', '12');
INSERT INTO `sys_column_control` VALUES ('221', 'timedType', '提醒类型', '1', '定时提醒列表', '2', '2', '0', '1');
INSERT INTO `sys_column_control` VALUES ('222', 'timedDate', '提醒时间', '1', '定时提醒列表', '2', '2', '0', '2');
INSERT INTO `sys_column_control` VALUES ('223', 'timedDescription', '提醒内容', '1', '定时提醒列表', '1', '2', '30', '3');
INSERT INTO `sys_column_control` VALUES ('224', 'primaryKey', '提醒ID', '2', '定时提醒列表', '2', '2', '0', '4');
INSERT INTO `sys_column_control` VALUES ('225', 'oaChatEmp', '姓名', '1', '通讯手册', '1', '1', '0', '1');
INSERT INTO `sys_column_control` VALUES ('226', 'oaChatSex', '性别', '1', '通讯手册', '2', '1', '0', '2');
INSERT INTO `sys_column_control` VALUES ('227', 'oaChatGroups.oaChatgpName', '所属分组', '1', '通讯手册', '2', '2', '0', '3');
INSERT INTO `sys_column_control` VALUES ('228', 'oaChatGroup', '所属分组', '2', '通讯手册', '2', '1', '0', '4');
INSERT INTO `sys_column_control` VALUES ('229', 'oaChatCom', '单位', '1', '通讯手册', '2', '2', '10', '5');
INSERT INTO `sys_column_control` VALUES ('230', 'oaHomeTel', '家庭电话', '1', '通讯手册', '2', '2', '0', '6');
INSERT INTO `sys_column_control` VALUES ('231', 'oaChatMobile', '移动电话', '1', '通讯手册', '2', '2', '0', '7');
INSERT INTO `sys_column_control` VALUES ('232', 'oaWorkTel', '工作电话', '1', '通讯手册', '2', '2', '0', '8');
INSERT INTO `sys_column_control` VALUES ('233', 'oaIsShare', '是否共享', '1', '通讯手册', '2', '1', '0', '9');
INSERT INTO `sys_column_control` VALUES ('234', 'isOnLine', '', '1', '在线人员', '2', '2', '0', '1');
INSERT INTO `sys_column_control` VALUES ('235', 'employeeCode', '工号', '1', '在线人员', '2', '2', '0', '2');
INSERT INTO `sys_column_control` VALUES ('236', 'employeeName', '姓名', '1', '在线人员', '2', '2', '0', '3');
INSERT INTO `sys_column_control` VALUES ('237', 'employeeDeptName', '部门', '1', '在线人员', '2', '2', '0', '4');
INSERT INTO `sys_column_control` VALUES ('238', 'employeeSex', '性别', '1', '在线人员', '2', '2', '0', '5');
INSERT INTO `sys_company_info` VALUES ('1', '江苏省', '无锡市', '宜兴市', '品互网络', '品互网络', '江苏省宜兴市兴业路298号', '214200', '费林吉良', '总经理', 'service@pinhuba.com', '0510-80322888,0510-80322666', '0510-80322888', '2', '4', 'PINHUBA', '2010-01-01', '2199-01-01', '0', '0', null, '06  2 2010  1:37PM', '06  2 2010  1:37PM', '-1', null, null);
INSERT INTO `sys_company_info` VALUES ('18', '江苏省', '南京市', '浦口区', '南京百敖软件股份有限公司', '百敖软件', '南京市浦口高新区星火路9号软件大厦B座10F/9F', '210061', '周海萍', 'HR', 'service@bysoft.com.cn', '13972638743', '025-80808080', '2', '3', 'BIOS', '2013-05-21', '2016-05-21', '100', '10', '', '2013-05-21 15:21:18', '2015-04-22 08:15:47', '78', 'BAMS 品互网络基础应用开发框架', '');
INSERT INTO `sys_company_methods` VALUES ('6', '01', '18');
INSERT INTO `sys_company_methods` VALUES ('7', '02', '18');
INSERT INTO `sys_company_methods` VALUES ('8', '03', '18');
INSERT INTO `sys_config` VALUES ('1', '00', 'BAMS', '', '/erp/center.jsp');
INSERT INTO `sys_config` VALUES ('2', '02', '', '', '/hrm/center.jsp');
INSERT INTO `sys_config` VALUES ('3', '03', '', '', '');
INSERT INTO `sys_config` VALUES ('4', '04', '', '', '');
INSERT INTO `sys_config` VALUES ('5', '06', '', '', '');
INSERT INTO `sys_image_info` VALUES ('11', 'QzovQmFtc0Rvd25sb2Fkcy9pbWFnZS9jb21wMTgvcGVyc29uNTIvMl8yMDEzMDkyMDIyNTE1NDk3OS5qcGc@3', null, '2.jpg', null, null, null, '182013052121033133083', '2013-09-20 22:51:58', '182013052121033133083', '2013-09-20 22:51:58', '18');
INSERT INTO `sys_image_info` VALUES ('12', 'QzovQmFtc0Rvd25sb2Fkcy9pbWFnZS9jb21wMTgvcGVyc29uNTIvM18yMDEzMDkyMDIyNTE1NTAwOC5qcGc@3', null, '3.jpg', null, null, null, '182013052121033133083', '2013-09-20 22:51:58', '182013052121033133083', '2013-09-20 22:51:58', '18');
INSERT INTO `sys_image_info` VALUES ('13', 'QzovQmFtc0Rvd25sb2Fkcy9pbWFnZS9jb21wMTgvcGVyc29uNTQvMTBfMjAxMzA5MjAyMjUyNTIyNTMuanBn', null, '10.jpg', null, null, null, '182013072730085454643', '2013-09-20 22:52:53', '182013072730085454643', '2013-09-20 22:52:53', '18');
INSERT INTO `sys_image_info` VALUES ('14', 'QzovQmFtc0Rvd25sb2Fkcy9pbWFnZS9jb21wMTgvcGVyc29uNTQvMTJfMjAxMzA5MjAyMjUyNTIyNjMuanBn', null, '12.jpg', null, null, null, '182013072730085454643', '2013-09-20 22:52:53', '182013072730085454643', '2013-09-20 22:52:53', '18');
INSERT INTO `sys_image_info` VALUES ('15', 'QzovQmFtc0Rvd25sb2Fkcy9pbWFnZS9jb21wMTgvcGVyc29uNTQvMTFfMjAxMzA5MjAyMjUyNTIyNTYuanBn', null, '11.jpg', null, null, null, '182013072730085454643', '2013-09-20 22:52:53', '182013072730085454643', '2013-09-20 22:52:53', '18');
INSERT INTO `sys_image_info` VALUES ('16', 'QzovQmFtc0Rvd25sb2Fkcy9pbWFnZS9jb21wMTgvcGVyc29uNTQvOV8yMDEzMDkyMDIyNTI1MjI0Mi5qcGc@3', null, '9.jpg', null, null, null, '182013072730085454643', '2013-09-20 22:52:53', '182013072730085454643', '2013-09-20 22:52:53', '18');
INSERT INTO `sys_image_info` VALUES ('17', 'QzovQmFtc0Rvd25sb2Fkcy9pbWFnZS9wb3dlZF8yMDE0MDEyMzE2NTg1OTU4NS5qcGc@3', null, 'powed.jpg', null, null, null, '182013052121033133083', '2014-01-23 16:59:01', '182013052121033133083', '2014-01-23 16:59:01', '18');
INSERT INTO `sys_image_info` VALUES ('18', 'QzovQmFtc0Rvd25sb2Fkcy9pbWFnZS9sb2dpbl8wMDBfMjAxNDAxMjMyMzIyNDI2MDAucG5n', null, 'login_000.png', null, null, null, '182013072730085454643', '2014-01-23 23:23:05', '182013072730085454643', '2014-01-23 23:23:05', '18');
INSERT INTO `sys_image_info` VALUES ('29', 'QzovQmFtc0Rvd25sb2Fkcy9pbWFnZS9jb21wMTgvcGVyc29uNTQvdW50aXRsZWRfMjAxNDAzMTMyMzE2MDk4MjAuYm1w', null, 'untitled.bmp', 'untitled_20140313231609820.bmp', null, null, '182013072730085454643', '2014-03-13 23:16:11', '182013072730085454643', '2014-03-13 23:16:11', '18');
INSERT INTO `sys_image_info` VALUES ('30', 'QzovQmFtc0Rvd25sb2Fkcy9pbWFnZS9jb21wMTgvcGVyc29uNTQvUVHNvMasMjAxNDAzMTIwODQ2NThfMjAxNDAzMTMyMzE2MDk4MTcuanBn', null, 'QQ图片20140312084658.jpg', 'QQ图片20140312084658_20140313231609817.jpg', null, null, '182013072730085454643', '2014-03-13 23:16:11', '182013072730085454643', '2014-03-13 23:16:11', '18');
INSERT INTO `sys_image_info` VALUES ('31', 'QzovQmFtc0Rvd25sb2Fkcy9pbWFnZS9jb21wMTgvcGVyc29uNTQvdW50aXRsZWRfMjAxNDAzMTMyMzIyNDM2MjQuYm1w', null, 'untitled.bmp', 'untitled_20140313232243624.bmp', null, null, '182013072730085454643', '2014-03-13 23:23:28', '182013072730085454643', '2014-03-13 23:23:28', '18');
INSERT INTO `sys_image_info` VALUES ('47', 'QzovQmFtc0Rvd25sb2Fkcy9pbWFnZS9jb21wMTgvcGVyc29uNTQvdW50aXRsZWRfMjAxNDAzMTQwOTQ0NTAwODkuanBn', null, 'untitled.jpg', 'untitled_20140314094450089.jpg', null, null, '182013072730085454643', '2014-03-14 09:44:52', '182013072730085454643', '2014-03-14 09:44:52', '18');
INSERT INTO `sys_image_info` VALUES ('51', 'QzovQmFtc0Rvd25sb2Fkcy9pbWFnZS9jb21wMTgvcGVyc29uNTIvdW50aXRsZWRfMjAxNDAzMTQxMDM1NTU3NjguanBn', 'C:/BamsDownloads/image/comp18/person52/untitled_20140314103555768.jpg', 'untitled.jpg', 'untitled_20140314103555768.jpg', null, null, '182013052121033133083', '2014-03-14 10:35:58', '182013052121033133083', '2014-03-14 10:35:58', '18');
INSERT INTO `sys_image_info` VALUES ('55', 'QzovQmFtc0Rvd25sb2Fkcy9pbWFnZS9jb21wMTgvcGVyc29uNTIvZmUwZTk4NmU5NTdjMTIxZl8yMDE0MDMyOTE1MzMyNjg3MC5qcGc@3', 'C:/BamsDownloads/image/comp18/person52/fe0e986e957c121f_20140329153326870.jpg', 'fe0e986e957c121f.jpg', 'fe0e986e957c121f_20140329153326870.jpg', null, null, '182013052121033133083', '2014-03-29 15:33:51', '182013052121033133083', '2014-03-29 15:33:51', '18');
INSERT INTO `sys_image_info` VALUES ('57', 'QzovQmFtc0Rvd25sb2Fkcy9pbWFnZS9jb21wMTgvcGVyc29uNTIvdW50aXRsZWRfMjAxNDAzMTQwOTQ1NTM1NTYuanBn', 'C:/BamsDownloads/image/comp18/person52/untitled_20140314094553556.jpg', 'untitled.jpg', '', null, null, '182013072931083905862', '2014-05-24 00:31:46', '182013072931083905862', '2014-05-24 00:31:46', '18');
INSERT INTO `sys_image_info` VALUES ('59', 'QzovQmFtc0Rvd25sb2Fkcy9pbWFnZS90aWUwMDJfMjAxNDAxMjYxMDM5MjkyODAuZ2lm', null, 'tie002.gif', null, null, null, '182013052121033133083', '2014-05-25 07:58:09', '182013052121033133083', '2014-05-25 07:58:09', '18');
INSERT INTO `sys_image_info` VALUES ('61', 'QzovQmFtc0Rvd25sb2Fkcy9pbWFnZS9jb21wMTgvcGVyc29uNTIvUVHNvMasMjAxNDA3MDExNDI5MTVfMjAxNDA3MDExNDI5MjA0MjMuanBn', 'C:/BamsDownloads/image/comp18/person52/QQ图片20140701142915_20140701142920423.jpg', 'QQ图片20140701142915.jpg', 'QQ图片20140701142915_20140701142920423.jpg', null, null, '182013052121033133083', '2014-07-01 14:29:22', '182013052121033133083', '2014-07-01 14:29:22', '18');
INSERT INTO `sys_image_info` VALUES ('62', 'QzovQmFtc0Rvd25sb2Fkcy9pbWFnZS9jb21wMTgvcGVyc29uNTIvMV8yMDE0MDcwNDEzMTQwMjQ4Ny5wbmc@3', 'C:/BamsDownloads/image/comp18/person52/1_20140704131402487.png', '1.png', '1_20140704131402487.png', null, null, '182013052121033133083', '2014-07-04 13:14:04', '182013052121033133083', '2014-07-04 13:14:04', '18');
INSERT INTO `sys_image_info` VALUES ('63', 'QzovQmFtc0Rvd25sb2Fkcy9pbWFnZS9jb21wMTgvcGVyc29uNTIvMl8yMDE0MDcwNDEzMTQwMjUxMy5wbmc@3', 'C:/BamsDownloads/image/comp18/person52/2_20140704131402513.png', '2.png', '2_20140704131402513.png', null, null, '182013052121033133083', '2014-07-04 13:14:04', '182013052121033133083', '2014-07-04 13:14:04', '18');
INSERT INTO `sys_image_info` VALUES ('64', 'QzovQmFtc0Rvd25sb2Fkcy9pbWFnZS9jb21wMTgvcGVyc29uNTIvNF8yMDE0MDcwNDEzMTQwMjUxNi5wbmc@3', 'C:/BamsDownloads/image/comp18/person52/4_20140704131402516.png', '4.png', '4_20140704131402516.png', null, null, '182013052121033133083', '2014-07-04 13:14:04', '182013052121033133083', '2014-07-04 13:14:04', '18');
INSERT INTO `sys_image_info` VALUES ('67', 'QzovQmFtc0Rvd25sb2Fkcy9pbWFnZS9jb21wMTgvcGVyc29uNTIvbG9nbzFfMjAxNDA3MTkxMDE1MTQ0NDkucG5n', 'C:/BamsDownloads/image/comp18/person52/logo1_20140719101514449.png', 'logo1.png', 'logo1_20140719101514449.png', null, null, '182013052121033133083', '2014-07-19 10:15:15', '182013052121033133083', '2014-07-19 10:15:15', '18');
INSERT INTO `sys_image_info` VALUES ('68', 'QzovQmFtc0Rvd25sb2Fkcy9pbWFnZS9jb21wMTgvcGVyc29uNTIvbG9nbzFfMjAxNDA3MTkxMDE1MTQ0NDkucG5n', 'C:/BamsDownloads/image/comp18/person52/logo1_20140719101514449.png', 'logo1.png', 'logo1_20140719101514449.png', null, null, '182013052121033133083', '2014-07-19 10:15:44', '182013052121033133083', '2014-07-19 10:15:44', '18');
INSERT INTO `sys_image_info` VALUES ('69', 'QzovQmFtc0Rvd25sb2Fkcy9pbWFnZS9jb21wMTgvcGVyc29uNTIvUVHNvMasMjAxNDA4MDgxMzI1NTlfMjAxNDA4MjIxNDU1NDA3NjMuanBn', 'C:/BamsDownloads/image/comp18/person52/QQ图片20140808132559_20140822145540763.jpg', 'QQ图片20140808132559.jpg', 'QQ图片20140808132559_20140822145540763.jpg', null, null, '182013052121033133083', '2014-08-22 14:55:42', '182013052121033133083', '2014-08-22 14:55:42', '18');
INSERT INTO `sys_image_info` VALUES ('70', 'QzovQmFtc0Rvd25sb2Fkcy9pbWFnZS9jb21wMTgvcGVyc29uNTIvVTExNDg5UDQzNFQxNTJEMUY1MDE3RFQyMDE0MTIwODA5MTYyNF8yMDE0MTIxMTE0MDQzMzMxMi5qcGc@3', 'C:/BamsDownloads/image/comp18/person52/U11489P434T152D1F5017DT20141208091624_20141211140433312.jpg', 'U11489P434T152D1F5017DT20141208091624.jpg', 'U11489P434T152D1F5017DT20141208091624_20141211140433312.jpg', null, null, '182013052121033133083', '2014-12-11 14:04:34', '182013052121033133083', '2014-12-11 14:04:34', '18');
INSERT INTO `sys_image_info` VALUES ('71', 'QzovQmFtc0Rvd25sb2Fkcy9pbWFnZS9jb21wMTgvcGVyc29uNTIvbG9nbzJfMjAxNTAxMTYwOTI5MDEwODQucG5n', 'C:/BamsDownloads/image/comp18/person52/logo2_20150116092901084.png', 'logo2.png', 'logo2_20150116092901084.png', null, null, '182013052121033133083', '2015-01-16 09:29:02', '182013052121033133083', '2015-01-16 09:29:02', '18');
INSERT INTO `sys_image_info` VALUES ('72', 'QzovQmFtc0Rvd25sb2Fkcy9pbWFnZS9jb21wMTgvcGVyc29uNTIvbG9nbzJfMjAxNTAxMTYwOTI5MDEwODQucG5n', 'C:/BamsDownloads/image/comp18/person52/logo2_20150116092901084.png', 'logo2.png', 'logo2_20150116092901084.png', null, null, '182013052121033133083', '2015-01-16 09:42:27', '182013052121033133083', '2015-01-16 09:42:27', '18');
INSERT INTO `sys_image_info` VALUES ('73', 'QzovQmFtc0Rvd25sb2Fkcy9pbWFnZS9jb21wMTgvcGVyc29uNTIvc3lzbG9naW5fMjAxNTAxMTYxMTE5MDkwNDcucG5n', 'C:/BamsDownloads/image/comp18/person52/syslogin_20150116111909047.png', 'syslogin.png', 'syslogin_20150116111909047.png', null, null, '182013052121033133083', '2015-01-16 11:19:10', '182013052121033133083', '2015-01-16 11:19:10', '18');
INSERT INTO `sys_image_info` VALUES ('74', 'QzovQmFtc0Rvd25sb2Fkcy9pbWFnZS9jb21wMTgvcGVyc29uNTIvc3lzbG9naW5fMjAxNTAxMTYxMTE5MDkwNDcucG5n', 'C:/BamsDownloads/image/comp18/person52/syslogin_20150116111909047.png', 'syslogin.png', 'syslogin_20150116111909047.png', null, null, '182013052121033133083', '2015-01-16 11:24:46', '182013052121033133083', '2015-01-16 11:24:46', '18');
INSERT INTO `sys_image_info` VALUES ('75', 'QzovQmFtc0Rvd25sb2Fkcy9pbWFnZS9jb21wMTgvcGVyc29uNTIvc3lzbG9naW5fMjAxNTAxMTYxMTE5MDkwNDcucG5n', 'C:/BamsDownloads/image/comp18/person52/syslogin_20150116111909047.png', 'syslogin.png', 'syslogin_20150116111909047.png', null, null, '182013052121033133083', '2015-01-16 11:25:01', '182013052121033133083', '2015-01-16 11:25:01', '18');
INSERT INTO `sys_image_info` VALUES ('76', 'QzovQmFtc0Rvd25sb2Fkcy9pbWFnZS9jb21wMTgvcGVyc29uNTIvc3lzbG9naW5fMjAxNTAxMTYxMTE5MDkwNDcucG5n', 'C:/BamsDownloads/image/comp18/person52/syslogin_20150116111909047.png', 'syslogin.png', 'syslogin_20150116111909047.png', null, null, '182013052121033133083', '2015-01-16 12:26:23', '182013052121033133083', '2015-01-16 12:26:23', '18');
INSERT INTO `sys_image_info` VALUES ('77', 'QzovQmFtc0Rvd25sb2Fkcy9pbWFnZS9jb21wMTgvcGVyc29uNTIvbG9naW5fdGl0bGVfMjAxNTAyMDcxMDE3NDAxMDEucG5n', 'C:/BamsDownloads/image/comp18/person52/login_title_20150207101740101.png', 'login_title.png', 'login_title_20150207101740101.png', null, null, '182013052121033133083', '2015-02-07 10:17:41', '182013052121033133083', '2015-02-07 10:17:41', '18');
INSERT INTO `sys_image_info` VALUES ('78', 'QzovQmFtc0Rvd25sb2Fkcy9pbWFnZS9jb21wMTgvcGVyc29uNTIvbG9naW5fdGl0bGVfNTBfMjAxNTAyMDcxMDE4NTU4NjQucG5n', 'C:/BamsDownloads/image/comp18/person52/login_title_50_20150207101855864.png', 'login_title_50.png', 'login_title_50_20150207101855864.png', null, null, '182013052121033133083', '2015-02-07 10:18:58', '182013052121033133083', '2015-02-07 10:18:58', '18');
INSERT INTO `sys_library_info` VALUES ('2141', '01', '用工形式', 'PATTERN', '00', '2', '1', '用于人员用工形式');
INSERT INTO `sys_library_info` VALUES ('2142', '0101', '合同工', '', '01', '1', '1', '');
INSERT INTO `sys_library_info` VALUES ('2143', '0102', '劳务工', '', '01', '1', '1', '');
INSERT INTO `sys_library_info` VALUES ('2144', '02', '婚姻状况', 'MARRIAGE', '00', '2', '1', '人员婚姻状况');
INSERT INTO `sys_library_info` VALUES ('2145', '0201', '未婚', '', '02', '1', '1', '');
INSERT INTO `sys_library_info` VALUES ('2146', '0202', '已婚', '', '02', '1', '1', '');
INSERT INTO `sys_library_info` VALUES ('2147', '03', '计划类型', '', '00', '2', '1', '');
INSERT INTO `sys_library_info` VALUES ('2148', '0301', '工作计划', '', '03', '1', '1', '');
INSERT INTO `sys_library_info` VALUES ('2149', '0302', '项目计划', '', '03', '1', '1', '');
INSERT INTO `sys_library_info` VALUES ('2150', '0303', '经营计划', '', '03', '1', '1', '');
INSERT INTO `sys_library_info` VALUES ('2151', '0304', '生产计划', '', '03', '1', '1', '');
INSERT INTO `sys_library_info` VALUES ('2152', '0305', '销售计划', '', '03', '1', '1', '');
INSERT INTO `sys_library_info` VALUES ('2153', '0306', '采购计划', '', '03', '1', '1', '');
INSERT INTO `sys_library_info` VALUES ('2154', '04', '日志类型', '', '00', '2', '1', '');
INSERT INTO `sys_library_info` VALUES ('2155', '0401', '工作日志', '', '04', '1', '1', '');
INSERT INTO `sys_library_info` VALUES ('2156', '0402', '个人日志', '', '04', '1', '1', '');
INSERT INTO `sys_library_info` VALUES ('2157', '05', '新闻类型', '', '00', '2', '1', '描述新闻的类型');
INSERT INTO `sys_library_info` VALUES ('2158', '0501', '公司', '', '05', '1', '1', '公司的所发生的事情。');
INSERT INTO `sys_library_info` VALUES ('2159', '0502', '娱乐', '', '05', '1', '1', '');
INSERT INTO `sys_library_info` VALUES ('2160', '0503', '生活', '', '05', '1', '1', '');
INSERT INTO `sys_library_info` VALUES ('2161', '0504', '其他', '', '05', '1', '1', '');
INSERT INTO `sys_library_info` VALUES ('2162', '06', '公告类型', '', '00', '2', '1', '公告类型。');
INSERT INTO `sys_library_info` VALUES ('2163', '0601', '奖励', '', '06', '1', '1', '公告所属类型：奖励。');
INSERT INTO `sys_library_info` VALUES ('2164', '0602', '惩罚', '', '06', '1', '1', '');
INSERT INTO `sys_library_info` VALUES ('2165', '0603', '规章制度', '', '06', '1', '1', '规章制度。。。');
INSERT INTO `sys_library_info` VALUES ('2166', '0604', '其他', '', '06', '1', '1', '不属于前面的公告类型。');
INSERT INTO `sys_library_info` VALUES ('2167', '09', '相册类型', '', '00', '2', '1', '公司资源-公司相册');
INSERT INTO `sys_library_info` VALUES ('2168', '0901', '人物相册', '', '09', '1', '1', '');
INSERT INTO `sys_library_info` VALUES ('2169', '0902', '风景相册', '', '09', '1', '1', '');
INSERT INTO `sys_library_info` VALUES ('2170', '0903', '公司照片', '', '09', '1', '1', '');
INSERT INTO `sys_library_info` VALUES ('2171', '0904', '其他', '', '09', '1', '1', '');
INSERT INTO `sys_library_info` VALUES ('2172', '0905', '电脑相册', '', '09', '1', '1', '');
INSERT INTO `sys_library_info` VALUES ('2173', '10', '日程类型', '', '00', '2', '1', '');
INSERT INTO `sys_library_info` VALUES ('2174', '1001', '工作日程', '', '10', '1', '1', '');
INSERT INTO `sys_library_info` VALUES ('2175', '1002', '个人日程', '', '10', '1', '1', '');
INSERT INTO `sys_library_info` VALUES ('2176', '11', '规章制度类型', '', '00', '2', '1', '');
INSERT INTO `sys_library_info` VALUES ('2177', '1101', '公司规章', '', '11', '1', '1', '');
INSERT INTO `sys_library_info` VALUES ('2178', '1102', '部门规章', '', '11', '1', '1', '');
INSERT INTO `sys_library_info` VALUES ('2179', '12', '会议类型', '', '00', '2', '1', '');
INSERT INTO `sys_library_info` VALUES ('2180', '1201', '全体员工会议', '', '12', '1', '1', '');
INSERT INTO `sys_library_info` VALUES ('2181', '1202', '部门会议', '', '12', '1', '1', '');
INSERT INTO `sys_library_info` VALUES ('2182', '13', '车辆类型', '', '00', '2', '1', '');
INSERT INTO `sys_library_info` VALUES ('2183', '1301', '轿车', '', '13', '1', '1', '');
INSERT INTO `sys_library_info` VALUES ('2184', '1302', '货车', '', '13', '1', '1', '');
INSERT INTO `sys_library_info` VALUES ('2185', '15', '用品类别', '', '00', '2', '1', '');
INSERT INTO `sys_library_info` VALUES ('2186', '1501', '纸笔类', '', '15', '1', '1', '');
INSERT INTO `sys_library_info` VALUES ('2187', '1502', '工具类', '', '15', '1', '1', '');
INSERT INTO `sys_library_info` VALUES ('2188', '16', '维护类型', '', '00', '2', '1', '');
INSERT INTO `sys_library_info` VALUES ('2189', '1601', '日常保养', '', '16', '1', '1', '');
INSERT INTO `sys_library_info` VALUES ('2190', '1602', '更换配件', '', '16', '1', '1', '');
INSERT INTO `sys_library_info` VALUES ('2191', '17', '工作地区', '', '00', '2', '1', '');
INSERT INTO `sys_library_info` VALUES ('2192', '1701', '北京', '', '17', '1', '1', '');
INSERT INTO `sys_library_info` VALUES ('2193', '1702', '上海', '', '17', '1', '1', '');
INSERT INTO `sys_library_info` VALUES ('2194', '1703', '南京', '', '17', '1', '1', '');
INSERT INTO `sys_library_info` VALUES ('2195', '1704', '广州', '', '17', '1', '1', '');
INSERT INTO `sys_library_info` VALUES ('2196', '18', '政治面貌', '', '00', '2', '1', '');
INSERT INTO `sys_library_info` VALUES ('2197', '1801', '群众', '', '18', '1', '1', '');
INSERT INTO `sys_library_info` VALUES ('2198', '1802', '团员', '', '18', '1', '1', '');
INSERT INTO `sys_library_info` VALUES ('2199', '1803', '预备党员', '', '18', '1', '1', '');
INSERT INTO `sys_library_info` VALUES ('2200', '1804', '党员', '', '18', '1', '1', '');
INSERT INTO `sys_library_info` VALUES ('2201', '19', '血型', '', '00', '2', '1', '');
INSERT INTO `sys_library_info` VALUES ('2202', '1901', 'A 型', '', '19', '1', '1', '');
INSERT INTO `sys_library_info` VALUES ('2203', '1902', 'B 型', '', '19', '1', '1', '');
INSERT INTO `sys_library_info` VALUES ('2204', '1903', 'AB 型', '', '19', '1', '1', '');
INSERT INTO `sys_library_info` VALUES ('2205', '1904', 'O 型', '', '19', '1', '1', '');
INSERT INTO `sys_library_info` VALUES ('2206', '1905', 'HR型', '', '19', '1', '1', '');
INSERT INTO `sys_library_info` VALUES ('2207', '20', '民族', '', '00', '2', '1', '');
INSERT INTO `sys_library_info` VALUES ('2208', '2001', '汉族', '', '20', '2', '1', '');
INSERT INTO `sys_library_info` VALUES ('2209', '2002', '回族', '', '20', '2', '1', '');
INSERT INTO `sys_library_info` VALUES ('2210', '2003', '畲族', '', '20', '2', '1', '');
INSERT INTO `sys_library_info` VALUES ('2211', '2004', '塔塔尔族', '', '20', '2', '1', '');
INSERT INTO `sys_library_info` VALUES ('2212', '2005', '阿昌族', '', '20', '2', '1', '');
INSERT INTO `sys_library_info` VALUES ('2213', '2006', '哈萨克族', '', '20', '2', '1', '');
INSERT INTO `sys_library_info` VALUES ('2214', '2007', '土家族', '', '20', '2', '1', '');
INSERT INTO `sys_library_info` VALUES ('2215', '2008', '景颇族', '', '20', '2', '1', '');
INSERT INTO `sys_library_info` VALUES ('2216', '2009', '哈尼族', '', '20', '2', '1', '');
INSERT INTO `sys_library_info` VALUES ('2217', '2010', '土族', '', '20', '2', '1', '');
INSERT INTO `sys_library_info` VALUES ('2218', '2011', '白族', '', '20', '2', '1', '');
INSERT INTO `sys_library_info` VALUES ('2219', '2012', '维吾尔族', '', '20', '2', '1', '');
INSERT INTO `sys_library_info` VALUES ('2220', '2013', '保安族', '', '20', '2', '1', '');
INSERT INTO `sys_library_info` VALUES ('2221', '2014', '赫哲族', '', '20', '2', '1', '');
INSERT INTO `sys_library_info` VALUES ('2222', '2015', '乌孜别克族', '', '20', '2', '1', '');
INSERT INTO `sys_library_info` VALUES ('2223', '2016', '基诺族', '', '20', '2', '1', '');
INSERT INTO `sys_library_info` VALUES ('2224', '2017', '布依族', '', '20', '2', '1', '');
INSERT INTO `sys_library_info` VALUES ('2225', '2018', '拉祜族', '', '20', '2', '1', '');
INSERT INTO `sys_library_info` VALUES ('2226', '2019', '锡伯族', '', '20', '2', '1', '');
INSERT INTO `sys_library_info` VALUES ('2227', '2020', '黎族', '', '20', '2', '1', '');
INSERT INTO `sys_library_info` VALUES ('2228', '2021', '东乡族', '', '20', '2', '1', '');
INSERT INTO `sys_library_info` VALUES ('2229', '2022', '蒙古族', '', '20', '2', '1', '');
INSERT INTO `sys_library_info` VALUES ('2230', '2023', '仫佬族', '', '20', '2', '1', '');
INSERT INTO `sys_library_info` VALUES ('2231', '2024', '达斡尔族', '', '20', '2', '1', '');
INSERT INTO `sys_library_info` VALUES ('2232', '2025', '藏族', '', '20', '2', '1', '');
INSERT INTO `sys_library_info` VALUES ('2233', '2026', '毛南族', '', '20', '2', '1', '');
INSERT INTO `sys_library_info` VALUES ('2234', '2027', '裕固族', '', '20', '2', '1', '');
INSERT INTO `sys_library_info` VALUES ('2235', '2028', '俄罗斯族', '', '20', '2', '1', '');
INSERT INTO `sys_library_info` VALUES ('2236', '2029', '德昂族', '', '20', '2', '1', '');
INSERT INTO `sys_library_info` VALUES ('2237', '2030', '僳僳族', '', '20', '2', '1', '');
INSERT INTO `sys_library_info` VALUES ('2238', '2031', '瑶族', '', '20', '2', '1', '');
INSERT INTO `sys_library_info` VALUES ('2239', '2032', '朝鲜族', '', '20', '2', '1', '');
INSERT INTO `sys_library_info` VALUES ('2240', '2033', '布朗族', '', '20', '2', '1', '');
INSERT INTO `sys_library_info` VALUES ('2241', '2034', '满族', '', '20', '2', '1', '');
INSERT INTO `sys_library_info` VALUES ('2242', '2035', '彝族', '', '20', '2', '1', '');
INSERT INTO `sys_library_info` VALUES ('2243', '2036', '门巴族', '', '20', '2', '1', '');
INSERT INTO `sys_library_info` VALUES ('2244', '2037', '侗族', '', '20', '2', '1', '');
INSERT INTO `sys_library_info` VALUES ('2245', '2038', '苗族', '', '20', '2', '1', '');
INSERT INTO `sys_library_info` VALUES ('2246', '2039', '佤族', '', '20', '2', '1', '');
INSERT INTO `sys_library_info` VALUES ('2247', '2040', '羌族', '', '20', '2', '1', '');
INSERT INTO `sys_library_info` VALUES ('2248', '2041', '独龙族', '', '20', '2', '1', '');
INSERT INTO `sys_library_info` VALUES ('2249', '2042', '怒族', '', '20', '2', '1', '');
INSERT INTO `sys_library_info` VALUES ('2250', '2043', '珞巴族', '', '20', '2', '1', '');
INSERT INTO `sys_library_info` VALUES ('2251', '2044', '普米族', '', '20', '2', '1', '');
INSERT INTO `sys_library_info` VALUES ('2252', '2045', '傣族', '', '20', '2', '1', '');
INSERT INTO `sys_library_info` VALUES ('2253', '2046', '纳西族', '', '20', '2', '1', '');
INSERT INTO `sys_library_info` VALUES ('2254', '2047', '高山族', '', '20', '2', '1', '');
INSERT INTO `sys_library_info` VALUES ('2255', '2048', '壮族', '', '20', '2', '1', '');
INSERT INTO `sys_library_info` VALUES ('2256', '2049', '额伦春族', '', '20', '2', '1', '');
INSERT INTO `sys_library_info` VALUES ('2257', '2050', '塔吉克族', '', '20', '2', '1', '');
INSERT INTO `sys_library_info` VALUES ('2258', '2051', '京族', '', '20', '2', '1', '');
INSERT INTO `sys_library_info` VALUES ('2259', '2052', '仡佬族', '', '20', '2', '1', '');
INSERT INTO `sys_library_info` VALUES ('2260', '2053', '鄂温克族', '', '20', '2', '1', '');
INSERT INTO `sys_library_info` VALUES ('2261', '2054', '撒拉族', '', '20', '2', '1', '');
INSERT INTO `sys_library_info` VALUES ('2262', '2055', '柯尔克孜族', '', '20', '2', '1', '');
INSERT INTO `sys_library_info` VALUES ('2263', '2056', '水族', '', '20', '2', '1', '');
INSERT INTO `sys_library_info` VALUES ('2264', '21', '学历', '', '00', '2', '1', '');
INSERT INTO `sys_library_info` VALUES ('2265', '2101', '小学', '', '21', '1', '1', '');
INSERT INTO `sys_library_info` VALUES ('2266', '2102', '初中', '', '21', '1', '1', '');
INSERT INTO `sys_library_info` VALUES ('2267', '2103', '高中', '', '21', '1', '1', '');
INSERT INTO `sys_library_info` VALUES ('2268', '2104', '中专', '', '21', '1', '1', '');
INSERT INTO `sys_library_info` VALUES ('2269', '2105', '大专', '', '21', '1', '1', '');
INSERT INTO `sys_library_info` VALUES ('2270', '2106', '本科', '', '21', '1', '1', '');
INSERT INTO `sys_library_info` VALUES ('2271', '2107', '硕士', '', '21', '1', '1', '');
INSERT INTO `sys_library_info` VALUES ('2272', '2108', '博士', '', '21', '1', '1', '');
INSERT INTO `sys_library_info` VALUES ('2273', '2109', '博士后', '', '21', '1', '1', '');
INSERT INTO `sys_library_info` VALUES ('2274', '22', '投票类型', '', '00', '2', '1', '表示投票的类型！');
INSERT INTO `sys_library_info` VALUES ('2275', '2201', '考核', '', '22', '1', '1', '');
INSERT INTO `sys_library_info` VALUES ('2276', '2202', '调查', '', '22', '1', '1', '');
INSERT INTO `sys_library_info` VALUES ('2277', '2203', '娱乐', '', '22', '1', '1', '');
INSERT INTO `sys_library_info` VALUES ('2278', '2204', '其他', '', '22', '1', '1', '');
INSERT INTO `sys_library_info` VALUES ('2279', '23', '请假类型', '', '00', '1', '1', '');
INSERT INTO `sys_library_info` VALUES ('2280', '2301', '事假', '', '23', '1', '1', '');
INSERT INTO `sys_library_info` VALUES ('2281', '2302', '病假', '', '23', '1', '1', '');
INSERT INTO `sys_library_info` VALUES ('2282', '24', '常用工具类型', '', '00', '2', '1', '');
INSERT INTO `sys_library_info` VALUES ('2283', '2401', '交通常用查询', '', '24', '2', '1', '');
INSERT INTO `sys_library_info` VALUES ('2284', '2402', '地区查询工具', '', '24', '2', '1', '');
INSERT INTO `sys_library_info` VALUES ('2285', '2403', '所属地查询工具', '', '24', '2', '1', '');
INSERT INTO `sys_library_info` VALUES ('2286', '2404', '时间工具', '', '24', '2', '1', '');
INSERT INTO `sys_library_info` VALUES ('2287', '2405', '度量换算工具', '', '24', '2', '1', '');
INSERT INTO `sys_library_info` VALUES ('2288', '2406', '其他工具', '', '24', '2', '1', '');
INSERT INTO `sys_library_info` VALUES ('2289', '25', '产品数量单位', 'product unit', '00', '2', '1', '');
INSERT INTO `sys_library_info` VALUES ('2290', '2501', '个', '', '25', '1', '1', '');
INSERT INTO `sys_library_info` VALUES ('2291', '2502', '台', '', '25', '1', '1', '');
INSERT INTO `sys_library_info` VALUES ('2292', '2503', '件', '', '25', '1', '1', '');
INSERT INTO `sys_library_info` VALUES ('2293', '2504', '套', '', '25', '1', '1', '');
INSERT INTO `sys_library_info` VALUES ('2294', '2505', '桶', '', '25', '1', '1', '');
INSERT INTO `sys_library_info` VALUES ('2295', '2506', '箱', '', '25', '1', '1', '');
INSERT INTO `sys_library_info` VALUES ('2296', '2507', '袋', '', '25', '1', '1', '');
INSERT INTO `sys_library_info` VALUES ('2297', '2508', '米', '', '25', '1', '1', '');
INSERT INTO `sys_library_info` VALUES ('2298', '2509', '千克', '', '25', '1', '1', '');
INSERT INTO `sys_library_info` VALUES ('2299', '26', '供应商性质', '', '00', '2', '1', '');
INSERT INTO `sys_library_info` VALUES ('2300', '2601', '国营', '', '26', '1', '1', '');
INSERT INTO `sys_library_info` VALUES ('2301', '2602', '私营', '', '26', '1', '1', '');
INSERT INTO `sys_library_info` VALUES ('2302', '2603', '股份制', '', '26', '1', '1', '');
INSERT INTO `sys_library_info` VALUES ('2303', '2604', '合资', '', '26', '1', '1', '');
INSERT INTO `sys_library_info` VALUES ('2304', '2605', '外资', '', '26', '1', '1', '');
INSERT INTO `sys_library_info` VALUES ('2305', '2606', '有限责任公司', '', '26', '1', '1', '');
INSERT INTO `sys_library_info` VALUES ('2306', '2607', '集体企业', '', '26', '1', '1', '');
INSERT INTO `sys_library_info` VALUES ('2307', '2608', '独资', '', '26', '1', '1', '');
INSERT INTO `sys_library_info` VALUES ('2308', '27', '生产任务类型', '', '00', '2', '1', '');
INSERT INTO `sys_library_info` VALUES ('2309', '2701', '正常生产', 'Normal', '27', '1', '1', '');
INSERT INTO `sys_library_info` VALUES ('2310', '2702', '临时生产', 'Temporary', '27', '1', '1', '');
INSERT INTO `sys_library_info` VALUES ('2311', '28', '服务类型', '', '00', '2', '1', '对客户的服务');
INSERT INTO `sys_library_info` VALUES ('2312', '2801', '故障维修', '', '28', '1', '1', '');
INSERT INTO `sys_library_info` VALUES ('2313', '2802', '技术支持', '', '28', '1', '1', '');
INSERT INTO `sys_library_info` VALUES ('2314', '2803', '客户培训', '', '28', '1', '1', '');
INSERT INTO `sys_library_info` VALUES ('2315', '29', '投诉类型', '', '00', '2', '1', '客户的投诉');
INSERT INTO `sys_library_info` VALUES ('2316', '2901', '质量问题', '', '29', '1', '1', '');
INSERT INTO `sys_library_info` VALUES ('2317', '2902', '服务问题', '', '29', '1', '1', '');
INSERT INTO `sys_library_info` VALUES ('2322', '31', '开发类型', '', '00', '2', '1', '开发客户方式');
INSERT INTO `sys_library_info` VALUES ('2323', '3101', '电话访问', '', '31', '1', '1', '');
INSERT INTO `sys_library_info` VALUES ('2324', '3102', '上门拜访', '', '31', '1', '1', '');
INSERT INTO `sys_library_info` VALUES ('2325', '3103', '客户访问', '', '31', '1', '1', '');
INSERT INTO `sys_library_info` VALUES ('2326', '1303', 'SUV', '', '13', '1', '1', '');
INSERT INTO `sys_library_info` VALUES ('2342', '33', '前端新闻类别', '', '00', '1', '1', '');
INSERT INTO `sys_library_info` VALUES ('2343', '3301', '通知公告', '', '33', '1', '1', '');
INSERT INTO `sys_library_info` VALUES ('2345', '3302', '申报指南', '', '33', '1', '1', '');
INSERT INTO `sys_library_info` VALUES ('2347', '3303', '在线帮助', '', '33', '1', '1', '');
INSERT INTO `sys_library_info` VALUES ('2349', '3304', '工作动态', '', '33', '1', '1', '');
INSERT INTO `sys_library_info` VALUES ('2351', '3305', '相关链接', '', '33', '1', '1', '');
INSERT INTO `sys_library_standard` VALUES ('16', '01', '性别代码', '00', '-1', 'GB/T 2261.1-2003');
INSERT INTO `sys_library_standard` VALUES ('17', '0101', '未知的性别', '01', '0', '');
INSERT INTO `sys_library_standard` VALUES ('18', '0102', '男性', '01', '1', '');
INSERT INTO `sys_library_standard` VALUES ('19', '0103', '女性', '01', '2', '');
INSERT INTO `sys_library_standard` VALUES ('20', '0104', '未说明的性别', '01', '9', '');
INSERT INTO `sys_library_standard` VALUES ('21', '02', '婚姻状况代码', '00', '-1', 'GB/T 2261.2-2003');
INSERT INTO `sys_library_standard` VALUES ('22', '0201', '未婚', '02', '10', '');
INSERT INTO `sys_library_standard` VALUES ('23', '0202', '已婚', '02', '20', '');
INSERT INTO `sys_library_standard` VALUES ('24', '020201', '初婚', '0202', '21', '');
INSERT INTO `sys_library_standard` VALUES ('25', '020202', '再婚', '0202', '22', '');
INSERT INTO `sys_library_standard` VALUES ('26', '020203', '复婚', '0202', '23', '');
INSERT INTO `sys_library_standard` VALUES ('27', '0203', '丧偶', '02', '30', '');
INSERT INTO `sys_library_standard` VALUES ('28', '0204', '离婚', '02', '40', '');
INSERT INTO `sys_library_standard` VALUES ('29', '0205', '未说明的婚姻状况', '02', '90', '');
INSERT INTO `sys_library_standard` VALUES ('30', '03', '健康状况代码（一）', '00', '-1', 'GB/T 2261.3-2003');
INSERT INTO `sys_library_standard` VALUES ('31', '0301', '健康或良好', '03', '1', '人体生理机能、营养、发育状况良好');
INSERT INTO `sys_library_standard` VALUES ('32', '0302', '一般或较弱', '03', '2', '人体生理机能、营养、发育状况良好，但身体体质较弱');
INSERT INTO `sys_library_standard` VALUES ('33', '0303', '有慢性病', '03', '3', '有慢性疾病');
INSERT INTO `sys_library_standard` VALUES ('34', '0304', '残疾', '03', '6', '心理、生理、人体结构上，某种组织、功能丧失或不正常，全部或部分丧失以正常方式从事某种活动的人');
INSERT INTO `sys_library_standard` VALUES ('35', '04', '健康状况代码（二）', '00', '-1', 'GB/T 2261.3-2003');
INSERT INTO `sys_library_standard` VALUES ('36', '0401', '健康或良好', '04', '10', '');
INSERT INTO `sys_library_standard` VALUES ('37', '0402', '一般或较弱', '04', '20', '');
INSERT INTO `sys_library_standard` VALUES ('38', '0403', '有慢性病', '04', '30', '');
INSERT INTO `sys_library_standard` VALUES ('39', '0404', '有慢性病', '04', '40', '');
INSERT INTO `sys_library_standard` VALUES ('40', '0405', '残疾', '04', '60', '');
INSERT INTO `sys_library_standard` VALUES ('41', '040301', '心血管病', '0403', '31', '');
INSERT INTO `sys_library_standard` VALUES ('42', '040302', '脑血管病', '0403', '32', '');
INSERT INTO `sys_library_standard` VALUES ('43', '040303', '慢性呼吸系统病', '0403', '33', '包括溃疡、肝炎及肝硬化');
INSERT INTO `sys_library_standard` VALUES ('44', '040304', '慢性消化系统病', '0403', '34', '');
INSERT INTO `sys_library_standard` VALUES ('45', '040305', '慢性肾炎', '0403', '35', '');
INSERT INTO `sys_library_standard` VALUES ('46', '040306', '结核病', '0403', '36', '');
INSERT INTO `sys_library_standard` VALUES ('47', '040307', '糖尿病', '0403', '37', '');
INSERT INTO `sys_library_standard` VALUES ('48', '040308', '神经或精神疾病', '0403', '38', '');
INSERT INTO `sys_library_standard` VALUES ('49', '040401', '癌症', '0404', '41', '');
INSERT INTO `sys_library_standard` VALUES ('50', '040402', '其他慢性病', '0404', '49', '');
INSERT INTO `sys_library_standard` VALUES ('51', '040501', '视力残疾', '0405', '61', '');
INSERT INTO `sys_library_standard` VALUES ('52', '040502', '听力残疾', '0405', '62', '');
INSERT INTO `sys_library_standard` VALUES ('53', '040503', '言语残疾', '0405', '63', '');
INSERT INTO `sys_library_standard` VALUES ('54', '040504', '肢体残疾', '0405', '64', '');
INSERT INTO `sys_library_standard` VALUES ('55', '040505', '精神残疾', '0405', '66', '');
INSERT INTO `sys_library_standard` VALUES ('56', '040506', '智力残疾', '0405', '65', '');
INSERT INTO `sys_library_standard` VALUES ('57', '040507', '多重残疾', '0405', '67', '');
INSERT INTO `sys_library_standard` VALUES ('58', '040508', '其他残疾', '0405', '69', '');
INSERT INTO `sys_library_standard` VALUES ('59', '05', '从业状况', '00', '-1', 'GB/T 2261.4-2003');
INSERT INTO `sys_library_standard` VALUES ('60', '0501', '国家公务员', '05', '11', '包括参照、依照公务员管理的人员');
INSERT INTO `sys_library_standard` VALUES ('61', '0502', '专业技术人员', '05', '13', '');
INSERT INTO `sys_library_standard` VALUES ('62', '0503', '职员', '05', '17', '');
INSERT INTO `sys_library_standard` VALUES ('63', '0504', '企业管理人员', '05', '21', '');
INSERT INTO `sys_library_standard` VALUES ('64', '0505', '工人', '05', '24', '');
INSERT INTO `sys_library_standard` VALUES ('65', '0506', '农民', '05', '27', '');
INSERT INTO `sys_library_standard` VALUES ('66', '0507', '学生', '05', '31', '');
INSERT INTO `sys_library_standard` VALUES ('67', '0508', '现役军人', '05', '37', '');
INSERT INTO `sys_library_standard` VALUES ('68', '0509', '自由职业者', '05', '51', '');
INSERT INTO `sys_library_standard` VALUES ('69', '0510', '个体经营者', '05', '54', '');
INSERT INTO `sys_library_standard` VALUES ('70', '0511', '无业人员', '05', '70', '');
INSERT INTO `sys_library_standard` VALUES ('71', '0512', '退（离）休人员', '05', '80', '');
INSERT INTO `sys_library_standard` VALUES ('72', '0513', '其他', '05', '90', '');
INSERT INTO `sys_log` VALUES ('1', '1', '2013-05-21 15:06:26', '登录系统:企业平台', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_log` VALUES ('2', '1', '2013-05-21 15:07:26', '登录系统:企业平台', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_log` VALUES ('3', '1', '2013-05-21 15:08:02', '登录系统:企业平台', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_log` VALUES ('4', '1', '2013-05-21 15:11:28', '登录系统:企业平台', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_log` VALUES ('7', '1', '2013-05-21 15:17:21', '登录系统:企业平台', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_log` VALUES ('8', '1', '2013-05-21 15:21:37', '登录系统:企业平台', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_log` VALUES ('239', '1', '2013-09-07 16:07:57', '登录系统:企业平台', '1', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('240', '1', '2013-09-07 16:09:40', '登录系统:企业平台', '1', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('244', '1', '2013-09-08 21:13:43', '登录系统:企业平台', '1', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('245', '1', '2013-09-08 21:16:26', '登录系统:企业平台', '1', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('246', '1', '2013-09-08 21:16:47', '登录系统:企业平台', '1', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('262', '1', '2013-09-16 10:33:00', '登录系统:企业平台', '1', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('263', '1', '2013-09-16 10:34:31', '登录系统:企业平台', '1', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('267', '1', '2013-09-16 10:57:03', '登录系统:企业平台', '1', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('269', '1', '2013-09-16 11:21:49', '登录系统:企业平台', '1', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('302', '1', '2013-09-18 22:48:21', '登录系统:企业平台', '1', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('304', '1', '2013-09-19 09:37:21', '登录系统:企业平台', '1', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('315', '1', '2013-09-20 08:37:58', '登录系统:企业平台', '1', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('340', '1', '2013-09-20 12:22:33', '登录系统:erp/index.jsp', '1', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('341', '1', '2013-09-20 12:23:19', '登录系统:企业平台', '1', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('346', '1', '2013-09-20 13:40:34', '登录系统:企业平台', '1', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('347', '1', '2013-09-20 13:55:05', '登录系统:企业平台', '1', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('350', '1', '2013-09-20 14:06:06', '登录系统:企业平台', '1', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('351', '1', '2013-09-20 14:10:38', '登录系统:企业平台', '1', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('371', '1', '2013-09-20 22:34:21', '登录系统:企业平台', '1', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('372', '1', '2013-09-20 22:35:18', '登录系统:企业平台', '1', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('381', '1', '2013-10-01 14:08:16', '登录系统:企业平台', '1', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('415', '1', '2013-10-28 23:40:19', '登录系统:企业平台', '1', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('418', '1', '2013-10-29 08:08:02', '登录系统:企业平台', '1', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('426', '1', '2013-10-31 13:45:00', '登录系统:企业平台', '1', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('427', '1', '2013-10-31 13:54:12', '登录系统:企业平台', '1', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('429', '1', '2013-10-31 13:58:24', '登录系统:企业平台', '1', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('466', '1', '2013-12-13 10:41:36', '登录系统:企业平台', '1', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('468', '1', '2013-12-13 11:19:23', '登录系统:企业平台', '1', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('476', '1', '2014-01-13 09:28:10', '登录系统:企业平台', '1', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('477', '1', '2014-01-13 09:34:01', '登录系统:企业平台', '1', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('478', '1', '2014-01-13 09:34:45', '登录系统:企业平台', '1', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('481', '1', '2014-01-13 09:53:39', '登录系统:企业平台', '1', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('482', '1', '2014-01-13 10:02:03', '登录系统:企业平台', '1', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('484', '1', '2014-01-13 10:04:07', '登录系统:企业平台', '1', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('754', '1', '2014-02-14 13:20:36', '登录系统:企业平台', '1', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('760', '1', '2014-02-14 15:53:15', '登录系统:企业平台', '1', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('932', '1', '2014-04-04 19:19:44', '登录系统:企业平台', '1', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('933', '1', '2014-04-04 19:32:03', '登录系统:企业平台', '1', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('937', '1', '2014-04-04 19:44:35', '登录系统:企业平台', '1', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('938', '1', '2014-04-04 19:45:27', '登录系统:企业平台', '1', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('939', '1', '2014-04-04 19:59:42', '登录系统:企业平台', '1', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('940', '1', '2014-04-04 20:00:27', '登录系统:erp/index.jsp', '1', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('942', '1', '2014-04-04 20:25:27', '登录系统:erp/index.jsp', '1', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('944', '1', '2014-04-04 21:31:40', '登录系统:erp/index.jsp', '1', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('946', '1', '2014-04-04 21:52:14', '登录系统:erp/index.jsp', '1', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('948', '1', '2014-04-04 22:03:09', '登录系统:erp/index.jsp', '1', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('950', '1', '2014-04-04 22:21:12', '登录系统:erp/index.jsp', '1', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('951', '1', '2014-04-04 22:23:56', '登录系统:erp/index.jsp', '1', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('952', '1', '2014-04-04 22:25:12', '登录系统:erp/index.jsp', '1', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('953', '1', '2014-04-04 22:29:33', '登录系统:企业平台', '1', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('954', '1', '2014-04-04 22:35:02', '登录系统:erp/index.jsp', '1', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('955', '1', '2014-04-04 22:49:19', '登录系统:erp/index.jsp', '1', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('957', '1', '2014-04-04 22:51:34', '登录系统:企业平台', '1', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('959', '1', '2014-04-04 22:51:57', '登录系统:erp/index.jsp', '1', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('960', '1', '2014-04-05 07:36:05', '登录系统:erp/index.jsp', '1', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('961', '1', '2014-04-05 07:36:20', '登录系统:企业平台', '1', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('962', '1', '2014-04-05 08:52:16', '登录系统:企业平台', '1', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('967', '1', '2014-04-05 09:35:01', '登录系统:erp/index.jsp', '1', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('971', '1', '2014-04-05 09:49:31', '登录系统:企业平台', '1', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('975', '1', '2014-04-05 10:59:39', '登录系统:erp/index.jsp', '1', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('976', '1', '2014-04-05 11:10:00', '登录系统:erp/index.jsp', '1', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('977', '1', '2014-04-05 11:10:37', '登录系统:erp/index.jsp', '1', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('978', '1', '2014-04-05 11:22:41', '登录系统:erp/index.jsp', '1', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('979', '1', '2014-04-05 11:46:07', '登录系统:企业平台', '1', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('980', '1', '2014-04-05 11:58:02', '登录系统:企业平台', '1', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('984', '1', '2014-04-05 12:25:33', '登录系统:企业平台', '1', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('985', '1', '2014-04-05 12:25:47', '登录系统:企业平台', '1', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('986', '1', '2014-04-05 12:28:21', '登录系统:企业平台', '1', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('987', '1', '2014-04-05 12:31:02', '登录系统:企业平台', '1', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('990', '1', '2014-04-05 13:13:27', '登录系统:企业平台', '1', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('991', '1', '2014-04-05 15:31:33', '登录系统:企业平台', '1', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('992', '1', '2014-04-05 15:44:18', '登录系统:企业平台', '1', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('993', '1', '2014-04-05 15:46:03', '登录系统:企业平台', '1', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('1005', '1', '2014-04-05 20:50:06', '登录系统:企业平台', '1', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('1008', '1', '2014-04-05 22:00:28', '登录系统:企业平台', '1', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('1009', '1', '2014-04-05 22:14:36', '登录系统:企业平台', '1', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('1010', '1', '2014-04-05 22:16:31', '登录系统:企业平台', '1', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('1017', '1', '2014-04-06 09:38:18', '登录系统:企业平台', '1', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('1025', '1', '2014-04-06 11:31:42', '登录系统:企业平台', '1', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('1041', '1', '2014-04-07 12:00:58', '登录系统:企业平台', '1', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('1082', '1', '2014-04-13 09:35:29', '登录系统:企业平台', '1', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('1105', '1', '2014-04-17 18:57:39', '登录系统:企业平台', '1', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('1106', '1', '2014-04-17 20:02:11', '登录系统:企业平台', '1', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('1107', '1', '2014-04-18 08:02:39', '登录系统:企业平台', '1', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('1115', '1', '2014-04-18 23:13:04', '登录系统:企业平台', '1', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('1116', '1', '2014-04-18 23:46:40', '登录系统:企业平台', '1', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('1117', '1', '2014-04-19 01:04:35', '登录系统:企业平台', '1', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('1173', '1', '2014-04-25 13:44:00', '登录系统:企业平台', '1', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('1219', '1', '2014-05-14 15:30:51', '登录系统:企业平台', '1', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('1225', '1', '2014-05-15 08:34:25', '登录系统:企业平台', '1', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('1261', '1', '2014-05-24 15:55:24', '登录系统:企业平台', '1', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('1263', '1', '2014-05-24 16:08:09', '登录系统:企业平台', '1', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('1264', '1', '2014-05-24 16:12:50', '登录系统:企业平台', '1', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('1265', '1', '2014-05-24 16:20:47', '登录系统:企业平台', '1', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('1273', '1', '2014-05-24 20:50:09', '登录系统:企业平台', '1', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('1276', '1', '2014-05-24 20:54:26', '登录系统:企业平台', '1', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('1284', '1', '2014-05-24 22:22:34', '登录系统:企业平台', '1', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('1315', '1', '2014-06-12 13:41:35', '登录系统:企业平台', '1', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('1344', '1', '2014-06-17 16:12:14', '登录系统:企业平台', '1', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('1353', '1', '2014-06-18 10:08:46', '登录系统:企业平台', '1', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('1354', '1', '2014-06-18 10:12:01', '登录系统:企业平台', '1', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('1355', '1', '2014-06-18 10:40:28', '登录系统:企业平台', '1', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('1359', '1', '2014-06-18 16:12:36', '登录系统:企业平台', '1', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('2919', '1', '2014-06-19 15:12:57', '登录系统:企业平台', '1', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('5534', '1', '2014-06-19 15:20:03', '登录系统:企业平台', '1', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('9043', '1', '2014-06-19 18:39:21', '登录系统:企业平台', '1', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('9046', '1', '2014-06-19 18:58:28', '登录系统:企业平台', '1', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('9049', '1', '2014-06-20 13:20:13', '登录系统:企业平台', '1', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('9065', '1', '2014-06-21 15:53:48', '登录系统:企业平台', '1', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('9093', '1', '2014-07-02 08:42:48', '登录系统:企业平台', '1', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('9094', '1', '2014-07-02 09:36:15', '登录系统:企业平台', '1', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('9095', '1', '2014-07-02 09:51:47', '登录系统:企业平台', '1', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('9096', '1', '2014-07-02 09:53:20', '登录系统:企业平台', '1', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('9097', '1', '2014-07-02 09:53:55', '登录系统:企业平台', '1', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('9108', '1', '2014-07-03 19:47:30', '登录系统:企业平台', '1', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('9124', '1', '2014-07-05 10:17:48', '登录系统:企业平台', '1', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('9149', '1', '2014-07-05 17:20:19', '登录系统:企业平台', '1', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('9157', '1', '2014-07-07 08:07:59', '登录系统:企业平台', '1', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('9158', '1', '2014-07-07 08:10:43', '登录系统:企业平台', '1', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('9159', '1', '2014-07-07 08:13:59', '登录系统:企业平台', '1', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('9160', '1', '2014-07-07 08:15:09', '登录系统:企业平台', '1', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('9163', '1', '2014-07-07 10:06:19', '登录系统:企业平台', '1', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('9165', '1', '2014-07-07 10:13:23', '登录系统:企业平台', '1', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('9184', '1', '2014-07-09 13:23:05', '登录系统:企业平台', '1', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('9186', '1', '2014-07-09 14:37:11', '登录系统:企业平台', '1', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('9189', '1', '2014-07-09 14:57:58', '登录系统:企业平台', '1', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('9211', '1', '2014-07-11 15:59:56', '登录系统:企业平台', '1', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('9239', '1', '2014-07-16 08:22:34', '登录系统:企业平台', '1', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('9242', '1', '2014-07-16 14:26:48', '登录系统:企业平台', '1', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('9248', '1', '2014-07-19 09:05:42', '登录系统:企业平台', '1', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('9253', '1', '2014-07-19 10:52:27', '登录系统:企业平台', '1', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('9255', '1', '2014-07-19 13:25:22', '登录系统:企业平台', '1', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('9259', '1', '2014-07-19 14:14:40', '登录系统:企业平台', '1', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('9298', '1', '2014-07-25 15:07:36', '登录系统:企业平台', '1', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('9301', '1', '2014-07-25 15:42:09', '登录系统:企业平台', '1', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('9303', '1', '2014-07-25 15:56:05', '登录系统:企业平台', '1', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('9313', '1', '2014-07-28 08:22:20', '登录系统:企业平台', '1', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('9316', '1', '2014-07-28 08:24:38', '登录系统:企业平台', '1', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('9328', '1', '2014-07-28 10:23:09', '登录系统:企业平台', '1', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('9330', '1', '2014-07-28 10:26:56', '登录系统:企业平台', '1', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('9354', '1', '2014-07-29 07:41:45', '登录系统:企业平台', '1', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('9356', '1', '2014-07-29 07:43:42', '登录系统:企业平台', '1', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('9359', '1', '2014-07-29 07:45:07', '登录系统:企业平台', '1', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('9385', '1', '2014-07-31 13:48:42', '登录系统:企业平台', '1', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('9390', '1', '2014-07-31 14:54:11', '登录系统:企业平台', '1', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('9395', '1', '2014-07-31 15:44:30', '登录系统:企业平台', '1', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('9399', '1', '2014-07-31 18:13:48', '登录系统:企业平台', '1', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('9402', '1', '2014-08-01 08:18:44', '登录系统:企业平台', '1', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('9404', '1', '2014-08-01 08:36:04', '登录系统:企业平台', '1', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('9427', '1', '2014-08-08 12:43:16', '登录系统:企业平台', '1', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('9429', '1', '2014-08-08 12:45:14', '登录系统:企业平台', '1', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('9431', '1', '2014-08-08 12:47:52', '登录系统:企业平台', '1', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('9433', '1', '2014-08-08 12:49:41', '登录系统:企业平台', '1', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('9435', '1', '2014-08-08 12:52:47', '登录系统:企业平台', '1', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('9439', '1', '2014-08-08 13:10:31', '登录系统:企业平台', '1', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('9460', '1', '2014-08-11 00:11:24', '登录系统:企业平台', '1', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('9461', '1', '2014-08-11 00:16:05', '登录系统:企业平台', '1', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('9463', '1', '2014-08-11 00:16:35', '登录系统:企业平台', '1', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('9476', '1', '2014-08-11 10:41:22', '登录系统:企业平台', '1', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('9486', '1', '2014-08-11 13:44:43', '登录系统:企业平台', '1', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('9488', '1', '2014-08-11 13:51:57', '登录系统:企业平台', '1', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('9519', '1', '2014-08-15 08:21:20', '登录系统:企业平台', '1', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('9522', '1', '2014-08-15 08:33:53', '登录系统:企业平台', '1', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('9592', '1', '2014-08-21 08:29:15', '登录系统:企业平台', '1', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('9615', '1', '2014-08-21 13:19:03', '登录系统:企业平台', '1', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('9616', '1', '2014-08-21 13:19:03', '登录系统:企业平台', '1', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('9617', '1', '2014-08-21 13:20:51', '登录系统:企业平台', '1', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('9664', '1', '2014-08-25 09:13:28', '登录系统:企业平台', '1', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('9683', '1', '2014-09-04 08:17:41', '登录系统:企业平台', '1', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('9714', '1', '2014-09-05 23:49:44', '登录系统:企业平台', '1', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('9716', '1', '2014-09-05 23:55:50', '登录系统:企业平台', '1', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('9773', '1', '2014-09-28 15:16:05', '登录系统:企业平台', '1', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('9777', '1', '2014-09-30 08:58:26', '登录系统:企业平台', '1', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('9787', '1', '2014-09-30 16:26:29', '登录系统:企业平台', '1', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('9789', '1', '2014-09-30 16:33:12', '登录系统:企业平台', '1', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('9792', '1', '2014-09-30 16:35:13', '登录系统:erp/index.jsp', '1', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('9799', '1', '2014-10-05 09:15:44', '登录系统:企业平台', '1', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('9847', '1', '2014-10-20 09:45:44', '登录系统:企业平台', '1', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('9849', '1', '2014-10-20 12:04:55', '登录系统:企业平台', '1', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('9850', '1', '2014-10-20 12:55:44', '登录系统:企业平台', '1', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('9851', '1', '2014-10-20 15:08:43', '登录系统:企业平台', '1', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('9852', '1', '2014-10-20 15:41:22', '登录系统:企业平台', '1', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('9854', '1', '2014-10-20 16:50:45', '登录系统:企业平台', '1', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('9856', '1', '2014-10-21 08:14:08', '登录系统:企业平台', '1', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('9857', '1', '2014-10-21 09:12:28', '登录系统:企业平台', '1', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('9859', '1', '2014-10-21 10:09:31', '登录系统:企业平台', '1', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('9861', '1', '2014-10-22 10:10:37', '登录系统:企业平台', '1', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('9863', '1', '2014-10-21 10:22:38', '登录系统:企业平台', '1', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('9864', '1', '2014-10-21 10:41:36', '登录系统:企业平台', '1', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('9865', '1', '2014-10-21 12:27:57', '登录系统:企业平台', '1', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('9866', '1', '2014-10-21 13:14:38', '登录系统:企业平台', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_log` VALUES ('9874', '1', '2014-10-22 08:45:04', '登录系统:企业平台', '1', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('9876', '1', '2014-10-22 08:49:26', '登录系统:企业平台', '1', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('9878', '1', '2014-10-22 08:52:52', '登录系统:企业平台', '1', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('9882', '2', '2014-10-23 12:54:33', '登录系统:企业平台', '1', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('10009', '52', '2014-12-12 08:33:37', '登录系统:企业平台', '18', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('10010', '52', '2014-12-12 08:53:50', '登录系统:企业平台', '18', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('10011', '52', '2014-12-12 09:01:25', '登录系统:企业平台', '18', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('10012', '52', '2014-12-12 09:03:11', '登录系统:企业平台', '18', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('10013', '52', '2014-12-12 09:14:09', '登录系统:企业平台', '18', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('10014', '52', '2014-12-12 09:21:22', '登录系统:企业平台', '18', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('10015', '52', '2014-12-12 09:27:38', '登录系统:企业平台', '18', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('10016', '52', '2014-12-12 09:38:54', '登录系统:企业平台', '18', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('10017', '52', '2014-12-12 09:51:24', '登录系统:企业平台', '18', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('10018', '52', '2014-12-12 09:58:30', '登录系统:企业平台', '18', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('10019', '52', '2014-12-13 08:20:12', '登录系统:企业平台', '18', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('10020', '56', '2014-12-13 08:20:44', '登录系统:erp/index.jsp', '18', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('10021', '56', '2014-12-13 08:21:12', '登录系统:erp/index.jsp', '18', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('10022', '58', '2014-12-22 09:18:23', '登录系统:人力资源', '18', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('10023', '52', '2014-12-22 09:19:07', '登录系统:企业平台', '18', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('10024', '52', '2014-12-23 16:52:40', '登录系统:企业平台', '18', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('10025', '58', '2014-12-25 15:30:14', '登录系统:人力资源', '18', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('10026', '58', '2014-12-26 08:55:36', '登录系统:人力资源', '18', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('10027', '58', '2014-12-26 09:09:57', '登录系统:人力资源', '18', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('10028', '52', '2014-12-26 10:02:16', '登录系统:企业平台', '18', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('10029', '52', '2014-12-26 11:04:47', '登录系统:企业平台', '18', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('10030', '58', '2014-12-26 13:44:59', '登录系统:企业平台', '18', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_log` VALUES ('10031', '58', '2014-12-26 13:53:48', '登录系统:企业平台', '18', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('10032', '58', '2014-12-26 14:19:09', '登录系统:人力资源', '18', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('10033', '58', '2014-12-26 14:25:02', '登录系统:人力资源', '18', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('10034', '58', '2014-12-26 14:35:33', '登录系统:企业平台', '18', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_log` VALUES ('10035', '52', '2014-12-29 13:17:25', '登录系统:企业平台', '18', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_log` VALUES ('10036', '52', '2014-12-29 13:21:31', '登录系统:企业平台', '18', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_log` VALUES ('10037', '58', '2014-12-30 16:40:44', '登录系统:企业平台', '18', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_log` VALUES ('10038', '52', '2015-01-01 16:08:31', '登录系统:企业平台', '18', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_log` VALUES ('10039', '52', '2015-01-02 21:48:40', '登录系统:人力资源', '18', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('10040', '52', '2015-01-02 21:50:35', '登录系统:企业平台', '18', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('10041', '52', '2015-01-02 22:01:51', '登录系统:企业平台', '18', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('10042', '56', '2015-01-02 22:02:00', '登录系统:erp/index.jsp', '18', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('10043', '56', '2015-01-02 22:02:43', '登录系统:erp/index.jsp', '18', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('10044', '52', '2015-01-02 22:02:59', '登录系统:人力资源', '18', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('10045', '52', '2015-01-02 23:07:18', '登录系统:人力资源', '18', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('10046', '52', '2015-01-02 23:58:15', '登录系统:人力资源', '18', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('10047', '52', '2015-01-03 09:51:26', '登录系统:企业平台', '18', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('10048', '52', '2015-01-03 09:51:36', '登录系统:企业平台', '18', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('10049', '52', '2015-01-03 09:53:23', '登录系统:企业平台', '18', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('10050', '56', '2015-01-03 09:53:32', '登录系统:企业平台', '18', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('10051', '54', '2015-01-03 09:54:15', '登录系统:人力资源', '18', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('10052', '52', '2015-01-03 09:58:22', '登录系统:企业平台', '18', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('10053', '52', '2015-01-03 10:00:22', '登录系统:企业平台', '18', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('10054', '52', '2015-01-03 10:00:48', '登录系统:企业平台', '18', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('10055', '54', '2015-01-03 10:01:04', '登录系统:进销存', '18', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('10056', '52', '2015-01-03 13:51:20', '登录系统:企业平台', '18', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('10057', '56', '2015-01-03 13:51:29', '登录系统:企业平台', '18', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('10058', '52', '2015-01-03 13:52:03', '登录系统:企业平台', '18', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('10059', '52', '2015-01-03 13:52:28', '登录系统:企业平台', '18', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('10060', '54', '2015-01-03 13:52:46', '登录系统:人力资源', '18', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('10061', '52', '2015-01-03 13:53:11', '登录系统:企业平台', '18', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('10062', '52', '2015-01-03 13:54:50', '登录系统:企业平台', '18', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('10063', '52', '2015-01-07 14:02:13', '登录系统:企业平台', '18', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('10064', '52', '2015-01-07 14:49:18', '登录系统:企业平台', '18', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('10065', '52', '2015-01-07 16:55:15', '登录系统:企业平台', '18', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('10066', '52', '2015-01-08 07:56:33', '登录系统:企业平台', '18', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('10067', '52', '2015-01-08 07:59:02', '登录系统:企业平台', '18', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('10068', '52', '2015-01-08 08:01:10', '登录系统:企业平台', '18', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('10069', '52', '2015-01-08 08:01:43', '登录系统:企业平台', '18', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('10070', '52', '2015-01-08 08:01:51', '登录系统:企业平台', '18', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('10071', '52', '2015-01-08 08:02:11', '登录系统:企业平台', '18', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('10072', '52', '2015-01-08 08:02:21', '登录系统:企业平台', '18', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('10073', '52', '2015-01-08 08:02:28', '登录系统:企业平台', '18', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('10074', '52', '2015-01-08 16:03:11', '登录系统:企业平台', '18', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('10075', '52', '2015-01-08 16:43:48', '登录系统:企业平台', '18', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('10076', '52', '2015-01-08 16:51:02', '登录系统:企业平台', '18', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('10077', '52', '2015-01-08 16:52:50', '登录系统:企业平台', '18', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('10078', '52', '2015-01-08 16:55:59', '登录系统:企业平台', '18', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('10079', '52', '2015-01-09 07:52:57', '登录系统:企业平台', '18', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('10080', '52', '2015-01-09 07:53:16', '登录系统:企业平台', '18', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('10081', '52', '2015-01-09 08:10:27', '登录系统:企业平台', '18', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('10082', '52', '2015-01-09 08:18:44', '登录系统:企业平台', '18', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('10083', '52', '2015-01-09 08:23:39', '登录系统:企业平台', '18', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('10084', '52', '2015-01-09 09:40:12', '登录系统:企业平台', '18', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('10085', '52', '2015-01-09 16:24:01', '登录系统:企业平台', '18', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('10086', '52', '2015-01-10 08:27:22', '登录系统:企业平台', '18', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('10087', '52', '2015-01-10 09:19:19', '登录系统:企业平台', '18', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('10088', '52', '2015-01-10 09:19:36', '登录系统:企业平台', '18', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('10089', '52', '2015-01-10 09:25:55', '登录系统:企业平台', '18', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('10090', '52', '2015-01-13 13:08:14', '登录系统:企业平台', '18', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('10091', '52', '2015-01-13 15:56:42', '登录系统:企业平台', '18', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('10092', '52', '2015-01-14 08:16:10', '登录系统:企业平台', '18', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('10093', '52', '2015-01-14 13:21:56', '登录系统:企业平台', '18', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('10094', '52', '2015-01-14 13:58:07', '登录系统:企业平台', '18', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('10095', '52', '2015-01-14 14:02:18', '登录系统:企业平台', '18', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('10096', '52', '2015-01-14 14:09:24', '登录系统:企业平台', '18', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('10097', '52', '2015-01-14 14:23:07', '登录系统:企业平台', '18', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('10098', '52', '2015-01-14 15:03:11', '登录系统:企业平台', '18', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('10099', '54', '2015-01-14 15:05:42', '登录系统:人力资源', '18', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('10100', '52', '2015-01-14 15:06:08', '登录系统:企业平台', '18', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('10101', '54', '2015-01-14 15:06:20', '登录系统:企业平台', '18', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('10102', '56', '2015-01-14 15:19:47', '登录系统:企业平台', '18', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('10103', '54', '2015-01-14 15:21:02', '登录系统:企业平台', '18', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('10104', '56', '2015-01-14 15:21:32', '登录系统:企业平台', '18', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('10105', '55', '2015-01-14 15:22:17', '登录系统:企业平台', '18', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('10106', '52', '2015-01-14 15:22:55', '登录系统:企业平台', '18', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('10107', '54', '2015-01-14 15:24:38', '登录系统:企业平台', '18', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('10108', '54', '2015-01-14 15:25:31', '登录系统:企业平台', '18', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('10109', '56', '2015-01-14 15:28:19', '登录系统:企业平台', '18', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('10110', '52', '2015-01-14 15:34:08', '登录系统:企业平台', '18', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('10111', '52', '2015-01-14 15:42:06', '登录系统:企业平台', '18', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('10112', '52', '2015-01-16 08:46:37', '登录系统:企业平台', '18', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('10113', '52', '2015-01-16 09:29:04', '登录系统:企业平台', '18', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('10114', '52', '2015-01-16 09:42:29', '登录系统:企业平台', '18', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('10115', '52', '2015-01-16 09:55:20', '登录系统:企业平台', '18', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('10116', '52', '2015-01-16 10:48:01', '登录系统:企业平台', '18', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('10117', '52', '2015-01-16 10:49:35', '登录系统:企业平台', '18', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('10118', '52', '2015-01-16 10:57:19', '登录系统:企业平台', '18', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('10119', '52', '2015-01-16 10:57:34', '登录系统:企业平台', '18', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('10120', '52', '2015-01-16 10:58:20', '登录系统:企业平台', '18', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('10121', '52', '2015-01-16 10:58:32', '登录系统:企业平台', '18', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('10122', '52', '2015-01-16 10:58:47', '登录系统:企业平台', '18', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('10123', '52', '2015-01-16 11:08:27', '登录系统:企业平台', '18', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('10124', '52', '2015-01-16 11:10:40', '登录系统:企业平台', '18', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('10125', '52', '2015-01-16 11:19:12', '登录系统:企业平台', '18', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('10126', '52', '2015-01-16 11:24:48', '登录系统:企业平台', '18', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('10127', '52', '2015-01-16 11:25:03', '登录系统:企业平台', '18', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('10128', '52', '2015-01-16 12:23:55', '登录系统:企业平台', '18', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('10129', '52', '2015-01-16 12:26:31', '登录系统:企业平台', '18', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('10130', '52', '2015-01-16 12:28:19', '登录系统:企业平台', '18', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('10131', '52', '2015-01-16 12:29:30', '登录系统:企业平台', '18', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('10132', '52', '2015-01-16 12:30:31', '登录系统:企业平台', '18', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('10133', '52', '2015-01-16 12:30:56', '登录系统:企业平台', '18', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('10134', '52', '2015-01-16 12:37:21', '登录系统:企业平台', '18', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('10135', '52', '2015-01-16 12:37:30', '登录系统:企业平台', '18', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('10136', '52', '2015-01-16 12:38:20', '登录系统:企业平台', '18', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('10137', '52', '2015-01-16 12:40:24', '登录系统:企业平台', '18', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('10138', '52', '2015-01-16 12:49:09', '登录系统:企业平台', '18', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('10139', '52', '2015-01-16 12:50:34', '登录系统:企业平台', '18', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('10140', '52', '2015-01-16 12:57:10', '登录系统:企业平台', '18', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('10141', '56', '2015-01-16 12:58:23', '登录系统:企业平台', '18', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('10142', '52', '2015-01-16 12:59:37', '登录系统:企业平台', '18', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('10143', '56', '2015-01-16 12:59:45', '登录系统:企业平台', '18', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('10144', '52', '2015-01-16 14:48:57', '登录系统:企业平台', '18', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('10145', '52', '2015-01-16 14:50:02', '登录系统:企业平台', '18', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('10146', '52', '2015-01-16 14:56:09', '登录系统:企业平台', '18', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('10147', '52', '2015-01-16 14:59:52', '登录系统:企业平台', '18', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('10148', '52', '2015-01-16 15:05:18', '登录系统:企业平台', '18', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('10149', '52', '2015-01-16 15:05:33', '登录系统:企业平台', '18', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('10150', '56', '2015-01-16 15:08:56', '登录系统:企业平台', '18', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('10151', '54', '2015-01-16 15:09:31', '登录系统:企业平台', '18', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('10152', '52', '2015-01-19 09:58:01', '登录系统:企业平台', '18', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('10153', '52', '2015-01-19 10:34:13', '登录系统:企业平台', '18', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('10154', '52', '2015-01-19 11:08:01', '登录系统:企业平台', '18', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_log` VALUES ('10155', '52', '2015-01-19 14:43:45', '登录系统:企业平台', '18', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_log` VALUES ('10156', '52', '2015-01-20 10:59:54', '登录系统:企业平台', '18', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('10157', '52', '2015-01-20 14:43:32', '登录系统:企业平台', '18', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_log` VALUES ('10158', '52', '2015-02-07 08:33:02', '登录系统:企业平台', '18', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_log` VALUES ('10159', '52', '2015-02-07 08:34:27', '登录系统:企业平台', '18', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_log` VALUES ('10160', '52', '2015-02-07 10:05:10', '登录系统:企业平台', '18', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_log` VALUES ('10161', '52', '2015-02-07 10:09:33', '登录系统:企业平台', '18', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_log` VALUES ('10162', '52', '2015-02-07 10:11:53', '登录系统:企业平台', '18', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_log` VALUES ('10163', '52', '2015-02-07 10:14:58', '登录系统:企业平台', '18', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_log` VALUES ('10164', '52', '2015-02-07 10:16:13', '登录系统:企业平台', '18', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_log` VALUES ('10165', '52', '2015-02-07 10:17:43', '登录系统:企业平台', '18', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_log` VALUES ('10166', '52', '2015-02-07 10:19:00', '登录系统:企业平台', '18', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_log` VALUES ('10167', '52', '2015-02-07 13:34:25', '登录系统:企业平台', '18', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_log` VALUES ('10168', '52', '2015-02-07 14:15:41', '登录系统:企业平台', '18', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_log` VALUES ('10169', '52', '2015-02-07 16:03:05', '登录系统:企业平台', '18', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_log` VALUES ('10170', '52', '2015-02-26 09:43:37', '登录系统:企业平台', '18', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_log` VALUES ('10171', '52', '2015-02-26 09:45:44', '登录系统:企业平台', '18', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_log` VALUES ('10172', '52', '2015-02-26 09:47:32', '登录系统:企业平台', '18', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_log` VALUES ('10173', '52', '2015-02-26 16:16:35', '登录系统:企业平台', '18', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_log` VALUES ('10174', '52', '2015-03-03 11:12:18', '登录系统:企业平台', '18', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_log` VALUES ('10175', '52', '2015-03-03 11:15:19', '登录系统:企业平台', '18', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_log` VALUES ('10176', '52', '2015-03-12 10:46:45', '登录系统:企业平台', '18', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_log` VALUES ('10177', '52', '2015-03-12 10:47:50', '登录系统:企业平台', '18', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_log` VALUES ('10178', '52', '2015-03-12 13:39:13', '登录系统:企业平台', '18', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_log` VALUES ('10179', '52', '2015-03-12 13:43:23', '登录系统:企业平台', '18', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_log` VALUES ('10180', '52', '2015-03-12 13:44:26', '登录系统:企业平台', '18', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_log` VALUES ('10181', '52', '2015-03-12 13:44:42', '登录系统:企业平台', '18', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_log` VALUES ('10182', '52', '2015-03-12 13:45:45', '登录系统:企业平台', '18', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_log` VALUES ('10183', '52', '2015-04-15 16:40:06', '登录系统:企业平台', '18', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('10184', '52', '2015-04-22 08:11:11', '登录系统:人力资源', '18', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_log` VALUES ('10185', '51', '2015-04-22 08:11:25', '登录系统:人力资源', '18', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_log` VALUES ('10186', '52', '2015-04-22 08:12:36', '登录系统:人力资源', '18', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_log` VALUES ('10187', '52', '2015-04-22 08:15:52', '登录系统:人力资源', '18', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_log` VALUES ('10188', '51', '2015-04-22 08:16:33', '登录系统:企业平台', '18', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_log` VALUES ('10189', '52', '2015-04-22 08:16:54', '登录系统:企业平台', '18', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_log` VALUES ('10190', '52', '2015-04-27 10:06:05', '登录系统:企业平台', '18', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_log` VALUES ('10191', '52', '2015-05-06 15:47:19', '登录系统:企业平台', '18', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_log` VALUES ('10192', '52', '2015-05-06 15:53:43', '登录系统:企业平台', '18', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_log` VALUES ('10193', '52', '2015-05-07 08:40:30', '登录系统:企业平台', '18', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_log` VALUES ('10194', '52', '2015-05-12 15:21:55', '登录系统:企业平台', '18', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_log` VALUES ('10195', '52', '2015-05-12 15:34:43', '登录系统:企业平台', '18', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_method_help` VALUES ('1', 'zyjj.png', '表示‘重要/紧急’的日程。', '00020302', '1');
INSERT INTO `sys_method_help` VALUES ('2', 'zybjj.png', '表示‘重要/不紧急’的日程。', '00020302', '2');
INSERT INTO `sys_method_help` VALUES ('3', 'bzyjj.png', '表示‘不重要/紧急’的日程。', '00020302', '3');
INSERT INTO `sys_method_help` VALUES ('4', 'bzybjj.png', '表示‘不重要/不紧急’的日程。', '00020302', '4');
INSERT INTO `sys_method_help` VALUES ('5', '', '该功能设置用户的特殊权限，不影响用户所绑定角色设置', '00080201', '1');
INSERT INTO `sys_method_help` VALUES ('6', '', '修改角色设置请进入‘角色管理’功能', '00080201', '2');
INSERT INTO `sys_method_help` VALUES ('7', 'zyjj.png', '删除或设置为无效将影响业务流程', '00080502', '1');
INSERT INTO `sys_method_help` VALUES ('14', 'rowset.png', '这里显示系统内所有的人员信息，双击记录可以查看该人员的详细信息。', '020203', '1');
INSERT INTO `sys_method_help` VALUES ('16', 'zybjj.png', '人员如果需要登录系统、使用系统功能，还需要两步设置。首先在系统设置-用户设置中，为相应的人员分配账号。然后在权限设置中，给人员设置权限。', '020203', '2');
INSERT INTO `sys_method_help` VALUES ('17', 'zybjj.png', '点击左侧组织机构树，可以快速查询到对应机构下面的人员信息。', '020203', '3');
INSERT INTO `sys_method_help` VALUES ('18', 'zybjj.png', '点击右上角“高级查询”，可以使用各种条件进行组合查询。', '020203', '4');
INSERT INTO `sys_method_help` VALUES ('19', 'rowedit.png', '点击编辑图标，可以对人员信息进行编辑。', '020203', '5');
INSERT INTO `sys_method_help` VALUES ('20', 'seta.png', '人员不能删除，只能设置为“离职”', '020203', '6');
INSERT INTO `sys_method_help` VALUES ('21', 'setpym.png', '设置拼音码，例如人员姓名“张三”，拼音码为“ZS”；人员姓名“李四”，拼音码为“LS”', '020203', '7');
INSERT INTO `sys_method_info` VALUES ('01', '企业平台', '', 'center.jsp', '1', '1.png', '-1', '-1', '1', 'pingtai', '1', 'erp/index.jsp', '公司在线办公基础平台', '');
INSERT INTO `sys_method_info` VALUES ('0101', '信息发布', '', '', '6', 'gr1.gif', '1', '01', '1', '', '0', '', '信息发布，可处理公司公告、内部通知、公司记事等等', null);
INSERT INTO `sys_method_info` VALUES ('010102', '公司公告', null, null, '2', 'tab_go.png', '2', '0101', '1', null, '0', null, '', null);
INSERT INTO `sys_method_info` VALUES ('01010201', '公告发布', null, 'issue_info/announcement_add.jsp', '1', 'ggfb.png', '3', '010102', '1', null, '0', null, '', null);
INSERT INTO `sys_method_info` VALUES ('01010202', '公告管理', null, 'issue_info/announcement_manager.jsp', '2', 'gggl.png', '3', '010102', '1', null, '0', null, '', null);
INSERT INTO `sys_method_info` VALUES ('010103', '内部通知', null, null, '3', 'sounda.png', '2', '0101', '1', null, '0', null, '', null);
INSERT INTO `sys_method_info` VALUES ('01010301', '发布通知', '', 'issue_info/notice_add.jsp', '1', 'fbtz.png', '3', '010103', '1', null, '0', null, '', null);
INSERT INTO `sys_method_info` VALUES ('01010302', '通知管理', '', 'issue_info/notice_manager.jsp', '2', 'tzgl.png', '3', '010103', '1', null, '0', null, '', null);
INSERT INTO `sys_method_info` VALUES ('010104', '公司记事', '', '', '4', 'page_component.gif', '2', '0101', '1', null, '0', null, '', null);
INSERT INTO `sys_method_info` VALUES ('01010401', '记事发布', '', 'issue_info/adversaria_add.jsp', '1', 'jsfb.png', '3', '010104', '1', null, '0', null, '', null);
INSERT INTO `sys_method_info` VALUES ('01010402', '记事管理', '', 'issue_info/adversaria_info.jsp', '2', 'jsgl.png', '3', '010104', '1', null, '0', null, '', null);
INSERT INTO `sys_method_info` VALUES ('0102', '工作安排', null, null, '2', 'chart.png', '1', '01', '1', null, '0', null, '', null);
INSERT INTO `sys_method_info` VALUES ('010202', '工作日志', '', '', '4', 'page.png', '2', '0102', '1', '', '0', '', '', null);
INSERT INTO `sys_method_info` VALUES ('01020201', '新增日志', '', 'work_arrange/myLog_add.jsp', '1', 'xzrz.png', '3', '010202', '1', null, '0', null, '', null);
INSERT INTO `sys_method_info` VALUES ('01020202', '个人日志', '', 'work_arrange/workLog.jsp', '2', 'grrz.png', '3', '010202', '1', null, '0', null, '', null);
INSERT INTO `sys_method_info` VALUES ('01020203', '共享日志', '', 'work_arrange/shareLog.jsp', '3', 'gxrz.png', '3', '010202', '1', null, '0', null, '', null);
INSERT INTO `sys_method_info` VALUES ('010203', '日程安排', '', '', '3', 'clock.png', '2', '0102', '1', null, '0', null, '', null);
INSERT INTO `sys_method_info` VALUES ('01020301', '日期显示', null, 'work_arrange/workCalender.jsp', '3', 'rqxs.png', '3', '010203', '1', null, '0', null, '', null);
INSERT INTO `sys_method_info` VALUES ('01020302', '日程列表', null, 'work_arrange/workCalender_list.jsp', '2', 'rclb.png', '3', '010203', '1', null, '0', null, '', null);
INSERT INTO `sys_method_info` VALUES ('01020303', '新增安排', null, 'work_arrange/workCalender_add.jsp', '1', 'xzap.png', '3', '010203', '1', null, '0', null, '', null);
INSERT INTO `sys_method_info` VALUES ('0103', '公司资源', '', '', '4', 'report.gif', '1', '01', '1', null, '0', null, '', null);
INSERT INTO `sys_method_info` VALUES ('010301', '知识仓库', null, null, '1', 'basket.png', '2', '0103', '1', null, '0', null, '', null);
INSERT INTO `sys_method_info` VALUES ('01030101', '知识类型', '', 'company_resources/waretype.jsp', '4', 'zslx.png', '3', '010301', '1', null, '0', null, '', null);
INSERT INTO `sys_method_info` VALUES ('01030102', '知识管理', null, 'company_resources/waremanger.jsp', '3', 'zsgl.png', '3', '010301', '1', null, '0', null, '', null);
INSERT INTO `sys_method_info` VALUES ('01030103', '知识查看', null, 'company_resources/warequery.jsp', '2', 'zsck.png', '3', '010301', '1', null, '0', null, '', null);
INSERT INTO `sys_method_info` VALUES ('01030104', '新增知识', '', 'company_resources/ware_add.jsp', '1', 'xzzs.png', '3', '010301', '1', null, '0', null, '添加知识', null);
INSERT INTO `sys_method_info` VALUES ('010302', '常用表格', null, null, '2', 'table.png', '2', '0103', '1', null, '0', null, '', null);
INSERT INTO `sys_method_info` VALUES ('01030201', '表格类型', null, 'company_resources/formstype.jsp', '4', 'bglx.png', '3', '010302', '1', null, '0', null, '', null);
INSERT INTO `sys_method_info` VALUES ('01030202', '表格管理', null, 'company_resources/formsmanger.jsp', '3', 'bggl.png', '3', '010302', '1', null, '0', null, '', null);
INSERT INTO `sys_method_info` VALUES ('01030203', '表格查看', null, 'company_resources/formsquery.jsp', '2', 'bgck.png', '3', '010302', '1', null, '0', null, '', null);
INSERT INTO `sys_method_info` VALUES ('01030204', '新增表格', '', 'company_resources/forms_add.jsp', '1', 'xzbg.png', '3', '010302', '1', null, '0', null, '添加表格', null);
INSERT INTO `sys_method_info` VALUES ('010303', '电子期刊', null, null, '3', 'flag_blue.gif', '2', '0103', '1', null, '0', null, '', null);
INSERT INTO `sys_method_info` VALUES ('01030301', '期刊类型', null, 'company_resources/journals_type.jsp', '4', 'qklx.png', '3', '010303', '1', null, '0', null, '', null);
INSERT INTO `sys_method_info` VALUES ('01030302', '期刊管理', null, 'company_resources/journals_manger.jsp', '3', 'qkgl.png', '3', '010303', '1', null, '0', null, '', null);
INSERT INTO `sys_method_info` VALUES ('01030303', '期刊查看', null, 'company_resources/journals_query.jsp', '2', 'qkck.png', '3', '010303', '1', null, '0', null, '', null);
INSERT INTO `sys_method_info` VALUES ('01030304', '新增期刊', '', 'company_resources/journals_add.jsp', '1', 'xzqk.png', '3', '010303', '1', null, '0', null, '添加期刊', null);
INSERT INTO `sys_method_info` VALUES ('010304', '公司相册', null, null, '4', 'images.png', '2', '0103', '1', null, '0', null, '', null);
INSERT INTO `sys_method_info` VALUES ('01030402', '浏览相册', null, 'company_resources/photos_albumquery.jsp', '3', 'llxc.png', '3', '010304', '1', null, '0', null, '', null);
INSERT INTO `sys_method_info` VALUES ('01030404', '创建相册', '', 'company_resources/photos_manger_add.jsp', '2', 'cjxc.png', '3', '010304', '1', null, '0', null, '创建相册 ', null);
INSERT INTO `sys_method_info` VALUES ('01030405', '新增相片', '', 'company_resources/photos_manger_addphoto.jsp', '1', 'xzxp.png', '3', '010304', '1', null, '0', null, '添加相片', null);
INSERT INTO `sys_method_info` VALUES ('01030406', '相册管理', '', 'company_resources/photos_manger.jsp', '4', 'xcgl.png', '3', '010304', '1', null, '0', null, '相册管理', null);
INSERT INTO `sys_method_info` VALUES ('010305', '规章制度', null, null, '5', 'icon_monitor_mac.gif', '2', '0103', '1', null, '0', null, '', null);
INSERT INTO `sys_method_info` VALUES ('01030501', '规章制度管理', '', 'company_resources/regulations_manger.jsp', '2', 'gzzdgl.png', '3', '010305', '1', null, '0', null, '', null);
INSERT INTO `sys_method_info` VALUES ('01030502', '新增规章制度', '', 'company_resources/regulations_add.jsp', '1', 'xzgzzd.png', '3', '010305', '1', null, '0', null, '', null);
INSERT INTO `sys_method_info` VALUES ('0104', '在线交流', 'chatter', null, '3', 'web.gif', '1', '01', '1', null, '0', null, '', null);
INSERT INTO `sys_method_info` VALUES ('010401', '通讯手册', null, null, '5', 'tongxun.png', '2', '0104', '1', null, '0', null, '', null);
INSERT INTO `sys_method_info` VALUES ('01040101', '新增联系人', '', 'communication/communications_manual_add.jsp', '1', 'xzlxr.png', '3', '010401', '1', null, '0', null, '', null);
INSERT INTO `sys_method_info` VALUES ('01040102', '联系人分组', '', 'communication/group_manage.jsp', '3', 'lxrfz.png', '3', '010401', '1', null, '0', null, '', null);
INSERT INTO `sys_method_info` VALUES ('01040103', '联系人查看', '', 'communication/communications_manual.jsp', '2', 'lxrck.png', '3', '010401', '1', null, '0', null, '', null);
INSERT INTO `sys_method_info` VALUES ('01040104', '他人共享联系人', '', 'communication/chatter_share_view.jsp', '4', 'trgxlxr.png', '3', '010401', '1', null, '0', null, '', null);
INSERT INTO `sys_method_info` VALUES ('01040105', '我共享的联系人', '', 'communication/my_share_chatters.jsp', '5', 'wgxdlxr.png', '3', '010401', '1', null, '0', null, '', null);
INSERT INTO `sys_method_info` VALUES ('010402', '讨论交流', null, null, '3', 'page_user.gif', '2', '0104', '1', null, '0', null, '', null);
INSERT INTO `sys_method_info` VALUES ('01040201', '进入版块', null, 'communication/communications_total.jsp', '1', 'page_link.png', '3', '010402', '1', null, '0', null, '', null);
INSERT INTO `sys_method_info` VALUES ('01040202', '版块管理', null, 'communication/forum_management.jsp', '5', 'page_code.png', '3', '010402', '1', null, '0', null, '', null);
INSERT INTO `sys_method_info` VALUES ('01040203', '已发帖子', null, 'communication/my_posts_manage.jsp', '3', 'yftz.png', '3', '010402', '1', null, '0', null, '', null);
INSERT INTO `sys_method_info` VALUES ('01040204', '版主权限', '', 'communication/versionManager_total.jsp', '4', 'bzqx.png', '3', '010402', '1', null, '0', null, '', null);
INSERT INTO `sys_method_info` VALUES ('01040205', '发布新帖', null, 'communication/posts_add.jsp', '2', 'fbxt.png', '3', '010402', '1', null, '0', null, '', null);
INSERT INTO `sys_method_info` VALUES ('010403', '公司投票', '', '', '6', 'plugin.png', '2', '0104', '1', null, '0', null, '', null);
INSERT INTO `sys_method_info` VALUES ('01040302', '投票管理', null, 'communication/vote_manager.jsp', '2', 'tpgl.png', '3', '010403', '1', null, '0', null, '', null);
INSERT INTO `sys_method_info` VALUES ('01040303', '发起投票', '', 'communication/vote_add.jsp', '1', 'fqtp.png', '3', '010403', '1', null, '0', null, '', null);
INSERT INTO `sys_method_info` VALUES ('010404', '公司短信', '', 'mobile_sms/sms_manage.jsp', '1', 'phone.png', '2', '0104', '1', null, '0', null, '', null);
INSERT INTO `sys_method_info` VALUES ('010405', '公司邮箱', '', 'mobile_sms/mail_manage.jsp', '2', 'email.png', '2', '0104', '1', null, '0', null, '', null);
INSERT INTO `sys_method_info` VALUES ('010406', '外部邮箱', '', 'mobile_sms/internet_mail.jsp', '2', 'netmail.png', '2', '0104', '1', null, '0', null, '', null);
INSERT INTO `sys_method_info` VALUES ('0105', '个人办公', '', '', '1', 'Coherence.png', '1', '01', '1', '', '0', '', '日常工作流程、公司信息等等在这里', null);
INSERT INTO `sys_method_info` VALUES ('010503', '在线人员', null, 'personal_work/online.jsp', '8', 'admini.gif', '2', '0105', '1', null, '0', null, '', null);
INSERT INTO `sys_method_info` VALUES ('010504', '常用工具', null, 'personal_work/commentools.jsp', '9', 'server.png', '2', '0105', '1', null, '0', null, '', null);
INSERT INTO `sys_method_info` VALUES ('010505', '网络磁盘', null, 'netdisk/netdisk.jsp#', '5', 'data.gif', '2', '0105', '1', null, '0', null, '', null);
INSERT INTO `sys_method_info` VALUES ('010506', '工作便签', '', 'personal_work/notebook.jsp', '3', 'notebook.png', '2', '0105', '1', '', '0', '', '使用便签、不忘事儿', null);
INSERT INTO `sys_method_info` VALUES ('010507', '公司信息', null, 'personal_work/company_info.jsp', '7', 'uwa.gif', '2', '0105', '1', null, '0', null, '', null);
INSERT INTO `sys_method_info` VALUES ('010508', '定时提醒', null, 'personal_work/timed_manager.jsp', '4', 'stimer.png', '2', '0105', '1', null, '0', null, '', null);
INSERT INTO `sys_method_info` VALUES ('010509', '公司投票', '', 'communication/vote_total_pager.jsp', '6', 'plugin.png', '2', '0105', '1', null, '0', null, '', null);
INSERT INTO `sys_method_info` VALUES ('0106', '行政办公', null, null, '4', 'chart_organisation.png', '1', '01', '1', null, '0', null, '', null);
INSERT INTO `sys_method_info` VALUES ('010601', '公司会议', null, null, '1', 'script.png', '2', '0106', '1', null, '0', null, '', null);
INSERT INTO `sys_method_info` VALUES ('01060101', '会议查看', null, 'office_resources/mymeeting.jsp', '2', null, '3', '010601', '1', null, '0', null, '', null);
INSERT INTO `sys_method_info` VALUES ('01060102', '会议纪要', null, 'office_resources/meet_summary.jsp', '3', 'page_edit.png', '3', '010601', '1', null, '0', null, '', null);
INSERT INTO `sys_method_info` VALUES ('01060105', '会议室管理', null, 'office_resources/boadroom.jsp', '4', null, '3', '010601', '1', null, '0', null, '', null);
INSERT INTO `sys_method_info` VALUES ('01060106', '会议召开', '', 'office_resources/meetapply_add.jsp', '1', 'script.png', '3', '010601', '1', null, '0', null, '', null);
INSERT INTO `sys_method_info` VALUES ('010602', '公司车辆', '', '', '2', 'lorry.png', '2', '0106', '1', null, '0', null, '', null);
INSERT INTO `sys_method_info` VALUES ('01060201', '车辆管理', null, 'office_resources/car.jsp', '5', 'clgl.png', '3', '010602', '1', null, '0', null, '', null);
INSERT INTO `sys_method_info` VALUES ('01060203', '车辆使用登记', '', 'office_resources/car_use_add.jsp', '2', 'clsydj.png', '3', '010602', '1', null, '0', null, '使用申请 车辆 每个员工都可以 进行申请', null);
INSERT INTO `sys_method_info` VALUES ('01060204', '车辆查看', '', 'office_resources/seletcar.jsp', '1', 'clck.png', '3', '010602', '1', null, '0', null, '', null);
INSERT INTO `sys_method_info` VALUES ('01060205', '使用登记管理', '', 'office_resources/car_app.jsp', '3', 'sydj.png', '3', '010602', '1', null, '0', null, '申请管理 个人', null);
INSERT INTO `sys_method_info` VALUES ('01060206', '车辆使用情况', '', 'office_resources/applycase_car.jsp', '4', 'clsyqk.png', '3', '010602', '1', null, '0', null, '', null);
INSERT INTO `sys_method_info` VALUES ('010604', '公司图书', null, null, '4', 'Book_phones.png', '2', '0106', '1', null, '0', null, '', null);
INSERT INTO `sys_method_info` VALUES ('01060401', '图书类别', null, 'office_resources/book_type.jsp', '6', 'tslb.png', '3', '010604', '1', null, '0', null, '', null);
INSERT INTO `sys_method_info` VALUES ('01060402', '图书管理', null, 'office_resources/book.jsp', '5', 'tsgl.png', '3', '010604', '1', null, '0', null, '', null);
INSERT INTO `sys_method_info` VALUES ('01060403', '借/还历史', null, 'office_resources/book_history.jsp', '4', 'jhls.png', '3', '010604', '1', null, '0', null, '', null);
INSERT INTO `sys_method_info` VALUES ('01060404', '图书查看', null, 'office_resources/book_info.jsp', '1', 'tsck.png', '3', '010604', '1', null, '0', null, '', null);
INSERT INTO `sys_method_info` VALUES ('01060405', '出借图书', null, 'office_resources/book_br_add.jsp', '2', 'cjts.png', '3', '010604', '1', null, '0', null, '', null);
INSERT INTO `sys_method_info` VALUES ('01060406', '归还图书', null, 'office_resources/book_back.jsp', '3', 'ghts.png', '3', '010604', '1', null, '0', null, '', null);
INSERT INTO `sys_method_info` VALUES ('0107', '日常工作', '', '', '0', 'application_form.png', '1', '01', '1', '', '0', '', '', '');
INSERT INTO `sys_method_info` VALUES ('010701', '新建工作', '', 'personal_work/flow_list.jsp', '1', 'application_form_add.png', '2', '0107', '1', '', '0', '', '', '');
INSERT INTO `sys_method_info` VALUES ('010702', '待办工作', '', 'personal_work/flow_todo.jsp', '2', 'application_form_edit.png', '2', '0107', '1', '', '0', '', '', '');
INSERT INTO `sys_method_info` VALUES ('010703', '工作查询', '', 'personal_work/flow_query.jsp', '3', 'application_form_magnify.png', '2', '0107', '1', '', '0', '', '', '');
INSERT INTO `sys_method_info` VALUES ('010704', '工作管理', '', 'personal_work/flow_manage.jsp', '4', 'application_form.png', '2', '0107', '1', '', '0', '', '', '');
INSERT INTO `sys_method_info` VALUES ('02', '人力资源', '', 'center.jsp', '3', '3.png', '-1', '-1', '1', 'renli', null, null, '公司人力资源部门管理员工、日常考核进行管理', null);
INSERT INTO `sys_method_info` VALUES ('0201', '组织机构', null, null, '1', 'rosette.png', '1', '02', '1', null, '0', null, '', null);
INSERT INTO `sys_method_info` VALUES ('020101', '新增机构', '', 'hrm/department_add.jsp', '1', 'xzjg.png', '2', '0201', '1', null, '0', null, '', null);
INSERT INTO `sys_method_info` VALUES ('020102', '机构查看', '', 'hrm/department_view.jsp', '2', 'jggl.png', '2', '0201', '1', '', '0', '', '', null);
INSERT INTO `sys_method_info` VALUES ('020103', '机构管理', null, 'hrm/department.jsp', '3', 'jggl.png', '2', '0201', '1', null, '0', null, '', null);
INSERT INTO `sys_method_info` VALUES ('0202', '人事管理', null, null, '2', 'web-.gif', '1', '02', '1', null, '0', null, '', null);
INSERT INTO `sys_method_info` VALUES ('020201', '新增人员', '', 'hrm/employee_add.jsp', '1', 'xzry.png', '2', '0202', '1', '', '0', '', '', 'employee_add.jsp');
INSERT INTO `sys_method_info` VALUES ('020202', '人员查询', '', 'hrm/employee_query.jsp', '2', 'rygl.png', '2', '0202', '1', '', '0', '', '', null);
INSERT INTO `sys_method_info` VALUES ('020203', '人员管理', '', 'hrm/employee.jsp', '3', 'rygl.png', '2', '0202', '1', '', '0', '', '', '');
INSERT INTO `sys_method_info` VALUES ('020204', '人员岗位设置', '', 'hrm/employee_post.jsp', '4', 'rygwsz.png', '2', '0202', '1', '', '0', '', '', null);
INSERT INTO `sys_method_info` VALUES ('020205', '人员导入', '', 'hrm/employee_import.jsp', '5', 'rygwsz.png', '2', '0202', '1', '', '0', '', '', null);
INSERT INTO `sys_method_info` VALUES ('0203', '工作岗位', null, null, '3', 'webcam.png', '1', '02', '1', null, '0', null, '', null);
INSERT INTO `sys_method_info` VALUES ('020301', '新增岗位', '', 'hrm/post_add.jsp', '1', 'xzgw.png', '2', '0203', '1', null, '0', null, '', null);
INSERT INTO `sys_method_info` VALUES ('020302', '岗位查询', null, 'hrm/post_query.jsp', '2', null, '2', '0203', '2', null, '0', null, null, null);
INSERT INTO `sys_method_info` VALUES ('020303', '岗位管理', null, 'hrm/post_manger.jsp', '3', 'gwgl.png', '2', '0203', '1', null, '0', null, '', null);
INSERT INTO `sys_method_info` VALUES ('0204', '工作地区', '', '', '4', 'bricks.png', '1', '02', '1', null, '0', null, '', null);
INSERT INTO `sys_method_info` VALUES ('020401', '新增地区', '', 'hrm/work_address_add.jsp', '1', 'xzdq.png', '2', '0204', '1', null, '0', null, '', null);
INSERT INTO `sys_method_info` VALUES ('020402', '工作地区查询', '', 'hrm/work_address_info.jsp', '2', 'page_url.gif', '2', '0204', '2', null, '0', null, '', null);
INSERT INTO `sys_method_info` VALUES ('020403', '工作地区管理', '', 'hrm/employee_workarea.jsp', '3', 'gzdqgl.png', '2', '0204', '1', null, '0', null, '', null);
INSERT INTO `sys_method_info` VALUES ('0205', '合同管理', '', 'hrm/contract_manage.jsp', '5', 'file.png', '1', '02', '1', '', '0', null, '', '');
INSERT INTO `sys_method_info` VALUES ('020501', '新增合同', '', 'hrm/contract_add.jsp', '1', 'file.png', '2', '0205', '1', '', '0', null, '', '');
INSERT INTO `sys_method_info` VALUES ('020502', '合同查看', '', 'hrm/contract_manage.jsp', '2', 'file.png', '2', '0205', '1', '', '0', null, '', '');
INSERT INTO `sys_method_info` VALUES ('020503', '合同类型管理', '', 'hrm/contract_type_manage.jsp', '3', 'file.png', '2', '0205', '1', '', '0', null, '', '');
INSERT INTO `sys_method_info` VALUES ('03', '系统设置', '', '', '3', '2.png', '-1', '-1', '1', '', '0', '', '', '');
INSERT INTO `sys_method_info` VALUES ('0301', '环境配置', null, null, '1', 'group_blue.png', '1', '03', '1', null, '0', null, '', null);
INSERT INTO `sys_method_info` VALUES ('030101', '业务字典', null, 'system_set/libraryset.jsp', '1', 'sjzd.png', '2', '0301', '1', null, '0', null, '', '');
INSERT INTO `sys_method_info` VALUES ('030102', '参数设置', null, 'system_set/paramset.jsp', '2', 'cssz.png', '2', '0301', '1', null, '0', null, '', null);
INSERT INTO `sys_method_info` VALUES ('030103', '系统显示', '', 'system_set/company_login.jsp', '3', 'xtxs.png', '2', '0301', '1', null, '0', null, '设置公司标志', null);
INSERT INTO `sys_method_info` VALUES ('030104', '磁盘设置', '', 'personal_work/diskemployee.jsp', '4', 'cpsz.png', '2', '0301', '1', null, '0', null, '网络磁盘设置大小', null);
INSERT INTO `sys_method_info` VALUES ('030105', '标准代码', '', 'system_set/libraryset_standard.jsp', '5', 'sjzd.png', '2', '0301', '1', '', '0', '', '国家标准或者行业标准的一些代码、编号等等', null);
INSERT INTO `sys_method_info` VALUES ('0302', '权限设置', null, null, '4', 'transmit.png', '1', '03', '1', null, '0', null, '', null);
INSERT INTO `sys_method_info` VALUES ('030201', '设置权限', null, 'system_set/premmset.jsp', '1', 'szqx.png', '2', '0302', '1', null, '0', null, '', null);
INSERT INTO `sys_method_info` VALUES ('030202', '查询权限', null, 'system_set/premmquery.jsp', '2', 'cxqx.png', '2', '0302', '1', null, '0', null, '', null);
INSERT INTO `sys_method_info` VALUES ('0303', '用户管理', null, null, '2', 'page_user.gif', '1', '03', '1', null, '0', null, '', null);
INSERT INTO `sys_method_info` VALUES ('030301', '用户设置', null, 'system_set/user_manger.jsp', '1', 'yhsz.png', '2', '0303', '1', null, '0', null, '', null);
INSERT INTO `sys_method_info` VALUES ('030302', '登录名密码', null, 'system_set/userset.jsp', '2', 'dlmmm.png', '2', '0303', '1', null, '0', null, '', null);
INSERT INTO `sys_method_info` VALUES ('030303', '用户编组', null, 'system_set/usergroupset.jsp', '3', 'yhbz.png', '2', '0303', '1', null, '0', null, '', null);
INSERT INTO `sys_method_info` VALUES ('0304', '角色管理', null, null, '3', 'page_user_light.gif', '1', '03', '1', null, '0', null, '', null);
INSERT INTO `sys_method_info` VALUES ('030401', '创建角色', null, 'system_set/roleset_add.jsp', '1', 'cjjs.png', '2', '0304', '1', null, '0', null, '', null);
INSERT INTO `sys_method_info` VALUES ('030402', '角色查询', null, 'system_set/roleset.jsp', '2', 'jscx.png', '2', '0304', '1', null, '0', null, '', null);
INSERT INTO `sys_method_info` VALUES ('0305', '流程管理', null, null, '5', 'page_tag_blue.gif', '1', '03', '1', null, '0', null, '', null);
INSERT INTO `sys_method_info` VALUES ('030502', '流程部署', '', 'system_set/process.jsp', '2', 'cxsplc.png', '2', '0305', '1', '', '0', '', '', '');
INSERT INTO `sys_method_info` VALUES ('030503', '流程用户组', null, 'system_set/process_group.jsp', '3', 'cxsplc.png', '2', '0305', '1', null, '0', null, '', null);
INSERT INTO `sys_method_info` VALUES ('030504', '流程用户编组', null, 'system_set/process_user.jsp', '4', 'cxsplc.png', '2', '0305', '1', null, '0', null, '', null);
INSERT INTO `sys_method_info` VALUES ('030505', '运行中的流程', null, 'system_set/process_running.jsp', '5', 'cxsplc.png', '2', '0305', '1', null, '0', null, '', null);
INSERT INTO `sys_method_info` VALUES ('030506', '历史流程', null, 'system_set/process_history.jsp', '6', 'cxsplc.png', '2', '0305', '1', null, '0', null, '', null);
INSERT INTO `sys_method_info` VALUES ('030507', '流程分类', '', 'system_set/process_type_manage.jsp', '7', 'cxsplc.png', '2', '0305', '1', '', '0', '', '', '');
INSERT INTO `sys_method_info` VALUES ('0306', '操作日志', null, null, '7', 'note.gif', '1', '03', '1', null, '0', null, '', null);
INSERT INTO `sys_method_info` VALUES ('030601', '日志查询', '', 'system_set/syslog.jsp', '1', 'rzcx.png', '2', '0306', '1', '', '0', '', '', 'syslog.jsp');
INSERT INTO `sys_method_info` VALUES ('0307', '系统管理', null, null, '6', 'hcard.png', '1', '03', '1', null, '0', null, '', null);
INSERT INTO `sys_method_info` VALUES ('030703', '公告管理', '', 'issue_info/announcement_info.jsp', '3', 'gggl.png', '2', '0307', '1', null, '0', null, '', null);
INSERT INTO `sys_method_info` VALUES ('030704', '知识管理', '', 'company_resources/superwaremanger.jsp', '4', 'zsgl.png', '2', '0307', '1', null, '0', null, '知识管理', null);
INSERT INTO `sys_method_info` VALUES ('030705', '表格管理', '', 'company_resources/superformsmanger.jsp', '5', 'bggl.png', '2', '0307', '1', null, '0', null, '表格管理', null);
INSERT INTO `sys_method_info` VALUES ('030706', '期刊管理', '', 'company_resources/superjournals_manger.jsp', '6', 'qkgl.png', '2', '0307', '1', null, '0', null, '期刊管理', null);
INSERT INTO `sys_method_info` VALUES ('030707', '通知管理', '', 'issue_info/notice_info.jsp', '7', 'tzgl.png', '2', '0307', '1', null, '0', null, '', null);
INSERT INTO `sys_method_info` VALUES ('030708', '车辆使用管理', '', 'office_resources/car_use.jsp', '8', 'clsydj.png', '2', '0307', '1', null, '0', null, '申请管理 管理员', null);
INSERT INTO `sys_method_info` VALUES ('030709', '车辆状态管理', '', 'office_resources/supercar.jsp', '9', 'clgl.png', '2', '0307', '1', null, '0', null, '', null);
INSERT INTO `sys_method_info` VALUES ('030710', '会议管理', '', 'office_resources/meet_manage.jsp', '10', 'hygl.png', '2', '0307', '1', null, '0', null, '', null);
INSERT INTO `sys_method_info` VALUES ('030711', '相册管理', '', 'company_resources/superphotos_manger.jsp', '11', 'xcgl.png', '2', '0307', '1', null, '0', null, '', null);
INSERT INTO `sys_method_info` VALUES ('030712', '投票管理', '', 'communication/admin_vote_manager.jsp', '12', 'tpgl.png', '2', '0307', '1', null, '0', null, '', null);
INSERT INTO `sys_method_info` VALUES ('030713', '记事管理', '', 'issue_info/adversaria_manager.jsp', '13', 'jsgl.png', '2', '0307', '1', null, '0', null, '', null);
INSERT INTO `sys_method_info` VALUES ('030714', '代码生成', null, 'code_create/code_create.jsp', '14', 'ast_order.gif', '2', '0307', '1', null, '0', null, '', null);
INSERT INTO `sys_method_info` VALUES ('030715', '请假管理', '', 'personal_work/leave_manage_super.jsp', '1', 'file.png', '2', '0307', '1', '', '0', '', '', '');
INSERT INTO `sys_method_info` VALUES ('030716', '出差管理', '', 'personal_work/trsvel_manage_super.jsp', '2', 'file.png', '2', '0307', '1', '', '0', '', '', '');
INSERT INTO `sys_method_info` VALUES ('0308', '前端管理', '', '', '8', 'file.png', '1', '03', '1', '', '0', null, '', '');
INSERT INTO `sys_method_info` VALUES ('030801', '注册用户', '', 'system_front/member_manage.jsp', '1', 'file.png', '2', '0308', '1', '', '0', null, '', '');
INSERT INTO `sys_method_info` VALUES ('030802', '新闻管理', '', 'system_front/news_manage.jsp', '2', 'file.png', '2', '0308', '1', '', '0', null, '', '');
INSERT INTO `sys_method_info` VALUES ('030803', '项目管理', '', 'system_front/project_manage.jsp', '3', 'file.png', '2', '0308', '1', '', '0', null, '', '');
INSERT INTO `sys_method_shortcut` VALUES ('201', '00010201', '182013072730040551054', '18', '2');
INSERT INTO `sys_method_shortcut` VALUES ('202', '00010202', '182013072730040551054', '18', '2');
INSERT INTO `sys_method_shortcut` VALUES ('208', '020101', '182013072730040551054', '18', '2');
INSERT INTO `sys_method_shortcut` VALUES ('210', '000506', '182013072730040551054', '18', '2');
INSERT INTO `sys_method_shortcut` VALUES ('212', '020204', '182013072730040551054', '18', '2');
INSERT INTO `sys_method_shortcut` VALUES ('216', '020203', '182013072730040551054', '18', '1');
INSERT INTO `sys_method_shortcut` VALUES ('219', '00010301', '182013072730040551054', '18', '2');
INSERT INTO `sys_method_shortcut` VALUES ('220', '00080101', '182013072730040551054', '18', '2');
INSERT INTO `sys_method_shortcut` VALUES ('223', '020203', '182013072931083905862', '18', '2');
INSERT INTO `sys_method_shortcut` VALUES ('224', '00080101', '182013072931083905862', '18', '2');
INSERT INTO `sys_method_shortcut` VALUES ('225', '00080105', '182013072730040551054', '18', '2');
INSERT INTO `sys_method_shortcut` VALUES ('227', '00080301', '182013072730040551054', '18', '2');
INSERT INTO `sys_method_shortcut` VALUES ('228', '0301', '182013052121033133083', '18', '2');
INSERT INTO `sys_method_shortcut` VALUES ('232', '020204', '182013072931083905862', '18', '2');
INSERT INTO `sys_method_shortcut` VALUES ('233', '020201', '182013072931083905862', '18', '2');
INSERT INTO `sys_method_shortcut` VALUES ('234', '00030304', '182013072931083905862', '18', '2');
INSERT INTO `sys_method_shortcut` VALUES ('235', '020303', '182013072931083905862', '18', '2');
INSERT INTO `sys_method_shortcut` VALUES ('245', '020103', '182013072730040551054', '18', '2');
INSERT INTO `sys_method_shortcut` VALUES ('247', '00020303', '182013072730040551054', '18', '2');
INSERT INTO `sys_method_shortcut` VALUES ('252', '00050102', '182013072730085454643', '18', '2');
INSERT INTO `sys_method_shortcut` VALUES ('254', '00050103', '182013072730040551054', '18', '2');
INSERT INTO `sys_method_shortcut` VALUES ('255', '020502', '182013072730040551054', '18', '2');
INSERT INTO `sys_method_shortcut` VALUES ('266', '00050102', '182013072931083905862', '18', '2');
INSERT INTO `sys_method_shortcut` VALUES ('267', '020101', '182013072931083905862', '18', '2');
INSERT INTO `sys_method_shortcut` VALUES ('268', '000506', '182013052121033133083', '18', '2');
INSERT INTO `sys_method_shortcut` VALUES ('269', '020203', '182013052121033133083', '18', '2');
INSERT INTO `sys_method_shortcut` VALUES ('270', '00080301', '182013052121033133083', '18', '2');
INSERT INTO `sys_method_shortcut` VALUES ('271', '00080302', '182013052121033133083', '18', '2');
INSERT INTO `sys_method_shortcut` VALUES ('272', '00010202', '182013052121033133083', '18', '2');
INSERT INTO `sys_method_shortcut` VALUES ('273', '00080714', '182013052121033133083', '18', '2');
INSERT INTO `sys_param` VALUES ('1', 'erp.user.PwdLen', '添加用户时密码最短长度', '6', '控制用户添加时的密码长度', '-1', '2010-03-11 13:49:24', '-1', '2010-03-11 18:01:57', '1', '2', '6-18');
INSERT INTO `sys_param` VALUES ('2', 'erp.msg.callTime', '审批提醒时间间隔', '5', '系统提醒时间间隔，单位为(分)', '-1', '2010-03-11 14:28:07', '-1', '2010-04-26 09:15:06', '1', '2', '1-30');
INSERT INTO `sys_param` VALUES ('3', 'erp.user.initPwd', '添加用户初始密码', '111111', '添加用户时默认密码，应配合初始密码长度应用', '-1', '2010-03-11 14:30:26', '-1', '2010-03-11 18:02:07', '1', '1', '6');
INSERT INTO `sys_param` VALUES ('4', 'erp.grid.pageSize', '页面表格中默认显示的记录行数', '30', '控制页面表格显示的默认行数', '-1', '2010-03-11 14:31:48', '-1', '2010-03-11 17:54:54', '1', '3', '10,20,30,50,80');
INSERT INTO `sys_param` VALUES ('5', 'erp.grid.imgViewCk', '使用表格的图形视图时默认是否显示详细信息', '是', '视图显示时是否默认选中显示图片详细信息', '-1', '2010-03-11 14:34:36', '-1', '2010-03-11 17:54:54', '1', '3', '是,否');
INSERT INTO `sys_param` VALUES ('7', 'erp.Net.Disk', '默认磁盘大小', '50', '共享磁盘大小', '-1', '2010-03-26 11:31:26', '-1', '2010-03-26 11:31:26', '1', '2', '5-500');
INSERT INTO `sys_param` VALUES ('365', 'erp.user.PwdLen', '添加用户时密码最短长度', '6', '控制用户添加时的密码长度', '-1', '2010-03-11 13:49:24', '182013052121033133083', '2014-08-12 19:49:35', '18', '2', '6-18');
INSERT INTO `sys_param` VALUES ('366', 'erp.msg.callTime', '审批提醒时间间隔', '5', '系统提醒时间间隔，单位为(分)', '-1', '2010-03-11 14:28:07', '182013052121033133083', '2014-08-12 19:49:35', '18', '2', '1-30');
INSERT INTO `sys_param` VALUES ('367', 'erp.user.initPwd', '添加用户初始密码', '111111', '添加用户时默认密码，应配合初始密码长度应用', '-1', '2010-03-11 14:30:26', '182013052121033133083', '2014-08-12 19:49:35', '18', '1', '6');
INSERT INTO `sys_param` VALUES ('368', 'erp.grid.pageSize', '页面表格中默认显示的记录行数', '50', '控制页面表格显示的默认行数', '-1', '2010-03-11 14:31:48', '182013052121033133083', '2014-08-12 19:49:35', '18', '3', '10,20,30,50,80');
INSERT INTO `sys_param` VALUES ('369', 'erp.grid.imgViewCk', '使用表格的图形视图时默认是否显示详细信息', '是', '视图显示时是否默认选中显示图片详细信息', '-1', '2010-03-11 14:34:36', '182013052121033133083', '2014-08-12 19:49:35', '18', '3', '是,否');
INSERT INTO `sys_param` VALUES ('371', 'erp.Net.Disk', '默认磁盘大小', '50', '共享磁盘大小', '-1', '2010-03-26 11:31:26', '182013052121033133083', '2014-08-12 19:49:35', '18', '2', '5-500');
INSERT INTO `sys_process_config` VALUES ('leave:1:2504', 'A7183995-C46F-4046-BFF9-A3A190F8CB88', '', 'personal_work/leave_add.jsp', 'personal_work/leave_handle.jsp', 'personal_work/leave_detail.jsp');
INSERT INTO `sys_process_config` VALUES ('trsvel:1:2531', 'A7183995-C46F-4046-BFF9-A3A190F8CB88', '', 'personal_work/trsvel_add.jsp', 'personal_worktrsvel_handle.jsp', 'personal_work/trsvel_detail.jsp');
INSERT INTO `sys_process_type` VALUES ('5179FFD3-62AE-499B-8288-112A3D25E646', '市场部流程', '', '2', '182013052121033133083', '2014-07-29 09:48:22', '182013052121033133083', '2014-07-29 09:48:22');
INSERT INTO `sys_process_type` VALUES ('A0D028DD-17E1-4D58-AFB6-AF1E6B64803C', '财务部流程', '', '3', null, null, '182013052121033133083', '2014-07-29 11:02:35');
INSERT INTO `sys_process_type` VALUES ('A7183995-C46F-4046-BFF9-A3A190F8CB88', '常用流程', '', '1', null, null, '182013052121033133083', '2014-07-29 10:51:24');
INSERT INTO `sys_role` VALUES ('1', '总经理', '', '182013052121033133083', '2014-07-10 10:54:16', '182013052121033133083', '2014-09-13 11:03:44', '18');
INSERT INTO `sys_role` VALUES ('2', '项目总负责人', '		', '182013052121033133083', '2014-09-13 11:04:41', '182013072730085454643', '2014-10-23 13:59:17', '18');
INSERT INTO `sys_role_bind` VALUES ('2', '1', '1', '18', '52');
INSERT INTO `sys_role_bind` VALUES ('6', '1', '2', '18', '52');
INSERT INTO `sys_role_detail` VALUES ('151', '1', '00', '18');
INSERT INTO `sys_role_detail` VALUES ('152', '1', '0001', '18');
INSERT INTO `sys_role_detail` VALUES ('153', '1', '000102', '18');
INSERT INTO `sys_role_detail` VALUES ('154', '1', '00010201', '18');
INSERT INTO `sys_role_detail` VALUES ('155', '1', '00010202', '18');
INSERT INTO `sys_role_detail` VALUES ('156', '1', '000103', '18');
INSERT INTO `sys_role_detail` VALUES ('157', '1', '00010301', '18');
INSERT INTO `sys_role_detail` VALUES ('158', '1', '00010302', '18');
INSERT INTO `sys_role_detail` VALUES ('159', '1', '000104', '18');
INSERT INTO `sys_role_detail` VALUES ('160', '1', '00010401', '18');
INSERT INTO `sys_role_detail` VALUES ('161', '1', '00010402', '18');
INSERT INTO `sys_role_detail` VALUES ('162', '1', '0002', '18');
INSERT INTO `sys_role_detail` VALUES ('163', '1', '000202', '18');
INSERT INTO `sys_role_detail` VALUES ('164', '1', '00020201', '18');
INSERT INTO `sys_role_detail` VALUES ('165', '1', '00020202', '18');
INSERT INTO `sys_role_detail` VALUES ('166', '1', '00020203', '18');
INSERT INTO `sys_role_detail` VALUES ('167', '1', '000203', '18');
INSERT INTO `sys_role_detail` VALUES ('168', '1', '00020301', '18');
INSERT INTO `sys_role_detail` VALUES ('169', '1', '00020302', '18');
INSERT INTO `sys_role_detail` VALUES ('170', '1', '00020303', '18');
INSERT INTO `sys_role_detail` VALUES ('171', '1', '0003', '18');
INSERT INTO `sys_role_detail` VALUES ('172', '1', '000301', '18');
INSERT INTO `sys_role_detail` VALUES ('173', '1', '00030101', '18');
INSERT INTO `sys_role_detail` VALUES ('174', '1', '00030102', '18');
INSERT INTO `sys_role_detail` VALUES ('175', '1', '00030103', '18');
INSERT INTO `sys_role_detail` VALUES ('176', '1', '00030104', '18');
INSERT INTO `sys_role_detail` VALUES ('177', '1', '000302', '18');
INSERT INTO `sys_role_detail` VALUES ('178', '1', '00030201', '18');
INSERT INTO `sys_role_detail` VALUES ('179', '1', '00030202', '18');
INSERT INTO `sys_role_detail` VALUES ('180', '1', '00030203', '18');
INSERT INTO `sys_role_detail` VALUES ('181', '1', '00030204', '18');
INSERT INTO `sys_role_detail` VALUES ('182', '1', '000303', '18');
INSERT INTO `sys_role_detail` VALUES ('183', '1', '00030301', '18');
INSERT INTO `sys_role_detail` VALUES ('184', '1', '00030302', '18');
INSERT INTO `sys_role_detail` VALUES ('185', '1', '00030303', '18');
INSERT INTO `sys_role_detail` VALUES ('186', '1', '00030304', '18');
INSERT INTO `sys_role_detail` VALUES ('187', '1', '000304', '18');
INSERT INTO `sys_role_detail` VALUES ('188', '1', '00030402', '18');
INSERT INTO `sys_role_detail` VALUES ('189', '1', '00030404', '18');
INSERT INTO `sys_role_detail` VALUES ('190', '1', '00030405', '18');
INSERT INTO `sys_role_detail` VALUES ('191', '1', '00030406', '18');
INSERT INTO `sys_role_detail` VALUES ('192', '1', '000305', '18');
INSERT INTO `sys_role_detail` VALUES ('193', '1', '00030501', '18');
INSERT INTO `sys_role_detail` VALUES ('194', '1', '00030502', '18');
INSERT INTO `sys_role_detail` VALUES ('195', '1', '0004', '18');
INSERT INTO `sys_role_detail` VALUES ('196', '1', '000401', '18');
INSERT INTO `sys_role_detail` VALUES ('197', '1', '00040101', '18');
INSERT INTO `sys_role_detail` VALUES ('198', '1', '00040102', '18');
INSERT INTO `sys_role_detail` VALUES ('199', '1', '00040103', '18');
INSERT INTO `sys_role_detail` VALUES ('200', '1', '00040104', '18');
INSERT INTO `sys_role_detail` VALUES ('201', '1', '00040105', '18');
INSERT INTO `sys_role_detail` VALUES ('202', '1', '000402', '18');
INSERT INTO `sys_role_detail` VALUES ('203', '1', '00040201', '18');
INSERT INTO `sys_role_detail` VALUES ('204', '1', '00040202', '18');
INSERT INTO `sys_role_detail` VALUES ('205', '1', '00040203', '18');
INSERT INTO `sys_role_detail` VALUES ('206', '1', '00040204', '18');
INSERT INTO `sys_role_detail` VALUES ('207', '1', '00040205', '18');
INSERT INTO `sys_role_detail` VALUES ('208', '1', '000403', '18');
INSERT INTO `sys_role_detail` VALUES ('209', '1', '00040302', '18');
INSERT INTO `sys_role_detail` VALUES ('210', '1', '00040303', '18');
INSERT INTO `sys_role_detail` VALUES ('211', '1', '000404', '18');
INSERT INTO `sys_role_detail` VALUES ('212', '1', '000405', '18');
INSERT INTO `sys_role_detail` VALUES ('213', '1', '000406', '18');
INSERT INTO `sys_role_detail` VALUES ('214', '1', '0005', '18');
INSERT INTO `sys_role_detail` VALUES ('215', '1', '000503', '18');
INSERT INTO `sys_role_detail` VALUES ('216', '1', '000504', '18');
INSERT INTO `sys_role_detail` VALUES ('217', '1', '000505', '18');
INSERT INTO `sys_role_detail` VALUES ('218', '1', '000506', '18');
INSERT INTO `sys_role_detail` VALUES ('219', '1', '000507', '18');
INSERT INTO `sys_role_detail` VALUES ('220', '1', '000508', '18');
INSERT INTO `sys_role_detail` VALUES ('221', '1', '000509', '18');
INSERT INTO `sys_role_detail` VALUES ('222', '1', '0006', '18');
INSERT INTO `sys_role_detail` VALUES ('223', '1', '000601', '18');
INSERT INTO `sys_role_detail` VALUES ('224', '1', '00060101', '18');
INSERT INTO `sys_role_detail` VALUES ('225', '1', '00060102', '18');
INSERT INTO `sys_role_detail` VALUES ('226', '1', '00060105', '18');
INSERT INTO `sys_role_detail` VALUES ('227', '1', '00060106', '18');
INSERT INTO `sys_role_detail` VALUES ('228', '1', '000602', '18');
INSERT INTO `sys_role_detail` VALUES ('229', '1', '00060201', '18');
INSERT INTO `sys_role_detail` VALUES ('230', '1', '00060203', '18');
INSERT INTO `sys_role_detail` VALUES ('231', '1', '00060204', '18');
INSERT INTO `sys_role_detail` VALUES ('232', '1', '00060205', '18');
INSERT INTO `sys_role_detail` VALUES ('233', '1', '00060206', '18');
INSERT INTO `sys_role_detail` VALUES ('234', '1', '000604', '18');
INSERT INTO `sys_role_detail` VALUES ('235', '1', '00060401', '18');
INSERT INTO `sys_role_detail` VALUES ('236', '1', '00060402', '18');
INSERT INTO `sys_role_detail` VALUES ('237', '1', '00060403', '18');
INSERT INTO `sys_role_detail` VALUES ('238', '1', '00060404', '18');
INSERT INTO `sys_role_detail` VALUES ('239', '1', '00060405', '18');
INSERT INTO `sys_role_detail` VALUES ('240', '1', '00060406', '18');
INSERT INTO `sys_role_detail` VALUES ('241', '1', '0008', '18');
INSERT INTO `sys_role_detail` VALUES ('242', '1', '000801', '18');
INSERT INTO `sys_role_detail` VALUES ('243', '1', '00080101', '18');
INSERT INTO `sys_role_detail` VALUES ('244', '1', '00080102', '18');
INSERT INTO `sys_role_detail` VALUES ('245', '1', '00080103', '18');
INSERT INTO `sys_role_detail` VALUES ('246', '1', '00080104', '18');
INSERT INTO `sys_role_detail` VALUES ('247', '1', '00080105', '18');
INSERT INTO `sys_role_detail` VALUES ('248', '1', '000802', '18');
INSERT INTO `sys_role_detail` VALUES ('249', '1', '00080201', '18');
INSERT INTO `sys_role_detail` VALUES ('250', '1', '00080202', '18');
INSERT INTO `sys_role_detail` VALUES ('251', '1', '000803', '18');
INSERT INTO `sys_role_detail` VALUES ('252', '1', '00080301', '18');
INSERT INTO `sys_role_detail` VALUES ('253', '1', '00080302', '18');
INSERT INTO `sys_role_detail` VALUES ('254', '1', '00080303', '18');
INSERT INTO `sys_role_detail` VALUES ('255', '1', '000804', '18');
INSERT INTO `sys_role_detail` VALUES ('256', '1', '00080401', '18');
INSERT INTO `sys_role_detail` VALUES ('257', '1', '00080402', '18');
INSERT INTO `sys_role_detail` VALUES ('258', '1', '000805', '18');
INSERT INTO `sys_role_detail` VALUES ('259', '1', '00080502', '18');
INSERT INTO `sys_role_detail` VALUES ('260', '1', '00080503', '18');
INSERT INTO `sys_role_detail` VALUES ('261', '1', '00080504', '18');
INSERT INTO `sys_role_detail` VALUES ('262', '1', '00080505', '18');
INSERT INTO `sys_role_detail` VALUES ('263', '1', '00080506', '18');
INSERT INTO `sys_role_detail` VALUES ('264', '1', '000806', '18');
INSERT INTO `sys_role_detail` VALUES ('265', '1', '00080601', '18');
INSERT INTO `sys_role_detail` VALUES ('266', '1', '000807', '18');
INSERT INTO `sys_role_detail` VALUES ('267', '1', '00080703', '18');
INSERT INTO `sys_role_detail` VALUES ('268', '1', '00080704', '18');
INSERT INTO `sys_role_detail` VALUES ('269', '1', '00080705', '18');
INSERT INTO `sys_role_detail` VALUES ('270', '1', '00080706', '18');
INSERT INTO `sys_role_detail` VALUES ('271', '1', '00080707', '18');
INSERT INTO `sys_role_detail` VALUES ('272', '1', '00080708', '18');
INSERT INTO `sys_role_detail` VALUES ('273', '1', '00080709', '18');
INSERT INTO `sys_role_detail` VALUES ('274', '1', '00080710', '18');
INSERT INTO `sys_role_detail` VALUES ('275', '1', '00080711', '18');
INSERT INTO `sys_role_detail` VALUES ('276', '1', '00080712', '18');
INSERT INTO `sys_role_detail` VALUES ('277', '1', '00080713', '18');
INSERT INTO `sys_role_detail` VALUES ('278', '1', '00080714', '18');
INSERT INTO `sys_role_detail` VALUES ('279', '1', '02', '18');
INSERT INTO `sys_role_detail` VALUES ('280', '1', '0201', '18');
INSERT INTO `sys_role_detail` VALUES ('281', '1', '020101', '18');
INSERT INTO `sys_role_detail` VALUES ('282', '1', '020102', '18');
INSERT INTO `sys_role_detail` VALUES ('283', '1', '020103', '18');
INSERT INTO `sys_role_detail` VALUES ('284', '1', '0202', '18');
INSERT INTO `sys_role_detail` VALUES ('285', '1', '020201', '18');
INSERT INTO `sys_role_detail` VALUES ('286', '1', '020202', '18');
INSERT INTO `sys_role_detail` VALUES ('287', '1', '020203', '18');
INSERT INTO `sys_role_detail` VALUES ('288', '1', '020204', '18');
INSERT INTO `sys_role_detail` VALUES ('289', '1', '020205', '18');
INSERT INTO `sys_role_detail` VALUES ('290', '1', '0203', '18');
INSERT INTO `sys_role_detail` VALUES ('291', '1', '020301', '18');
INSERT INTO `sys_role_detail` VALUES ('292', '1', '020303', '18');
INSERT INTO `sys_role_detail` VALUES ('293', '1', '0204', '18');
INSERT INTO `sys_role_detail` VALUES ('294', '1', '020401', '18');
INSERT INTO `sys_role_detail` VALUES ('295', '1', '020403', '18');
INSERT INTO `sys_role_detail` VALUES ('610', '2', '00', '18');
INSERT INTO `sys_role_detail` VALUES ('611', '2', '0001', '18');
INSERT INTO `sys_role_detail` VALUES ('612', '2', '000102', '18');
INSERT INTO `sys_role_detail` VALUES ('613', '2', '00010201', '18');
INSERT INTO `sys_role_detail` VALUES ('614', '2', '00010202', '18');
INSERT INTO `sys_role_detail` VALUES ('615', '2', '000103', '18');
INSERT INTO `sys_role_detail` VALUES ('616', '2', '00010301', '18');
INSERT INTO `sys_role_detail` VALUES ('617', '2', '00010302', '18');
INSERT INTO `sys_role_detail` VALUES ('618', '2', '000104', '18');
INSERT INTO `sys_role_detail` VALUES ('619', '2', '00010401', '18');
INSERT INTO `sys_role_detail` VALUES ('620', '2', '00010402', '18');
INSERT INTO `sys_role_detail` VALUES ('621', '2', '0002', '18');
INSERT INTO `sys_role_detail` VALUES ('622', '2', '000202', '18');
INSERT INTO `sys_role_detail` VALUES ('623', '2', '00020201', '18');
INSERT INTO `sys_role_detail` VALUES ('624', '2', '00020202', '18');
INSERT INTO `sys_role_detail` VALUES ('625', '2', '00020203', '18');
INSERT INTO `sys_role_detail` VALUES ('626', '2', '000203', '18');
INSERT INTO `sys_role_detail` VALUES ('627', '2', '00020301', '18');
INSERT INTO `sys_role_detail` VALUES ('628', '2', '00020302', '18');
INSERT INTO `sys_role_detail` VALUES ('629', '2', '00020303', '18');
INSERT INTO `sys_role_detail` VALUES ('630', '2', '0003', '18');
INSERT INTO `sys_role_detail` VALUES ('631', '2', '000301', '18');
INSERT INTO `sys_role_detail` VALUES ('632', '2', '00030101', '18');
INSERT INTO `sys_role_detail` VALUES ('633', '2', '00030102', '18');
INSERT INTO `sys_role_detail` VALUES ('634', '2', '00030103', '18');
INSERT INTO `sys_role_detail` VALUES ('635', '2', '00030104', '18');
INSERT INTO `sys_role_detail` VALUES ('636', '2', '000302', '18');
INSERT INTO `sys_role_detail` VALUES ('637', '2', '00030201', '18');
INSERT INTO `sys_role_detail` VALUES ('638', '2', '00030202', '18');
INSERT INTO `sys_role_detail` VALUES ('639', '2', '00030203', '18');
INSERT INTO `sys_role_detail` VALUES ('640', '2', '00030204', '18');
INSERT INTO `sys_role_detail` VALUES ('641', '2', '000303', '18');
INSERT INTO `sys_role_detail` VALUES ('642', '2', '00030301', '18');
INSERT INTO `sys_role_detail` VALUES ('643', '2', '00030302', '18');
INSERT INTO `sys_role_detail` VALUES ('644', '2', '00030303', '18');
INSERT INTO `sys_role_detail` VALUES ('645', '2', '00030304', '18');
INSERT INTO `sys_role_detail` VALUES ('646', '2', '000304', '18');
INSERT INTO `sys_role_detail` VALUES ('647', '2', '00030402', '18');
INSERT INTO `sys_role_detail` VALUES ('648', '2', '00030404', '18');
INSERT INTO `sys_role_detail` VALUES ('649', '2', '00030405', '18');
INSERT INTO `sys_role_detail` VALUES ('650', '2', '00030406', '18');
INSERT INTO `sys_role_detail` VALUES ('651', '2', '000305', '18');
INSERT INTO `sys_role_detail` VALUES ('652', '2', '00030501', '18');
INSERT INTO `sys_role_detail` VALUES ('653', '2', '00030502', '18');
INSERT INTO `sys_role_detail` VALUES ('654', '2', '0004', '18');
INSERT INTO `sys_role_detail` VALUES ('655', '2', '000401', '18');
INSERT INTO `sys_role_detail` VALUES ('656', '2', '00040101', '18');
INSERT INTO `sys_role_detail` VALUES ('657', '2', '00040102', '18');
INSERT INTO `sys_role_detail` VALUES ('658', '2', '00040103', '18');
INSERT INTO `sys_role_detail` VALUES ('659', '2', '00040104', '18');
INSERT INTO `sys_role_detail` VALUES ('660', '2', '00040105', '18');
INSERT INTO `sys_role_detail` VALUES ('661', '2', '000402', '18');
INSERT INTO `sys_role_detail` VALUES ('662', '2', '00040201', '18');
INSERT INTO `sys_role_detail` VALUES ('663', '2', '00040202', '18');
INSERT INTO `sys_role_detail` VALUES ('664', '2', '00040203', '18');
INSERT INTO `sys_role_detail` VALUES ('665', '2', '00040204', '18');
INSERT INTO `sys_role_detail` VALUES ('666', '2', '00040205', '18');
INSERT INTO `sys_role_detail` VALUES ('667', '2', '000403', '18');
INSERT INTO `sys_role_detail` VALUES ('668', '2', '00040302', '18');
INSERT INTO `sys_role_detail` VALUES ('669', '2', '00040303', '18');
INSERT INTO `sys_role_detail` VALUES ('670', '2', '000404', '18');
INSERT INTO `sys_role_detail` VALUES ('671', '2', '000405', '18');
INSERT INTO `sys_role_detail` VALUES ('672', '2', '000406', '18');
INSERT INTO `sys_role_detail` VALUES ('673', '2', '0005', '18');
INSERT INTO `sys_role_detail` VALUES ('674', '2', '000503', '18');
INSERT INTO `sys_role_detail` VALUES ('675', '2', '000504', '18');
INSERT INTO `sys_role_detail` VALUES ('676', '2', '000505', '18');
INSERT INTO `sys_role_detail` VALUES ('677', '2', '000506', '18');
INSERT INTO `sys_role_detail` VALUES ('678', '2', '000507', '18');
INSERT INTO `sys_role_detail` VALUES ('679', '2', '000508', '18');
INSERT INTO `sys_role_detail` VALUES ('680', '2', '000509', '18');
INSERT INTO `sys_role_detail` VALUES ('681', '2', '0006', '18');
INSERT INTO `sys_role_detail` VALUES ('682', '2', '000601', '18');
INSERT INTO `sys_role_detail` VALUES ('683', '2', '00060101', '18');
INSERT INTO `sys_role_detail` VALUES ('684', '2', '00060102', '18');
INSERT INTO `sys_role_detail` VALUES ('685', '2', '00060105', '18');
INSERT INTO `sys_role_detail` VALUES ('686', '2', '00060106', '18');
INSERT INTO `sys_role_detail` VALUES ('687', '2', '000602', '18');
INSERT INTO `sys_role_detail` VALUES ('688', '2', '00060201', '18');
INSERT INTO `sys_role_detail` VALUES ('689', '2', '00060203', '18');
INSERT INTO `sys_role_detail` VALUES ('690', '2', '00060204', '18');
INSERT INTO `sys_role_detail` VALUES ('691', '2', '00060205', '18');
INSERT INTO `sys_role_detail` VALUES ('692', '2', '00060206', '18');
INSERT INTO `sys_role_detail` VALUES ('693', '2', '000604', '18');
INSERT INTO `sys_role_detail` VALUES ('694', '2', '00060401', '18');
INSERT INTO `sys_role_detail` VALUES ('695', '2', '00060402', '18');
INSERT INTO `sys_role_detail` VALUES ('696', '2', '00060403', '18');
INSERT INTO `sys_role_detail` VALUES ('697', '2', '00060404', '18');
INSERT INTO `sys_role_detail` VALUES ('698', '2', '00060405', '18');
INSERT INTO `sys_role_detail` VALUES ('699', '2', '00060406', '18');
INSERT INTO `sys_role_detail` VALUES ('700', '2', '0007', '18');
INSERT INTO `sys_role_detail` VALUES ('701', '2', '000701', '18');
INSERT INTO `sys_role_detail` VALUES ('702', '2', '000702', '18');
INSERT INTO `sys_role_detail` VALUES ('703', '2', '000703', '18');
INSERT INTO `sys_role_detail` VALUES ('704', '2', '000704', '18');
INSERT INTO `sys_role_detail` VALUES ('705', '2', '0008', '18');
INSERT INTO `sys_role_detail` VALUES ('706', '2', '000801', '18');
INSERT INTO `sys_role_detail` VALUES ('707', '2', '00080101', '18');
INSERT INTO `sys_role_detail` VALUES ('708', '2', '00080102', '18');
INSERT INTO `sys_role_detail` VALUES ('709', '2', '00080103', '18');
INSERT INTO `sys_role_detail` VALUES ('710', '2', '00080104', '18');
INSERT INTO `sys_role_detail` VALUES ('711', '2', '00080105', '18');
INSERT INTO `sys_role_detail` VALUES ('712', '2', '000802', '18');
INSERT INTO `sys_role_detail` VALUES ('713', '2', '00080201', '18');
INSERT INTO `sys_role_detail` VALUES ('714', '2', '00080202', '18');
INSERT INTO `sys_role_detail` VALUES ('715', '2', '000803', '18');
INSERT INTO `sys_role_detail` VALUES ('716', '2', '00080301', '18');
INSERT INTO `sys_role_detail` VALUES ('717', '2', '00080302', '18');
INSERT INTO `sys_role_detail` VALUES ('718', '2', '00080303', '18');
INSERT INTO `sys_role_detail` VALUES ('719', '2', '000804', '18');
INSERT INTO `sys_role_detail` VALUES ('720', '2', '00080401', '18');
INSERT INTO `sys_role_detail` VALUES ('721', '2', '00080402', '18');
INSERT INTO `sys_role_detail` VALUES ('722', '2', '000805', '18');
INSERT INTO `sys_role_detail` VALUES ('723', '2', '00080502', '18');
INSERT INTO `sys_role_detail` VALUES ('724', '2', '00080503', '18');
INSERT INTO `sys_role_detail` VALUES ('725', '2', '00080504', '18');
INSERT INTO `sys_role_detail` VALUES ('726', '2', '00080505', '18');
INSERT INTO `sys_role_detail` VALUES ('727', '2', '00080506', '18');
INSERT INTO `sys_role_detail` VALUES ('728', '2', '00080507', '18');
INSERT INTO `sys_role_detail` VALUES ('729', '2', '000806', '18');
INSERT INTO `sys_role_detail` VALUES ('730', '2', '00080601', '18');
INSERT INTO `sys_role_detail` VALUES ('731', '2', '000807', '18');
INSERT INTO `sys_role_detail` VALUES ('732', '2', '00080703', '18');
INSERT INTO `sys_role_detail` VALUES ('733', '2', '00080704', '18');
INSERT INTO `sys_role_detail` VALUES ('734', '2', '00080705', '18');
INSERT INTO `sys_role_detail` VALUES ('735', '2', '00080706', '18');
INSERT INTO `sys_role_detail` VALUES ('736', '2', '00080707', '18');
INSERT INTO `sys_role_detail` VALUES ('737', '2', '00080708', '18');
INSERT INTO `sys_role_detail` VALUES ('738', '2', '00080709', '18');
INSERT INTO `sys_role_detail` VALUES ('739', '2', '00080710', '18');
INSERT INTO `sys_role_detail` VALUES ('740', '2', '00080711', '18');
INSERT INTO `sys_role_detail` VALUES ('741', '2', '00080712', '18');
INSERT INTO `sys_role_detail` VALUES ('742', '2', '00080713', '18');
INSERT INTO `sys_role_detail` VALUES ('743', '2', '00080714', '18');
INSERT INTO `sys_role_detail` VALUES ('744', '2', '00080715', '18');
INSERT INTO `sys_role_detail` VALUES ('745', '2', '00080716', '18');
INSERT INTO `sys_role_detail` VALUES ('746', '2', '02', '18');
INSERT INTO `sys_role_detail` VALUES ('747', '2', '0201', '18');
INSERT INTO `sys_role_detail` VALUES ('748', '2', '020101', '18');
INSERT INTO `sys_role_detail` VALUES ('749', '2', '020102', '18');
INSERT INTO `sys_role_detail` VALUES ('750', '2', '020103', '18');
INSERT INTO `sys_role_detail` VALUES ('751', '2', '0202', '18');
INSERT INTO `sys_role_detail` VALUES ('752', '2', '020201', '18');
INSERT INTO `sys_role_detail` VALUES ('753', '2', '020202', '18');
INSERT INTO `sys_role_detail` VALUES ('754', '2', '020203', '18');
INSERT INTO `sys_role_detail` VALUES ('755', '2', '020204', '18');
INSERT INTO `sys_role_detail` VALUES ('756', '2', '020205', '18');
INSERT INTO `sys_role_detail` VALUES ('757', '2', '0203', '18');
INSERT INTO `sys_role_detail` VALUES ('758', '2', '020301', '18');
INSERT INTO `sys_role_detail` VALUES ('759', '2', '020303', '18');
INSERT INTO `sys_role_detail` VALUES ('760', '2', '0204', '18');
INSERT INTO `sys_role_detail` VALUES ('761', '2', '020401', '18');
INSERT INTO `sys_role_detail` VALUES ('762', '2', '020403', '18');
INSERT INTO `sys_role_detail` VALUES ('763', '2', '0205', '18');
INSERT INTO `sys_role_detail` VALUES ('764', '2', '020501', '18');
INSERT INTO `sys_role_detail` VALUES ('765', '2', '020502', '18');
INSERT INTO `sys_role_detail` VALUES ('766', '2', '020503', '18');
INSERT INTO `sys_user_group` VALUES ('1', '部门经理', '', '182013052121033133083', '2013-10-07 15:26:23', '182013052121033133083', '2014-09-13 15:13:19', '18');
INSERT INTO `sys_user_group` VALUES ('2', '业务员', '', '182013052121033133083', '2014-09-13 15:13:37', '182013052121033133083', '2014-09-13 15:13:37', '18');
INSERT INTO `sys_user_group` VALUES ('3', '销售助理', '', '182013052121033133083', '2014-09-13 15:13:53', '182013052121033133083', '2014-09-13 15:13:53', '18');
INSERT INTO `sys_user_group_detail` VALUES ('9', '56', '1', null);
INSERT INTO `sys_user_group_detail` VALUES ('10', '55', '1', null);
INSERT INTO `sys_user_group_detail` VALUES ('11', '54', '1', null);
INSERT INTO `sys_user_group_detail` VALUES ('12', '58', '1', null);
INSERT INTO `sys_user_group_detail` VALUES ('13', '59', '1', null);
INSERT INTO `sys_user_group_detail` VALUES ('14', '60', '1', null);
INSERT INTO `sys_user_group_detail` VALUES ('15', '52', '1', null);
INSERT INTO `sys_user_group_detail` VALUES ('16', '57', '1', null);
INSERT INTO `sys_user_group_detail` VALUES ('17', '54', '2', '18');
INSERT INTO `sys_user_group_detail` VALUES ('18', '58', '2', '18');
INSERT INTO `sys_user_group_detail` VALUES ('19', '55', '2', '18');
INSERT INTO `sys_user_group_detail` VALUES ('20', '59', '3', '18');
INSERT INTO `sys_user_group_detail` VALUES ('21', '56', '3', '18');
INSERT INTO `sys_user_group_detail` VALUES ('22', '60', '3', '18');
INSERT INTO `sys_user_info` VALUES ('1', '-1', 'admin', 'MTExMTEx', '1', '-1', '2010-06-02 13:37:43', '1', '2014-10-23 13:08:19', '1', '3');
INSERT INTO `sys_user_info` VALUES ('51', '-1', 'systemadmin', 'MTExMTEx', '1', '-1', '2013-05-21 15:22:10', '51', '2013-05-21 15:23:24', '18', '3');
INSERT INTO `sys_user_info` VALUES ('52', '182013052121033133083', 'dxj', 'MTExMTEx', '1', '51', '2013-05-21 15:32:41', '182013052121033133083', '2015-01-16 10:58:30', '18', '1');
INSERT INTO `sys_user_info` VALUES ('54', '182013072730085454643', 'zhangs', 'MTExMTEx', '1', '182013052121033133083', '2013-08-29 22:18:57', '182013072730085454643', '2014-07-28 14:55:35', '18', '1');
INSERT INTO `sys_user_info` VALUES ('55', '182013072931083905862', 'wangwu', 'MTExMTEx', '1', '182013052121033133083', '2013-09-01 15:22:21', '182013052121033133083', '2013-09-01 15:22:21', '18', '1');
INSERT INTO `sys_user_info` VALUES ('56', '182013072730040551054', 'lisi', 'MTExMTEx', '1', '182013052121033133083', '2013-09-01 15:22:21', '182013072931083905862', '2014-09-03 14:35:59', '18', '1');
INSERT INTO `sys_user_info` VALUES ('57', '18201401285024208188', 'maliu', 'MTExMTEx', '1', '182013072730085454643', '2014-01-28 14:45:42', '182013052121033133083', '2014-04-13 16:35:24', '18', '1');
INSERT INTO `sys_user_info` VALUES ('58', '182014052421084820990', 'jiangc', 'MTExMTEx', '1', '182013052121033133083', '2014-05-24 20:48:40', '182013052121033133083', '2014-05-24 20:48:40', '18', '1');
INSERT INTO `sys_user_info` VALUES ('59', '182014052421102129560', 'zhangyan', 'MTExMTEx', '1', '182014052421084820990', '2014-05-24 22:21:45', '182014052421084820990', '2014-05-24 22:21:45', '18', '1');
INSERT INTO `sys_user_info` VALUES ('60', '182014052421104440246', 'zhangl', 'MTExMTEx', '1', '182013072931083905862', '2014-05-24 22:44:55', '182013072931083905862', '2014-05-24 22:44:55', '18', '1');
INSERT INTO `sys_user_methods` VALUES ('1', '52', '01,0101,010102,01010201,01010202,010103,01010301,01010302,010104,01010401,01010402,0102,010202,01020201,01020202,01020203,010203,01020301,01020302,01020303,0103,010301,01030101,01030102,01030103,01030104,010302,01030201,01030202,01030203,01030204,010303,01030301,01030302,01030303,01030304,010304,01030402,01030404,01030405,01030406,010305,01030501,01030502,0104,010401,01040101,01040102,01040103,01040104,01040105,010402,01040201,01040202,01040203,01040204,01040205,010403,01040302,01040303,010404,010405,010406,0105,010503,010504,010505,010506,010507,010508,010509,0106,010601,01060101,01060102,01060105,01060106,010602,01060201,01060203,01060204,01060205,01060206,010604,01060401,01060402,01060403,01060404,01060405,01060406,0107,010701,010702,010703,010704,02,0201,020101,020102,020103,0202,020201,020202,020203,020204,020205,0203,020301,020303,0204,020401,020403,0205,020501,020502,020503,03,0301,030101,030102,030103,030104,030105,0302,030201,030202,0303,030301,030302,030303,0304,030401,030402,0305,030502,030503,030504,030505,030506,030507,0306,030601,0307,030703,030704,030705,030706,030707,030708,030709,030710,030711,030712,030713,030714,030715,030716,0308,030801,030802,030803,', '18');
INSERT INTO `sys_user_methods` VALUES ('2', '53', '00,0001,000101,00010103,00010104,000102,00010201,00010202,000103,00010301,00010302,000104,00010402,00010401,0002,000201,00020104,00020102,00020107,000202,00020201,00020203,00020202,000203,00020301,00020302,00020303,000204,00020401,00020408,00020409,00020407,00020402,00020403,00020404,00020405,00020406,0003,000301,00030101,00030102,00030103,00030104,000302,00030201,00030202,00030203,00030204,000303,00030304,00030301,00030302,00030303,000304,00030402,00030404,00030405,00030406,000305,00030502,00030501,0004,000401,00040101,00040102,00040104,00040103,00040105,000402,00040204,00040203,00040201,00040202,00040205,000403,00040302,00040303,000404,000405,000406,0005,000501,000502,000503,000504,000505,000507,000506,000508,000509,0006,000601,00060105,00060101,00060102,00060106,000602,00060201,00060203,00060204,00060205,00060206,000603,00060307,00060301,00060302,00060304,00060306,00060308,00060309,000604,00060402,00060403,00060401,00060404,00060405,00060406,0008,000803,00080301,00080302,00080303,000804,00080401,00080402,000805,00080501,00080502,000806,00080601,000801,00080101,00080102,00080104,00080103,000802,00080201,00080202,000807,00080701,00080705,00080710,00080711,00080702,00080714,00080706,00080709,00080712,00080713,00080703,00080704,00080708,00080707,00080715,00080716,00080721,00080717,00080718,00080722,00080720,02,0201,020101,020103,0202,020201,020203,020204,020205,0203,020301,020303,0204,020401,020403,0205,020501,020502,', '18');
INSERT INTO `sys_user_methods` VALUES ('3', '54', '00,0001,000102,00010201,00010202,000103,00010301,00010302,000104,00010401,00010402,0002,000202,00020201,00020202,00020203,000203,00020301,00020302,00020303,0003,000301,00030101,00030102,00030103,00030104,000302,00030201,00030202,00030203,00030204,000303,00030301,00030302,00030303,00030304,000304,00030402,00030404,00030405,00030406,000305,00030501,00030502,0004,000401,00040101,00040102,00040103,00040104,00040105,000402,00040201,00040202,00040203,00040204,00040205,000403,00040302,00040303,000404,000405,000406,0005,000503,000504,000505,000506,000507,000508,000509,0006,000601,00060101,00060102,00060105,00060106,000602,00060201,00060203,00060204,00060205,00060206,000604,00060401,00060402,00060403,00060404,00060405,00060406,0007,000701,000702,000703,000704,0008,000801,00080101,00080102,00080103,00080104,00080105,000802,00080201,00080202,000803,00080301,00080302,00080303,000804,00080401,00080402,000805,00080502,00080503,00080504,00080505,00080506,00080507,000806,00080601,000807,00080703,00080704,00080705,00080706,00080707,00080708,00080709,00080710,00080711,00080712,00080713,00080714,00080715,00080716,000808,00080801,00080802,02,0201,020101,020102,020103,0202,020201,020202,020203,020204,020205,0203,020301,020303,0204,020401,020403,0205,020501,020502,020503,', '18');
INSERT INTO `sys_user_methods` VALUES ('4', '55', '00,0001,000102,00010201,00010202,000103,00010301,00010302,000104,00010401,00010402,0002,000202,00020201,00020202,00020203,000203,00020301,00020302,00020303,0003,000301,00030101,00030102,00030103,00030104,000302,00030201,00030202,00030203,00030204,000303,00030301,00030302,00030303,00030304,000304,00030402,00030404,00030405,00030406,000305,00030501,00030502,0004,000401,00040101,00040102,00040103,00040104,00040105,000402,00040201,00040202,00040203,00040204,00040205,000403,00040302,00040303,000404,000405,000406,0005,000503,000504,000505,000506,000507,000508,000509,0006,000601,00060101,00060102,00060105,00060106,000602,00060201,00060203,00060204,00060205,00060206,000604,00060401,00060402,00060403,00060404,00060405,00060406,0007,000701,000702,000703,000704,0008,000801,00080101,00080102,00080103,00080104,00080105,000802,00080201,00080202,000803,00080301,00080302,00080303,000804,00080401,00080402,000805,00080502,00080503,00080504,00080505,00080506,00080507,000806,00080601,000807,00080703,00080704,00080705,00080706,00080707,00080708,00080709,00080710,00080711,00080712,00080713,00080714,00080715,00080716,02,0201,020101,020102,020103,0202,020201,020202,020203,020204,020205,0203,020301,020303,0204,020401,020403,0205,020501,020502,020503,', '18');
INSERT INTO `sys_user_methods` VALUES ('5', '56', '00,0001,000102,00010201,00010202,000103,00010301,00010302,000104,00010401,00010402,0002,000202,00020201,00020202,00020203,000203,00020301,00020302,00020303,0003,000301,00030101,00030102,00030103,00030104,000302,00030201,00030202,00030203,00030204,000303,00030301,00030302,00030303,00030304,000304,00030402,00030404,00030405,00030406,000305,00030501,00030502,0004,000401,00040101,00040102,00040103,00040104,00040105,000402,00040201,00040202,00040203,00040204,00040205,000403,00040302,00040303,000404,000405,000406,0005,000503,000504,000505,000506,000507,000508,000509,0006,000601,00060101,00060102,00060105,00060106,000602,00060201,00060203,00060204,00060205,00060206,000604,00060401,00060402,00060403,00060404,00060405,00060406,0007,000701,000702,000703,000704,0008,000801,00080101,00080102,00080103,00080104,00080105,000802,00080201,00080202,000803,00080301,00080302,00080303,000804,00080401,00080402,000805,00080502,00080503,00080504,00080505,00080506,00080507,000806,00080601,000807,00080703,00080704,00080705,00080706,00080707,00080708,00080709,00080710,00080711,00080712,00080713,00080714,00080715,00080716,000808,00080801,00080802,', '18');
INSERT INTO `sys_user_methods` VALUES ('6', '57', '00,0001,000102,00010201,00010202,000103,00010301,00010302,000104,00010401,00010402,0002,000202,00020201,00020202,00020203,000203,00020301,00020302,00020303,0003,000301,00030101,00030102,00030103,00030104,000302,00030201,00030202,00030203,00030204,000303,00030301,00030302,00030303,00030304,000304,00030402,00030404,00030405,00030406,000305,00030501,00030502,0004,000401,00040101,00040102,00040103,00040104,00040105,000402,00040201,00040202,00040203,00040204,00040205,000403,00040302,00040303,000404,000405,000406,0005,000501,00050101,00050102,00050103,000503,000504,000505,000506,000507,000508,000509,0006,000601,00060101,00060102,00060105,00060106,000602,00060201,00060203,00060204,00060205,00060206,000604,00060401,00060402,00060403,00060404,00060405,00060406,0008,000801,00080101,00080102,00080103,00080104,000802,00080201,00080202,000803,00080301,00080302,00080303,000804,00080401,00080402,000805,00080502,00080503,00080504,00080505,00080506,000806,00080601,000807,00080703,00080704,00080705,00080706,00080707,00080708,00080709,00080710,00080711,00080712,00080713,00080714,00080721,', '18');
INSERT INTO `sys_user_methods` VALUES ('7', '58', '00,0001,000102,00010201,00010202,000103,00010301,00010302,000104,00010401,00010402,0002,000202,00020201,00020202,00020203,000203,00020301,00020302,00020303,0003,000301,00030101,00030102,00030103,00030104,000302,00030201,00030202,00030203,00030204,000303,00030301,00030302,00030303,00030304,000304,00030402,00030404,00030405,00030406,000305,00030501,00030502,0004,000401,00040101,00040102,00040103,00040104,00040105,000402,00040201,00040202,00040203,00040204,00040205,000403,00040302,00040303,000404,000405,000406,0005,000503,000504,000505,000506,000507,000508,000509,0006,000601,00060101,00060102,00060105,00060106,000602,00060201,00060203,00060204,00060205,00060206,000604,00060401,00060402,00060403,00060404,00060405,00060406,0007,000701,000702,000703,000704,0008,000801,00080101,00080102,00080103,00080104,00080105,000802,00080201,00080202,000803,00080301,00080302,00080303,000804,00080401,00080402,000805,00080502,00080503,00080504,00080505,00080506,000806,00080601,000807,00080703,00080704,00080705,00080706,00080707,00080708,00080709,00080710,00080711,00080712,00080713,00080714,000808,00080801,00080802,02,0201,020101,020102,020103,0202,020201,020202,020203,020204,020205,0203,020301,020303,0204,020401,020403,', '18');
INSERT INTO `sys_user_methods` VALUES ('8', '59', '00,0001,000102,00010201,00010202,000103,00010301,00010302,000104,00010401,00010402,0002,000202,00020201,00020202,00020203,000203,00020301,00020302,00020303,0003,000301,00030101,00030102,00030103,00030104,000302,00030201,00030202,00030203,00030204,000303,00030301,00030302,00030303,00030304,000304,00030402,00030404,00030405,00030406,000305,00030501,00030502,0004,000401,00040101,00040102,00040103,00040104,00040105,000402,00040201,00040202,00040203,00040204,00040205,000403,00040302,00040303,000404,000405,000406,0005,000501,00050101,00050102,00050103,000503,000504,000505,000506,000507,000508,000509,0006,000601,00060101,00060102,00060105,00060106,000602,00060201,00060203,00060204,00060205,00060206,000604,00060401,00060402,00060403,00060404,00060405,00060406,0008,000801,00080101,00080102,00080103,00080104,00080105,000802,00080201,00080202,000803,00080301,00080302,00080303,000804,00080401,00080402,000805,00080502,00080503,00080504,00080505,00080506,000806,00080601,000807,00080703,00080704,00080705,00080706,00080707,00080708,00080709,00080710,00080711,00080712,00080713,00080714,02,0201,020101,020102,020103,0202,020201,020202,020203,020204,020205,0203,020301,020303,0204,020401,020403,03,0301,', '18');
INSERT INTO `sys_user_methods` VALUES ('9', '60', '00,0001,000102,00010201,00010202,000103,00010301,00010302,000104,00010401,00010402,0002,000202,00020201,00020202,00020203,000203,00020301,00020302,00020303,0003,000301,00030101,00030102,00030103,00030104,000302,00030201,00030202,00030203,00030204,000303,00030301,00030302,00030303,00030304,000304,00030402,00030404,00030405,00030406,000305,00030501,00030502,0004,000401,00040101,00040102,00040103,00040104,00040105,000402,00040201,00040202,00040203,00040204,00040205,000403,00040302,00040303,000404,000405,000406,0005,000501,00050101,00050102,00050103,000503,000504,000505,000506,000507,000508,000509,0006,000601,00060101,00060102,00060105,00060106,000602,00060201,00060203,00060204,00060205,00060206,000604,00060401,00060402,00060403,00060404,00060405,00060406,0008,000801,00080101,00080102,00080103,00080104,00080105,000802,00080201,00080202,000803,00080301,00080302,00080303,000804,00080401,00080402,000805,00080502,00080503,00080504,00080505,00080506,000806,00080601,000807,00080703,00080704,00080705,00080706,00080707,00080708,00080709,00080710,00080711,00080712,00080713,00080714,02,0201,020101,020102,020103,0202,020201,020202,020203,020204,020205,0203,020301,020303,0204,020401,020403,', '18');
