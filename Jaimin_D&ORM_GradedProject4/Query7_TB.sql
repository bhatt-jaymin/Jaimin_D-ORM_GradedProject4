-- 7) Display the Id and Name of the Product ordered after “2021-10-05”.


SELECT product.PRO_ID, product.PRO_NAME
FROM product
JOIN supplier_pricing ON product.PRO_ID = supplier_pricing.PRO_ID
JOIN orders ON supplier_pricing.PRICING_ID = orders.PRICING_ID
WHERE orders.ORD_DATE > '2021-10-05';
