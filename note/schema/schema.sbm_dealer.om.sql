CREATE TABLE `om_admin` (
  `adm_uid` varchar(15) NOT NULL COMMENT '관리자ID',
  `adm_pswd` varchar(15) NOT NULL COMMENT '관리자비밀번호',
  `auth_grp_cd` varchar(2) DEFAULT NULL COMMENT '권한그룹코드',
  `perms_cd` varchar(4) DEFAULT NULL COMMENT '승인코드',
  `active_yn` char(1) CHARACTER SET latin1 NOT NULL DEFAULT 'N' COMMENT '활성화여부',
  `last_logindt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '최종로그인일시',
  `crt_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '생성일시',
  `udt_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '수정일시',
  PRIMARY KEY (`adm_uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='관리자정보';

CREATE TABLE `om_dealer` (
  `dealer_seq` int(11) NOT NULL COMMENT '딜러순번',
  `dealer_nm` varchar(30) DEFAULT NULL COMMENT '딜러명',
  `email` varchar(50) NOT NULL COMMENT '이메일',
  `pswd` varchar(15) DEFAULT NULL COMMENT '비밀번호',
  `cntry_atcd` varchar(4) NOT NULL COMMENT '국가속성코드',
  `cmpy_nm` varchar(50) DEFAULT NULL COMMENT '회사명',
  `biztp_atcd` varchar(4) DEFAULT NULL COMMENT '업무구분 속성코드',
  `job_tit` varchar(100) DEFAULT NULL COMMENT '직업타이틀',
  `addr` varchar(300) DEFAULT NULL COMMENT '주소',
  `tel` varchar(20) DEFAULT NULL COMMENT '전화번호',
  `fax` varchar(20) DEFAULT NULL COMMENT '팩스',
  `homepage` varchar(300) DEFAULT NULL COMMENT '홈페이지',
  `exper_years` varchar(4) DEFAULT NULL COMMENT '계수기취급 시작년도',
  `maincust_atcd` varchar(4) DEFAULT NULL COMMENT '주고객 속성코드',
  `comments` varchar(2000) DEFAULT NULL COMMENT '코멘트',
  `mkt_inf` varchar(4000) DEFAULT NULL COMMENT '마케팅정보',
  `worker_uid` varchar(15) DEFAULT NULL COMMENT '작업자ID',
  `premium_rate` decimal(5,2) DEFAULT NULL COMMENT '딜러할증요율',
  `bank_atcd` varchar(4) DEFAULT NULL COMMENT '은행속성코드',
  `attn` varchar(100) DEFAULT NULL COMMENT '송장 담당자',
  `file_grp_seq` int(11) DEFAULT NULL COMMENT '파일그룹순번',
  `crt_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '생성일시',
  `crt_uid` varchar(15) NOT NULL COMMENT '생성자ID',
  `udt_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '수정일시',
  `udt_uid` varchar(15) DEFAULT NULL COMMENT '수정자ID',
  PRIMARY KEY (`dealer_seq`),
  KEY `om_dealer_ibfk_1` (`worker_uid`),
  CONSTRAINT `om_dealer_ibfk_1` FOREIGN KEY (`worker_uid`) REFERENCES `om_worker` (`worker_uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='딜러정보';

CREATE TABLE `om_part` (
  `part_cd` varchar(10) NOT NULL COMMENT '부품코드',
  `part_nm` varchar(300) NOT NULL COMMENT '부품명',
  `unit_price` decimal(9,2) NOT NULL COMMENT '단위가격',
  `unit_wgt` decimal(5,2) DEFAULT NULL COMMENT '단위중량',
  `remark` varchar(1000) DEFAULT NULL COMMENT '의견',
  `version` varchar(8) NOT NULL COMMENT '버전정보',
  `srl_no` int(11) DEFAULT NULL COMMENT '시리얼번호',
  `recom_yn` char(1) CHARACTER SET latin1 DEFAULT 'N' COMMENT '추천부품여부',
  `use_yn` char(1) CHARACTER SET latin1 NOT NULL DEFAULT 'Y' COMMENT '사용여부',
  `crt_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '생성일시',
  `udt_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '수정일시',
  `crt_uid` varchar(15) NOT NULL COMMENT '생성자ID',
  `udt_uid` varchar(15) DEFAULT NULL COMMENT '수정자ID',
  PRIMARY KEY (`part_cd`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='부품정보';

CREATE TABLE `om_part_mdl` (
  `part_cd` varchar(10) NOT NULL COMMENT '부품코드',
  `mdl_atcd` varchar(4) NOT NULL COMMENT '모델속성코드',
  `disp_yn` char(1) CHARACTER SET latin1 NOT NULL DEFAULT 'Y' COMMENT '디스플레이여부',
  `use_yn` char(1) CHARACTER SET latin1 NOT NULL DEFAULT 'Y' COMMENT '사용여부',
  `crt_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '생성일시',
  `udt_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '수정일시',
  `crt_uid` varchar(15) NOT NULL COMMENT '생성자ID',
  `udt_uid` varchar(15) DEFAULT NULL COMMENT '수정자ID',
  PRIMARY KEY (`part_cd`,`mdl_atcd`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='부품모델정보';

CREATE TABLE `om_sndmail` (
  `seq` int(11) NOT NULL AUTO_INCREMENT COMMENT '순번',
  `wrk_tp_atcd` varchar(4) DEFAULT NULL COMMENT '작업구분 속성코드',
  `sender_uid` varchar(15) NOT NULL COMMENT '전송자ID',
  `sender_nm` varchar(50) DEFAULT NULL COMMENT '전송자명',
  `email_from` varchar(50) NOT NULL COMMENT '전송자EMAIL',
  `email_to` varchar(500) DEFAULT NULL COMMENT '수신자EMAIL',
  `email_cc` varchar(500) DEFAULT NULL COMMENT '참조EMAIL',
  `title` varchar(500) DEFAULT NULL COMMENT '메일제목',
  `ctnt` text CHARACTER SET latin1 NOT NULL COMMENT '메일내용',
  `crt_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '생성일시',
  `crt_uid` varchar(15) NOT NULL COMMENT '생성자ID',
  PRIMARY KEY (`seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='전송메일정보';

CREATE TABLE `om_team_mail` (
  `post_atcd` varchar(4) NOT NULL COMMENT '부서속성코드',
  `team_email` varchar(50) NOT NULL COMMENT '팀EMAIL',
  `mailing_yn` char(1) CHARACTER SET latin1 NOT NULL COMMENT '메일링여부',
  PRIMARY KEY (`post_atcd`,`team_email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='팀메일정보';

CREATE TABLE `om_worker` (
  `worker_uid` varchar(15) NOT NULL COMMENT '담당자ID',
  `kr_nm` varchar(20) NOT NULL COMMENT '담당자명',
  `eng_nm` varchar(50) DEFAULT NULL COMMENT '담당자영문명',
  `email` varchar(50) NOT NULL COMMENT '담당자이메일',
  `post_atcd` varchar(4) NOT NULL COMMENT '부서속성코드',
  `duty_atcd` varchar(4) NOT NULL COMMENT '직무속성코드',
  `extns_num` varchar(4) DEFAULT NULL COMMENT '내선번호',
  `moblie_num` varchar(11) DEFAULT NULL COMMENT '핸드폰번호',
  `mailing_yn` char(1) CHARACTER SET latin1 NOT NULL DEFAULT 'Y' COMMENT '메일링여부',
  `aprv_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '승인일시',
  PRIMARY KEY (`worker_uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='담당자정보';

