CREATE TABLE `om_dealer` (
  `dealer_seq` int(11) NOT NULL AUTO_INCREMENT COMMENT '딜러순번',
  `dealer_uid` varchar(50) NOT NULL COMMENT '딜러ID',
  `dealer_nm` varchar(50) DEFAULT NULL COMMENT '딜러명',
  `cmpy_nm` varchar(50) DEFAULT NULL COMMENT '회사명',
  `job_tit` varchar(100) DEFAULT NULL COMMENT '직업타이틀',
  `addr` varchar(300) DEFAULT NULL COMMENT '주소',
  `tel` varchar(50) DEFAULT NULL COMMENT '전화번호',
  `fax` varchar(50) DEFAULT NULL COMMENT '팩스',
  `homepage` varchar(300) DEFAULT NULL COMMENT '홈페이지',
  `exper_years` varchar(4) DEFAULT NULL COMMENT '계수기취급 시작년도',
  `maincust_atcd` varchar(8) DEFAULT NULL COMMENT '주고객 속성코드',
  `comments` varchar(2000) DEFAULT NULL COMMENT '코멘트',
  `mkt_inf` varchar(4000) DEFAULT NULL COMMENT '마케팅정보',
  `premium_rate` decimal(5,2) DEFAULT NULL COMMENT '딜러할증요율',
  `bank_atcd` varchar(8) DEFAULT NULL COMMENT '은행속성코드',
  `attn` varchar(100) DEFAULT NULL COMMENT '송장 담당자',
  `aprv_yn` char(1) CHARACTER SET latin1 NOT NULL DEFAULT 'N' COMMENT '승인여부',
  `worker_seq` int(11) DEFAULT NULL COMMENT '담당자순번',
  `file_grp_seq` int(11) DEFAULT NULL COMMENT '파일그룹순번',
  `crt_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '생성일시',
  `crt_uid` varchar(50) NOT NULL COMMENT '생성자ID',
  `udt_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '수정일시',
  `udt_uid` varchar(50) DEFAULT NULL COMMENT '수정자ID',
  PRIMARY KEY (`dealer_seq`),
  KEY `om_dealer_ibfk_1` (`dealer_uid`),
  KEY `om_dealer_ibfk_2` (`worker_seq`),
  KEY `om_dealer_ibfk_3` (`file_grp_seq`),
  CONSTRAINT `om_dealer_ibfk_1` FOREIGN KEY (`dealer_uid`) REFERENCES `om_user` (`uid`),
  CONSTRAINT `om_dealer_ibfk_2` FOREIGN KEY (`worker_seq`) REFERENCES `om_worker` (`worker_seq`),
  CONSTRAINT `om_dealer_ibfk_3` FOREIGN KEY (`file_grp_seq`) REFERENCES `cm_file_grp` (`file_grp_seq`)
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8 COMMENT='딜러정보';

CREATE TABLE `om_dealer_cntry` (
  `dealer_seq` int(11) NOT NULL COMMENT '딜러순번',
  `cntry_atcd` varchar(8) NOT NULL COMMENT '대상국가속성코드',
  `crt_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '생성일시',
  `crt_uid` varchar(50) NOT NULL COMMENT '생성자ID',
  PRIMARY KEY (`dealer_seq`,`cntry_atcd`),
  CONSTRAINT `om_dealer_cntry_ibfk_1` FOREIGN KEY (`dealer_seq`) REFERENCES `om_dealer` (`dealer_seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='딜러대상국가';

CREATE TABLE `om_invoice` (
  `pi_no` varchar(7) NOT NULL COMMENT 'PI번호',
  `prn_qty` int(6) DEFAULT NULL COMMENT '프린터수량',
  `prn_tot_amt` decimal(8,2) DEFAULT NULL COMMENT '프린터총금액',
  `repr_qty` int(6) unsigned DEFAULT NULL COMMENT '수리품수량',
  `repr_tot_amt` decimal(8,2) unsigned DEFAULT NULL COMMENT '수리품총금액',
  `ship_port_atcd` varchar(8) NOT NULL COMMENT '선적항속성코드',
  `payment_atcd` varchar(8) NOT NULL COMMENT '지불속성코드',
  `tot_qty` int(6) unsigned NOT NULL COMMENT '총수량',
  `tot_amt` decimal(14,2) unsigned NOT NULL COMMENT '총금액',
  `destnt` varchar(50) NOT NULL COMMENT '목적지',
  `validity` varchar(8) NOT NULL COMMENT '유효기간(YYYYMMDD)',
  `bank_atcd` varchar(8) NOT NULL COMMENT '은행속성코드',
  `invoice_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '송장발행일시',
  `pi_sndmail_seq` int(11) DEFAULT NULL COMMENT 'PI발송메일순번',
  `ci_sndmail_seq` int(11) DEFAULT NULL COMMENT 'CI발송메일순번',
  `csn_cmpy_nm` varchar(100) DEFAULT NULL COMMENT '인수회사명',
  `csn_addr` varchar(300) DEFAULT NULL COMMENT '인수자주소',
  `csn_tel` varchar(50) DEFAULT NULL COMMENT '인수자전화번호',
  `csn_fax` varchar(50) DEFAULT NULL COMMENT '인수자팩스',
  `csn_attn` varchar(100) DEFAULT NULL COMMENT '인수담당자',
  `crt_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '생성일시',
  `crt_uid` varchar(50) NOT NULL COMMENT '생성자ID',
  `udt_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '수정일시',
  `udt_uid` varchar(50) DEFAULT NULL COMMENT '수정자ID',
  PRIMARY KEY (`pi_no`),
  KEY `ci_sndmail_seq` (`ci_sndmail_seq`),
  KEY `om_invoice_ibfk_2` (`pi_sndmail_seq`),
  CONSTRAINT `om_invoice_ibfk_1` FOREIGN KEY (`pi_no`) REFERENCES `om_ord_inf` (`pi_no`),
  CONSTRAINT `om_invoice_ibfk_2` FOREIGN KEY (`pi_sndmail_seq`) REFERENCES `om_sndmail` (`sndmail_seq`),
  CONSTRAINT `om_invoice_ibfk_3` FOREIGN KEY (`ci_sndmail_seq`) REFERENCES `om_sndmail` (`sndmail_seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='송장정보';

CREATE TABLE `om_mdl` (
  `mdl_cd` varchar(4) NOT NULL COMMENT '모델코드',
  `mdl_nm` varchar(100) NOT NULL COMMENT '모델명',
  `mdl_stat_atcd` char(1) CHARACTER SET latin1 DEFAULT NULL COMMENT '모델상태속성코드',
  `net_wgt` decimal(4,1) unsigned DEFAULT NULL COMMENT '순중량',
  `gross_wgt` decimal(4,1) unsigned DEFAULT NULL COMMENT '총중량',
  PRIMARY KEY (`mdl_cd`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='모델정보';

CREATE TABLE `om_ord_eqp` (
  `pi_no` varchar(8) NOT NULL COMMENT 'PI번호',
  `po_no` int(11) NOT NULL AUTO_INCREMENT COMMENT '주문번호',
  `mdl_cd` varchar(4) DEFAULT NULL COMMENT '모델코드',
  `srl_atcd` varchar(8) DEFAULT NULL COMMENT '시리얼넘버속성코드',
  `lcd_color_atcd` varchar(8) DEFAULT NULL COMMENT 'LCD컬러 속성코드',
  `lcd_lang_atcd` varchar(8) DEFAULT NULL COMMENT 'LCD언어 속성코드',
  `rjt_pkt_tp_atcd` varchar(8) DEFAULT NULL COMMENT 'Reject Pocket 유형 속성코드',
  `pwr_cab_atcd` varchar(8) DEFAULT NULL COMMENT '파워케이블 속성코드',
  `shipped_by_atcd` varchar(8) DEFAULT NULL COMMENT '수송방식 속성코드',
  `courier_atcd` varchar(8) DEFAULT NULL COMMENT '특송 속성코드',
  `delivery_dt` varchar(8) DEFAULT NULL COMMENT '납기일자',
  `payment_atcd` varchar(8) DEFAULT NULL COMMENT '지불속성코드',
  `incoterms_atcd` varchar(8) DEFAULT NULL COMMENT '무역조건 속성코드',
  `acct_no` varchar(20) DEFAULT NULL COMMENT 'account번호',
  `srl_prn_cab_ox` char(1) CHARACTER SET latin1 DEFAULT NULL COMMENT '시리얼프린터케이블 OX구분',
  `calibr_sheet_ox` char(1) CHARACTER SET latin1 DEFAULT NULL COMMENT 'Calibration Sheet OX구분',
  `pc_cab_ox` char(1) CHARACTER SET latin1 DEFAULT NULL COMMENT 'PC케이블 OX구분',
  `remark` varchar(2000) DEFAULT NULL COMMENT '견해',
  `qty` int(6) unsigned DEFAULT NULL COMMENT '주문수량',
  `amt` decimal(13,2) unsigned DEFAULT NULL COMMENT '주문금액',
  `sndmail_seq` int(11) DEFAULT NULL COMMENT '발송메일순번',
  `crt_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '생성일시',
  `crt_uid` varchar(50) NOT NULL COMMENT '생성자ID',
  `udt_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '수정일시',
  `udt_uid` varchar(50) DEFAULT NULL COMMENT '수정자ID',
  PRIMARY KEY (`pi_no`,`po_no`),
  UNIQUE KEY `po_no` (`po_no`),
  KEY `om_ord_eqp_ibfk_3` (`sndmail_seq`),
  KEY `om_ord_eqp_ibfk_2` (`mdl_cd`),
  CONSTRAINT `om_ord_eqp_ibfk_1` FOREIGN KEY (`pi_no`) REFERENCES `om_ord_inf` (`pi_no`),
  CONSTRAINT `om_ord_eqp_ibfk_2` FOREIGN KEY (`mdl_cd`) REFERENCES `om_mdl` (`mdl_cd`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='주문장비정보';

CREATE TABLE `om_ord_eqp_dtl` (
  `pi_no` varchar(8) NOT NULL COMMENT 'PI번호',
  `po_no` int(11) NOT NULL COMMENT '주문번호',
  `cd` varchar(4) NOT NULL COMMENT '코드',
  `atcd` varchar(8) NOT NULL COMMENT '속성코드',
  `crt_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '생성일시',
  `crt_uid` varchar(50) NOT NULL COMMENT '생성자ID',
  `udt_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '수정일시',
  `udt_uid` varchar(50) DEFAULT NULL COMMENT '수정자ID',
  PRIMARY KEY (`po_no`,`cd`,`atcd`,`pi_no`),
  KEY `om_ord_eqp_dtl_ibfk_1` (`pi_no`,`po_no`),
  KEY `om_ord_eqp_dtl_ibfk_2` (`cd`,`atcd`),
  CONSTRAINT `om_ord_eqp_dtl_ibfk_1` FOREIGN KEY (`pi_no`, `po_no`) REFERENCES `om_ord_eqp` (`pi_no`, `po_no`),
  CONSTRAINT `om_ord_eqp_dtl_ibfk_2` FOREIGN KEY (`cd`, `atcd`) REFERENCES `cm_cd_attr` (`cd`, `atcd`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='주문장비상세';

CREATE TABLE `om_ord_inf` (
  `pi_no` varchar(8) NOT NULL COMMENT 'PI번호',
  `cntry_atcd` varchar(8) NOT NULL COMMENT '대상국가속성코드',
  `dealer_seq` int(11) NOT NULL COMMENT '딜러순번',
  `worker_seq` int(11) NOT NULL COMMENT '담당자순번',
  `premium_rate` decimal(5,2) DEFAULT NULL COMMENT '할증요율',
  `tot_amt` decimal(14,2) DEFAULT NULL COMMENT '주문총금액',
  `cnfm_yn` char(1) CHARACTER SET latin1 DEFAULT NULL COMMENT '주문확정여부',
  `cnfm_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '주문확정일시',
  `slip_sndmail_seq` int(11) DEFAULT NULL COMMENT '출고전표발송메일순번',
  `wrk_tp_atcd` varchar(8) DEFAULT NULL COMMENT '작업유형속성코드',
  `crt_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '생성일시',
  `crt_uid` varchar(50) NOT NULL COMMENT '생성자ID',
  `udt_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '수정일시',
  `udt_uid` varchar(50) DEFAULT NULL COMMENT '수정자ID',
  PRIMARY KEY (`pi_no`),
  KEY `om_ord_inf_ibfk_3` (`worker_seq`),
  KEY `dealer_seq` (`dealer_seq`,`cntry_atcd`),
  KEY `slip_sndmail_seq` (`slip_sndmail_seq`),
  CONSTRAINT `om_ord_inf_ibfk_1` FOREIGN KEY (`dealer_seq`) REFERENCES `om_dealer` (`dealer_seq`),
  CONSTRAINT `om_ord_inf_ibfk_2` FOREIGN KEY (`worker_seq`) REFERENCES `om_worker` (`worker_seq`),
  CONSTRAINT `om_ord_inf_ibfk_3` FOREIGN KEY (`slip_sndmail_seq`) REFERENCES `om_sndmail` (`sndmail_seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='주문정보';

CREATE TABLE `om_ord_part` (
  `pi_no` varchar(8) NOT NULL COMMENT 'PI번호',
  `swp_no` int(11) NOT NULL AUTO_INCREMENT COMMENT 'SWP번호',
  `amt` decimal(13,2) unsigned DEFAULT NULL COMMENT '주문금액',
  `wgt` decimal(7,2) unsigned DEFAULT NULL COMMENT '중량',
  `sndmail_seq` int(11) DEFAULT NULL COMMENT '발송메일순번',
  `crt_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '생성일시',
  `crt_uid` varchar(50) NOT NULL COMMENT '생성자ID',
  `udt_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '수정일시',
  `udt_uid` varchar(50) DEFAULT NULL COMMENT '수정자ID',
  PRIMARY KEY (`pi_no`,`swp_no`),
  UNIQUE KEY `swp_no` (`swp_no`),
  KEY `om_ord_part_ibfk_2` (`sndmail_seq`),
  CONSTRAINT `om_ord_part_ibfk_1` FOREIGN KEY (`pi_no`) REFERENCES `om_ord_inf` (`pi_no`),
  CONSTRAINT `om_ord_part_ibfk_2` FOREIGN KEY (`sndmail_seq`) REFERENCES `om_sndmail` (`sndmail_seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='주문부품정보';

CREATE TABLE `om_ord_part_dtl` (
  `pi_no` varchar(8) NOT NULL COMMENT 'PI번호',
  `swp_no` int(11) NOT NULL COMMENT 'SWP번호',
  `mdl_cd` varchar(4) NOT NULL COMMENT '모델코드',
  `part_ver` varchar(8) NOT NULL COMMENT '부품버전',
  `part_cd` varchar(13) NOT NULL COMMENT '부품코드',
  `qty` int(11) unsigned DEFAULT NULL COMMENT '수량',
  `unit_prd_cost` decimal(13,2) unsigned DEFAULT NULL COMMENT '공급단가',
  `crt_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '생성일시',
  `udt_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '수정일시',
  `crt_uid` varchar(50) NOT NULL COMMENT '생성자ID',
  `udt_uid` varchar(50) DEFAULT NULL COMMENT '수정자ID',
  PRIMARY KEY (`pi_no`,`swp_no`,`part_cd`,`mdl_cd`,`part_ver`),
  KEY `om_ord_part_dtl_ibfk_3` (`part_cd`,`mdl_cd`),
  KEY `part_ver` (`part_ver`,`part_cd`,`mdl_cd`),
  KEY `om_ord_part_dtl_ibfk_2` (`mdl_cd`,`part_ver`,`part_cd`),
  CONSTRAINT `om_ord_part_dtl_ibfk_1` FOREIGN KEY (`pi_no`, `swp_no`) REFERENCES `om_ord_part` (`pi_no`, `swp_no`),
  CONSTRAINT `om_ord_part_dtl_ibfk_2` FOREIGN KEY (`mdl_cd`, `part_ver`, `part_cd`) REFERENCES `om_part` (`mdl_cd`, `part_ver`, `part_cd`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='주문부품상세';

CREATE TABLE `om_packing` (
  `pi_no` varchar(8) NOT NULL COMMENT 'PI번호',
  `eqp_carton_no` varchar(8) DEFAULT NULL COMMENT '장비카톤번호',
  `part_carton_no` varchar(8) DEFAULT NULL COMMENT '부품카톤번호',
  `repr_carton_no` varchar(8) DEFAULT NULL COMMENT '수리품카톤번호',
  `part_cartons` int(4) unsigned DEFAULT NULL COMMENT '부품카톤수',
  `repr_cartons` int(4) unsigned DEFAULT NULL COMMENT '수리품카톤수',
  `eqp_gross_wgt` decimal(5,1) unsigned DEFAULT NULL COMMENT '장비총중량',
  `part_gross_wgt` decimal(5,1) unsigned DEFAULT NULL COMMENT '부품총중량',
  `repr_gross_wgt` decimal(5,1) unsigned DEFAULT NULL COMMENT '수리품총중량',
  `tot_cartons` int(6) unsigned NOT NULL COMMENT '총카톤수',
  `tot_gross_wgt` decimal(8,2) unsigned NOT NULL COMMENT '총중량',
  `sndmail_seq` int(11) DEFAULT NULL COMMENT '발송메일순번',
  `crt_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '생성일시',
  `udt_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '수정일시',
  `crt_uid` varchar(50) NOT NULL COMMENT '생성자ID',
  `udt_uid` varchar(50) DEFAULT NULL COMMENT '수정자ID',
  PRIMARY KEY (`pi_no`),
  KEY `sndmail_seq` (`sndmail_seq`),
  CONSTRAINT `om_packing_ibfk_1` FOREIGN KEY (`pi_no`) REFERENCES `om_invoice` (`pi_no`),
  CONSTRAINT `om_packing_ibfk_2` FOREIGN KEY (`sndmail_seq`) REFERENCES `om_sndmail` (`sndmail_seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Packing List';

CREATE TABLE `om_part` (
  `mdl_cd` varchar(4) NOT NULL COMMENT '모델코드',
  `part_ver` varchar(8) NOT NULL COMMENT '버전정보',
  `part_cd` varchar(13) NOT NULL COMMENT '부품코드',
  `part_nm` varchar(300) NOT NULL COMMENT '부품명',
  `unit_price` decimal(9,2) DEFAULT NULL COMMENT '단위가격',
  `unit_wgt` decimal(5,2) DEFAULT NULL COMMENT '단위중량',
  `remark` varchar(1000) DEFAULT NULL COMMENT '의견',
  `srl_no` int(11) DEFAULT NULL COMMENT '시리얼번호',
  `recom_yn` char(1) CHARACTER SET latin1 NOT NULL DEFAULT 'N' COMMENT '추천부품여부',
  `use_yn` char(1) NOT NULL DEFAULT 'Y' COMMENT '사용여부',
  `disp_yn` char(1) CHARACTER SET latin1 NOT NULL DEFAULT 'N' COMMENT '디스플레이여부',
  `ord_num` int(11) DEFAULT NULL COMMENT '정렬번호',
  `crt_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '생성일시',
  `udt_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '수정일시',
  `crt_uid` varchar(50) NOT NULL COMMENT '생성자ID',
  `udt_uid` varchar(50) DEFAULT NULL COMMENT '수정자ID',
  PRIMARY KEY (`part_ver`,`part_cd`,`mdl_cd`),
  KEY `om_part_ibfk_1` (`mdl_cd`),
  CONSTRAINT `om_part_ibfk_1` FOREIGN KEY (`mdl_cd`) REFERENCES `om_mdl` (`mdl_cd`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='부품정보';

CREATE TABLE `om_part_ship_req` (
  `pi_no` varchar(8) NOT NULL COMMENT 'PI번호',
  `swp_no` int(11) NOT NULL COMMENT 'SWP번호',
  `buyer` varchar(100) NOT NULL COMMENT '바이어',
  `ctnt` varchar(1000) DEFAULT NULL COMMENT '추가내용',
  `ship_dt` varchar(8) DEFAULT NULL COMMENT '출하일자',
  `send_yn` char(1) CHARACTER SET latin1 NOT NULL DEFAULT 'N' COMMENT '발송여부',
  `crt_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '생성일시',
  `udt_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '수정일시',
  `crt_uid` varchar(50) NOT NULL COMMENT '생성자ID',
  `udt_uid` varchar(50) DEFAULT NULL COMMENT '수정자ID',
  PRIMARY KEY (`pi_no`,`swp_no`),
  CONSTRAINT `om_part_ship_req_ibfk_1` FOREIGN KEY (`pi_no`, `swp_no`) REFERENCES `om_ord_part` (`pi_no`, `swp_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='부품출고의뢰서정보';

CREATE TABLE `om_prd_req` (
  `swm_no` int(11) NOT NULL AUTO_INCREMENT COMMENT 'SWM번호',
  `pi_no` varchar(8) NOT NULL COMMENT 'PI번호',
  `po_no` int(11) NOT NULL COMMENT '주문번호',
  `qual_ship_dt` varchar(8) DEFAULT NULL COMMENT '품질출하일',
  `qual_trans_dt` varchar(8) DEFAULT NULL COMMENT '품질이관일',
  `manual_lang_atcd` varchar(8) DEFAULT NULL COMMENT '메뉴얼언어속성코드',
  `extra` varchar(500) DEFAULT NULL COMMENT '특이사항',
  `sendmail_seq` int(11) DEFAULT NULL COMMENT '발송메일순번',
  `crt_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '생성일시',
  `udt_dt` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '수정일시(작성일)',
  `crt_uid` varchar(50) NOT NULL COMMENT '생성자ID',
  `udt_uid` varchar(50) DEFAULT NULL COMMENT '수정자ID',
  PRIMARY KEY (`swm_no`),
  KEY `om_prd_req_ibfk_1` (`pi_no`,`po_no`),
  KEY `om_prd_req_ibfk_2` (`sendmail_seq`),
  CONSTRAINT `om_prd_req_ibfk_1` FOREIGN KEY (`pi_no`, `po_no`) REFERENCES `om_ord_eqp` (`pi_no`, `po_no`),
  CONSTRAINT `om_prd_req_ibfk_2` FOREIGN KEY (`sendmail_seq`) REFERENCES `om_sndmail` (`sndmail_seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='생산의뢰서정보';

CREATE TABLE `om_prd_req_dtl` (
  `swm_no` int(11) NOT NULL COMMENT 'SWM번호',
  `cd` varchar(4) NOT NULL COMMENT '코드',
  `atcd` varchar(8) NOT NULL COMMENT '속성코드',
  `atcd_ox` char(1) CHARACTER SET latin1 DEFAULT NULL COMMENT '속성코드 OX여부',
  `crt_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '생성일시',
  `udt_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '수정일시',
  `crt_uid` varchar(50) NOT NULL COMMENT '생성자ID',
  `udt_uid` varchar(50) DEFAULT NULL COMMENT '수정자ID',
  PRIMARY KEY (`swm_no`,`cd`,`atcd`),
  KEY `om_prd_req_dtl_ibfk_2` (`cd`,`atcd`),
  CONSTRAINT `om_prd_req_dtl_ibfk_1` FOREIGN KEY (`swm_no`) REFERENCES `om_prd_req` (`swm_no`),
  CONSTRAINT `om_prd_req_dtl_ibfk_2` FOREIGN KEY (`cd`, `atcd`) REFERENCES `cm_cd_attr` (`cd`, `atcd`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='생산의뢰서상세';

CREATE TABLE `om_sndmail` (
  `sndmail_seq` int(11) NOT NULL AUTO_INCREMENT COMMENT '발송메일순번',
  `wrk_tp_atcd` varchar(8) NOT NULL COMMENT '작업유형속성코드',
  `sndmail_atcd` varchar(8) DEFAULT NULL COMMENT '발송메일속성코드',
  `auth_grp_cd` varchar(2) NOT NULL COMMENT '권한그룹코드',
  `sender_email` varchar(50) NOT NULL COMMENT '발송자ID',
  `sender_eng_nm` varchar(50) DEFAULT NULL COMMENT '발송자영문명',
  `title` varchar(500) NOT NULL COMMENT '메일제목',
  `ctnt` text NOT NULL COMMENT '메일내용',
  `crt_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '생성일시',
  `crt_uid` varchar(50) DEFAULT NULL COMMENT '생성자ID',
  PRIMARY KEY (`sndmail_seq`),
  KEY `om_sndmail_ibfk_1` (`auth_grp_cd`),
  CONSTRAINT `om_sndmail_ibfk_1` FOREIGN KEY (`auth_grp_cd`) REFERENCES `cm_auth_grp` (`auth_grp_cd`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='발송메일정보';

CREATE TABLE `om_sndmail_dtl` (
  `snd_no` int(11) NOT NULL AUTO_INCREMENT COMMENT '발송번호',
  `sndmail_seq` int(11) NOT NULL COMMENT '발송메일순번',
  `email_from` varchar(50) NOT NULL COMMENT '발송EMAIL',
  `email_to` varchar(500) NOT NULL COMMENT '수신EMAIL',
  `rcpnt_tp_atcd` char(1) CHARACTER SET latin1 DEFAULT NULL COMMENT '수신자구분 속성코드',
  `rcpnt_team_atcd` varchar(8) DEFAULT NULL COMMENT '수신팀속성코드',
  `snd_yn` char(1) NOT NULL DEFAULT 'N' COMMENT '발송여부',
  `crt_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '생성일시',
  `crt_uid` varchar(50) DEFAULT NULL COMMENT '생성자ID',
  PRIMARY KEY (`snd_no`),
  KEY `om_sndmail_dtl_ibfk_1` (`sndmail_seq`),
  KEY `om_sndmail_dtl_ibfk_2` (`rcpnt_team_atcd`),
  CONSTRAINT `om_sndmail_dtl_ibfk_1` FOREIGN KEY (`sndmail_seq`) REFERENCES `om_sndmail` (`sndmail_seq`),
  CONSTRAINT `om_sndmail_dtl_ibfk_2` FOREIGN KEY (`rcpnt_team_atcd`) REFERENCES `om_team` (`team_atcd`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='발송메일상세';

CREATE TABLE `om_team` (
  `team_atcd` varchar(8) NOT NULL COMMENT '팀속성코드',
  `team_email` varchar(50) NOT NULL COMMENT '팀EMAIL',
  `team_mngr_email` varchar(50) DEFAULT NULL COMMENT '팀관리자EMAIL',
  `team_mailing_yn` char(1) CHARACTER SET latin1 NOT NULL DEFAULT 'N' COMMENT '팀메일링여부',
  PRIMARY KEY (`team_atcd`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='팀정보';

CREATE TABLE `om_user` (
  `uid` varchar(50) NOT NULL COMMENT '사용자ID',
  `pswd` varchar(15) NOT NULL COMMENT '비밀번호',
  `auth_grp_cd` varchar(2) DEFAULT NULL COMMENT '권한그룹코드',
  `perms_cd` varchar(4) DEFAULT NULL COMMENT '승인코드',
  `usr_nm` varchar(50) DEFAULT NULL COMMENT '사용자명',
  `usr_email` varchar(50) DEFAULT NULL COMMENT '사용자이메일',
  `gender_atcd` char(1) DEFAULT NULL COMMENT '성별속성코드',
  `nation_atcd` varchar(8) DEFAULT NULL COMMENT '국적속성코드',
  `join_dt` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '가입일시',
  `last_logindt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '최종로그인일시',
  `active_yn` char(1) NOT NULL DEFAULT 'N' COMMENT '활성화여부',
  `crt_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '생성일시',
  `crt_uid` varchar(50) NOT NULL COMMENT '생성자ID',
  `udt_dt` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '수정일시',
  `udt_uid` varchar(50) DEFAULT NULL COMMENT '수정자ID',
  PRIMARY KEY (`uid`),
  KEY `om_user_ibfk_1` (`auth_grp_cd`),
  CONSTRAINT `om_user_ibfk_1` FOREIGN KEY (`auth_grp_cd`) REFERENCES `cm_auth_grp` (`auth_grp_cd`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='사용자정보';

CREATE TABLE `om_worker` (
  `worker_seq` int(11) NOT NULL AUTO_INCREMENT COMMENT '담당자순번',
  `worker_uid` varchar(50) NOT NULL COMMENT '담당자ID',
  `kr_nm` varchar(20) NOT NULL COMMENT '담당자명',
  `eng_nm` varchar(50) DEFAULT NULL COMMENT '담당자영문명',
  `w_email` varchar(50) NOT NULL COMMENT '담당자이메일',
  `w_mob` varchar(11) DEFAULT NULL COMMENT '핸드폰번호',
  `team_atcd` varchar(8) NOT NULL COMMENT '팀속성코드',
  `duty_atcd` varchar(8) NOT NULL COMMENT '직무속성코드',
  `extns_num` varchar(4) DEFAULT NULL COMMENT '내선번호',
  `mailing_yn` char(1) NOT NULL DEFAULT 'Y' COMMENT '메일링여부',
  `aprv_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '승인일시',
  `crt_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '생성일시',
  `crt_uid` varchar(50) NOT NULL COMMENT '생성자ID',
  `udt_dt` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '수정일시',
  `udt_uid` varchar(50) DEFAULT NULL COMMENT '수정자ID',
  PRIMARY KEY (`worker_seq`),
  UNIQUE KEY `team_atcd` (`team_atcd`,`worker_uid`),
  KEY `om_worker_ibfk_1` (`worker_uid`),
  CONSTRAINT `om_worker_ibfk_2` FOREIGN KEY (`team_atcd`) REFERENCES `om_team` (`team_atcd`)
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8 COMMENT='담당자정보';

