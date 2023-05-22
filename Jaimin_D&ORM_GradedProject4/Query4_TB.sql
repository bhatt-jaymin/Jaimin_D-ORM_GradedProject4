-- 4) Display all the orders along with product name ordered by a customer having Customer_Id=2

SELECT orders.ORD_ID, product.PRO_NAME
FROM orders
JOIN supplier_pricing ON orders.PRICING_ID = supplier_pricing.PRICING_ID
JOIN product ON supplier_pricing.PRO_ID = product.PRO_ID
WHERE orders.CUS_ID = 2;
