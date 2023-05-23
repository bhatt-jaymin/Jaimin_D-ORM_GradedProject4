-- 8) Display customer name and gender whose names start or end with character 'A'.
SELECT CUS_NAME, CUS_GENDER
FROM customer
WHERE CUS_NAME LIKE 'A%' OR CUS_NAME LIKE '%A';
