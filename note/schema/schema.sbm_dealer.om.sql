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

CREATE TABLE `om_post` (
  `post_seq` int(11) NOT NULL AUTO_INCREMENT,
  `post_kr_nm` varchar(100) NOT NULL,
  `post_eng_nm` varchar(100) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`post_seq`),
  KEY `post_kor_nm` (`post_kr_nm`),
  KEY `post_eng_nm` (`post_eng_nm`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `om_sndmail` (
  `seq` int(11) NOT NULL AUTO_INCREMENT,
  `sender_uid` varchar(15) NOT NULL,
  `crt_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `sender_nm` varchar(50) DEFAULT NULL,
  `email_from` varchar(50) NOT NULL,
  `email_to` varchar(50) DEFAULT NULL,
  `email_cc` varchar(500) DEFAULT NULL,
  `wrk_tp_attr_cd` varchar(4) DEFAULT NULL,
  `snd_ctnt` text CHARACTER SET latin1,
  PRIMARY KEY (`seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `om_worker` (
  `worker_uid` varchar(15) NOT NULL,
  `kr_nm` varchar(20) NOT NULL,
  `eng_nm` varchar(50) DEFAULT NULL,
  `email` varchar(50) NOT NULL,
  `post_seq` int(11) NOT NULL,
  `duty_attr_cd` varchar(4) NOT NULL,
  `extns_num` varchar(4) DEFAULT NULL,
  `moblie_num` varchar(11) DEFAULT NULL,
  `aprv_dt` timestamp NULL DEFAULT NULL,
  `mailing_yn` char(1) CHARACTER SET latin1 NOT NULL DEFAULT 'Y',
  PRIMARY KEY (`worker_uid`),
  KEY `om_worker_ibfk_1` (`post_seq`),
  CONSTRAINT `om_worker_ibfk_1` FOREIGN KEY (`post_seq`) REFERENCES `om_post` (`post_seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

