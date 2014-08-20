
insert into sbm.om_dealer (dealer_nm, email, pswd, cntry_atcd, cmpy_nm, addr, tel, crt_uid)
SELECT name, email, 'dealer123', atcd, Company, address, Telephone, 'admin' 
FROM sbm.tmp_buyer_list t
where email is not null
and exists (select email, count(*) cnt
FROM sbm.tmp_buyer_list
group by email
having cnt=1
and t.email = email
)
order by atcd
;

select email, count(*) cnt
FROM sbm.tmp_buyer_list
group by email
having cnt<>1
;



INSERT INTO sbm.om_part
(mdl_cd, part_ver, part_cd, part_nm, unit_price, unit_wgt, remark, srl_no, recom_yn, crt_uid) 
SELECT mdl_cd, part_ver, part_cd, part_nm, unit_price, unit_wgt, remark, srl_no, IF(recom_yn='Y','Y','N'), crt_uid
FROM sbm.tmp_om_part



--select atcd, company, address, telephone, null fax, name, 'admin' 
--select b.*, (select dealer_seq from om_dealer where b.email = dealer_uid) dealer_seq
INSERT INTO sbm.om_dealer_cntry
(dealer_seq, cntry_atcd, csn_attn, crt_uid) 
select (select dealer_seq from om_dealer where b.email = dealer_uid) dealer_seq, atcd, name, 'admin' 
from sbm.tmp_buyer_list b
where email in (
select email
FROM sbm.tmp_buyer_list
group by email
having count(*)<>1
)
and not exists (select u.nation_atcd from (om_dealer d left outer join om_user u on d.dealer_uid = u.uid) where nation_atcd = b.atcd)
order by email





SELECT worker_uid, INSTR(worker_uid, 'sbmkorea.com'), SUBSTRING(worker_uid, 1, INSTR(worker_uid, '@')-1)
FROM sbm.om_worker;
;