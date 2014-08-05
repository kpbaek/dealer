CREATE TABLE `om_admin` (
  `adm_uid` varchar(15) NOT NULL COMMENT '������ID',
  `adm_pswd` varchar(15) NOT NULL COMMENT '�����ں�й�ȣ',
  `auth_grp_cd` varchar(2) DEFAULT NULL COMMENT '���ѱ׷��ڵ�',
  `perms_cd` varchar(4) DEFAULT NULL COMMENT '�����ڵ�',
  `active_yn` char(1) NOT NULL DEFAULT 'N' COMMENT 'Ȱ��ȭ����',
  `last_logindt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '�����α����Ͻ�',
  `crt_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '�����Ͻ�',
  `udt_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '�����Ͻ�',
  PRIMARY KEY (`adm_uid`),
  KEY `om_admin_ibfk_1` (`auth_grp_cd`),
  CONSTRAINT `om_admin_ibfk_1` FOREIGN KEY (`auth_grp_cd`) REFERENCES `cm_auth_grp` (`auth_grp_cd`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='����������';

CREATE TABLE `om_dealer` (
  `dealer_seq` int(11) NOT NULL COMMENT '��������',
  `dealer_nm` varchar(30) DEFAULT NULL COMMENT '������',
  `email` varchar(50) NOT NULL COMMENT '�̸���',
  `pswd` varchar(15) DEFAULT NULL COMMENT '��й�ȣ',
  `cntry_atcd` varchar(8) NOT NULL COMMENT '�����Ӽ��ڵ�',
  `cmpy_nm` varchar(50) DEFAULT NULL COMMENT 'ȸ���',
  `biztp_atcd` varchar(8) DEFAULT NULL COMMENT '�������� �Ӽ��ڵ�',
  `job_tit` varchar(100) DEFAULT NULL COMMENT '����Ÿ��Ʋ',
  `addr` varchar(300) DEFAULT NULL COMMENT '�ּ�',
  `tel` varchar(20) DEFAULT NULL COMMENT '��ȭ��ȣ',
  `fax` varchar(20) DEFAULT NULL COMMENT '�ѽ�',
  `homepage` varchar(300) DEFAULT NULL COMMENT 'Ȩ������',
  `exper_years` varchar(4) DEFAULT NULL COMMENT '�������� ���۳⵵',
  `maincust_atcd` varchar(8) DEFAULT NULL COMMENT '�ְ� �Ӽ��ڵ�',
  `comments` varchar(2000) DEFAULT NULL COMMENT '�ڸ�Ʈ',
  `mkt_inf` varchar(4000) DEFAULT NULL COMMENT '����������',
  `worker_uid` varchar(15) DEFAULT NULL COMMENT '�����ID',
  `premium_rate` decimal(5,2) DEFAULT NULL COMMENT '������������',
  `bank_atcd` varchar(8) DEFAULT NULL COMMENT '����Ӽ��ڵ�',
  `attn` varchar(100) DEFAULT NULL COMMENT '���� �����',
  `file_grp_seq` int(11) DEFAULT NULL COMMENT '���ϱ׷����',
  `crt_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '�����Ͻ�',
  `crt_uid` varchar(15) NOT NULL COMMENT '������ID',
  `udt_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '�����Ͻ�',
  `udt_uid` varchar(15) DEFAULT NULL COMMENT '������ID',
  PRIMARY KEY (`dealer_seq`),
  KEY `worker_uid` (`worker_uid`),
  CONSTRAINT `om_dealer_ibfk_1` FOREIGN KEY (`worker_uid`) REFERENCES `om_worker` (`worker_uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='��������';

CREATE TABLE `om_invoice` (
  `pi_no` varchar(10) NOT NULL,
  `crt_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '�����Ͻ�',
  `udt_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '�����Ͻ�',
  `crt_uid` varchar(15) NOT NULL COMMENT '������ID',
  `udt_uid` varchar(15) DEFAULT NULL COMMENT '������ID',
  PRIMARY KEY (`pi_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='��������';

CREATE TABLE `om_ord_eqp` (
  `po_no` varchar(10) NOT NULL,
  `pi_no` varchar(10) DEFAULT NULL,
  `mdl_atcd` varchar(8) DEFAULT NULL,
  `srl_atcd` varchar(8) DEFAULT NULL,
  `lcd_color_atcd` varchar(8) DEFAULT NULL,
  `lcd_lang_atcd` varchar(8) DEFAULT NULL,
  `rjt_pkt_tp_atcd` varchar(8) DEFAULT NULL,
  `pwr_cab_atcd` varchar(8) DEFAULT NULL,
  `shipped_by_atcd` varchar(8) DEFAULT NULL,
  `courrier_atcd` varchar(8) DEFAULT NULL,
  `delivery_dt` varchar(8) DEFAULT NULL,
  `payment_atcd` varchar(8) DEFAULT NULL,
  `incoterms_atcd` varchar(8) DEFAULT NULL,
  `acct_no` varchar(20) DEFAULT NULL,
  `srl_prn_cab_ox` char(1) CHARACTER SET latin1 DEFAULT NULL,
  `calibr_sheet_ox` char(1) CHARACTER SET latin1 DEFAULT NULL,
  `pc_cab_ox` char(1) CHARACTER SET latin1 DEFAULT NULL,
  `remark` varchar(2000) DEFAULT NULL,
  `qty` int(6) unsigned DEFAULT NULL,
  `amt` decimal(13,2) unsigned DEFAULT NULL,
  `crt_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '�����Ͻ�',
  `udt_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '�����Ͻ�',
  `crt_uid` varchar(15) NOT NULL COMMENT '������ID',
  `udt_uid` varchar(15) DEFAULT NULL COMMENT '������ID',
  PRIMARY KEY (`po_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='�ֹ��������';

CREATE TABLE `om_ord_eqp_dtl` (
  `po_no` varchar(10) NOT NULL,
  `cd` varchar(4) NOT NULL,
  `atcd` varchar(8) NOT NULL,
  `crt_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '�����Ͻ�',
  `udt_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '�����Ͻ�',
  `crt_uid` varchar(15) NOT NULL COMMENT '������ID',
  `udt_uid` varchar(15) DEFAULT NULL COMMENT '������ID',
  PRIMARY KEY (`po_no`,`cd`,`atcd`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='�ֹ�����';

CREATE TABLE `om_ord_inf` (
  `pi_no` varchar(10) NOT NULL,
  `dealer_seq` int(11) NOT NULL,
  `worker_uid` varchar(15) NOT NULL,
  `cmpy_nm` varchar(50) DEFAULT NULL,
  `premium_rate` decimal(5,2) DEFAULT NULL,
  `tot_amt` decimal(14,2) DEFAULT NULL,
  `cnfm_yn` char(1) CHARACTER SET latin1 DEFAULT NULL,
  `cnfm_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '�ֹ�Ȯ���Ͻ�',
  `pi_send_yn` char(1) CHARACTER SET latin1 NOT NULL DEFAULT 'N',
  `ci_send_yn` char(1) CHARACTER SET latin1 NOT NULL DEFAULT 'N',
  `pack_send_yn` char(1) CHARACTER SET latin1 NOT NULL DEFAULT 'N',
  `slip_send_yn` char(1) CHARACTER SET latin1 NOT NULL DEFAULT 'N',
  `crt_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '�����Ͻ�',
  `udt_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '�����Ͻ�',
  `crt_uid` varchar(15) NOT NULL COMMENT '������ID',
  `udt_uid` varchar(15) DEFAULT NULL COMMENT '������ID',
  PRIMARY KEY (`pi_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='�ֹ�����';

CREATE TABLE `om_ord_part` (
  `ord_part_seq` int(11) NOT NULL,
  `pi_no` varchar(10) DEFAULT NULL,
  `amt` decimal(13,2) unsigned DEFAULT NULL,
  `wgt` decimal(7,2) unsigned DEFAULT NULL,
  `crt_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '�����Ͻ�',
  `udt_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '�����Ͻ�',
  `crt_uid` varchar(15) NOT NULL COMMENT '������ID',
  `udt_uid` varchar(15) DEFAULT NULL COMMENT '������ID',
  PRIMARY KEY (`ord_part_seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='�ֹ���ǰ����';

CREATE TABLE `om_ord_part_dtl` (
  `ord_part_seq` int(11) NOT NULL,
  `part_cd` varchar(10) NOT NULL,
  `mdl_atcd` varchar(8) NOT NULL,
  `qty` int(11) unsigned DEFAULT NULL,
  `offer_unit_price` decimal(13,2) unsigned DEFAULT NULL,
  `crt_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '�����Ͻ�',
  `udt_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '�����Ͻ�',
  `crt_uid` varchar(15) NOT NULL COMMENT '������ID',
  `udt_uid` varchar(15) DEFAULT NULL COMMENT '������ID',
  PRIMARY KEY (`ord_part_seq`,`part_cd`,`mdl_atcd`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='�ֹ���ǰ��';

CREATE TABLE `om_part` (
  `part_cd` varchar(10) NOT NULL COMMENT '��ǰ�ڵ�',
  `part_nm` varchar(300) NOT NULL COMMENT '��ǰ��',
  `unit_price` decimal(9,2) NOT NULL COMMENT '��������',
  `unit_wgt` decimal(5,2) DEFAULT NULL COMMENT '�����߷�',
  `remark` varchar(1000) DEFAULT NULL COMMENT '�ǰ�',
  `version` varchar(8) NOT NULL COMMENT '��������',
  `srl_no` int(11) DEFAULT NULL COMMENT '�ø����ȣ',
  `recom_yn` char(1) DEFAULT 'N' COMMENT '��õ��ǰ����',
  `use_yn` char(1) NOT NULL DEFAULT 'Y' COMMENT '��뿩��',
  `crt_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '�����Ͻ�',
  `udt_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '�����Ͻ�',
  `crt_uid` varchar(15) NOT NULL COMMENT '������ID',
  `udt_uid` varchar(15) DEFAULT NULL COMMENT '������ID',
  PRIMARY KEY (`part_cd`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='��ǰ����';

CREATE TABLE `om_part_mdl` (
  `part_cd` varchar(10) NOT NULL COMMENT '��ǰ�ڵ�',
  `mdl_atcd` varchar(8) NOT NULL COMMENT '�𵨼Ӽ��ڵ�',
  `disp_yn` char(1) NOT NULL DEFAULT 'Y' COMMENT '���÷��̿���',
  `use_yn` char(1) NOT NULL DEFAULT 'Y' COMMENT '��뿩��',
  `crt_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '�����Ͻ�',
  `udt_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '�����Ͻ�',
  `crt_uid` varchar(15) NOT NULL COMMENT '������ID',
  `udt_uid` varchar(15) DEFAULT NULL COMMENT '������ID',
  PRIMARY KEY (`part_cd`,`mdl_atcd`),
  CONSTRAINT `om_part_mdl_ibfk_1` FOREIGN KEY (`part_cd`) REFERENCES `om_part` (`part_cd`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='��ǰ������';

CREATE TABLE `om_part_ship_req` (
  `po_no` varchar(10) NOT NULL,
  `buyer` varchar(100) NOT NULL,
  `ctnt` varchar(1000) DEFAULT NULL COMMENT '�߰�����',
  `ship_dt` varchar(8) DEFAULT NULL,
  `send_yn` char(1) CHARACTER SET latin1 NOT NULL DEFAULT 'N',
  `crt_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '�����Ͻ�',
  `udt_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '�����Ͻ�',
  `crt_uid` varchar(15) NOT NULL COMMENT '������ID',
  `udt_uid` varchar(15) DEFAULT NULL COMMENT '������ID',
  PRIMARY KEY (`po_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='��ǰ����Ƿڼ�����';

CREATE TABLE `om_prd_req` (
  `swm_no` varchar(10) NOT NULL,
  `po_no` varchar(10) NOT NULL,
  `qual_ship_dt` varchar(8) DEFAULT NULL COMMENT 'ǰ��������',
  `qual_trans_dt` varchar(8) DEFAULT NULL,
  `extra` varchar(500) DEFAULT NULL COMMENT 'Ư�̻���',
  `send_yn` char(1) CHARACTER SET latin1 DEFAULT NULL,
  `crt_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '�����Ͻ�',
  `udt_dt` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '�����Ͻ�(�ۼ���)',
  `crt_uid` varchar(15) NOT NULL COMMENT '������ID',
  `udt_uid` varchar(15) DEFAULT NULL COMMENT '������ID',
  PRIMARY KEY (`swm_no`),
  UNIQUE KEY `po_no` (`po_no`),
  CONSTRAINT `om_prd_req_ibfk_1` FOREIGN KEY (`po_no`) REFERENCES `om_ord_eqp` (`po_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='�����Ƿڼ�����';

CREATE TABLE `om_prd_req_dtl` (
  `swm_no` varchar(10) NOT NULL,
  `cd` varchar(4) NOT NULL,
  `atcd` varchar(8) NOT NULL,
  `atcd_ox` char(1) DEFAULT NULL,
  `crt_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '�����Ͻ�',
  `udt_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '�����Ͻ�',
  `crt_uid` varchar(15) NOT NULL COMMENT '������ID',
  `udt_uid` varchar(15) DEFAULT NULL COMMENT '������ID',
  PRIMARY KEY (`swm_no`,`cd`,`atcd`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='�����Ƿڼ���';

CREATE TABLE `om_sndmail` (
  `sndmail_seq` int(11) NOT NULL AUTO_INCREMENT COMMENT '���۸��ϼ���',
  `wrk_tp_atcd` varchar(8) DEFAULT NULL COMMENT '�۾����� �Ӽ��ڵ�',
  `sender_uid` varchar(15) NOT NULL COMMENT '������ID',
  `sender_nm` varchar(50) DEFAULT NULL COMMENT '�����ڸ�',
  `email_from` varchar(50) NOT NULL COMMENT '������EMAIL',
  `email_to` varchar(500) DEFAULT NULL COMMENT '������EMAIL',
  `email_cc` varchar(500) DEFAULT NULL COMMENT '����EMAIL',
  `title` varchar(500) DEFAULT NULL COMMENT '��������',
  `ctnt` text NOT NULL COMMENT '���ϳ���',
  `crt_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '�����Ͻ�',
  `crt_uid` varchar(15) NOT NULL COMMENT '������ID',
  PRIMARY KEY (`sndmail_seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='���۸�������';

CREATE TABLE `om_team_mail` (
  `post_atcd` varchar(8) NOT NULL COMMENT '�μ��Ӽ��ڵ�',
  `team_email` varchar(50) NOT NULL COMMENT '��EMAIL',
  `mailing_yn` char(1) NOT NULL DEFAULT 'Y' COMMENT '���ϸ�����',
  PRIMARY KEY (`post_atcd`,`team_email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='����������';

CREATE TABLE `om_worker` (
  `worker_uid` varchar(15) NOT NULL COMMENT '�����ID',
  `kr_nm` varchar(20) NOT NULL COMMENT '����ڸ�',
  `eng_nm` varchar(50) DEFAULT NULL COMMENT '����ڿ�����',
  `email` varchar(50) NOT NULL COMMENT '������̸���',
  `post_atcd` varchar(8) NOT NULL COMMENT '�μ��Ӽ��ڵ�',
  `duty_atcd` varchar(8) NOT NULL COMMENT '�����Ӽ��ڵ�',
  `extns_num` varchar(4) DEFAULT NULL COMMENT '������ȣ',
  `moblie_num` varchar(11) DEFAULT NULL COMMENT '�ڵ�����ȣ',
  `mailing_yn` char(1) NOT NULL DEFAULT 'Y' COMMENT '���ϸ�����',
  `aprv_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '�����Ͻ�',
  PRIMARY KEY (`worker_uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='���������';

