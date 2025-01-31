
 -- exercise 1
 SELECT city, MAX(grade) AS max_grade
FROM customer
WHERE grade IS NOT NULL
GROUP BY city;

--exercise 2 
SELECT SUM(purch_amt) AS total_purchase_amount
FROM orders;

--exercise 3
SELECT AVG(purch_amt) AS average_purchase_amount
FROM orders;

--exercise 4
SELECT COUNT(DISTINCT salesman_id) AS number_of_salespeople
FROM orders;


--exercise 5
SELECT COUNT(customer_id) AS number_of_customers
FROM customer;


--exercise 6
SELECT COUNT(DISTINCT customer_id) 
FROM customer 
WHERE grade IS NOT NULL;

-- exercise 7
SELECT MAX(purch_amt) 
FROM orders;

-- exercise 8
SELECT MIN(purch_amt) 
FROM orders;

--exercise 9
SELECT customer_id, MAX(purch_amt) AS max_purchase_amount
FROM orders
GROUP BY customer_id;

--exercise 10
SELECT ord_date, MAX(purch_amt) AS highest_purchase_amount
FROM orders
GROUP BY ord_date;


--exercise 11
SELECT salesman_id, MAX(purch_amt) AS highest_purchase_amount
FROM orders
WHERE ord_date = '2012-08-17'
GROUP BY salesman_id;


--exercise 12
SELECT customer_id, ord_date, MAX(purch_amt) AS max_purchase_amount
FROM orders
GROUP BY customer_id, ord_date
having MAX(purch_amt) > 2000; --- group by ga ishlatsa bo'ladi

--exercise 13
SELECT customer_id, ord_date, MAX(purch_amt) AS max_purchase_amount
FROM orders
WHERE purch_amt BETWEEN 2000 AND 6000
GROUP BY customer_id, ord_date;

--exercise 14
SELECT customer_id, ord_date, MAX(purch_amt) AS max_purchase_amount
FROM orders
WHERE purch_amt IN (2000, 3000, 5760, 6000)
GROUP BY customer_id, ord_date;

--exercise 15
SELECT customer_id, MAX(purch_amt) AS max_purchase_amount
FROM orders
WHERE customer_id BETWEEN 3002 AND 3007
GROUP BY customer_id;
