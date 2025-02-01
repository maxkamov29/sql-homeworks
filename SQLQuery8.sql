CREATE TABLE customer (
    customer_id INT PRIMARY KEY,
    cust_name VARCHAR(50),
    city VARCHAR(50),
    grade INT,
    salesman_id INT
);

INSERT INTO customer (customer_id, cust_name, city, grade, salesman_id) VALUES
(3002, 'Nick Rimando', 'New York', 100, 5001),
(3007, 'Brad Davis', 'New York', 200, 5001),
(3005, 'Graham Zusi', 'California', 200, 5002),
(3008, 'Julian Green', 'London', 300, 5002),
(3004, 'Fabian Johnson', 'Paris', 300, 5006),
(3009, 'Geoff Cameron', 'Berlin', 100, 5003),
(3003, 'Jozy Altidor', 'Moscow', 200, 5007),
(3001, 'Brad Guzan', 'London', NULL, 5005);


CREATE TABLE salesman (
    salesman_id INT PRIMARY KEY,
    name VARCHAR(50),
    city VARCHAR(50),
    commission DECIMAL(3,2)
);

INSERT INTO salesman (salesman_id, name, city, commission) VALUES
(5001, 'James Hoog', 'New York', 0.15),
(5002, 'Nail Knite', 'Paris', 0.13),
(5005, 'Pit Alex', 'London', 0.11),
(5006, 'Mc Lyon', 'Paris', 0.14),
(5007, 'Paul Adam', 'Rome', 0.13),
(5003, 'Lauson Hen', 'San Jose', 0.12);

select customer.cust_name, salesman.name, salesman.city from customer, salesman
where customer.city = salesman.city


--exercise 2
select customer.cust_name, salesman.name from customer, salesman
where customer.salesman_id = salesman.salesman_id



CREATE TABLE orders (
    ord_no INT PRIMARY KEY,
    purch_amt DECIMAL(10,2),
    ord_date DATE,
    customer_id INT,
    salesman_id INT
);

INSERT INTO orders (ord_no, purch_amt, ord_date, customer_id, salesman_id) VALUES
(70001, 150.5, '2012-10-05', 3005, 5002),
(70009, 270.65, '2012-09-10', 3001, 5005),
(70002, 65.26, '2012-10-05', 3002, 5001),
(70004, 110.5, '2012-08-17', 3009, 5003),
(70007, 948.5, '2012-09-10', 3005, 5002),
(70005, 2400.6, '2012-07-27', 3007, 5001),
(70008, 5760, '2012-09-10', 3002, 5001),
(70010, 1983.43, '2012-10-10', 3004, 5006),
(70003, 2480.4, '2012-10-10', 3009, 5003),
(70012, 250.45, '2012-06-27', 3008, 5002),
(70011, 75.29, '2012-08-17', 3003, 5007),
(70013, 3045.6, '2012-04-25', 3002, 5001);

--exxercise 3
select ord_no, cust_name, orders.customer_id, orders.salesman_id from orders, salesman, customer
where customer.salesman_id = salesman.salesman_id and customer.city != salesman.city and orders.customer_id=customer.customer_id

--exerccise 4
select ord_no, cust_name from orders, customer
where orders.customer_id = customer.customer_id


--exercise 5
select cust_name as 'Customer', grade as 'Grade', orders.ord_no as 'Order No' from customer, orders, salesman
where orders.customer_id = customer.customer_id
  AND orders.salesman_id = salesman.salesman_id
  AND salesman.city IS NOT NULL
  AND customer.grade IS NOT NULL


--exercise 6
select cust_name as 'Customer', customer.city as 'City' from customer, salesman
where customer.salesman_id = salesman.salesman_id and (salesman.commission >= 0.12 or salesman.commission <=0.14)




