create or replace view v_cm_cd_inf AS 
select c.cd_seq,c.grp_cd,g.grp_nm,g.p_grp_cd,c.lang_cd,t.lang_nm,c.cd_dispnm,c.cd_dscrnm
from ((cm_cd_grp g join cm_cd_lang t on g.use_yn='Y') join cm_cd_inf c) where ((c.grp_cd = g.grp_cd) and (c.lang_cd = t.lang_cd));