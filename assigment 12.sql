create database assigment12;
use assigment12;
CREATE TABLE student_log (
  id INT AUTO_INCREMENT,
  student_id INT,
  action VARCHAR(10),
  log_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id)
);
DELIMITER //
CREATE TRIGGER log_new_student
AFTER INSERT ON student
FOR EACH ROW
BEGIN
  INSERT INTO student_log (student_id, action)
  VALUES (NEW.id, 'INSERT');
END//
DELIMITER ;