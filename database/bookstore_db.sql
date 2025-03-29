


-- This is for books 

CREATE TABLE books (
    id INT PRIMARY KEY ,
    title VARCHAR(255),
    author VARCHAR(255),
    price DECIMAL(10,2) NOT NULL CHECK (price >= 0),
    stock INT NOT NULL CHECK (stock >= 0),
    published_year INT
);


-- this is for order 
CREATE TABLE customers (
    id INT PRIMARY KEY ,
    name VARCHAR(255) ,
    email VARCHAR(255)  UNIQUE,
    joined_date DATE  DEFAULT CURRENT_DATE
);

-- This is for customers
INSERT INTO customers (id, name, email, joined_date) VALUES
(1, 'John Doe', 'john.doe@example.com', '2025-03-20'),
(2, 'Jane Smith', 'jane.smith@example.com', '2025-03-21'),
(3, 'Alice Johnson', 'alice.johnson@example.com', '2025-03-22'),
(4, 'Bob Brown', 'bob.brown@example.com', '2025-03-23'),
(5, 'Charlie Davis', 'charlie.davis@example.com', '2025-03-24'),
(6, 'Emily Wilson', 'emily.wilson@example.com', '2025-03-25');


-- This is for books Data
INSERT INTO books (id,title, author, price, stock, published_year) 
VALUES (2, 'The Pragmatic Programmer','Andrew Hunt', 40.00, 10,1999);

-- This is for order 
CREATE TABLE orders (
    id INT PRIMARY KEY ,
    customer_id INT,
    book_id INT,
    quantity INT NOT NULL CHECK (quantity > 0),
    order_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (customer_id) REFERENCES customers(id),
    FOREIGN KEY (book_id) REFERENCES books(id)
);



-- To view Customers
SELECT * from customers


-- 1 Books Price

SELECT SUM(price) as total_revenue
 FROM books 

-- 2 Max price of Book
SELECT * FROM books
   WHERE price = (SELECT MAX(price) from books )


-- average book price
SELECT AVG(price) as avg_book_price from books;



-- two done
SELECT c.name, SUM(o.quantity) AS total_orders 
FROM customers c
JOIN orders o ON c.id = o.customer_id
GROUP BY c.id, c.name;

--   20% discound
UPDATE books
SET price = price * 1.10
WHERE published_year < 2000;

SELECT * FROM books


------- This is for Join two table--------
INSERT INTO orders (id, customer_id, book_id, quantity, order_date) VALUES
(1, 2, 1, 2, '2025-03-20 10:15:00');

SELECT* FROM orders



-- deleted email DELETE FROM customers
WHERE id NOT IN (SELECT DISTINCT customer_id FROM orders);



