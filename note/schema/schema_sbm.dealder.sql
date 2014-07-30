CREATE TABLE `cm_auth_grp` (
  `auth_grp_cd` varchar(2) NOT NULL,
  `auth_grp_nm` varchar(50) NOT NULL,
  `auth_grp_dscrnm` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`auth_grp_cd`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='권한그룹';

CREATE TABLE `cm_cd_attr` (
  `cd_seq` int(4) NOT NULL,
  `atcd` varchar(4) NOT NULL,
  `atcd_nm` varchar(100) NOT NULL,
  `atcd_dscrnm` varchar(200) DEFAULT NULL,
  `use_yn` char(1) NOT NULL DEFAULT 'Y',
  `ord_num` smallint(5) DEFAULT NULL,
  `crt_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `udt_dt` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `upt_uid` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`cd_seq`,`atcd`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='코드속성';

CREATE TABLE `cm_cd_grp` (
  `grp_cd` varchar(4) NOT NULL,
  `grp_nm` varchar(50) NOT NULL,
  `grp_dscrnm` varchar(200) DEFAULT NULL,
  `use_yn` char(1) NOT NULL DEFAULT 'Y',
  `crt_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `udt_dt` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `p_grp_cd` varchar(4) DEFAULT NULL,
  PRIMARY KEY (`grp_cd`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='코드그룹';

CREATE TABLE `cm_cd_inf` (
  `cd_seq` int(11) NOT NULL,
  `grp_cd` varchar(4) NOT NULL,
  `lang_cd` varchar(4) NOT NULL,
  `cd_dispnm` varchar(100) DEFAULT NULL,
  `cd_dscrnm` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`grp_cd`,`lang_cd`),
  UNIQUE KEY `cd_seq` (`cd_seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='공통코드정보';

CREATE TABLE `cm_cd_lang` (
  `lang_cd` varchar(4) NOT NULL,
  `lang_nm` varchar(100) NOT NULL,
  `crt_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `udt_dt` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`lang_cd`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='코드구분';

CREATE TABLE `cm_cdgrp` (
  `grp_cd` varchar(4) NOT NULL,
  `grp_nm` varchar(50) NOT NULL,
  `grp_dscrnm` varchar(200) DEFAULT NULL,
  `use_yn` char(1) NOT NULL DEFAULT 'Y',
  `crt_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `udt_dt` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `p_grp_cd` varchar(4) DEFAULT NULL,
  PRIMARY KEY (`grp_cd`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='코드그룹';

CREATE TABLE `cm_file_grp` (
  `file_grp_seq` int(11) NOT NULL,
  `file_seq` int(11) NOT NULL,
  `file_nm` varchar(100) NOT NULL,
  `file_size` smallint(11) DEFAULT NULL,
  `crt_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `udt_dt` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `udt_uid` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`file_grp_seq`,`file_seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='첨부파일그룹';

CREATE TABLE `om_admin` (
  `adm_uid` varchar(15) NOT NULL,
  `adm_pswd` varchar(15) NOT NULL,
  `auth_grp_cd` varchar(2) DEFAULT NULL,
  `perms_cd` varchar(4) DEFAULT NULL,
  `active_yn` char(1) NOT NULL DEFAULT 'N',
  `last_logindt` timestamp NULL DEFAULT NULL,
  `crt_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `udt_dt` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`adm_uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='관리자정보';

CREATE TABLE `om_dealer` (
  `dealer_seq` int(11) NOT NULL,
  `dealer_nm` varchar(30) DEFAULT NULL,
  `email` varchar(50) NOT NULL,
  `pswd` varchar(15) DEFAULT NULL,
  `cntry_atcd` varchar(4) NOT NULL,
  `cmpy_nm` varchar(50) DEFAULT NULL,
  `biztp_atcd` varchar(4) DEFAULT NULL,
  `job_tit` varchar(100) DEFAULT NULL,
  `addr` varchar(300) DEFAULT NULL,
  `tel` varchar(20) DEFAULT NULL,
  `fax` varchar(20) DEFAULT NULL,
  `homepage` varchar(300) DEFAULT NULL,
  `exper_years` varchar(4) DEFAULT NULL,
  `maincust_atcd` varchar(4) DEFAULT NULL,
  `comments` varchar(2000) DEFAULT NULL,
  `mkt_inf` varchar(4000) DEFAULT NULL,
  `worker_uid` varchar(15) DEFAULT NULL,
  `premium_rate` decimal(5,2) DEFAULT NULL,
  `bank_atcd` varchar(4) DEFAULT NULL,
  `attn` varchar(100) DEFAULT NULL,
  `file_grp_seq` int(11) DEFAULT NULL,
  `crt_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `crt_uid` varchar(15) NOT NULL,
  `udt_dt` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `udt_uid` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`dealer_seq`),
  KEY `om_dealer_ibfk_1` (`worker_uid`),
  CONSTRAINT `om_dealer_ibfk_1` FOREIGN KEY (`worker_uid`) REFERENCES `om_worker` (`worker_uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='딜러정보';

CREATE TABLE `om_part` (
  `part_cd` varchar(10) NOT NULL,
  `part_nm` varchar(300) NOT NULL,
  `unit_price` decimal(9,2) NOT NULL,
  `unit_wgt` decimal(5,2) DEFAULT NULL,
  `remark` varchar(1000) DEFAULT NULL,
  `version` varchar(8) NOT NULL,
  `srl_no` int(11) DEFAULT NULL,
  `recom_yn` char(1) DEFAULT 'N',
  `use_yn` char(1) NOT NULL DEFAULT 'Y',
  `crt_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `udt_dt` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `crt_uid` varchar(15) NOT NULL,
  `udt_uid` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`part_cd`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='부품정보';

CREATE TABLE `om_sndmail` (
  `seq` int(11) NOT NULL AUTO_INCREMENT,
  `wrk_tp_atcd` varchar(4) DEFAULT NULL,
  `sender_uid` varchar(15) NOT NULL,
  `sender_nm` varchar(50) DEFAULT NULL,
  `email_from` varchar(50) NOT NULL,
  `email_to` varchar(500) DEFAULT NULL,
  `email_cc` varchar(500) DEFAULT NULL,
  `title` varchar(500) DEFAULT NULL,
  `ctnt` text NOT NULL,
  `crt_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `crt_uid` varchar(15) NOT NULL,
  PRIMARY KEY (`seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='전송메일정보';

CREATE TABLE `om_part_mdl` (
  `part_cd` varchar(10) NOT NULL,
  `mdl_atcd` varchar(4) NOT NULL,
  `disp_yn` char(1) NOT NULL DEFAULT 'Y',
  `use_yn` char(1) NOT NULL DEFAULT 'Y',
  `crt_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `udt_dt` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `crt_uid` varchar(15) NOT NULL,
  `udt_uid` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`part_cd`,`mdl_atcd`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='부품모델정보';

CREATE TABLE `om_team_mail` (
  `post_atcd` varchar(4) NOT NULL,
  `team_email` varchar(50) NOT NULL,
  `mailing_yn` char(1) NOT NULL,
  PRIMARY KEY (`post_atcd`,`team_email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='팀메일정보';

CREATE TABLE `om_worker` (
  `worker_uid` varchar(15) NOT NULL,
  `kr_nm` varchar(20) NOT NULL,
  `eng_nm` varchar(50) DEFAULT NULL,
  `email` varchar(50) NOT NULL,
  `post_atcd` varchar(4) NOT NULL,
  `duty_atcd` varchar(4) NOT NULL,
  `extns_num` varchar(4) DEFAULT NULL,
  `moblie_num` varchar(11) DEFAULT NULL,
  `mailing_yn` char(1) CHARACTER SET latin1 NOT NULL DEFAULT 'Y',
  `aprv_dt` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`worker_uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='담당자정보';

