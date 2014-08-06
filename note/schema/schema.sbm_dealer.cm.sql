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

