ALTER TABLE Employees
DROP COLUMN employee_name;

-- Show table structure
DESCRIBE Employees;
ALTER TABLE Employees
ADD COLUMN first_name VARCHAR(255) AFTER employee_id;

ALTER TABLE Employees
ADD COLUMN last_name VARCHAR(255) AFTER first_name;

-- Show table structure
DESCRIBE Employees;
SELECT CONCAT(first_name, ' ', last_name, ', ', designation, ', ', department) AS "Full Name, Designation, Department"
FROM Employees;
SELECT COUNT(*) AS "Number of Employees"
FROM Employees;
SELECT COUNT(*) AS "Number of Managers"
FROM Employees
WHERE designation = 'Manager';
SELECT designation, COUNT(*) AS "Number of Employees"
FROM Employees
GROUP BY designation;
SELECT designation, AVG(salary) AS "Average Salary"
FROM Employees
GROUP BY designation;
SELECT department, MAX(salary) AS "Maximum Salary", MIN(salary) AS "Minimum Salary"
FROM Employees
GROUP BY department;
SELECT department, COUNT(*) AS "Number of Employees Over 10 Years"
FROM Employees
WHERE DATEDIFF(CURRENT_DATE, joining_date) > 3650 
 -- Assumes joining_date is a date column
GROUP BY department;
SELECT department, SUM(salary) AS "Total Salary Expense"
FROM Employees
GROUP BY department
ORDER BY "Total Salary Expense" DESC;
SELECT city, department, COUNT(*) AS "Number of Employees"
FROM Employees
GROUP BY city, department;
SELECT city, department, TRUNCATE(AVG(salary), 2) AS "Average Salary"
FROM Employees
GROUP BY city, department
HAVING AVG(salary) >= 80000;