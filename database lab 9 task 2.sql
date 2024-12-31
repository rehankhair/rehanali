create database lab9task2;
use lab9task2;
UPDATE students
SET Overloaded = 
    CASE 
        WHEN (SELECT COUNT(*) FROM enrollments WHERE enrollments.student_id = students.student_id) > 3 THEN 'Y'
        ELSE 'N'
    END;
    DELETE FROM departments
WHERE department_id IN (
    SELECT department_id
    FROM students
    GROUP BY department_id
    HAVING COUNT(*) < 5
);
SELECT s.name, s.GPA, d.department_name
FROM students s
JOIN departments d ON s.department_id = d.department_id
WHERE s.GPA < (
    SELECT MIN(avg_gpa)
    FROM (
        SELECT department_id, AVG(GPA) AS avg_gpa
        FROM students
        GROUP BY department_id
    ) AS avg_gpas
);