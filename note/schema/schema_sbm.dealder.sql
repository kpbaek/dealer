CREATE TABLE `om_dealer` (
  `dealer_seq` int(11) NOT NULL AUTO_INCREMENT COMMENT '��������',
  `dealer_nm` varchar(50) DEFAULT NULL COMMENT '������',
  `dealer_uid` varchar(50) NOT NULL COMMENT '����ID',
  `email` varchar(50) NOT NULL COMMENT '�̸���',
  `nation_atcd` varchar(8) NOT NULL COMMENT '�����Ӽ��ڵ�',
  `cmpy_nm` varchar(50) DEFAULT NULL COMMENT 'ȸ���',
  `job_tit` varchar(100) DEFAULT NULL COMMENT '����Ÿ��Ʋ',
  `addr` varchar(300) DEFAULT NULL COMMENT '�ּ�',
  `tel` varchar(50) DEFAULT NULL COMMENT '��ȭ��ȣ',
  `fax` varchar(50) DEFAULT NULL COMMENT '�ѽ�',
  `homepage` varchar(300) DEFAULT NULL COMMENT 'Ȩ������',
  `exper_years` varchar(4) DEFAULT NULL COMMENT '�������� ���۳⵵',
  `maincust_atcd` varchar(8) DEFAULT NULL COMMENT '�ְ� �Ӽ��ڵ�',
  `comments` varchar(2000) DEFAULT NULL COMMENT '�ڸ�Ʈ',
  `mkt_inf` varchar(4000) DEFAULT NULL COMMENT '����������',
  `worker_uid` varchar(50) DEFAULT NULL COMMENT '�����ID',
  `premium_rate` decimal(5,2) DEFAULT NULL COMMENT '������������',
  `bank_atcd` varchar(8) DEFAULT NULL COMMENT '����Ӽ��ڵ�',
  `attn` varchar(100) DEFAULT NULL COMMENT '���� �����',
  `file_grp_seq` int(11) DEFAULT NULL COMMENT '���ϱ׷����',
  `crt_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '�����Ͻ�',
  `crt_uid` varchar(50) NOT NULL COMMENT '������ID',
  `udt_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '�����Ͻ�',
  `udt_uid` varchar(15) DEFAULT NULL COMMENT '������ID',
  PRIMARY KEY (`dealer_seq`),
  UNIQUE KEY `email` (`email`),
  KEY `dealer_uid` (`dealer_uid`),
  KEY `worker_uid` (`worker_uid`),
  KEY `file_grp_seq` (`file_grp_seq`),
  CONSTRAINT `om_dealer_ibfk_1` FOREIGN KEY (`dealer_uid`) REFERENCES `om_user` (`uid`),
  CONSTRAINT `om_dealer_ibfk_2` FOREIGN KEY (`worker_uid`) REFERENCES `om_worker` (`worker_uid`),
  CONSTRAINT `om_dealer_ibfk_3` FOREIGN KEY (`file_grp_seq`) REFERENCES `cm_file_grp` (`file_grp_seq`)
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8 COMMENT='��������';

CREATE TABLE `om_invoice` (
  `pi_no` varchar(7) NOT NULL COMMENT 'PI��ȣ',
  `prn_qty` int(6) DEFAULT NULL COMMENT '�����ͼ���',
  `prn_tot_amt` decimal(8,2) DEFAULT NULL COMMENT '�������ѱݾ�',
  `repr_qty` int(6) unsigned DEFAULT NULL COMMENT '����ǰ����',
  `repr_tot_amt` decimal(8,2) unsigned DEFAULT NULL COMMENT '����ǰ�ѱݾ�',
  `ship_port_atcd` varchar(8) NOT NULL COMMENT '�����׼Ӽ��ڵ�',
  `payment_atcd` varchar(8) NOT NULL COMMENT '���ҼӼ��ڵ�',
  `tot_qty` int(6) unsigned NOT NULL COMMENT '�Ѽ���',
  `tot_amt` decimal(14,2) unsigned NOT NULL COMMENT '�ѱݾ�',
  `destnt` varchar(50) NOT NULL COMMENT '������',
  `validity` varchar(8) NOT NULL COMMENT '��ȿ�Ⱓ(YYYYMMDD)',
  `bank_atcd` varchar(8) NOT NULL COMMENT '����Ӽ��ڵ�',
  `invoice_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '��������Ͻ�',
  `pi_sndmail_seq` int(11) DEFAULT NULL COMMENT 'PI�߼۸��ϼ���',
  `ci_sndmail_seq` int(11) DEFAULT NULL COMMENT 'CI�߼۸��ϼ���',
  `crt_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '�����Ͻ�',
  `udt_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '�����Ͻ�',
  `crt_uid` varchar(50) NOT NULL COMMENT '������ID',
  `udt_uid` varchar(50) DEFAULT NULL COMMENT '������ID',
  PRIMARY KEY (`pi_no`),
  KEY `ci_sndmail_seq` (`ci_sndmail_seq`),
  KEY `om_invoice_ibfk_2` (`pi_sndmail_seq`),
  CONSTRAINT `om_invoice_ibfk_1` FOREIGN KEY (`pi_no`) REFERENCES `om_ord_inf` (`pi_no`),
  CONSTRAINT `om_invoice_ibfk_2` FOREIGN KEY (`pi_sndmail_seq`) REFERENCES `om_sndmail` (`sndmail_seq`),
  CONSTRAINT `om_invoice_ibfk_3` FOREIGN KEY (`ci_sndmail_seq`) REFERENCES `om_sndmail` (`sndmail_seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='��������';

CREATE TABLE `om_mdl` (
  `mdl_cd` varchar(4) NOT NULL COMMENT '���ڵ�',
  `mdl_nm` varchar(100) NOT NULL COMMENT '�𵨸�',
  `mdl_stat_atcd` char(1) CHARACTER SET latin1 DEFAULT NULL COMMENT '�𵨻��¼Ӽ��ڵ�',
  `net_wgt` decimal(4,1) unsigned DEFAULT NULL COMMENT '���߷�',
  `gross_wgt` decimal(4,1) unsigned DEFAULT NULL COMMENT '���߷�',
  PRIMARY KEY (`mdl_cd`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='������';

CREATE TABLE `om_ord_eqp` (
  `pi_no` varchar(7) NOT NULL COMMENT 'PI��ȣ',
  `po_no` int(11) NOT NULL AUTO_INCREMENT COMMENT '�ֹ���ȣ',
  `mdl_cd` varchar(4) DEFAULT NULL COMMENT '���ڵ�',
  `srl_atcd` varchar(8) DEFAULT NULL COMMENT '�ø���ѹ��Ӽ��ڵ�',
  `lcd_color_atcd` varchar(8) DEFAULT NULL COMMENT 'LCD�÷� �Ӽ��ڵ�',
  `lcd_lang_atcd` varchar(8) DEFAULT NULL COMMENT 'LCD��� �Ӽ��ڵ�',
  `rjt_pkt_tp_atcd` varchar(8) DEFAULT NULL COMMENT 'Reject Pocket ���� �Ӽ��ڵ�',
  `pwr_cab_atcd` varchar(8) DEFAULT NULL COMMENT '�Ŀ����̺� �Ӽ��ڵ�',
  `shipped_by_atcd` varchar(8) DEFAULT NULL COMMENT '���۹�� �Ӽ��ڵ�',
  `courier_atcd` varchar(8) DEFAULT NULL COMMENT 'Ư�� �Ӽ��ڵ�',
  `delivery_dt` varchar(8) DEFAULT NULL COMMENT '��������',
  `payment_atcd` varchar(8) DEFAULT NULL COMMENT '���ҼӼ��ڵ�',
  `incoterms_atcd` varchar(8) DEFAULT NULL COMMENT '�������� �Ӽ��ڵ�',
  `acct_no` varchar(20) DEFAULT NULL COMMENT 'account��ȣ',
  `srl_prn_cab_ox` char(1) CHARACTER SET latin1 DEFAULT NULL COMMENT '�ø������������̺� OX����',
  `calibr_sheet_ox` char(1) CHARACTER SET latin1 DEFAULT NULL COMMENT 'Calibration Sheet OX����',
  `pc_cab_ox` char(1) CHARACTER SET latin1 DEFAULT NULL COMMENT 'PC���̺� OX����',
  `remark` varchar(2000) DEFAULT NULL COMMENT '����',
  `qty` int(6) unsigned DEFAULT NULL COMMENT '�ֹ�����',
  `amt` decimal(13,2) unsigned DEFAULT NULL COMMENT '�ֹ��ݾ�',
  `sndmail_seq` int(11) DEFAULT NULL COMMENT '�߼۸��ϼ���',
  `crt_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '�����Ͻ�',
  `udt_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '�����Ͻ�',
  `crt_uid` varchar(50) NOT NULL COMMENT '������ID',
  `udt_uid` varchar(50) DEFAULT NULL COMMENT '������ID',
  PRIMARY KEY (`pi_no`,`po_no`),
  UNIQUE KEY `po_no` (`po_no`),
  KEY `om_ord_eqp_ibfk_3` (`sndmail_seq`),
  KEY `om_ord_eqp_ibfk_2` (`mdl_cd`),
  CONSTRAINT `om_ord_eqp_ibfk_1` FOREIGN KEY (`pi_no`) REFERENCES `om_ord_inf` (`pi_no`),
  CONSTRAINT `om_ord_eqp_ibfk_2` FOREIGN KEY (`mdl_cd`) REFERENCES `om_mdl` (`mdl_cd`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='�ֹ��������';

CREATE TABLE `om_ord_eqp_dtl` (
  `pi_no` varchar(7) NOT NULL COMMENT 'PI��ȣ',
  `po_no` int(11) NOT NULL COMMENT '�ֹ���ȣ',
  `cd` varchar(4) NOT NULL COMMENT '�ڵ�',
  `atcd` varchar(8) NOT NULL COMMENT '�Ӽ��ڵ�',
  `crt_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '�����Ͻ�',
  `udt_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '�����Ͻ�',
  `crt_uid` varchar(50) NOT NULL COMMENT '������ID',
  `udt_uid` varchar(50) DEFAULT NULL COMMENT '������ID',
  PRIMARY KEY (`po_no`,`cd`,`atcd`,`pi_no`),
  KEY `om_ord_eqp_dtl_ibfk_1` (`pi_no`,`po_no`),
  KEY `om_ord_eqp_dtl_ibfk_2` (`cd`,`atcd`),
  CONSTRAINT `om_ord_eqp_dtl_ibfk_1` FOREIGN KEY (`pi_no`, `po_no`) REFERENCES `om_ord_eqp` (`pi_no`, `po_no`),
  CONSTRAINT `om_ord_eqp_dtl_ibfk_2` FOREIGN KEY (`cd`, `atcd`) REFERENCES `cm_cd_attr` (`cd`, `atcd`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='�ֹ�����';

CREATE TABLE `om_ord_inf` (
  `pi_no` varchar(7) NOT NULL COMMENT 'PI��ȣ',
  `cntry_atcd` varchar(8) NOT NULL COMMENT '�����Ӽ��ڵ�',
  `dealer_seq` int(11) NOT NULL COMMENT '��������',
  `worker_uid` varchar(15) NOT NULL COMMENT '�����ID',
  `cmpy_nm` varchar(50) DEFAULT NULL COMMENT 'ȸ���',
  `premium_rate` decimal(5,2) DEFAULT NULL COMMENT '��������',
  `tot_amt` decimal(14,2) DEFAULT NULL COMMENT '�ֹ��ѱݾ�',
  `cnfm_yn` char(1) CHARACTER SET latin1 DEFAULT NULL COMMENT '�ֹ�Ȯ������',
  `cnfm_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '�ֹ�Ȯ���Ͻ�',
  `slip_sndmail_seq` int(11) DEFAULT NULL COMMENT '�����ǥ�߼۸��ϼ���',
  `wrk_tp_atcd` varchar(8) DEFAULT NULL COMMENT '�۾������Ӽ��ڵ�',
  `crt_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '�����Ͻ�',
  `udt_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '�����Ͻ�',
  `crt_uid` varchar(50) NOT NULL COMMENT '������ID',
  `udt_uid` varchar(50) DEFAULT NULL COMMENT '������ID',
  PRIMARY KEY (`pi_no`),
  KEY `om_ord_inf_ibfk_3` (`worker_uid`),
  KEY `dealer_seq` (`dealer_seq`),
  KEY `slip_sndmail_seq` (`slip_sndmail_seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='�ֹ�����';

CREATE TABLE `om_ord_part` (
  `pi_no` varchar(7) NOT NULL COMMENT 'PI��ȣ',
  `swp_no` int(11) NOT NULL AUTO_INCREMENT COMMENT 'SWP��ȣ',
  `amt` decimal(13,2) unsigned DEFAULT NULL COMMENT '�ֹ��ݾ�',
  `wgt` decimal(7,2) unsigned DEFAULT NULL COMMENT '�߷�',
  `sndmail_seq` int(11) DEFAULT NULL COMMENT '�߼۸��ϼ���',
  `crt_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '�����Ͻ�',
  `udt_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '�����Ͻ�',
  `crt_uid` varchar(50) NOT NULL COMMENT '������ID',
  `udt_uid` varchar(50) DEFAULT NULL COMMENT '������ID',
  PRIMARY KEY (`pi_no`,`swp_no`),
  UNIQUE KEY `swp_no` (`swp_no`),
  KEY `om_ord_part_ibfk_2` (`sndmail_seq`),
  CONSTRAINT `om_ord_part_ibfk_1` FOREIGN KEY (`pi_no`) REFERENCES `om_ord_inf` (`pi_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='�ֹ���ǰ����';

CREATE TABLE `om_ord_part_dtl` (
  `pi_no` varchar(7) NOT NULL COMMENT 'PI��ȣ',
  `swp_no` int(11) NOT NULL COMMENT 'SWP��ȣ',
  `mdl_cd` varchar(4) NOT NULL COMMENT '���ڵ�',
  `part_ver` varchar(8) NOT NULL COMMENT '��ǰ����',
  `part_cd` varchar(13) NOT NULL COMMENT '��ǰ�ڵ�',
  `qty` int(11) unsigned DEFAULT NULL COMMENT '����',
  `unit_prd_cost` decimal(13,2) unsigned DEFAULT NULL COMMENT '���޴ܰ�',
  `crt_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '�����Ͻ�',
  `udt_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '�����Ͻ�',
  `crt_uid` varchar(50) NOT NULL COMMENT '������ID',
  `udt_uid` varchar(50) DEFAULT NULL COMMENT '������ID',
  PRIMARY KEY (`pi_no`,`swp_no`,`part_cd`,`mdl_cd`,`part_ver`),
  KEY `om_ord_part_dtl_ibfk_3` (`part_cd`,`mdl_cd`),
  KEY `part_ver` (`part_ver`,`part_cd`,`mdl_cd`),
  KEY `om_ord_part_dtl_ibfk_2` (`mdl_cd`,`part_ver`,`part_cd`),
  CONSTRAINT `om_ord_part_dtl_ibfk_1` FOREIGN KEY (`pi_no`, `swp_no`) REFERENCES `om_ord_part` (`pi_no`, `swp_no`),
  CONSTRAINT `om_ord_part_dtl_ibfk_2` FOREIGN KEY (`mdl_cd`, `part_ver`, `part_cd`) REFERENCES `om_part` (`mdl_cd`, `part_ver`, `part_cd`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='�ֹ���ǰ��';

CREATE TABLE `om_packing` (
  `pi_no` varchar(7) NOT NULL COMMENT 'PI��ȣ',
  `eqp_carton_no` varchar(8) DEFAULT NULL COMMENT '���ī���ȣ',
  `part_carton_no` varchar(8) DEFAULT NULL COMMENT '��ǰī���ȣ',
  `repr_carton_no` varchar(8) DEFAULT NULL COMMENT '����ǰī���ȣ',
  `part_cartons` int(4) unsigned DEFAULT NULL COMMENT '��ǰī���',
  `repr_cartons` int(4) unsigned DEFAULT NULL COMMENT '����ǰī���',
  `eqp_gross_wgt` decimal(5,1) unsigned DEFAULT NULL COMMENT '������߷�',
  `part_gross_wgt` decimal(5,1) unsigned DEFAULT NULL COMMENT '��ǰ���߷�',
  `repr_gross_wgt` decimal(5,1) unsigned DEFAULT NULL COMMENT '����ǰ���߷�',
  `tot_cartons` int(6) unsigned NOT NULL COMMENT '��ī���',
  `tot_gross_wgt` decimal(8,2) unsigned NOT NULL COMMENT '���߷�',
  `sndmail_seq` int(11) DEFAULT NULL COMMENT '�߼۸��ϼ���',
  `crt_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '�����Ͻ�',
  `udt_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '�����Ͻ�',
  `crt_uid` varchar(50) NOT NULL COMMENT '������ID',
  `udt_uid` varchar(50) DEFAULT NULL COMMENT '������ID',
  PRIMARY KEY (`pi_no`),
  KEY `om_packing_ibfk_2` (`sndmail_seq`),
  CONSTRAINT `om_packing_ibfk_1` FOREIGN KEY (`pi_no`) REFERENCES `om_ord_inf` (`pi_no`),
  CONSTRAINT `om_packing_ibfk_2` FOREIGN KEY (`sndmail_seq`) REFERENCES `om_sndmail` (`sndmail_seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Packing List';

CREATE TABLE `om_part` (
  `mdl_cd` varchar(4) NOT NULL COMMENT '���ڵ�',
  `part_ver` varchar(8) NOT NULL COMMENT '��������',
  `part_cd` varchar(13) NOT NULL COMMENT '��ǰ�ڵ�',
  `part_nm` varchar(300) NOT NULL COMMENT '��ǰ��',
  `unit_price` decimal(9,2) DEFAULT NULL COMMENT '��������',
  `unit_wgt` decimal(5,2) DEFAULT NULL COMMENT '�����߷�',
  `remark` varchar(1000) DEFAULT NULL COMMENT '�ǰ�',
  `srl_no` int(11) DEFAULT NULL COMMENT '�ø����ȣ',
  `recom_yn` char(1) CHARACTER SET latin1 NOT NULL DEFAULT 'N' COMMENT '��õ��ǰ����',
  `use_yn` char(1) NOT NULL DEFAULT 'Y' COMMENT '��뿩��',
  `disp_yn` char(1) CHARACTER SET latin1 NOT NULL DEFAULT 'N' COMMENT '���÷��̿���',
  `ord_num` int(11) DEFAULT NULL COMMENT '���Ĺ�ȣ',
  `crt_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '�����Ͻ�',
  `udt_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '�����Ͻ�',
  `crt_uid` varchar(50) NOT NULL COMMENT '������ID',
  `udt_uid` varchar(50) DEFAULT NULL COMMENT '������ID',
  PRIMARY KEY (`part_ver`,`part_cd`,`mdl_cd`),
  KEY `om_part_ibfk_1` (`mdl_cd`),
  CONSTRAINT `om_part_ibfk_1` FOREIGN KEY (`mdl_cd`) REFERENCES `om_mdl` (`mdl_cd`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='��ǰ����';

CREATE TABLE `om_part_ship_req` (
  `pi_no` varchar(7) NOT NULL COMMENT 'PI��ȣ',
  `swp_no` int(11) NOT NULL COMMENT 'SWP��ȣ',
  `buyer` varchar(100) NOT NULL COMMENT '���̾�',
  `ctnt` varchar(1000) DEFAULT NULL COMMENT '�߰�����',
  `ship_dt` varchar(8) DEFAULT NULL COMMENT '��������',
  `send_yn` char(1) CHARACTER SET latin1 NOT NULL DEFAULT 'N' COMMENT '�߼ۿ���',
  `crt_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '�����Ͻ�',
  `udt_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '�����Ͻ�',
  `crt_uid` varchar(50) NOT NULL COMMENT '������ID',
  `udt_uid` varchar(50) DEFAULT NULL COMMENT '������ID',
  PRIMARY KEY (`pi_no`,`swp_no`),
  CONSTRAINT `om_part_ship_req_ibfk_1` FOREIGN KEY (`pi_no`, `swp_no`) REFERENCES `om_ord_part` (`pi_no`, `swp_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='��ǰ����Ƿڼ�����';

CREATE TABLE `om_prd_req` (
  `swm_no` int(11) NOT NULL AUTO_INCREMENT COMMENT 'SWM��ȣ',
  `pi_no` varchar(7) NOT NULL COMMENT 'PI��ȣ',
  `po_no` int(11) NOT NULL COMMENT '�ֹ���ȣ',
  `qual_ship_dt` varchar(8) DEFAULT NULL COMMENT 'ǰ��������',
  `qual_trans_dt` varchar(8) DEFAULT NULL COMMENT 'ǰ���̰���',
  `manual_lang_atcd` varchar(8) DEFAULT NULL COMMENT '�޴�����Ӽ��ڵ�',
  `extra` varchar(500) DEFAULT NULL COMMENT 'Ư�̻���',
  `sendmail_seq` int(11) DEFAULT NULL COMMENT '�߼۸��ϼ���',
  `crt_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '�����Ͻ�',
  `udt_dt` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '�����Ͻ�(�ۼ���)',
  `crt_uid` varchar(50) NOT NULL COMMENT '������ID',
  `udt_uid` varchar(50) DEFAULT NULL COMMENT '������ID',
  PRIMARY KEY (`swm_no`),
  KEY `om_prd_req_ibfk_1` (`pi_no`,`po_no`),
  KEY `om_prd_req_ibfk_2` (`sendmail_seq`),
  CONSTRAINT `om_prd_req_ibfk_1` FOREIGN KEY (`pi_no`, `po_no`) REFERENCES `om_ord_eqp` (`pi_no`, `po_no`),
  CONSTRAINT `om_prd_req_ibfk_2` FOREIGN KEY (`sendmail_seq`) REFERENCES `om_sndmail` (`sndmail_seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='�����Ƿڼ�����';

CREATE TABLE `om_prd_req_dtl` (
  `swm_no` int(11) NOT NULL COMMENT 'SWM��ȣ',
  `cd` varchar(4) NOT NULL COMMENT '�ڵ�',
  `atcd` varchar(8) NOT NULL COMMENT '�Ӽ��ڵ�',
  `atcd_ox` char(1) CHARACTER SET latin1 DEFAULT NULL COMMENT '�Ӽ��ڵ� OX����',
  `crt_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '�����Ͻ�',
  `udt_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '�����Ͻ�',
  `crt_uid` varchar(50) NOT NULL COMMENT '������ID',
  `udt_uid` varchar(50) DEFAULT NULL COMMENT '������ID',
  PRIMARY KEY (`swm_no`,`cd`,`atcd`),
  KEY `om_prd_req_dtl_ibfk_2` (`cd`,`atcd`),
  CONSTRAINT `om_prd_req_dtl_ibfk_1` FOREIGN KEY (`swm_no`) REFERENCES `om_prd_req` (`swm_no`),
  CONSTRAINT `om_prd_req_dtl_ibfk_2` FOREIGN KEY (`cd`, `atcd`) REFERENCES `cm_cd_attr` (`cd`, `atcd`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='�����Ƿڼ���';

CREATE TABLE `om_sndmail` (
  `sndmail_seq` int(11) NOT NULL AUTO_INCREMENT COMMENT '�߼۸��ϼ���',
  `wrk_tp_atcd` varchar(8) NOT NULL COMMENT '�۾������Ӽ��ڵ�',
  `auth_grp_cd` varchar(2) NOT NULL COMMENT '���ѱ׷��ڵ�',
  `sender_email` varchar(15) NOT NULL COMMENT '�߼���ID',
  `sender_eng_nm` varchar(50) DEFAULT NULL COMMENT '�߼��ڿ�����',
  `title` varchar(500) NOT NULL COMMENT '��������',
  `ctnt` text NOT NULL COMMENT '���ϳ���',
  `crt_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '�����Ͻ�',
  `crt_uid` varchar(50) DEFAULT NULL COMMENT '������ID',
  PRIMARY KEY (`sndmail_seq`),
  KEY `om_sndmail_ibfk_1` (`auth_grp_cd`),
  CONSTRAINT `om_sndmail_ibfk_1` FOREIGN KEY (`auth_grp_cd`) REFERENCES `cm_auth_grp` (`auth_grp_cd`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='�߼۸�������';

CREATE TABLE `om_sndmail_dtl` (
  `snd_no` int(11) NOT NULL AUTO_INCREMENT COMMENT '�߼۹�ȣ',
  `sndmail_seq` int(11) NOT NULL COMMENT '�߼۸��ϼ���',
  `email_from` varchar(50) NOT NULL COMMENT '�߼�EMAIL',
  `email_to` varchar(500) NOT NULL COMMENT '����EMAIL',
  `rcpnt_tp_atcd` char(1) CHARACTER SET latin1 DEFAULT NULL COMMENT '�����ڱ��� �Ӽ��ڵ�',
  `rcpnt_team_atcd` varchar(8) DEFAULT NULL COMMENT '�������Ӽ��ڵ�',
  `snd_yn` char(1) NOT NULL DEFAULT 'N' COMMENT '�߼ۿ���',
  `crt_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '�����Ͻ�',
  `crt_uid` varchar(50) DEFAULT NULL COMMENT '������ID',
  PRIMARY KEY (`snd_no`),
  KEY `om_sndmail_dtl_ibfk_1` (`sndmail_seq`),
  KEY `om_sndmail_dtl_ibfk_2` (`rcpnt_team_atcd`),
  CONSTRAINT `om_sndmail_dtl_ibfk_1` FOREIGN KEY (`sndmail_seq`) REFERENCES `om_sndmail` (`sndmail_seq`),
  CONSTRAINT `om_sndmail_dtl_ibfk_2` FOREIGN KEY (`rcpnt_team_atcd`) REFERENCES `om_team` (`team_atcd`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='�߼۸��ϻ�';

CREATE TABLE `om_team` (
  `team_atcd` varchar(8) NOT NULL COMMENT '���Ӽ��ڵ�',
  `team_email` varchar(50) NOT NULL COMMENT '��EMAIL',
  `team_mngr_email` varchar(50) DEFAULT NULL COMMENT '��������EMAIL',
  `team_mailing_yn` char(1) CHARACTER SET latin1 NOT NULL DEFAULT 'N' COMMENT '�����ϸ�����',
  PRIMARY KEY (`team_atcd`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='������';

CREATE TABLE `om_user` (
  `uid` varchar(50) NOT NULL COMMENT '�����ID',
  `pswd` varchar(15) NOT NULL COMMENT '��й�ȣ',
  `auth_grp_cd` varchar(2) DEFAULT NULL COMMENT '���ѱ׷��ڵ�',
  `perms_cd` varchar(4) DEFAULT NULL COMMENT '�����ڵ�',
  `usr_email` varchar(50) DEFAULT NULL COMMENT '������̸���',
  `gender_atcd` char(1) DEFAULT NULL COMMENT '�����Ӽ��ڵ�',
  `nation_atcd` varchar(8) DEFAULT NULL COMMENT '�����Ӽ��ڵ�',
  `join_dt` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '�����Ͻ�',
  `last_logindt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '�����α����Ͻ�',
  `active_yn` char(1) NOT NULL DEFAULT 'N' COMMENT 'Ȱ��ȭ����',
  `crt_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '�����Ͻ�',
  `crt_uid` varchar(15) NOT NULL COMMENT '������ID',
  `udt_dt` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '�����Ͻ�',
  `udt_uid` varchar(15) DEFAULT NULL COMMENT '������ID',
  PRIMARY KEY (`uid`),
  KEY `auth_grp_cd` (`auth_grp_cd`),
  CONSTRAINT `om_user_ibfk_1` FOREIGN KEY (`auth_grp_cd`) REFERENCES `cm_auth_grp` (`auth_grp_cd`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='���������';

CREATE TABLE `om_worker` (
  `worker_uid` varchar(50) NOT NULL COMMENT '�����ID',
  `kr_nm` varchar(20) NOT NULL COMMENT '����ڸ�',
  `eng_nm` varchar(50) DEFAULT NULL COMMENT '����ڿ�����',
  `email` varchar(50) NOT NULL COMMENT '������̸���',
  `team_atcd` varchar(8) NOT NULL COMMENT '���ڵ�',
  `duty_atcd` varchar(8) NOT NULL COMMENT '�����Ӽ��ڵ�',
  `extns_num` varchar(4) DEFAULT NULL COMMENT '������ȣ',
  `moblie_num` varchar(11) DEFAULT NULL COMMENT '�ڵ�����ȣ',
  `mailing_yn` char(1) NOT NULL DEFAULT 'Y' COMMENT '���ϸ�����',
  `aprv_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '�����Ͻ�',
  `crt_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '�����Ͻ�',
  `crt_uid` varchar(50) NOT NULL COMMENT '������ID',
  `udt_dt` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '�����Ͻ�',
  `udt_uid` varchar(50) DEFAULT NULL COMMENT '������ID',
  PRIMARY KEY (`worker_uid`),
  KEY `om_worker_ibfk_1` (`team_atcd`),
  CONSTRAINT `om_worker_ibfk_1` FOREIGN KEY (`worker_uid`) REFERENCES `om_user` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='���������';

CREATE TABLE `cm_file_grp` (
  `file_grp_seq` int(11) NOT NULL AUTO_INCREMENT COMMENT '���ϱ׷����',
  `file_seq` int(11) NOT NULL COMMENT '���ϼ���',
  `file_nm` varchar(100) NOT NULL COMMENT '���ϸ�',
  `file_size` smallint(11) DEFAULT NULL COMMENT '���Ͽ뷮',
  `crt_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '�����Ͻ�',
  `udt_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '�����Ͻ�',
  `udt_uid` varchar(50) DEFAULT NULL COMMENT '������ID',
  PRIMARY KEY (`file_grp_seq`,`file_seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='÷�����ϱ׷�';

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
  `upt_uid` varchar(50) DEFAULT NULL COMMENT '������ID',
  PRIMARY KEY (`cd`,`atcd`),
  CONSTRAINT `cm_cd_attr_ibfk_1` FOREIGN KEY (`cd`) REFERENCES `cm_cd` (`cd`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='�ڵ�Ӽ�';

CREATE TABLE `cm_cd` (
  `cd` varchar(4) NOT NULL COMMENT '�ڵ�',
  `cd_nm` varchar(50) NOT NULL COMMENT '�ڵ��',
  `cd_dscrt` varchar(200) DEFAULT NULL COMMENT '�ڵ弳��',
  `use_yn` char(1) CHARACTER SET latin1 NOT NULL DEFAULT 'Y' COMMENT '��뿩��',
  `p_cd` varchar(4) DEFAULT NULL COMMENT '�����ڵ�',
  `crt_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '�����Ͻ�',
  `udt_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '�����Ͻ�',
  PRIMARY KEY (`cd`),
  KEY `cm_cd_ibfk_1` (`p_cd`),
  CONSTRAINT `cm_cd_ibfk_1` FOREIGN KEY (`p_cd`) REFERENCES `cm_cd` (`cd`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='�ڵ�����';

CREATE TABLE `cm_auth_grp` (
  `auth_grp_cd` varchar(2) NOT NULL COMMENT '���ѱ׷��ڵ�',
  `auth_grp_nm` varchar(50) NOT NULL COMMENT '���ѱ׷��',
  `auth_grp_dscrt` varchar(200) DEFAULT NULL COMMENT '���ѱ׷켳��',
  PRIMARY KEY (`auth_grp_cd`),
  UNIQUE KEY `auth_grp_nm` (`auth_grp_nm`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='���ѱ׷�';

