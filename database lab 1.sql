-- 1. database lab 1
CREATE TABLE Book (
    Title VARCHAR(255),
    Publisher VARCHAR(255),
    ISBN VARCHAR(20)
);

CREATE TABLE Author (
    Author_ID INT AUTO_INCREMENT PRIMARY KEY,
    Author_Name VARCHAR(255),
    Book_ID INT,
    FOREIGN KEY (Book_ID) REFERENCES Book(ISBN)
);

-- 2. Show the structure of created tables.
DESCRIBE Book;
DESCRIBE Author;

-- 3. Insert rows/tuples into the first table using column names.
INSERT INTO Book (Title, Publisher, ISBN) VALUES
('An Introduction to Database Systems', 'Addison Wesley', '0-201-14201-5'),
('Transaction Processing: Concepts and Techniques', 'Morgan Kaufmann', '1-55860-190-2'),
('Fundamentals of Database Systems', 'Benjamin/Cummings', '0-8053-1748-1'),
('Relational Database Writings, 1991-1994', 'Addison-Wesley', '0-201-82459-0');

-- 4. Insert rows/tuples into the second table without using column name.
INSERT INTO Author VALUES
(1, 'Author 1', '0-201-14201-5'),
(2, 'Author 2', '1-55860-190-2'),
(3, 'Author 3', '0-8053-1748-1'),
(4, 'Author 4', '0-201-82459-0');

-- 5. Show records with a separate query for each table.
SELECT * FROM Book;
SELECT * FROM Author;

-- 6. Add column email into “Author” table.
ALTER TABLE Author
ADD COLUMN Email VARCHAR(255);

-- 7. Alter the data type of any two columns from any table.
ALTER TABLE Book
MODIFY Title TEXT,
MODIFY Publisher TEXT;

-- 8. Truncate the first table data.
TRUNCATE TABLE Book;

-- 9. Delete the first record of the second table.
DELETE FROM Author WHERE Author_ID = 1;

-- 10. Update the second record of the second table.
UPDATE Author SET Author_Name = 'Updated Author 2' WHERE Author_ID = 2;