SELECT *
FROM da_sales.purchases

SELECT custid, prodid, quantity
FROM da_sales.purchases
WHERE quantity > 1
LIMIT 1000;


SELECT custid, prodid, SUM(quantity) AS total_quantity
FROM da_sales.purchases
WHERE quantity > 1
GROUP BY custid, prodid
LIMIT 1000;


SELECT custid,  SUM(quantity) AS total_quantity
FROM da_sales.purchases
WHERE quantity >= 1
GROUP BY custid
