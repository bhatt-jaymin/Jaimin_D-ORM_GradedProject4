--  5) Display the Supplier details who can supply more than one product.

SELECT supplier.SUPP_ID, supplier.SUPP_NAME
FROM supplier
JOIN supplier_pricing ON supplier.SUPP_ID = supplier_pricing.SUPP_ID
GROUP BY supplier.SUPP_ID, supplier.SUPP_NAME
HAVING COUNT(DISTINCT supplier_pricing.PRO_ID) > 1;
