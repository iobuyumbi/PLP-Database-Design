-- Query to show the total payment amount for each payment date
SELECT payment_date, SUM(amount) AS total_payment
FROM payments
GROUP BY payment_date
ORDER BY payment_date DESC
LIMIT 5;

-- Query to find the average credit limit of each customer
SELECT customer_name, country, AVG(credit_limit) AS average_credit_limit
FROM customers
GROUP BY customer_name, country;


-- Query to find the total price of products ordered
SELECT product_code, quantity_ordered, SUM(price_each * quantity_ordered) AS total_price
FROM orderdetails
GROUP BY product_code, quantity_ordered;


-- Query to find the highest payment amount for each check number
SELECT check_number, MAX(amount) AS highest_payment
FROM payments   
GROUP BY check_number;
