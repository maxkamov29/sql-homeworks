CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    Name VARCHAR(100),
    DepartmentID INT,
    Salary DECIMAL(10,2),
    HireDate DATE,
    ManagerID INT NULL
);

INSERT INTO Employees (EmployeeID, Name, DepartmentID, Salary, HireDate, ManagerID) VALUES
(1, 'Alice Johnson', 1, 75000, '2015-06-15', NULL),
(2, 'Bob Smith', 2, 60000, '2018-03-22', 1),
(3, 'Charlie Brown', 1, 80000, '2012-11-05', NULL),
(4, 'David Williams', 3, 50000, '2020-07-19', 2),
(5, 'Emily Davis', 1, 72000, '2016-09-10', 1),
(6, 'Frank Harris', 2, 59000, '2019-04-25', 2),
(7, 'Grace Lee', 3, 48000, '2021-01-12', 3);

CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(100),
    Location VARCHAR(100)
);

INSERT INTO Departments (DepartmentID, DepartmentName, Location) VALUES
(1, 'IT', 'New York'),
(2, 'HR', 'Chicago'),
(3, 'Finance', 'San Francisco');


CREATE TABLE Orders(
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    TotalAmount DECIMAL(10,2)
);

INSERT INTO Orders (OrderID, CustomerID, OrderDate, TotalAmount) VALUES
(101, 1, '2023-01-15', 250.00),
(102, 2, '2023-02-10', 500.00),
(103, 1, '2023-03-05', 120.00),
(104, 3, '2023-04-20', 800.00),
(105, 2, '2023-05-11', 350.00),
(106, 4, '2023-06-22', 450.00);

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(100)
);

INSERT INTO Customers (CustomerID, CustomerName) VALUES
(1, 'John Doe'),
(2, 'Jane Smith'),
(3, 'Michael Johnson'),
(4, 'Sarah Williams');


-------
select * from Employees  e 
where e.salary in 
(select top 5 salary from Employees order by salary desc)

--------

select d.DepartmentID, d.DepartmentName, dt.Average_salary  from Departments d join 
(select DepartmentID, AVG(Salary) as Average_salary from Employees e group by DepartmentID) as dt
on d.DepartmentID = dt.DepartmentID
