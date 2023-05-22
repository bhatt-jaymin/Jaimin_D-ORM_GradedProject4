-- 3) Display the total number of customers based on gender who have placed orders of worth at least Rs.3000.

SELECT CUS_GENDER, COUNT(*) AS total_customers
FROM customer
WHERE CUS_ID IN (
  SELECT CUS_ID
  FROM orders
  WHERE ORD_AMOUNT >= 3000
)
GROUP BY CUS_GENDER;