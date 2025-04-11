-- Database: bookstore

-- Step 1: Create the database
CREATE DATABASE bookstore;

-- Step 2: Use the database
USE bookstore;

-- Step 3: Create tables

-- Table: authors
CREATE TABLE authors (
    author_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    bio TEXT,
    birth_date DATE
);

-- Table: books
CREATE TABLE books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    author_id INT NOT NULL,
    genre VARCHAR(100),
    price DECIMAL(10, 2) NOT NULL,
    published_date DATE,
    FOREIGN KEY (author_id) REFERENCES authors(author_id)
);

-- Table: customers
CREATE TABLE customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    phone_number VARCHAR(15),
    address TEXT
);

-- Table: orders
CREATE TABLE orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    order_date DATE NOT NULL,
    total_amount DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- Table: order_details
CREATE TABLE order_details (
    order_detail_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    book_id INT NOT NULL,
    quantity INT NOT NULL,
    subtotal DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (book_id) REFERENCES books(book_id)
);

-- Step 4: Insert sample data

-- Insert into authors
INSERT INTO authors (name, bio, birth_date)
VALUES
('F. Scott Fitzgerald', 'American novelist widely regarded as one of the greatest of the 20th century.', '1896-09-24'),
('George Orwell', 'English novelist, essayist, journalist, and critic.', '1903-06-25'),
('Harper Lee', 'American novelist best known for her 1960 novel To Kill a Mockingbird.', '1926-04-28');

-- Insert into books
INSERT INTO books (title, author_id, genre, price, published_date)
VALUES
('The Great Gatsby', 1, 'Fiction', 10.99, '1925-04-10'),
('1984', 2, 'Dystopian', 8.99, '1949-06-08'),
('To Kill a Mockingbird', 3, 'Fiction', 12.99, '1960-07-11');

-- Insert into customers
INSERT INTO customers (first_name, last_name, email, phone_number, address)
VALUES
('John', 'Doe', 'john.doe@example.com', '1234567890', '123 Elm Street'),
('Jane', 'Smith', 'jane.smith@example.com', '0987654321', '456 Oak Avenue');

-- Insert into orders
INSERT INTO orders (customer_id, order_date, total_amount)
VALUES
(1, '2023-10-01', 21.98),
(2, '2023-10-02', 12.99);

-- Insert into order_details
INSERT INTO order_details (order_id, book_id, quantity, subtotal)
VALUES
(1, 1, 1, 10.99),
(1, 2, 1, 10.99),
(2, 3, 1, 12.99);

-- Step 5: Create a user and grant privileges
CREATE USER 'bookstore_admin'@'localhost' IDENTIFIED BY 'securepassword';
GRANT ALL PRIVILEGES ON bookstore.* TO 'bookstore_admin'@'localhost';
-- Step 6: Create additional users and grant privileges

-- Create user for Innocent Obuyumbi Nyongesa
CREATE USER 'innocent'@'localhost' IDENTIFIED BY 'securepass1';
GRANT SELECT, INSERT, UPDATE ON bookstore.* TO 'innocent'@'localhost';

-- Create user for Mohamed Bashir
CREATE USER 'mohamed'@'localhost' IDENTIFIED BY 'securepass2';
GRANT SELECT, INSERT ON bookstore.* TO 'mohamed'@'localhost';

-- Create user for Lindiwe
CREATE USER 'lindiwe'@'localhost' IDENTIFIED BY 'securepass3';
GRANT SELECT ON bookstore.* TO 'lindiwe'@'localhost';

-- Apply changes
FLUSH PRIVILEGES;

