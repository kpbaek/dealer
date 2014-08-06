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
  KEY `om_dealer_ibfk_1` (`worker_uid`),
  KEY `om_dealer_ibfk_2` (`file_grp_seq`),
  CONSTRAINT `om_dealer_ibfk_1` FOREIGN KEY (`worker_uid`) REFERENCES `om_worker` (`worker_uid`),
  CONSTRAINT `om_dealer_ibfk_2` FOREIGN KEY (`file_grp_seq`) REFERENCES `cm_file_grp` (`file_grp_seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='��������';

CREATE TABLE `om_invoice` (
  `pi_no` varchar(7) NOT NULL,
  `prn_qty` int(6) DEFAULT NULL,
  `prn_amt` decimal(8,2) DEFAULT NULL,
  `repr_parts_qty` int(6) unsigned DEFAULT NULL,
  `repr_parts_amt` decimal(8,2) unsigned DEFAULT NULL,
  `ship_port_atcd` varchar(8) DEFAULT NULL,
  `payment_atcd` varchar(8) NOT NULL,
  `tot_qty` int(6) unsigned DEFAULT NULL,
  `tot_amt` decimal(14,2) unsigned DEFAULT NULL,
  `destnt` varchar(50) DEFAULT NULL,
  `validity_dt` varchar(8) NOT NULL,
  `bank_atcd` varchar(8) DEFAULT NULL,
  `invoice_dt` varchar(8) NOT NULL,
  `pi_sndmail_seq` int(11) DEFAULT NULL,
  `ci_sndmail_seq` int(11) DEFAULT NULL,
  `crt_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '�����Ͻ�',
  `udt_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '�����Ͻ�',
  `crt_uid` varchar(15) NOT NULL COMMENT '������ID',
  `udt_uid` varchar(15) DEFAULT NULL COMMENT '������ID',
  PRIMARY KEY (`pi_no`),
  KEY `ci_sndmail_seq` (`ci_sndmail_seq`),
  KEY `pi_sndmail_seq` (`pi_sndmail_seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='��������';

CREATE TABLE `om_ord_eqp` (
  `pi_no` varchar(7) NOT NULL,
  `po_no` int(11) NOT NULL,
  `mdl_cd` varchar(4) DEFAULT NULL,
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
  `srl_prn_cab_ox` char(1) DEFAULT NULL,
  `calibr_sheet_ox` char(1) DEFAULT NULL,
  `pc_cab_ox` char(1) DEFAULT NULL,
  `remark` varchar(2000) DEFAULT NULL,
  `qty` int(6) unsigned DEFAULT NULL,
  `amt` decimal(13,2) unsigned DEFAULT NULL,
  `sndmail_seq` int(11) DEFAULT NULL,
  `crt_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '�����Ͻ�',
  `udt_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '�����Ͻ�',
  `crt_uid` varchar(15) NOT NULL COMMENT '������ID',
  `udt_uid` varchar(15) DEFAULT NULL COMMENT '������ID',
  PRIMARY KEY (`pi_no`,`po_no`),
  KEY `om_ord_eqp_ibfk_3` (`sndmail_seq`),
  KEY `mdl_cd` (`mdl_cd`),
  CONSTRAINT `om_ord_eqp_ibfk_1` FOREIGN KEY (`pi_no`) REFERENCES `om_ord_inf` (`pi_no`),
  CONSTRAINT `om_ord_eqp_ibfk_2` FOREIGN KEY (`mdl_cd`) REFERENCES `cm_cd` (`cd`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='�ֹ��������';

CREATE TABLE `om_ord_eqp_dtl` (
  `pi_no` varchar(7) NOT NULL,
  `po_no` int(11) NOT NULL,
  `cd` varchar(4) NOT NULL,
  `atcd` varchar(8) NOT NULL,
  `crt_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '�����Ͻ�',
  `udt_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '�����Ͻ�',
  `crt_uid` varchar(15) NOT NULL COMMENT '������ID',
  `udt_uid` varchar(15) DEFAULT NULL COMMENT '������ID',
  PRIMARY KEY (`po_no`,`cd`,`atcd`,`pi_no`),
  KEY `pi_no` (`pi_no`,`po_no`),
  KEY `cd` (`cd`,`atcd`),
  CONSTRAINT `om_ord_eqp_dtl_ibfk_1` FOREIGN KEY (`pi_no`, `po_no`) REFERENCES `om_ord_eqp` (`pi_no`, `po_no`),
  CONSTRAINT `om_ord_eqp_dtl_ibfk_2` FOREIGN KEY (`cd`, `atcd`) REFERENCES `cm_cd_attr` (`cd`, `atcd`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='�ֹ�����';

CREATE TABLE `om_ord_inf` (
  `pi_no` varchar(7) NOT NULL,
  `dealer_seq` int(11) NOT NULL,
  `worker_uid` varchar(15) NOT NULL,
  `cmpy_nm` varchar(50) DEFAULT NULL,
  `premium_rate` decimal(5,2) DEFAULT NULL,
  `tot_amt` decimal(14,2) DEFAULT NULL,
  `cnfm_yn` char(1) DEFAULT NULL,
  `cnfm_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '�ֹ�Ȯ���Ͻ�',
  `slip_sndmail_seq` int(11) DEFAULT NULL,
  `crt_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '�����Ͻ�',
  `udt_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '�����Ͻ�',
  `crt_uid` varchar(15) NOT NULL COMMENT '������ID',
  `udt_uid` varchar(15) DEFAULT NULL COMMENT '������ID',
  PRIMARY KEY (`pi_no`),
  KEY `worker_uid` (`worker_uid`),
  KEY `dealer_seq` (`dealer_seq`),
  KEY `slip_sndmail_seq` (`slip_sndmail_seq`),
  CONSTRAINT `om_ord_inf_ibfk_1` FOREIGN KEY (`dealer_seq`) REFERENCES `om_dealer` (`dealer_seq`),
  CONSTRAINT `om_ord_inf_ibfk_2` FOREIGN KEY (`slip_sndmail_seq`) REFERENCES `om_sndmail` (`sndmail_seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='�ֹ�����';

CREATE TABLE `om_ord_part` (
  `pi_no` varchar(7) NOT NULL,
  `swp_no` int(11) NOT NULL,
  `amt` decimal(13,2) unsigned DEFAULT NULL,
  `wgt` decimal(7,2) unsigned DEFAULT NULL,
  `sndmail_seq` int(11) DEFAULT NULL,
  `crt_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '�����Ͻ�',
  `udt_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '�����Ͻ�',
  `crt_uid` varchar(15) NOT NULL COMMENT '������ID',
  `udt_uid` varchar(15) DEFAULT NULL COMMENT '������ID',
  PRIMARY KEY (`pi_no`,`swp_no`),
  KEY `sndmail_seq` (`sndmail_seq`),
  CONSTRAINT `om_ord_part_ibfk_1` FOREIGN KEY (`pi_no`) REFERENCES `om_ord_inf` (`pi_no`),
  CONSTRAINT `om_ord_part_ibfk_2` FOREIGN KEY (`sndmail_seq`) REFERENCES `om_sndmail` (`sndmail_seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='�ֹ���ǰ����';

CREATE TABLE `om_ord_part_dtl` (
  `pi_no` varchar(7) NOT NULL,
  `swp_no` int(11) NOT NULL,
  `part_ver` varchar(8) NOT NULL,
  `part_cd` varchar(10) NOT NULL,
  `mdl_cd` varchar(4) NOT NULL,
  `qty` int(11) unsigned DEFAULT NULL,
  `offer_unit_price` decimal(13,2) unsigned DEFAULT NULL,
  `crt_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '�����Ͻ�',
  `udt_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '�����Ͻ�',
  `crt_uid` varchar(15) NOT NULL COMMENT '������ID',
  `udt_uid` varchar(15) DEFAULT NULL COMMENT '������ID',
  PRIMARY KEY (`pi_no`,`swp_no`,`part_cd`,`mdl_cd`,`part_ver`),
  KEY `part_ver` (`part_ver`,`part_cd`),
  KEY `part_cd` (`part_cd`,`mdl_cd`),
  CONSTRAINT `om_ord_part_dtl_ibfk_1` FOREIGN KEY (`pi_no`, `swp_no`) REFERENCES `om_ord_part` (`pi_no`, `swp_no`),
  CONSTRAINT `om_ord_part_dtl_ibfk_2` FOREIGN KEY (`part_ver`, `part_cd`) REFERENCES `om_part` (`part_ver`, `part_cd`),
  CONSTRAINT `om_ord_part_dtl_ibfk_3` FOREIGN KEY (`part_cd`, `mdl_cd`) REFERENCES `om_part_mdl` (`part_cd`, `mdl_cd`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='�ֹ���ǰ��';

CREATE TABLE `om_packing` (
  `pi_no` varchar(7) NOT NULL,
  `eqp_carton_no` varchar(8) DEFAULT NULL,
  `part_carton_no` varchar(8) DEFAULT NULL,
  `repr_carton_no` varchar(8) DEFAULT NULL,
  `part_cartons` int(4) unsigned DEFAULT NULL,
  `repr_cartons` int(4) unsigned DEFAULT NULL,
  `eqp_gross_wgt` decimal(5,1) unsigned DEFAULT NULL,
  `part_gross_wgt` decimal(5,1) unsigned DEFAULT NULL,
  `repr_gross_wgt` decimal(5,1) unsigned DEFAULT NULL,
  `tot_cartons` int(6) unsigned DEFAULT NULL,
  `tot_gross_wgt` decimal(8,2) unsigned DEFAULT NULL,
  `sndmail_seq` int(11) DEFAULT NULL,
  `crt_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '�����Ͻ�',
  `udt_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '�����Ͻ�',
  `crt_uid` varchar(15) NOT NULL COMMENT '������ID',
  `udt_uid` varchar(15) DEFAULT NULL COMMENT '������ID',
  PRIMARY KEY (`pi_no`),
  KEY `sndmail_seq` (`sndmail_seq`),
  CONSTRAINT `om_packing_ibfk_1` FOREIGN KEY (`sndmail_seq`) REFERENCES `om_sndmail` (`sndmail_seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Packing List';

CREATE TABLE `om_part` (
  `part_ver` varchar(8) NOT NULL COMMENT '��������',
  `part_cd` varchar(10) NOT NULL COMMENT '��ǰ�ڵ�',
  `part_nm` varchar(300) NOT NULL COMMENT '��ǰ��',
  `unit_price` decimal(9,2) NOT NULL COMMENT '��������',
  `unit_wgt` decimal(5,2) DEFAULT NULL COMMENT '�����߷�',
  `remark` varchar(1000) DEFAULT NULL COMMENT '�ǰ�',
  `srl_no` int(11) DEFAULT NULL COMMENT '�ø����ȣ',
  `recom_yn` char(1) CHARACTER SET latin1 NOT NULL DEFAULT 'N' COMMENT '��õ��ǰ����',
  `use_yn` char(1) NOT NULL DEFAULT 'Y' COMMENT '��뿩��',
  `disp_yn` char(1) CHARACTER SET latin1 NOT NULL DEFAULT 'N',
  `ord_num` int(11) DEFAULT NULL,
  `crt_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '�����Ͻ�',
  `udt_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '�����Ͻ�',
  `crt_uid` varchar(15) NOT NULL COMMENT '������ID',
  `udt_uid` varchar(15) DEFAULT NULL COMMENT '������ID',
  PRIMARY KEY (`part_ver`,`part_cd`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='��ǰ����';

CREATE TABLE `om_part_mdl` (
  `part_cd` varchar(10) NOT NULL COMMENT '��ǰ�ڵ�',
  `mdl_cd` varchar(4) NOT NULL COMMENT '�𵨼Ӽ��ڵ�',
  `disp_yn` char(1) NOT NULL DEFAULT 'Y' COMMENT '���÷��̿���',
  `use_yn` char(1) NOT NULL DEFAULT 'Y' COMMENT '��뿩��',
  `crt_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '�����Ͻ�',
  `udt_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '�����Ͻ�',
  `crt_uid` varchar(15) NOT NULL COMMENT '������ID',
  `udt_uid` varchar(15) DEFAULT NULL COMMENT '������ID',
  PRIMARY KEY (`part_cd`,`mdl_cd`),
  KEY `mdl_cd` (`mdl_cd`),
  CONSTRAINT `om_part_mdl_ibfk_1` FOREIGN KEY (`part_cd`) REFERENCES `om_part` (`part_ver`),
  CONSTRAINT `om_part_mdl_ibfk_2` FOREIGN KEY (`mdl_cd`) REFERENCES `cm_cd` (`cd`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='��ǰ������';

CREATE TABLE `om_part_ship_req` (
  `pi_no` varchar(7) NOT NULL,
  `swp_no` int(11) NOT NULL,
  `buyer` varchar(100) NOT NULL,
  `ctnt` varchar(1000) DEFAULT NULL COMMENT '�߰�����',
  `ship_dt` varchar(8) DEFAULT NULL,
  `send_yn` char(1) NOT NULL DEFAULT 'N',
  `crt_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '�����Ͻ�',
  `udt_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '�����Ͻ�',
  `crt_uid` varchar(15) NOT NULL COMMENT '������ID',
  `udt_uid` varchar(15) DEFAULT NULL COMMENT '������ID',
  PRIMARY KEY (`pi_no`,`swp_no`),
  CONSTRAINT `om_part_ship_req_ibfk_1` FOREIGN KEY (`pi_no`, `swp_no`) REFERENCES `om_ord_part` (`pi_no`, `swp_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='��ǰ����Ƿڼ�����';

CREATE TABLE `om_prd_req` (
  `swm_no` int(11) NOT NULL,
  `pi_no` varchar(7) NOT NULL,
  `po_no` int(11) NOT NULL,
  `qual_ship_dt` varchar(8) DEFAULT NULL COMMENT 'ǰ��������',
  `qual_trans_dt` varchar(8) DEFAULT NULL,
  `manual_lang_atcd` varchar(8) DEFAULT NULL,
  `extra` varchar(500) DEFAULT NULL COMMENT 'Ư�̻���',
  `sendmail_seq` int(11) DEFAULT NULL,
  `crt_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '�����Ͻ�',
  `udt_dt` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '�����Ͻ�(�ۼ���)',
  `crt_uid` varchar(15) NOT NULL COMMENT '������ID',
  `udt_uid` varchar(15) DEFAULT NULL COMMENT '������ID',
  PRIMARY KEY (`swm_no`),
  KEY `pi_no` (`pi_no`,`po_no`),
  CONSTRAINT `om_prd_req_ibfk_1` FOREIGN KEY (`pi_no`, `po_no`) REFERENCES `om_ord_eqp` (`pi_no`, `po_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='�����Ƿڼ�����';

CREATE TABLE `om_prd_req_dtl` (
  `swm_no` int(11) NOT NULL,
  `cd` varchar(4) NOT NULL,
  `atcd` varchar(8) NOT NULL,
  `atcd_ox` char(1) DEFAULT NULL,
  `crt_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '�����Ͻ�',
  `udt_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '�����Ͻ�',
  `crt_uid` varchar(15) NOT NULL COMMENT '������ID',
  `udt_uid` varchar(15) DEFAULT NULL COMMENT '������ID',
  PRIMARY KEY (`swm_no`,`cd`,`atcd`),
  KEY `cd` (`cd`,`atcd`),
  CONSTRAINT `om_prd_req_dtl_ibfk_1` FOREIGN KEY (`swm_no`) REFERENCES `om_prd_req` (`swm_no`),
  CONSTRAINT `om_prd_req_dtl_ibfk_2` FOREIGN KEY (`cd`, `atcd`) REFERENCES `cm_cd_attr` (`cd`, `atcd`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='�����Ƿڼ���';

CREATE TABLE `om_sndmail` (
  `sndmail_seq` int(11) NOT NULL COMMENT '���۸��ϼ���',
  `wrk_tp_atcd` varchar(8) NOT NULL COMMENT '�۾����� �Ӽ��ڵ�',
  `sender_email` varchar(15) NOT NULL COMMENT '������ID',
  `sender_eng_nm` varchar(50) DEFAULT NULL COMMENT '�����ڿ�����',
  `email_from` varchar(50) NOT NULL COMMENT '������EMAIL',
  `email_to` varchar(500) NOT NULL COMMENT '������EMAIL',
  `email_cc` varchar(500) DEFAULT NULL COMMENT '����EMAIL',
  `title` varchar(500) NOT NULL COMMENT '��������',
  `ctnt` text NOT NULL COMMENT '���ϳ���',
  `snd_yn` char(1) NOT NULL DEFAULT 'N' COMMENT '���ۿ���',
  `crt_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '�����Ͻ�',
  `crt_uid` varchar(15) NOT NULL COMMENT '������ID',
  PRIMARY KEY (`sndmail_seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='���۸�������';

CREATE TABLE `om_team_mail` (
  `post_atcd` varchar(8) NOT NULL COMMENT '�μ��Ӽ��ڵ�',
  `manager_email` varchar(50) DEFAULT NULL COMMENT '���������EMAIL',
  `team_email` varchar(50) NOT NULL COMMENT '��EMAIL',
  `team_mailing_yn` char(1) CHARACTER SET latin1 NOT NULL DEFAULT 'N' COMMENT '�����ϸ�����',
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
  `crt_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '�����Ͻ�',
  `crt_uid` varchar(15) NOT NULL COMMENT '������ID',
  `udt_dt` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '�����Ͻ�',
  `udt_uid` varchar(15) DEFAULT NULL COMMENT '������ID',
  PRIMARY KEY (`worker_uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='���������';

