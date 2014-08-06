CREATE TABLE `cm_auth_grp` (
  `auth_grp_cd` varchar(2) NOT NULL COMMENT '���ѱ׷��ڵ�',
  `auth_grp_nm` varchar(50) NOT NULL COMMENT '���ѱ׷��',
  `auth_grp_dscrt` varchar(200) DEFAULT NULL COMMENT '���ѱ׷켳��',
  PRIMARY KEY (`auth_grp_cd`),
  UNIQUE KEY `auth_grp_nm` (`auth_grp_nm`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='���ѱ׷�';

CREATE TABLE `cm_cd` (
  `cd` varchar(4) NOT NULL COMMENT '�ڵ�',
  `cd_nm` varchar(50) NOT NULL COMMENT '�ڵ��',
  `cd_dscrt` varchar(200) DEFAULT NULL COMMENT '�ڵ弳��',
  `use_yn` char(1) CHARACTER SET latin1 NOT NULL DEFAULT 'Y' COMMENT '��뿩��',
  `crt_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '�����Ͻ�',
  `udt_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '�����Ͻ�',
  `p_cd` varchar(4) DEFAULT NULL COMMENT '�����ڵ�',
  PRIMARY KEY (`cd`),
  KEY `cm_cd_ibfk_1` (`p_cd`),
  CONSTRAINT `cm_cd_ibfk_1` FOREIGN KEY (`p_cd`) REFERENCES `cm_cd` (`cd`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='�ڵ�����';

CREATE TABLE `cm_cd_attr` (
  `cd` varchar(4) NOT NULL COMMENT '�ڵ�',
  `atcd` varchar(8) NOT NULL COMMENT '�Ӽ��ڵ�',
  `atcd_nm` varchar(100) NOT NULL COMMENT '�Ӽ��ڵ��',
  `atcd_dscrt` varchar(200) DEFAULT NULL COMMENT '�Ӽ��ڵ弳��',
  `disp_yn` char(1) NOT NULL DEFAULT 'Y' COMMENT '���÷��̿���',
  `use_yn` char(1) NOT NULL DEFAULT 'Y' COMMENT '��뿩��',
  `ord_num` smallint(5) DEFAULT NULL COMMENT '���Ĺ�ȣ',
  `crt_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '�����Ͻ�',
  `udt_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '�����Ͻ�',
  `upt_uid` varchar(15) DEFAULT NULL COMMENT '������ID',
  PRIMARY KEY (`cd`,`atcd`),
  CONSTRAINT `cm_cd_attr_ibfk_1` FOREIGN KEY (`cd`) REFERENCES `cm_cd` (`cd`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='�ڵ�Ӽ�';

CREATE TABLE `cm_file_grp` (
  `file_grp_seq` int(11) NOT NULL COMMENT '���ϱ׷����',
  `file_seq` int(11) NOT NULL COMMENT '���ϼ���',
  `file_nm` varchar(100) NOT NULL COMMENT '���ϸ�',
  `file_size` smallint(11) DEFAULT NULL COMMENT '���Ͽ뷮',
  `crt_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '�����Ͻ�',
  `udt_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '�����Ͻ�',
  `udt_uid` varchar(15) DEFAULT NULL COMMENT '������ID',
  PRIMARY KEY (`file_grp_seq`,`file_seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='÷�����ϱ׷�';

