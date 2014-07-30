CREATE TABLE `cm_auth_grp` (
  `auth_grp_cd` varchar(2) NOT NULL,
  `auth_grp_nm` varchar(50) NOT NULL,
  `auth_grp_dscrnm` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`auth_grp_cd`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `cm_cdattr` (
  `cd_seq` int(4) NOT NULL,
  `atcd` varchar(4) NOT NULL,
  `atcd_nm` varchar(100) NOT NULL,
  `atcd_dscrnm` varchar(200) DEFAULT NULL,
  `use_yn` char(1) NOT NULL DEFAULT 'Y',
  `ord_num` decimal(11,0) DEFAULT NULL,
  `crt_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `udt_dt` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `upt_uid` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`cd_seq`,`atcd`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `cm_cdgrp` (
  `grp_cd` varchar(4) NOT NULL,
  `grp_nm` varchar(50) NOT NULL,
  `grp_dscrnm` varchar(200) DEFAULT NULL,
  `use_yn` char(1) NOT NULL DEFAULT 'Y',
  `crt_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `udt_dt` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `p_grp_cd` varchar(4) DEFAULT NULL,
  PRIMARY KEY (`grp_cd`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `cm_cdinf` (
  `cd_seq` int(11) NOT NULL,
  `grp_cd` varchar(4) NOT NULL,
  `type_cd` varchar(4) NOT NULL,
  `cd_dispnm` varchar(100) DEFAULT NULL,
  `cd_dscrnm` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`grp_cd`,`type_cd`),
  KEY `cd_seq` (`cd_seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `cm_cdtype` (
  `type_cd` varchar(4) NOT NULL,
  `type_nm` varchar(100) NOT NULL,
  `crt_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `udt_dt` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`type_cd`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `cm_file_grp` (
  `file_grp_seq` int(11) NOT NULL,
  `file_seq` int(11) NOT NULL,
  `file_nm` varchar(100) NOT NULL,
  `file_size` smallint(11) DEFAULT NULL,
  `crt_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `udt_dt` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `udt_uid` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`file_grp_seq`,`file_seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

