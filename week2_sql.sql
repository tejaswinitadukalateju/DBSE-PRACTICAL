CREATE DATABASE IF NOT EXISTS book_db;
USE book_db;
CREATE TABLE book (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    isbn VARCHAR(13) NOT NULL UNIQUE,
    published_year INT,
CONSTRAINT chk_book_published_year CHECK (published_year < 2027)
);
INSERT INTO book (book_id, title, isbn, published_year) VALUES
(1, 'The Great Gatsby', '9780743273565', 1925),
(2, 'To Kill a Mockingbird', '9780061120084', 1960),
(3, '1984', '9780451524935', 1949);
SELECT * FROM Books;
CREATE TABLE Membrs (
    member_id INT PRIMARY KEY,
    full_name VARCHAR(100),
    email VARCHAR(100) UNIQUE
);
INSERT INTO Membrs (member_id, full_name, email) VALUES
(201, 'Amulya', 'amulya@email.com'),
(202, 'Alluru', 'alluru@email.com'),
(103, 'Ammu', 'ammu@email.com');
SELECT * FROM Membrs;
CREATE TABLE Loans (
    loan_id INT PRIMARY KEY,
    member_id INT,
    book_id INT,
    loan_date DATE,
    FOREIGN KEY (member_id) REFERENCES Members(member_id),
    FOREIGN KEY (book_id) REFERENCES Books(book_id)
);
UPDATE Membrs
SET member_id = 101
WHERE member_id = 201;

UPDATE Membrs
SET member_id = 102
WHERE member_id = 202;
SELECT * FROM Membrs;
INSERT INTO Loans (loan_id, member_id, book_id, loan_date) VALUES
(1, 101, 1, '2025-01-05'),
(2, 102, 2, '2025-01-08'),
(3, 103, 3, '2025-01-10'),
(4, 101, 2, '2025-02-01'),
(5, 102, 1, '2025-02-05'),
(6, 103, 2, '2025-02-12'),
(7, 101, 3, '2025-03-01'),
(8, 102, 3, '2025-03-07'),
(9, 103, 1, '2025-03-15'),
(10, 101, 1, '2025-04-01');
UPDATE Membrs
SET member_id = 101
WHERE member_id = 201;
SELECT * FROM Membrs;
SELECT * FROM Books;
SELECT * FROM Loans;
SELECT * FROM Membrs;
SELECT * FROM Books;
INSERT INTO Loans (loan_id, member_id, book_id, loan_date) VALUES
(1, 101, 1, '2025-01-05'),
(2, 102, 2, '2025-01-08'),
(3, 103, 3, '2025-01-10'),
(4, 101, 2, '2025-02-01'),
(5, 102, 1, '2025-02-05'),
(6, 103, 2, '2025-02-12'),
(7, 101, 3, '2025-03-01'),
(8, 102, 3, '2025-03-07'),
(9, 103, 1, '2025-03-15'),
(10, 101, 1, '2025-04-01');
SELECT * FROM Loans;
SHOW CREATE TABLE Loans;
SELECT member_id FROM Membrs;
SELECT book_id FROM Books;
SHOW ENGINE INNODB STATUS;
SELECT * FROM Members;
SELECT * FROM Membrs;
DROP TABLE Loans;
CREATE TABLE Loans (
    loan_id INT PRIMARY KEY,
    member_id INT,
    book_id INT,
    loan_date DATE,
    FOREIGN KEY (member_id) REFERENCES Membrs(member_id),
    FOREIGN KEY (book_id) REFERENCES Books(book_id)
);
INSERT INTO Loans (loan_id, member_id, book_id, loan_date) VALUES
(1, 101, 1, '2025-01-05'),
(2, 102, 2, '2025-01-08'),
(3, 103, 3, '2025-01-10'),
(4, 101, 2, '2025-02-01'),
(5, 102, 1, '2025-02-05'),
(6, 103, 2, '2025-02-12'),
(7, 101, 3, '2025-03-01'),
(8, 102, 3, '2025-03-07'),
(9, 103, 1, '2025-03-15'),
(10, 101, 1, '2025-04-01');
SELECT * FROM Loans;
SELECT m.full_name AS Member_Name, b.title AS Book_Title
FROM Loans l
INNER JOIN Membrs m ON l.member_id = m.member_id
INNER JOIN Books b ON l.book_id = b.book_id;
SELECT published_year, COUNT(*) AS total_books
FROM Books
GROUP BY published_year;
CREATE TABLE Donation_History (
    donation_id INT PRIMARY KEY,
    book_id INT,
    donor_name VARCHAR(100),
    donation_date DATE,
    FOREIGN KEY (book_id) REFERENCES Books(book_id)
);
START TRANSACTION;

INSERT INTO Books (book_id, title, isbn, published_year)
VALUES (4, 'Animal Farm', '9780451526342', 1945);

INSERT INTO Donation_History (donation_id, book_id, donor_name, donation_date)
VALUES (1, 4, 'Raj Kumar', CURDATE());

COMMIT;
CREATE INDEX idx_books_isbn
ON Books(isbn);
SELECT *
FROM Books
WHERE isbn = '9780451524935';
UPDATE Books
SET title = '1947',
    isbn = '9780451524935',
    published_year = 2020
WHERE book_id = 3;
SELECT *
FROM Books
WHERE isbn = '9780451524935';

