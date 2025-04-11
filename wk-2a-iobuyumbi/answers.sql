-- Retrieve the check number, payment date, and amount from the payments table
SELECT checkNumber, paymentDate, amount 
FROM payments;

-- Retrieve order date, required date, and status from the orders table 
-- Only include orders that are 'In Process'
-- Sort the results by orderDate in descending order
SELECT orderDate, requiredDate, status 
FROM orders 
WHERE status = 'In Process' 
ORDER BY orderDate DESC;

-- Retrieve first name, last name, and email of employees whose job title is 'Sales Rep'
-- Sort the results by employeeNumber in descending order
SELECT firstName, lastName, email 
FROM employees 
WHERE jobTitle = 'Sales Rep' 
ORDER BY employeeNumber DESC;

-- Retrieve all columns and records from the offices table
SELECT * FROM offices;

-- Retrieve product name and quantity in stock from the products table
-- Sort by buyPrice in ascending order
-- Limit the output to 5 records
SELECT productName, quantityInStock 
FROM products 
ORDER BY buyPrice ASC 
LIMIT 5;
