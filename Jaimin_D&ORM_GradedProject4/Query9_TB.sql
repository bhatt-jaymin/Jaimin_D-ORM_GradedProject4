-- 9)Create a stored procedure to display supplier id, name, rating and Type_of_Service. For Type_of_Service, If rating =5, print “Excellent Service”,If rating >4 print “Good Service”, If rating >2 print “Average Service” else print “Poor Service”.


DELIMITER //

CREATE PROCEDURE GetSupplierServiceRatings()
BEGIN
    SELECT
        SUP.SUPP_NAME,
        SP_RO_2.*,
        CASE
            WHEN AverageRating = 5 THEN 'Excellent Service'
            WHEN AverageRating > 4 THEN 'Good Service'
            WHEN AverageRating > 2 THEN 'Average Service'
            ELSE 'Poor Service'
        END AS TypeOfService
    FROM
        supplier SUP
    INNER JOIN (
        SELECT
            SUPP_ID,
            AVG(RAT_RATSTARS) AS AverageRating
        FROM (
            SELECT
                SUP.SUPP_ID,
                RAT.ORD_ID,
                RAT.RAT_RATSTARS
            FROM
                supplier_pricing SUP
            INNER JOIN (
                SELECT
                    ORD.ORD_ID,
                    ORD.PRICING_ID,
                    RAT.RAT_RATSTARS
                FROM
                    orders ORD
                INNER JOIN rating RAT ON ORD.ORD_ID = RAT.ORD_ID
            ) AS RATORD ON SUP.PRICING_ID = RATORD.PRICING_ID
        ) AS SUP_RATORD
        GROUP BY
            SUPP_ID
    ) AS SUP_RATORD_2 ON SUP.SUPP_ID = SUP_RATORD_2.SUPP_ID;
END //

DELIMITER ;
-- Execute Procedure

call GetSupplierServiceRatings();