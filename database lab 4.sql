CREATE TABLE Employees (
    employeeID INT AUTO_INCREMENT PRIMARY KEY,
    firstName VARCHAR(255) NOT NULL,
    lastName VARCHAR(255) NOT NULL,
    birthCity VARCHAR(255),
    hiringDate DATE,
    deptID INT,
    jobID VARCHAR(255),
    FOREIGN KEY (deptID) REFERENCES Departments(deptID),
    FOREIGN KEY (jobID) REFERENCES Jobs(jobID)
);
CREATE TABLE Departments (
    deptID INT AUTO_INCREMENT PRIMARY KEY,
    deptName VARCHAR(255) NOT NULL,
    locationID INT,
    FOREIGN KEY (locationID) REFERENCES Locations(locationID)
);
CREATE TABLE Jobs (
    jobID VARCHAR(255) PRIMARY KEY,
    jobTitle VARCHAR(255),
    salary DECIMAL(10,2)
);
CREATE TABLE Locations (
    locationID INT AUTO_INCREMENT PRIMARY KEY,
    city VARCHAR(255),
    country VARCHAR(255)
);
INSERT INTO Locations (city, country) VALUES 
('Islamabad', 'Pakistan'),
('Karachi', 'Pakistan'),
('London', 'United Kingdom'),
('New York', 'United States'),
('Dubai', 'United Arab Emirates');
INSERT INTO Departments (deptName, locationID) VALUES 
('Engineering', 1),
('Management', 1),
('Marketing', 1),
('Sales', 2),
('Finance', 3),
('Human Resources', 4);
INSERT INTO Jobs (jobID, jobTitle, salary) VALUES
('ENG101', 'Software Engineer', 60000.00),
('ENG102', 'Data Engineer', 70000.00),
('MAN201', 'Project Manager', 80000.00),
('MAN202', 'Team Lead', 90000.00),
('MKT301', 'Marketing Manager', 50000.00),
('MKT302', 'Social Media Specialist', 40000.00);
INSERT INTO Employees (firstName, lastName, birthCity, hiringDate, deptID, jobID) VALUES
('John', 'Doe', 'New York', '2022-01-15', 1, 'ENG101'),
('Jane', 'Smith', 'London', '2021-08-20', 2, 'MAN201'),
('Peter', 'Jones', 'Islamabad', '2023-03-10', 3, 'MKT301'),
('Mary', 'Brown', 'Karachi', '2022-05-05', 4, 'ENG102'),
('David', 'Wilson', 'Dubai', '2021-11-12', 5, 'MAN202'),
('Sarah', 'Williams', 'London', '2022-09-28', 6, 'MKT302');
-- Delete location with locationID = 5
DELETE FROM Locations WHERE locationID = 5;

-- Delete all departments associated with the deleted location (locationID = 5)
DELETE FROM Departments WHERE locationID = 5;
ALTER TABLE Employees MODIFY firstName VARCHAR(255) NOT NULL;
ALTER TABLE Employees MODIFY lastName VARCHAR(255) NOT NULL;
ALTER TABLE Departments MODIFY deptName VARCHAR(255) NOT NULL;