CREATE TABLE `cm_auth_grp` (
  `auth_grp_cd` varchar(2) NOT NULL COMMENT '권한그룹코드',
  `auth_grp_nm` varchar(50) NOT NULL COMMENT '권한그룹명',
  `auth_grp_dscrt` varchar(200) DEFAULT NULL COMMENT '권한그룹설명',
  PRIMARY KEY (`auth_grp_cd`),
  UNIQUE KEY `auth_grp_nm` (`auth_grp_nm`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='권한그룹';

CREATE TABLE `cm_cd` (
  `cd` varchar(4) NOT NULL COMMENT '코드',
  `cd_nm` varchar(50) NOT NULL COMMENT '코드명',
  `cd_dscrt` varchar(200) DEFAULT NULL COMMENT '코드설명',
  `use_yn` char(1) CHARACTER SET latin1 NOT NULL DEFAULT 'Y' COMMENT '사용여부',
  `crt_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '생성일시',
  `udt_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '수정일시',
  `p_cd` varchar(4) DEFAULT NULL COMMENT '상위코드',
  PRIMARY KEY (`cd`),
  KEY `cm_cd_ibfk_1` (`p_cd`),
  CONSTRAINT `cm_cd_ibfk_1` FOREIGN KEY (`p_cd`) REFERENCES `cm_cd` (`cd`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='코드정보';

CREATE TABLE `cm_cd_attr` (
  `cd` varchar(4) NOT NULL COMMENT '코드',
  `atcd` varchar(8) NOT NULL COMMENT '속성코드',
  `atcd_nm` varchar(100) NOT NULL COMMENT '속성코드명',
  `atcd_dscrt` varchar(200) DEFAULT NULL COMMENT '속성코드설명',
  `disp_yn` char(1) NOT NULL DEFAULT 'Y' COMMENT '디스플레이여부',
  `use_yn` char(1) NOT NULL DEFAULT 'Y' COMMENT '사용여부',
  `ord_num` smallint(5) DEFAULT NULL COMMENT '정렬번호',
  `crt_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '생성일시',
  `udt_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '수정일시',
  `upt_uid` varchar(15) DEFAULT NULL COMMENT '수정자ID',
  PRIMARY KEY (`cd`,`atcd`),
  CONSTRAINT `cm_cd_attr_ibfk_1` FOREIGN KEY (`cd`) REFERENCES `cm_cd` (`cd`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='코드속성';

CREATE TABLE `cm_file_grp` (
  `file_grp_seq` int(11) NOT NULL COMMENT '파일그룹순번',
  `file_seq` int(11) NOT NULL COMMENT '파일순번',
  `file_nm` varchar(100) NOT NULL COMMENT '파일명',
  `file_size` smallint(11) DEFAULT NULL COMMENT '파일용량',
  `crt_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '생성일시',
  `udt_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '수정일시',
  `udt_uid` varchar(15) DEFAULT NULL COMMENT '수정자ID',
  PRIMARY KEY (`file_grp_seq`,`file_seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='첨부파일그룹';

CREATE TABLE `om_admin` (
  `adm_uid` varchar(15) NOT NULL COMMENT '관리자ID',
  `adm_pswd` varchar(15) NOT NULL COMMENT '관리자비밀번호',
  `auth_grp_cd` varchar(2) DEFAULT NULL COMMENT '권한그룹코드',
  `perms_cd` varchar(4) DEFAULT NULL COMMENT '승인코드',
  `active_yn` char(1) NOT NULL DEFAULT 'N' COMMENT '활성화여부',
  `last_logindt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '최종로그인일시',
  `crt_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '생성일시',
  `udt_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '수정일시',
  PRIMARY KEY (`adm_uid`),
  KEY `om_admin_ibfk_1` (`auth_grp_cd`),
  CONSTRAINT `om_admin_ibfk_1` FOREIGN KEY (`auth_grp_cd`) REFERENCES `cm_auth_grp` (`auth_grp_cd`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='관리자정보';

CREATE TABLE `om_dealer` (
  `dealer_seq` int(11) NOT NULL COMMENT '딜러순번',
  `dealer_nm` varchar(30) DEFAULT NULL COMMENT '딜러명',
  `email` varchar(50) NOT NULL COMMENT '이메일',
  `pswd` varchar(15) DEFAULT NULL COMMENT '비밀번호',
  `cntry_atcd` varchar(8) NOT NULL COMMENT '국가속성코드',
  `cmpy_nm` varchar(50) DEFAULT NULL COMMENT '회사명',
  `job_tit` varchar(100) DEFAULT NULL COMMENT '직업타이틀',
  `addr` varchar(300) DEFAULT NULL COMMENT '주소',
  `tel` varchar(20) DEFAULT NULL COMMENT '전화번호',
  `fax` varchar(20) DEFAULT NULL COMMENT '팩스',
  `homepage` varchar(300) DEFAULT NULL COMMENT '홈페이지',
  `exper_years` varchar(4) DEFAULT NULL COMMENT '계수기취급 시작년도',
  `maincust_atcd` varchar(8) DEFAULT NULL COMMENT '주고객 속성코드',
  `comments` varchar(2000) DEFAULT NULL COMMENT '코멘트',
  `mkt_inf` varchar(4000) DEFAULT NULL COMMENT '마케팅정보',
  `worker_uid` varchar(15) DEFAULT NULL COMMENT '담당자ID',
  `premium_rate` decimal(5,2) DEFAULT NULL COMMENT '딜러할증요율',
  `bank_atcd` varchar(8) DEFAULT NULL COMMENT '은행속성코드',
  `attn` varchar(100) DEFAULT NULL COMMENT '송장 담당자',
  `file_grp_seq` int(11) DEFAULT NULL COMMENT '파일그룹순번',
  `crt_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '생성일시',
  `crt_uid` varchar(15) NOT NULL COMMENT '생성자ID',
  `udt_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '수정일시',
  `udt_uid` varchar(15) DEFAULT NULL COMMENT '수정자ID',
  PRIMARY KEY (`dealer_seq`),
  KEY `om_dealer_ibfk_1` (`worker_uid`),
  KEY `om_dealer_ibfk_2` (`file_grp_seq`),
  CONSTRAINT `om_dealer_ibfk_1` FOREIGN KEY (`worker_uid`) REFERENCES `om_worker` (`worker_uid`),
  CONSTRAINT `om_dealer_ibfk_2` FOREIGN KEY (`file_grp_seq`) REFERENCES `cm_file_grp` (`file_grp_seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='딜러정보';

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
  `crt_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '생성일시',
  `udt_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '수정일시',
  `crt_uid` varchar(15) NOT NULL COMMENT '생성자ID',
  `udt_uid` varchar(15) DEFAULT NULL COMMENT '수정자ID',
  PRIMARY KEY (`pi_no`),
  KEY `ci_sndmail_seq` (`ci_sndmail_seq`),
  KEY `pi_sndmail_seq` (`pi_sndmail_seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='송장정보';

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
  `crt_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '생성일시',
  `udt_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '수정일시',
  `crt_uid` varchar(15) NOT NULL COMMENT '생성자ID',
  `udt_uid` varchar(15) DEFAULT NULL COMMENT '수정자ID',
  PRIMARY KEY (`pi_no`,`po_no`),
  KEY `om_ord_eqp_ibfk_3` (`sndmail_seq`),
  KEY `mdl_cd` (`mdl_cd`),
  CONSTRAINT `om_ord_eqp_ibfk_1` FOREIGN KEY (`pi_no`) REFERENCES `om_ord_inf` (`pi_no`),
  CONSTRAINT `om_ord_eqp_ibfk_2` FOREIGN KEY (`mdl_cd`) REFERENCES `cm_cd` (`cd`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='주문장비정보';

CREATE TABLE `om_ord_eqp_dtl` (
  `pi_no` varchar(7) NOT NULL,
  `po_no` int(11) NOT NULL,
  `cd` varchar(4) NOT NULL,
  `atcd` varchar(8) NOT NULL,
  `crt_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '생성일시',
  `udt_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '수정일시',
  `crt_uid` varchar(15) NOT NULL COMMENT '생성자ID',
  `udt_uid` varchar(15) DEFAULT NULL COMMENT '수정자ID',
  PRIMARY KEY (`po_no`,`cd`,`atcd`,`pi_no`),
  KEY `pi_no` (`pi_no`,`po_no`),
  KEY `cd` (`cd`,`atcd`),
  CONSTRAINT `om_ord_eqp_dtl_ibfk_1` FOREIGN KEY (`pi_no`, `po_no`) REFERENCES `om_ord_eqp` (`pi_no`, `po_no`),
  CONSTRAINT `om_ord_eqp_dtl_ibfk_2` FOREIGN KEY (`cd`, `atcd`) REFERENCES `cm_cd_attr` (`cd`, `atcd`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='주문장비상세';

CREATE TABLE `om_ord_inf` (
  `pi_no` varchar(7) NOT NULL,
  `dealer_seq` int(11) NOT NULL,
  `worker_uid` varchar(15) NOT NULL,
  `cmpy_nm` varchar(50) DEFAULT NULL,
  `premium_rate` decimal(5,2) DEFAULT NULL,
  `tot_amt` decimal(14,2) DEFAULT NULL,
  `cnfm_yn` char(1) DEFAULT NULL,
  `cnfm_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '주문확정일시',
  `slip_sndmail_seq` int(11) DEFAULT NULL,
  `crt_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '생성일시',
  `udt_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '수정일시',
  `crt_uid` varchar(15) NOT NULL COMMENT '생성자ID',
  `udt_uid` varchar(15) DEFAULT NULL COMMENT '수정자ID',
  PRIMARY KEY (`pi_no`),
  KEY `worker_uid` (`worker_uid`),
  KEY `dealer_seq` (`dealer_seq`),
  KEY `slip_sndmail_seq` (`slip_sndmail_seq`),
  CONSTRAINT `om_ord_inf_ibfk_1` FOREIGN KEY (`dealer_seq`) REFERENCES `om_dealer` (`dealer_seq`),
  CONSTRAINT `om_ord_inf_ibfk_2` FOREIGN KEY (`slip_sndmail_seq`) REFERENCES `om_sndmail` (`sndmail_seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='주문정보';

CREATE TABLE `om_ord_part` (
  `pi_no` varchar(7) NOT NULL,
  `swp_no` int(11) NOT NULL,
  `amt` decimal(13,2) unsigned DEFAULT NULL,
  `wgt` decimal(7,2) unsigned DEFAULT NULL,
  `sndmail_seq` int(11) DEFAULT NULL,
  `crt_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '생성일시',
  `udt_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '수정일시',
  `crt_uid` varchar(15) NOT NULL COMMENT '생성자ID',
  `udt_uid` varchar(15) DEFAULT NULL COMMENT '수정자ID',
  PRIMARY KEY (`pi_no`,`swp_no`),
  KEY `sndmail_seq` (`sndmail_seq`),
  CONSTRAINT `om_ord_part_ibfk_1` FOREIGN KEY (`pi_no`) REFERENCES `om_ord_inf` (`pi_no`),
  CONSTRAINT `om_ord_part_ibfk_2` FOREIGN KEY (`sndmail_seq`) REFERENCES `om_sndmail` (`sndmail_seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='주문부품정보';

CREATE TABLE `om_ord_part_dtl` (
  `pi_no` varchar(7) NOT NULL,
  `swp_no` int(11) NOT NULL,
  `part_ver` varchar(8) NOT NULL,
  `part_cd` varchar(10) NOT NULL,
  `mdl_cd` varchar(4) NOT NULL,
  `qty` int(11) unsigned DEFAULT NULL,
  `offer_unit_price` decimal(13,2) unsigned DEFAULT NULL,
  `crt_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '생성일시',
  `udt_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '수정일시',
  `crt_uid` varchar(15) NOT NULL COMMENT '생성자ID',
  `udt_uid` varchar(15) DEFAULT NULL COMMENT '수정자ID',
  PRIMARY KEY (`pi_no`,`swp_no`,`part_cd`,`mdl_cd`,`part_ver`),
  KEY `part_ver` (`part_ver`,`part_cd`),
  KEY `part_cd` (`part_cd`,`mdl_cd`),
  CONSTRAINT `om_ord_part_dtl_ibfk_1` FOREIGN KEY (`pi_no`, `swp_no`) REFERENCES `om_ord_part` (`pi_no`, `swp_no`),
  CONSTRAINT `om_ord_part_dtl_ibfk_2` FOREIGN KEY (`part_ver`, `part_cd`) REFERENCES `om_part` (`part_ver`, `part_cd`),
  CONSTRAINT `om_ord_part_dtl_ibfk_3` FOREIGN KEY (`part_cd`, `mdl_cd`) REFERENCES `om_part_mdl` (`part_cd`, `mdl_cd`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='주문부품상세';

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
  `crt_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '생성일시',
  `udt_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '수정일시',
  `crt_uid` varchar(15) NOT NULL COMMENT '생성자ID',
  `udt_uid` varchar(15) DEFAULT NULL COMMENT '수정자ID',
  PRIMARY KEY (`pi_no`),
  KEY `sndmail_seq` (`sndmail_seq`),
  CONSTRAINT `om_packing_ibfk_1` FOREIGN KEY (`sndmail_seq`) REFERENCES `om_sndmail` (`sndmail_seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Packing List';

CREATE TABLE `om_part` (
  `part_ver` varchar(8) NOT NULL COMMENT '버전정보',
  `part_cd` varchar(10) NOT NULL COMMENT '부품코드',
  `part_nm` varchar(300) NOT NULL COMMENT '부품명',
  `unit_price` decimal(9,2) NOT NULL COMMENT '단위가격',
  `unit_wgt` decimal(5,2) DEFAULT NULL COMMENT '단위중량',
  `remark` varchar(1000) DEFAULT NULL COMMENT '의견',
  `srl_no` int(11) DEFAULT NULL COMMENT '시리얼번호',
  `recom_yn` char(1) CHARACTER SET latin1 NOT NULL DEFAULT 'N' COMMENT '추천부품여부',
  `use_yn` char(1) NOT NULL DEFAULT 'Y' COMMENT '사용여부',
  `disp_yn` char(1) CHARACTER SET latin1 NOT NULL DEFAULT 'N',
  `ord_num` int(11) DEFAULT NULL,
  `crt_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '생성일시',
  `udt_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '수정일시',
  `crt_uid` varchar(15) NOT NULL COMMENT '생성자ID',
  `udt_uid` varchar(15) DEFAULT NULL COMMENT '수정자ID',
  PRIMARY KEY (`part_ver`,`part_cd`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='부품정보';

CREATE TABLE `om_part_mdl` (
  `part_cd` varchar(10) NOT NULL COMMENT '부품코드',
  `mdl_cd` varchar(4) NOT NULL COMMENT '모델속성코드',
  `disp_yn` char(1) NOT NULL DEFAULT 'Y' COMMENT '디스플레이여부',
  `use_yn` char(1) NOT NULL DEFAULT 'Y' COMMENT '사용여부',
  `crt_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '생성일시',
  `udt_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '수정일시',
  `crt_uid` varchar(15) NOT NULL COMMENT '생성자ID',
  `udt_uid` varchar(15) DEFAULT NULL COMMENT '수정자ID',
  PRIMARY KEY (`part_cd`,`mdl_cd`),
  KEY `mdl_cd` (`mdl_cd`),
  CONSTRAINT `om_part_mdl_ibfk_1` FOREIGN KEY (`part_cd`) REFERENCES `om_part` (`part_ver`),
  CONSTRAINT `om_part_mdl_ibfk_2` FOREIGN KEY (`mdl_cd`) REFERENCES `cm_cd` (`cd`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='부품모델정보';

CREATE TABLE `om_part_ship_req` (
  `pi_no` varchar(7) NOT NULL,
  `swp_no` int(11) NOT NULL,
  `buyer` varchar(100) NOT NULL,
  `ctnt` varchar(1000) DEFAULT NULL COMMENT '추가내용',
  `ship_dt` varchar(8) DEFAULT NULL,
  `send_yn` char(1) NOT NULL DEFAULT 'N',
  `crt_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '생성일시',
  `udt_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '수정일시',
  `crt_uid` varchar(15) NOT NULL COMMENT '생성자ID',
  `udt_uid` varchar(15) DEFAULT NULL COMMENT '수정자ID',
  PRIMARY KEY (`pi_no`,`swp_no`),
  CONSTRAINT `om_part_ship_req_ibfk_1` FOREIGN KEY (`pi_no`, `swp_no`) REFERENCES `om_ord_part` (`pi_no`, `swp_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='부품출고의뢰서정보';

CREATE TABLE `om_prd_req` (
  `swm_no` int(11) NOT NULL,
  `pi_no` varchar(7) NOT NULL,
  `po_no` int(11) NOT NULL,
  `qual_ship_dt` varchar(8) DEFAULT NULL COMMENT '품질출하일',
  `qual_trans_dt` varchar(8) DEFAULT NULL,
  `manual_lang_atcd` varchar(8) DEFAULT NULL,
  `extra` varchar(500) DEFAULT NULL COMMENT '특이사항',
  `sendmail_seq` int(11) DEFAULT NULL,
  `crt_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '생성일시',
  `udt_dt` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '수정일시(작성일)',
  `crt_uid` varchar(15) NOT NULL COMMENT '생성자ID',
  `udt_uid` varchar(15) DEFAULT NULL COMMENT '수정자ID',
  PRIMARY KEY (`swm_no`),
  KEY `pi_no` (`pi_no`,`po_no`),
  CONSTRAINT `om_prd_req_ibfk_1` FOREIGN KEY (`pi_no`, `po_no`) REFERENCES `om_ord_eqp` (`pi_no`, `po_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='생산의뢰서정보';

CREATE TABLE `om_prd_req_dtl` (
  `swm_no` int(11) NOT NULL,
  `cd` varchar(4) NOT NULL,
  `atcd` varchar(8) NOT NULL,
  `atcd_ox` char(1) DEFAULT NULL,
  `crt_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '생성일시',
  `udt_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '수정일시',
  `crt_uid` varchar(15) NOT NULL COMMENT '생성자ID',
  `udt_uid` varchar(15) DEFAULT NULL COMMENT '수정자ID',
  PRIMARY KEY (`swm_no`,`cd`,`atcd`),
  KEY `cd` (`cd`,`atcd`),
  CONSTRAINT `om_prd_req_dtl_ibfk_1` FOREIGN KEY (`swm_no`) REFERENCES `om_prd_req` (`swm_no`),
  CONSTRAINT `om_prd_req_dtl_ibfk_2` FOREIGN KEY (`cd`, `atcd`) REFERENCES `cm_cd_attr` (`cd`, `atcd`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='생산의뢰서상세';

CREATE TABLE `om_sndmail` (
  `sndmail_seq` int(11) NOT NULL COMMENT '전송메일순번',
  `wrk_tp_atcd` varchar(8) NOT NULL COMMENT '작업구분 속성코드',
  `sender_email` varchar(15) NOT NULL COMMENT '전송자ID',
  `sender_eng_nm` varchar(50) DEFAULT NULL COMMENT '전송자영문명',
  `email_from` varchar(50) NOT NULL COMMENT '전송자EMAIL',
  `email_to` varchar(500) NOT NULL COMMENT '수신자EMAIL',
  `email_cc` varchar(500) DEFAULT NULL COMMENT '참조EMAIL',
  `title` varchar(500) NOT NULL COMMENT '메일제목',
  `ctnt` text NOT NULL COMMENT '메일내용',
  `snd_yn` char(1) NOT NULL DEFAULT 'N' COMMENT '전송여부',
  `crt_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '생성일시',
  `crt_uid` varchar(15) NOT NULL COMMENT '생성자ID',
  PRIMARY KEY (`sndmail_seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='전송메일정보';

CREATE TABLE `om_team_mail` (
  `post_atcd` varchar(8) NOT NULL COMMENT '부서속성코드',
  `manager_email` varchar(50) DEFAULT NULL COMMENT '관리담당자EMAIL',
  `team_email` varchar(50) NOT NULL COMMENT '팀EMAIL',
  `team_mailing_yn` char(1) CHARACTER SET latin1 NOT NULL DEFAULT 'N' COMMENT '팀메일링여부',
  PRIMARY KEY (`post_atcd`,`team_email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='팀메일정보';

CREATE TABLE `om_worker` (
  `worker_uid` varchar(15) NOT NULL COMMENT '담당자ID',
  `kr_nm` varchar(20) NOT NULL COMMENT '담당자명',
  `eng_nm` varchar(50) DEFAULT NULL COMMENT '담당자영문명',
  `email` varchar(50) NOT NULL COMMENT '담당자이메일',
  `post_atcd` varchar(8) NOT NULL COMMENT '부서속성코드',
  `duty_atcd` varchar(8) NOT NULL COMMENT '직무속성코드',
  `extns_num` varchar(4) DEFAULT NULL COMMENT '내선번호',
  `moblie_num` varchar(11) DEFAULT NULL COMMENT '핸드폰번호',
  `mailing_yn` char(1) NOT NULL DEFAULT 'Y' COMMENT '메일링여부',
  `aprv_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '승인일시',
  `crt_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '생성일시',
  `crt_uid` varchar(15) NOT NULL COMMENT '생성자ID',
  `udt_dt` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '수정일시',
  `udt_uid` varchar(15) DEFAULT NULL COMMENT '수정자ID',
  PRIMARY KEY (`worker_uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='담당자정보';

