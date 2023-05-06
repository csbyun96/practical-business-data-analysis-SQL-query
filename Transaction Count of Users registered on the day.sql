SELECT date(tt),count(DISTINCT(aa))
FROM 
		(SELECT a.accountid as aa,a.createtime as tt
		from 
		(SELECT accountid,createtime FROM da_account_trade WHERE biztype in (1,3) AND inouttype=1 AND `status`=20) a
JOIN 
		(SELECT id,registtime  FROM da_account) b
ON a.accountid=b.id AND date(a.createtime)=date(b.registtime)
HAVING a.createtime>'2015-12-25') mm
GROUP BY 1;