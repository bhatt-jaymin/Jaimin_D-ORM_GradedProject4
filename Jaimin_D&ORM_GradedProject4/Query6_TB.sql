select CT.CAT_ID, CT.CAT_NAME, 
Min(SP_PRZ.MinimumPrice) as 'MinimumPrice'
 from category CT inner join (
	select PRD.*, SP.MinimumPrice from product PRD inner join (
		select pro_id, min(SUPP_PRICE) as MinimumPrice from supplier_pricing 
		group by pro_id
	) as SP
	on PRD.pro_id = SP.PRO_ID
) as SP_PRZ
on CT.CAT_ID = SP_PRZ.CAT_ID
group by SP_PRZ.CAT_ID