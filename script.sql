
START TRANSACTION;

DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS books;
DROP TABLE IF EXISTS authors;


CREATE TABLE authors (
    author_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    country VARCHAR(50)
);


CREATE TABLE books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    price DECIMAL(5, 2) NOT NULL,
    author_id INT,
    CONSTRAINT fk_author FOREIGN KEY (author_id) REFERENCES authors(author_id)
);


CREATE TABLE orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    order_date DATE NOT NULL,
    book_id INT,
    CONSTRAINT fk_book FOREIGN KEY (book_id) REFERENCES books(book_id)
);


INSERT INTO authors (first_name, last_name, country) VALUES 
('Andy', 'Weir', 'United States'),
('Freida', 'McFadden', 'United States');


INSERT INTO books (title, price, author_id) VALUES 
('Project Hail Mary', 19.99, 1),
('The Housemaid', 14.99, 2);


INSERT INTO orders (customer_name, order_date, book_id) VALUES 
('Jane Doe', '2026-10-18', 1),
('John Smith', '2026-10-18', 2);


COMMIT;

SELECT * FROM authors;
SELECT * FROM books;
SELECT * FROM orders;