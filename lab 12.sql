create database lab12task1;
use lab12task1;
CREATE TRIGGER log_new_department
AFTER INSERT ON departments
FOR EACH ROW
BEGIN
    INSERT INTO department_log (username, created_at, department_name)
    VALUES (CURRENT_USER(), NOW(), NEW.department_name);
END;
CREATE TABLE department_log (
    id INT AUTO_INCREMENT,
    username VARCHAR(50),
    created_at TIMESTAMP,
    department_name VARCHAR(100),
    PRIMARY KEY (id)
);