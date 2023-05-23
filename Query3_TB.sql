-- 3) Display the total number of customers based on gender who have placed orders of worth at least Rs.3000.

SELECT cus.CUS_GENDER, COUNT(*) AS Total_Customers
FROM customer cus
INNER JOIN orders ord ON cus.CUS_ID = ord.CUS_ID
WHERE ord.ORD_AMOUNT >= 3000
GROUP BY cus.CUS_GENDER;