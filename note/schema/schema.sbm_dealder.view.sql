 create or replace view v_cm_cd_attr
 as
 select c.cd, c.cd_nm, c.cd_dscrt, c.use_yn, c.crt_dt, c.udt_dt, c.p_cd
 , a.atcd, a.atcd_nm, a.atcd_dscrt, a.disp_yn, a.use_yn as attr_use_yn, a.ord_num
 from (cm_cd c left outer join cm_cd_attr a on c.cd = a.cd);