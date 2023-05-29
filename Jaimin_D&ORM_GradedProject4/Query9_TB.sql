-- 9)Create a stored procedure to display supplier id, name, rating and Type_of_Service. For Type_of_Service, If rating =5, print “Excellent Service”,If rating >4 print “Good Service”, If rating >2 print “Average Service” else print “Poor Service”.


DELIMITER //

CREATE PROCEDURE GetSupplierServiceRatings()
BEGIN

    SELECT
        S.SUPP_NAME,
        SP_RO_2.*,
        CASE
            WHEN AverageRating = 5 THEN 'Excellent Service'
            WHEN AverageRating > 4 THEN 'Good Service'
            WHEN AverageRating > 2 THEN 'Average Service'
            ELSE 'Poor Service'
        END AS TypeOfService
    FROM
        supplier S
    INNER JOIN (
        SELECT
            SUPP_ID,
            AVG(RAT_RATSTARS) AS AverageRating
        FROM (
            SELECT
                SP.SUPP_ID,
                RO.ORD_ID,
                RO.RAT_RATSTARS
            FROM
                supplier_pricing SP
            INNER JOIN (
                SELECT
                    O.ORD_ID,
                    O.PRICING_ID,
                    R.RAT_RATSTARS
                FROM
                    `orders` O
                INNER JOIN rating R ON O.ORD_ID = R.ORD_ID
            ) AS RO ON SP.PRICING_ID = RO.PRICING_ID
        ) AS SP_RO
        GROUP BY
            SUPP_ID
    ) AS SP_RO_2 ON S.SUPP_ID = SP_RO_2.SUPP_ID;
END //

DELIMITER ;
-- Execute Procedure

call GetSupplierServiceRatings();