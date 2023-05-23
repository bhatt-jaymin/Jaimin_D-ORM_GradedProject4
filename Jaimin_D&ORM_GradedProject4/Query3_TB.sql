-- 3) Display the total number of customers based on gender who have placed orders of worth at least Rs.3000.

SELECT c.CUS_GENDER, COUNT(*) AS Total_Customers
FROM customer c
INNER JOIN orders o ON c.CUS_ID = o.CUS_ID
WHERE o.ORD_AMOUNT >= 3000
GROUP BY c.CUS_GENDER;