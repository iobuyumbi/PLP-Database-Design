
CREATE TABLE student (
    id INT PRIMARY KEY,
    fullName VARCHAR(100),
    age INT,
);


INSERT INTO student (id, fullName, age) VALUES
(1, 'John Doe', 20),
(2, 'Jane Smith', 22),
(3, 'Alice Johnson', 19),
(4, 'Bob Brown', 21);


UPDATE student
SET age = 20
WHERE id = 2;

