create database lab7task1;
use lab7task1;
CREATE TABLE StudentCourses (
  Sid INT,
  Roll_No VARCHAR(10),
  Name VARCHAR(50),
  Courses VARCHAR(50),
  Grade VARCHAR(2),
  Marks FLOAT
);
INSERT INTO StudentCourses (Sid, Roll_No, Name, Courses, Grade, Marks)
VALUES
  (1, 'R001', 'rehan khair', 'Math', 'A', 85.5),
  (2, 'R002', 'zeeshan', 'Science', 'B', 78.2),
  (3, 'R003', 'ayad', 'History', 'C', 65.1),
  (4, 'R004', 'daniyal', 'English', 'A', 92.8),
  (5, 'R005', 'hassan', 'Physics', 'B', 88.5);
  
SELECT Sid, Roll_No, Name, Courses, Grade, CONVERT(Marks, CHAR) AS Marks
FROM StudentCourses;
ALTER TABLE StudentCourses
MODIFY COLUMN Grade ENUM('A', 'B', 'C', 'D', 'F');
CREATE TEMPORARY TABLE StudentInfo (
  Name VARCHAR(50),
  Courses VARCHAR(50),
  Marks FLOAT
);
DESCRIBE StudentInfo;
SELECT *
FROM StudentCourses
WHERE Marks > 70;
CREATE TABLE StudentCourses_Clone LIKE StudentCourses;
DESCRIBE StudentCourses_Clone;
INSERT INTO StudentCourses_Clone
SELECT *
FROM StudentCourses;
SELECT *
FROM StudentCourses_Clone;