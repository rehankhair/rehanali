-- Create the Employees table
CREATE TABLE Employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(255),
    designation VARCHAR(255),
    birth_date DATE,
    hire_date DATE,
    department VARCHAR(255),
    salary DECIMAL(10, 2),
    city VARCHAR(255)
);

-- Insert employee data
INSERT INTO Employees (employee_id, employee_name, designation, birth_date, hire_date, department, salary, city) VALUES
    (1, 'John Smith', 'Manager', '1985-07-15', '2015-01-10', 'Sales', 50000.00, 'Karachi'),
    (2, 'Jane Doe', 'Auditor', '1988-04-22', '2017-03-05', 'Finance', 35000.00, 'Lahore'),
    (3, 'David Lee', 'Software Engineer', '1992-11-08', '2018-06-20', 'IT', 40000.00, 'Islamabad'),
    (4, 'Emily Brown', 'Marketing Manager', '1990-02-18', '2016-08-15', 'Marketing', 45000.00, 'Karachi'),
    (5, 'Robert Jones', 'Data Analyst', '1987-09-03', '2015-12-28', 'Analytics', 38000.00, 'Faisalabad');

-- Show the table structure
DESCRIBE Employees;

-- Display employee names, salaries, and departments
SELECT employee_name, salary, department FROM Employees;

-- Display employee details sorted by hiring date
SELECT employee_name, designation, hire_date FROM Employees ORDER BY hire_date ASC;

-- Display distinct departments
SELECT DISTINCT department FROM Employees;

-- List employees with salary > 30,000 hired in 2015
SELECT employee_name, salary, hire_date FROM Employees WHERE salary > 30000 AND YEAR(hire_date) = 2015;

-- List cities with 'a' or 'e' at the 4th position
SELECT DISTINCT city FROM Employees WHERE SUBSTRING(city, 4, 1) IN ('a', 'e');

-- List departments with employees hired between January 2017 and August 2018
SELECT DISTINCT department FROM Employees WHERE hire_date BETWEEN '2017-01-01' AND '2018-08-31' ORDER BY hire_date DESC, salary ASC;

-- List employees who are Managers in Karachi
SELECT employee_name FROM Employees WHERE designation = 'Manager' AND city = 'Karachi';

-- Display Managers and Auditors with salaries and 10% increment
SELECT employee_name, salary, salary * 1.10 AS Bonus, salary * 1.10 AS 'New Salary' FROM Employees WHERE designation IN ('Manager', 'Auditor');