CREATE database practice

create table order_dimension (
order_id int identity(1, 1), order_date datetime, shipping_date datetime,
constraint pk_order_id primary key(order_id)
)

INSERT INTO order_dimension (order_date, shipping_date) VALUES
('2024-01-01 10:30:00', '2024-01-05 15:00:00'),
('2024-02-10 14:45:00', '2024-02-15 12:30:00'),
('2024-03-20 09:15:00', '2024-03-25 18:00:00'),
('2024-04-05 16:00:00', '2024-04-10 14:00:00'),
('2024-05-12 08:00:00', '2024-05-17 10:30:00');

create table customer_dimension (
customer_id int identity(1, 1), name varchar(20), age int, address varchar(255), phone_number varchar(20),
constraint pk_customer_id primary key(customer_id)
)

--drop table customer_dimension
INSERT INTO customer_dimension (name, age, address, phone_number) VALUES
('John Doe', 30, '123 Main St, New York, USA', '1-555-1234'),
('Alice Smith', 25, '456 Elm St, London, UK', '44-7890-5678'),
('Michael Brown', 40, '789 Maple Ave, Toronto, Canada', '1-416-9876'),
('Emma Wilson', 35, '321 Oak St, Sydney, Australia', '61-400-8765'),
('David Johnson', 28, '555 Pine St, Paris, France', '33-650-4321');

create table product_dimension(
product_id int identity(1, 1),
name varchar(20),
brand varchar(20),
description varchar(20),
constraint pk_product_id primary key(product_id)
)

INSERT INTO product_dimension (name, brand, description) VALUES
('Laptop', 'Dell', 'High-performance'),
('Smartphone', 'Apple', 'Latest model'),
('Headphones', 'Sony', 'Noise-canceling'),
('Smartwatch', 'Samsung', 'Water-resistant'),
('Tablet', 'Lenovo', 'Lightweight design');


create table week_dimension(
week_id int unique,
day varchar(20),
constraint pk_week_id primary key(week_id)
)


INSERT INTO week_dimension(week_id, day) VALUES
(1, 'Monday'),
(2, 'Tuesday'),
(3, 'Wednesday'),
(4, 'Thursday'),
(5, 'Friday'),
(6, 'Saturday'),
(7, 'Sunday');

create table month_dimension (
month_id int unique,
month_name varchar(20),
constraint pk_month_id primary key(month_id)
)

INSERT INTO month_dimension (month_id, month_name) VALUES
(1, 'January'),
(2, 'February'),
(3, 'March'),
(4, 'April'),
(5, 'May'),
(6, 'June'),
(7, 'July'),
(8, 'August'),
(9, 'September'),
(10, 'October'),
(11, 'November'),
(12, 'December');

CREATE TABLE quarter_dimension (
    quarter_id INT PRIMARY KEY, 
    quarter_name VARCHAR(10)
)

INSERT INTO quarter_dimension (quarter_id, quarter_name) VALUES
(1, 'Q1'),
(2, 'Q2'),
(3, 'Q3'),
(4, 'Q4');


create table date_dimension (
date_id int identity(1, 1),
date datetime,
day varchar(20),
week_id int,
month_id int,
quarter_id int,
year varchar(20),
constraint pk_date_id primary key(date_id),
constraint fk_week_id foreign key(week_id) references week_dimension(week_id),
constraint fk_month_id foreign key(month_id) references month_dimension(month_id),
constraint fk_quarter_id foreign key(quarter_id) references quarter_dimension(quarter_id),
)

INSERT INTO date_dimension (date, day, week_id, month_id, quarter_id, year) VALUES
('2024-01-15', 'Monday', 1, 1, 1, '2024'),
('2024-04-20', 'Saturday', 6, 4, 2, '2024'),
('2024-07-10', 'Wednesday', 3, 7, 3, '2024'),
('2024-10-05', 'Friday', 5, 10, 4, '2024'),
('2025-02-28', 'Thursday', 4, 2, 1, '2025');


create table sales_fact_table(
fact_id int primary key,
order_id int,
product_id int,
customer_id int,
date int,
quantity int,
price int,
constraint fk_order_id foreign key(order_id) references order_dimension(order_id),
constraint fk_product_id foreign key(product_id) references product_dimension(product_id),
constraint fk_customer_id foreign key(customer_id) references customer_dimension(customer_id),
constraint fk_date_id foreign key(date) references date_dimension(date_id),
)

INSERT INTO sales_fact_table (fact_id, order_id, product_id, customer_id, date, quantity, price) VALUES
(1, 1, 1, 1, 1, 2, 1500.00),
(2, 2, 3, 2, 2, 1, 200.75),
(3, 3, 5, 3, 3, 4, 899.99),
(4, 4, 2, 4, 4, 3, 1200.50),
(5, 5, 4, 5, 5, 1, 450.25);
