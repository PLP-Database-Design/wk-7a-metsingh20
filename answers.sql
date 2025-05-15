/* Question 1 
Write an SQL query to get the firstName, lastName, email, and officeCode of all employees.
Use an INNER JOIN to combine the employees table with the offices table using the officeCode column.*/
SELECT 
    OrderID, 
    CustomerName,
    LTRIM(RTRIM(value)) AS Product
FROM ProductDetail
CROSS APPLY STRING_SPLIT(Products, ',')
ORDER BY OrderID;


/* Question 2 
Write an SQL query to get the productName, productVendor, and productLine from the products table.
Use a LEFT JOIN to combine the products table with the productlines table using the productLine column.*/
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(100)
);

INSERT INTO Orders (OrderID, CustomerName)
SELECT DISTINCT OrderID, CustomerName
FROM OrderDetails;

CREATE TABLE OrderDetailsNormalized (
    OrderID INT,
    Product VARCHAR(100),
    Quantity INT,
    PRIMARY KEY (OrderID, Product),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

INSERT INTO OrderDetailsNormalized (OrderID, Product, Quantity)
SELECT OrderID, Product, Quantity
FROM OrderDetails;


/* Question 3 
Write an SQL query to retrieve the orderDate, shippedDate, status, and customerNumber for the first 10 orders.
Use a RIGHT JOIN to combine the customers table with the orders table using the customerNumber column.*/
SELECT 
    o.orderDate, 
    o.shippedDate, 
    o.status, 
    o.customerNumber
FROM customers c
RIGHT JOIN orders o ON c.customerNumber = o.customerNumber
ORDER BY o.orderDate -- or o.orderNumber if available
LIMIT 10;  -- For MySQL, PostgreSQL
