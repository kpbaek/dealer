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

