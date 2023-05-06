FROM
(SELECT CASE
	WHEN count(accountid)=1 THEN 'count 1 '
	when count(accountid)=2 THEN 'count 2'
	when count(accountid)=3 THEN 'count 3'
	WHEN count(accountid)>3 THEN 'count 3+' END as times,sum(amount+assetamount+bonusamount+couponamount) as sum 
FROM da_account_trade
WHERE biztype in (1,3) AND inouttype=1 AND `status`=20 AND date(createtime)='2020-10-31' 
AND accountid in (SELECT accountid FROM da_account_trade
WHERE date(createtime)='2020-10-31'
and `status` =20 and biztype in (1,3) and inouttype = 1)
GROUP BY accountid) aaa
GROUP BY 1;