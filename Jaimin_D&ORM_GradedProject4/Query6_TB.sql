-- 6) Find the least expensive product from each category and print the table with category id, name, product name and price of the product

SELECT category.CAT_ID, category.CAT_NAME, product.PRO_NAME, supplier_pricing.SUPP_PRICE
FROM category
JOIN product ON category.CAT_ID = product.CAT_ID
JOIN supplier_pricing ON product.PRO_ID = supplier_pricing.PRO_ID
WHERE supplier_pricing.SUPP_PRICE = (
  SELECT MIN(SUPP_PRICE)
  FROM supplier_pricing
  WHERE supplier_pricing.PRO_ID = product.PRO_ID
)
GROUP BY category.CAT_ID, category.CAT_NAME, product.PRO_NAME, supplier_pricing.SUPP_PRICE;
