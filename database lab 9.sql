create database lab9task1;
use  lab9task1;
-- Create a new database
CREATE DATABASE UniversityDB;

-- Use the newly created database
USE UniversityDB;

-- Create the Students table
CREATE TABLE Students (
  StudentID INT AUTO_INCREMENT,
  FirstName VARCHAR(255),
  LastName VARCHAR(255),
  GPA DECIMAL(3, 2),
  PRIMARY KEY (StudentID)
);
CREATE TABLE University (
  UniversityID INT,
  AverageGPA DECIMAL(3, 2)
);
SELECT 
  s.FirstName, 
  s.LastName, 
  s.GPA, 
  u.AverageGPA
FROM 
  Students s
  CROSS JOIN (
    SELECT 
      AVG(GPA) AS AverageGPA 
    FROM 
      Students
  ) u;
  SELECT 
  FirstName, 
  LastName, 
  GPA, 
  AVG(GPA) OVER () AS AverageGPA
FROM 
  Students;
  SELECT 
  s.FirstName, 
  s.LastName, 
  s.GPA, 
  (
    SELECT 
      AVG(GPA) 
    FROM 
      Students
  ) AS AverageGPA
FROM 
  Students s;
  CREATE TABLE Faculty (
  FacultyID INT,
  Name VARCHAR(255),
  Designation VARCHAR(255),
  DepartmentID INT
);

CREATE TABLE Departments (
  DepartmentID INT,
  DepartmentName VARCHAR(255)
);
SELECT 
  f.Name, 
  f.Designation, 
  (
    SELECT 
      d.DepartmentName 
    FROM 
      Departments d
    WHERE 
      d.DepartmentID = f.DepartmentID
  ) AS DepartmentName
FROM 
  Faculty f;
  SELECT 
  f.Name, 
  f.Designation, 
  d.DepartmentName
FROM 
  Faculty f
  JOIN Departments d ON f.DepartmentID = d.DepartmentID;
  SELECT 
  Name
FROM 
  Students
WHERE 
  FirstName IN (
    SELECT 
      FirstName 
    FROM 
      Students 
    WHERE 
      FirstName LIKE 'M%'
  ) OR LastName IN (
    SELECT 
      LastName 
    FROM 
      Students 
    WHERE 
      LastName LIKE 'A%'
  );
  SELECT 
  Name
FROM 
  Students
WHERE 
  FirstName LIKE 'M%' OR LastName LIKE 'A%';
  CREATE TABLE NewFacultyTable AS
SELECT 
  f.FacultyID, 
  f.Designation, 
  (
    SELECT 
      d.DepartmentName 
    FROM 
      Departments d
    WHERE 
      d.DepartmentID = f.DepartmentID
  ) AS DepartmentName
FROM 
  Faculty f
WHERE 
  f.Designation IN (
    'Associate Professor', 
    'Assistant Professor'
  );
  CREATE TABLE NewFacultyTable AS
SELECT 
  f.FacultyID, 
  f.Designation, 
  d.DepartmentName
FROM 
  Faculty f
  JOIN Departments d ON f.DepartmentID = d.DepartmentID
WHERE 
  f.Designation IN (
    'Associate Professor', 
    'Assistant Professor'
  );