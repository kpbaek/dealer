CREATE TABLE `om_admin` (
  `adm_uid` varchar(15) NOT NULL COMMENT '������ID',
  `adm_pswd` varchar(15) NOT NULL COMMENT '�����ں�й�ȣ',
  `auth_grp_cd` varchar(2) DEFAULT NULL COMMENT '���ѱ׷��ڵ�',
  `perms_cd` varchar(4) DEFAULT NULL COMMENT '�����ڵ�',
  `active_yn` char(1) CHARACTER SET latin1 NOT NULL DEFAULT 'N' COMMENT 'Ȱ��ȭ����',
  `last_logindt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '�����α����Ͻ�',
  `crt_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '�����Ͻ�',
  `udt_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '�����Ͻ�',
  PRIMARY KEY (`adm_uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='����������';

CREATE TABLE `om_dealer` (
  `dealer_seq` int(11) NOT NULL COMMENT '��������',
  `dealer_nm` varchar(30) DEFAULT NULL COMMENT '������',
  `email` varchar(50) NOT NULL COMMENT '�̸���',
  `pswd` varchar(15) DEFAULT NULL COMMENT '��й�ȣ',
  `cntry_atcd` varchar(4) NOT NULL COMMENT '�����Ӽ��ڵ�',
  `cmpy_nm` varchar(50) DEFAULT NULL COMMENT 'ȸ���',
  `biztp_atcd` varchar(4) DEFAULT NULL COMMENT '�������� �Ӽ��ڵ�',
  `job_tit` varchar(100) DEFAULT NULL COMMENT '����Ÿ��Ʋ',
  `addr` varchar(300) DEFAULT NULL COMMENT '�ּ�',
  `tel` varchar(20) DEFAULT NULL COMMENT '��ȭ��ȣ',
  `fax` varchar(20) DEFAULT NULL COMMENT '�ѽ�',
  `homepage` varchar(300) DEFAULT NULL COMMENT 'Ȩ������',
  `exper_years` varchar(4) DEFAULT NULL COMMENT '�������� ���۳⵵',
  `maincust_atcd` varchar(4) DEFAULT NULL COMMENT '�ְ� �Ӽ��ڵ�',
  `comments` varchar(2000) DEFAULT NULL COMMENT '�ڸ�Ʈ',
  `mkt_inf` varchar(4000) DEFAULT NULL COMMENT '����������',
  `worker_uid` varchar(15) DEFAULT NULL COMMENT '�۾���ID',
  `premium_rate` decimal(5,2) DEFAULT NULL COMMENT '������������',
  `bank_atcd` varchar(4) DEFAULT NULL COMMENT '����Ӽ��ڵ�',
  `attn` varchar(100) DEFAULT NULL COMMENT '���� �����',
  `file_grp_seq` int(11) DEFAULT NULL COMMENT '���ϱ׷����',
  `crt_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '�����Ͻ�',
  `crt_uid` varchar(15) NOT NULL COMMENT '������ID',
  `udt_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '�����Ͻ�',
  `udt_uid` varchar(15) DEFAULT NULL COMMENT '������ID',
  PRIMARY KEY (`dealer_seq`),
  KEY `om_dealer_ibfk_1` (`worker_uid`),
  CONSTRAINT `om_dealer_ibfk_1` FOREIGN KEY (`worker_uid`) REFERENCES `om_worker` (`worker_uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='��������';

CREATE TABLE `om_part` (
  `part_cd` varchar(10) NOT NULL COMMENT '��ǰ�ڵ�',
  `part_nm` varchar(300) NOT NULL COMMENT '��ǰ��',
  `unit_price` decimal(9,2) NOT NULL COMMENT '��������',
  `unit_wgt` decimal(5,2) DEFAULT NULL COMMENT '�����߷�',
  `remark` varchar(1000) DEFAULT NULL COMMENT '�ǰ�',
  `version` varchar(8) NOT NULL COMMENT '��������',
  `srl_no` int(11) DEFAULT NULL COMMENT '�ø����ȣ',
  `recom_yn` char(1) CHARACTER SET latin1 DEFAULT 'N' COMMENT '��õ��ǰ����',
  `use_yn` char(1) CHARACTER SET latin1 NOT NULL DEFAULT 'Y' COMMENT '��뿩��',
  `crt_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '�����Ͻ�',
  `udt_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '�����Ͻ�',
  `crt_uid` varchar(15) NOT NULL COMMENT '������ID',
  `udt_uid` varchar(15) DEFAULT NULL COMMENT '������ID',
  PRIMARY KEY (`part_cd`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='��ǰ����';

CREATE TABLE `om_part_mdl` (
  `part_cd` varchar(10) NOT NULL COMMENT '��ǰ�ڵ�',
  `mdl_atcd` varchar(4) NOT NULL COMMENT '�𵨼Ӽ��ڵ�',
  `disp_yn` char(1) CHARACTER SET latin1 NOT NULL DEFAULT 'Y' COMMENT '���÷��̿���',
  `use_yn` char(1) CHARACTER SET latin1 NOT NULL DEFAULT 'Y' COMMENT '��뿩��',
  `crt_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '�����Ͻ�',
  `udt_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '�����Ͻ�',
  `crt_uid` varchar(15) NOT NULL COMMENT '������ID',
  `udt_uid` varchar(15) DEFAULT NULL COMMENT '������ID',
  PRIMARY KEY (`part_cd`,`mdl_atcd`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='��ǰ������';

CREATE TABLE `om_sndmail` (
  `seq` int(11) NOT NULL AUTO_INCREMENT COMMENT '����',
  `wrk_tp_atcd` varchar(4) DEFAULT NULL COMMENT '�۾����� �Ӽ��ڵ�',
  `sender_uid` varchar(15) NOT NULL COMMENT '������ID',
  `sender_nm` varchar(50) DEFAULT NULL COMMENT '�����ڸ�',
  `email_from` varchar(50) NOT NULL COMMENT '������EMAIL',
  `email_to` varchar(500) DEFAULT NULL COMMENT '������EMAIL',
  `email_cc` varchar(500) DEFAULT NULL COMMENT '����EMAIL',
  `title` varchar(500) DEFAULT NULL COMMENT '��������',
  `ctnt` text CHARACTER SET latin1 NOT NULL COMMENT '���ϳ���',
  `crt_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '�����Ͻ�',
  `crt_uid` varchar(15) NOT NULL COMMENT '������ID',
  PRIMARY KEY (`seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='���۸�������';

CREATE TABLE `om_team_mail` (
  `post_atcd` varchar(4) NOT NULL COMMENT '�μ��Ӽ��ڵ�',
  `team_email` varchar(50) NOT NULL COMMENT '��EMAIL',
  `mailing_yn` char(1) CHARACTER SET latin1 NOT NULL COMMENT '���ϸ�����',
  PRIMARY KEY (`post_atcd`,`team_email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='����������';

CREATE TABLE `om_worker` (
  `worker_uid` varchar(15) NOT NULL COMMENT '�����ID',
  `kr_nm` varchar(20) NOT NULL COMMENT '����ڸ�',
  `eng_nm` varchar(50) DEFAULT NULL COMMENT '����ڿ�����',
  `email` varchar(50) NOT NULL COMMENT '������̸���',
  `post_atcd` varchar(4) NOT NULL COMMENT '�μ��Ӽ��ڵ�',
  `duty_atcd` varchar(4) NOT NULL COMMENT '�����Ӽ��ڵ�',
  `extns_num` varchar(4) DEFAULT NULL COMMENT '������ȣ',
  `moblie_num` varchar(11) DEFAULT NULL COMMENT '�ڵ�����ȣ',
  `mailing_yn` char(1) CHARACTER SET latin1 NOT NULL DEFAULT 'Y' COMMENT '���ϸ�����',
  `aprv_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '�����Ͻ�',
  PRIMARY KEY (`worker_uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='���������';

