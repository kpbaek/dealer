create or replace view v_cm_cdinf AS 
select c.cd_seq,c.grp_cd,g.grp_nm,g.p_grp_cd,c.type_cd,t.type_nm,c.cd_dispnm,c.cd_dscrnm
from ((cm_cdgrp g join cm_cdtype t on g.use_yn='Y') join cm_cdinf c) where ((c.grp_cd = g.grp_cd) and (c.type_cd = t.type_cd));

CREATE TABLE `cm_cdtype` (
  `type_cd` varchar(4) NOT NULL,
  `type_nm` varchar(100) NOT NULL,
  `crt_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `udt_dt` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`type_cd`)
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

CREATE TABLE `cm_attr` (
  `cd_seq` int(4) NOT NULL,
  `attr_cd` varchar(4) NOT NULL,
  `attr_nm` varchar(100) NOT NULL,
  `attr_dscrnm` varchar(200) DEFAULT NULL,
  `use_yn` char(1) NOT NULL DEFAULT 'Y',
  `ord_num` decimal(11,0) DEFAULT NULL,
  `crt_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `udt_dt` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `upt_uid` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`cd_seq`,`attr_cd`)
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

CREATE TABLE `cm_auth_grp` (
  `auth_grp_cd` varchar(2) NOT NULL,
  `auth_grp_nm` varchar(50) NOT NULL,
  `auth_grp_dscrnm` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`auth_grp_cd`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `om_post` (
  `post_seq` int(11) NOT NULL AUTO_INCREMENT,
  `post_kor_nm` varchar(100) NOT NULL,
  `post_eng_nm` varchar(100) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`post_seq`),
  KEY `post_kor_nm` (`post_kor_nm`),
  KEY `post_eng_nm` (`post_eng_nm`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

CREATE TABLE `om_worker` (
  `worker_uid` varchar(15) NOT NULL,
  `kor_nm` varchar(20) NOT NULL,
  `eng_nm` varchar(50) NOT NULL,
  `post_seq` int(11) NOT NULL,
  `email` varchar(70) NOT NULL,
  `extns_num` varchar(4) DEFAULT NULL,
  `moblie_num` varchar(11) DEFAULT NULL,
  `aprv_dt` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`worker_uid`),
  KEY `om_worker_ibfk_1` (`post_seq`),
  CONSTRAINT `om_worker_ibfk_1` FOREIGN KEY (`post_seq`) REFERENCES `om_post` (`post_seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `om_dealer` (
  `dealer_seq` int(11) NOT NULL,
  `dealer_nm` varchar(30) DEFAULT NULL,
  `email` varchar(50) NOT NULL,
  `pswd` varchar(15) DEFAULT NULL,
  `cntry_attr_cd` varchar(4) NOT NULL,
  `cmpy_nm` varchar(50) DEFAULT NULL,
  `buyer_yn` char(1) DEFAULT NULL,
  `biztype_attr_cd` varchar(4) DEFAULT NULL,
  `job_tit` varchar(100) DEFAULT NULL,
  `addr` varchar(200) DEFAULT NULL,
  `tel` varchar(20) DEFAULT NULL,
  `homepage` varchar(150) DEFAULT NULL,
  `exper_years` varchar(4) DEFAULT NULL,
  `m_cust_attr_cd` varchar(4) DEFAULT NULL,
  `comments` varchar(500) DEFAULT NULL,
  `mkt_inf` text,
  `worker_uid` varchar(15) DEFAULT NULL,
  `premium_rate` float DEFAULT NULL,
  `bank_attr_cd` varchar(4) DEFAULT NULL,
  `fax` varchar(20) DEFAULT NULL,
  `attn` varchar(100) DEFAULT NULL,
  `file_grp_seq` int(11) DEFAULT NULL,
  `crt_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `udt_dt` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `udt_uid` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`dealer_seq`),
  KEY `worker_uid` (`worker_uid`),
  CONSTRAINT `om_dealer_ibfk_1` FOREIGN KEY (`worker_uid`) REFERENCES `om_worker` (`worker_uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
