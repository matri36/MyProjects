
  
  
--Project 2 (Part A, B, C)
--Date 02/25/15
--Meena Chandok
--Used Oracle SQL Developer 11g to perform different parts of the project.
  
Part A: 
  SELECT email_address,  max (order_total) as largest_order
FROM (SELECT email_address, o.order_id, sum ((item_price-discount_amount)*quantity) AS order_total
        FROM customers ca, orders o, order_items oi
        WHERE ca.CUSTOMER_ID = o.customer_id
        AND oi.order_id=o.order_id
        GROUP BY email_address, o.order_id)
GROUP BY email_address;

EMAIL_ADDRESS                                                                                     LARGEST_ORDER
-------------------------------------------------------------------------------------------------- -------------
david.goldstein@hotmail.com                                                                          489.3 
gary_hernandez@yahoo.com                                                                             679.99 
erinv@gmail.com                                                                                      299 
barryz@gmail.com                                                                                     303.79 
allan.sherwood@yahoo.com                                                                             1461.31 
christineb@solarone.com                                                                              1678.6 
frankwilson@sbcglobal.net                                                                            1539.28 

 7 rows selected 

 -----------------------------------------------------------
 Part B:
 SELECT product_name, discount_percent
FROM products
WHERE discount_percent not in 
      (SELECT discount_percent 
       FROM products 
       GROUP BY discount_percent 
       HAVING COUNT(*)>1)
ORDER BY product_name;


PRODUCT_NAME                                                              DISCOUNT_PERCENT
------------------------------------------------------------------------- ----------------
Gibson SG                                                                       52 
Hofner Icon                                                                     25 
Rodriguez Caballero 11                                                          39 
Tama 5-Piece Drum Set with Cymbals                                              15 
Washburn D10S                                                                   0 
Yamaha FG700S                                                                   38 

 6 rows selected 

--------------------------
Part C: 

SELECT email_address, order_date AS oldest_order,
       order_id
FROM orders o_main JOIN customers c
  ON o_main.customer_id = c.customer_id
WHERE order_date =
  (SELECT MIN(order_date)
   FROM orders o_sub
   WHERE o_sub.customer_id = o_main.customer_id)
ORDER BY email_address;

EMAIL_ADDRESS                                                                                        OLDEST_ORDER   ORDER_ID
---------------------------------------------------------------------------------------------------- ------------ ----------
allan.sherwood@yahoo.com                                                                            28-MAR-12             1 
barryz@gmail.com                                                                                    28-MAR-12             2 
christineb@solarone.com                                                                             30-MAR-12             4 
david.goldstein@hotmail.com                                                                         31-MAR-12             5 
erinv@gmail.com                                                                                     31-MAR-12             6 
frankwilson@sbcglobal.net                                                                           01-APR-12             7 
gary_hernandez@yahoo.com                                                                            02-APR-12             8 

 7 rows selected 

----------------------------------------