-- 4) Display all the orders along with product name ordered by a customer having Customer_Id=2

select prd.pro_name as 'Product Name', ord.* from `orders` ord
inner join supplier_pricing sup_prz
on ord.PRICING_ID = sup_prz.PRICING_ID
inner join product prd
on prd.PRO_ID = sup_prz.pro_id
where ord.CUS_ID = 2;




