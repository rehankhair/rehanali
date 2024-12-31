CREATE DATABASE lab11task2;
USE lab11task2;

-- Create the Students table
CREATE TABLE Students (
    StudentID INT,
    Name VARCHAR(50),
    GPA DECIMAL(3,2)
);

-- Insert some sample data into the Students table
INSERT INTO Students (StudentID, Name, GPA)
VALUES
(1, 'John Doe', 3.5),
(2, 'Jane Doe', 2.1),
(3, 'Bob Smith', 3.8),
(4, 'Alice Johnson', 2.9);

DELIMITER //

-- Create the print_table procedure
CREATE PROCEDURE print_table(IN num INT)
BEGIN
    DECLARE i INT;
    SET i = 1;
    WHILE i <= 10 DO
        SELECT CONCAT(num, ' x ', i, ' = ', num * i) AS Table;
        SET i = i + 1;
    END WHILE;
END//

-- Create the display_student_status procedure
CREATE PROCEDURE display_student_status()
BEGIN
    DECLARE student_gpa DECIMAL(3,2);
    DECLARE student_name VARCHAR(50);
    DECLARE student_id INT;
    DECLARE done INT DEFAULT 0;
    DECLARE student_cursor CURSOR FOR SELECT StudentID, Name, GPA FROM Students;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

    OPEN student_cursor;
    read_loop: LOOP
        FETCH student_cursor INTO student_id, student_name, student_gpa;
        IF done THEN
            LEAVE read_loop;
        END IF;

        SELECT CASE
            WHEN student_gpa >= 2.5 THEN 'Passed'
            ELSE 'Failed'
        END AS Status, student_name, student_gpa;
    END LOOP;
    CLOSE student_cursor;
END//

DELIMITER ;

-- Call the procedures
CALL print_table(5);
CALL display_student_status();