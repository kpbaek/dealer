CREATE TABLE `cm_auth_grp` (
  `auth_grp_cd` varchar(2) NOT NULL COMMENT '���ѱ׷��ڵ�',
  `auth_grp_nm` varchar(50) NOT NULL COMMENT '���ѱ׷��',
  `auth_grp_dscrt` varchar(200) DEFAULT NULL COMMENT '���ѱ׷켳��',
  PRIMARY KEY (`auth_grp_cd`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='���ѱ׷�';

CREATE TABLE `cm_cd_attr` (
  `cd_seq` int(4) NOT NULL COMMENT '�ڵ����',
  `atcd` varchar(4) NOT NULL COMMENT '�Ӽ��ڵ�',
  `atcd_nm` varchar(100) NOT NULL COMMENT '�Ӽ��ڵ��',
  `atcd_dscrt` varchar(200) DEFAULT NULL COMMENT '�Ӽ��ڵ弳��',
  `disp_yn` char(1) CHARACTER SET latin1 NOT NULL DEFAULT 'Y' COMMENT '���÷��̿���',
  `use_yn` char(1) CHARACTER SET latin1 NOT NULL DEFAULT 'Y' COMMENT '��뿩��',
  `ord_num` smallint(5) DEFAULT NULL COMMENT '���Ĺ�ȣ',
  `crt_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '�����Ͻ�',
  `udt_dt` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `upt_uid` varchar(15) DEFAULT NULL COMMENT '������ID',
  PRIMARY KEY (`cd_seq`,`atcd`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='�ڵ�Ӽ�';

CREATE TABLE `cm_cd_grp` (
  `grp_cd` varchar(4) NOT NULL COMMENT '�ڵ�׷� �ڵ�',
  `grp_nm` varchar(50) NOT NULL COMMENT '�ڵ�׷��',
  `grp_dscrt` varchar(200) DEFAULT NULL COMMENT '�ڵ�׷� ����',
  `use_yn` char(1) CHARACTER SET latin1 NOT NULL DEFAULT 'Y' COMMENT '��뿩��',
  `crt_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '�����Ͻ�',
  `udt_dt` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `p_grp_cd` varchar(4) DEFAULT NULL COMMENT '�����׷��ڵ�',
  PRIMARY KEY (`grp_cd`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='�ڵ�׷�';

CREATE TABLE `cm_cd_inf` (
  `cd_seq` int(11) NOT NULL COMMENT '�ڵ����',
  `grp_cd` varchar(4) NOT NULL COMMENT '�׷��ڵ�',
  `lang_cd` varchar(4) NOT NULL COMMENT '����ڵ�',
  `cd_dispnm` varchar(100) DEFAULT NULL COMMENT '���÷��̸�',
  `cd_dscrnm` varchar(200) DEFAULT NULL COMMENT '�ڵ弳��',
  PRIMARY KEY (`grp_cd`,`lang_cd`),
  UNIQUE KEY `cd_seq` (`cd_seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='�����ڵ�����';

CREATE TABLE `cm_cd_lang` (
  `lang_cd` varchar(4) NOT NULL COMMENT '����ڵ�',
  `lang_nm` varchar(100) NOT NULL COMMENT '����',
  `crt_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '�����Ͻ�',
  `udt_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '�����Ͻ�',
  PRIMARY KEY (`lang_cd`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='�ڵ屸��';

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

