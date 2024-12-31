create database lab11task;
use lab11task;
DELIMITER //
CREATE PROCEDURE display_student_status(IN student_gpa DECIMAL(3,2))
BEGIN
    IF student_gpa >= 2.5 THEN
        SELECT 'Passed' AS Status;
    ELSE
        SELECT 'Failed' AS Status;
    END IF;
END//
DELIMITER ;
DELIMITER //
CREATE PROCEDURE display_student(IN student_gpa DECIMAL(3,2))
BEGIN
    SELECT CASE
        WHEN student_gpa >= 2.5 THEN 'Passed'
        ELSE 'Failed'
    END AS Status;
END//
DELIMITER ;
CALL display_student_status(3.2);  -- Output: Passed
CALL display_student_status(2.1);  -- Output: Failed