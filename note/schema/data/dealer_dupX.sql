
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
having cnt=1
;