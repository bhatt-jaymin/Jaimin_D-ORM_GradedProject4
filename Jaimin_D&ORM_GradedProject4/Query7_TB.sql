-- 7) Display the Id and Name of the Product ordered after “2021-10-05”.

select prd.PRO_ID, prd.PRO_NAME, ord.ORD_DATE from product prd
inner join supplier_pricing sp_prz
ON prd.PRO_ID = sp_prz.pro_ID
inner join `orders` ord
on sp_prz.PRICING_ID = ord.PRICING_ID
where ord.ORD_DATE > "2021-10-05"; 
