 create or replace view v_cm_cd_attr
 as
 select c.cd, c.cd_nm, c.cd_dscrt, c.use_yn, c.p_cd, c.crt_dt, c.udt_dt
 , a.atcd, a.atcd_nm, a.atcd_dscrt, a.disp_yn, a.use_yn as attr_use_yn, a.ord_num, a.crt_dt as at_crt_dt, a.udt_dt as at_upt_dt, a.upt_uid as at_upt_uid
 from (cm_cd c left outer join cm_cd_attr a on c.cd = a.cd);