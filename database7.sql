create database lab8task;
use lab8task;
-- a) Using the IN operator
SELECT department_name
FROM department
WHERE department_id IN (
    SELECT department_id
    FROM employee
    GROUP BY department_id
    HAVING AVG(salary) < (SELECT AVG(salary) FROM employee)
);

-- b) Using the ANY operator
SELECT department_name
FROM department
WHERE department_id = ANY (
    SELECT department_id
    FROM employee
    GROUP BY department_id
    HAVING AVG(salary) < (SELECT AVG(salary) FROM employee)
);

-- c) Display first_name, id and salary of all employees who earn more than "Shazia Sidiqui"
SELECT first_name, employee_id, salary
FROM employee
WHERE salary > (SELECT salary FROM employee WHERE last_name = 'Sidiqui' AND first_name = 'Shazia');

-- d) Using the ALL operator, display list of all employees whose id 6 or 9
SELECT *
FROM employee
WHERE employee_id = ALL (SELECT 6 UNION ALL SELECT 9);

