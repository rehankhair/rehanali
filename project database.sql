CREATE DATABASE real_estate_management;
USE real_estate_management;
CREATE TABLE users (
  id INT AUTO_INCREMENT,
  username VARCHAR(255) NOT NULL,
  email VARCHAR(255) NOT NULL,
  password VARCHAR(255) NOT NULL,
  role ENUM('admin', 'agent', 'customer') NOT NULL,
  PRIMARY KEY (id)
);
CREATE TABLE properties (
  id INT AUTO_INCREMENT,
  title VARCHAR(255) NOT NULL,
  description TEXT NOT NULL,
  price DECIMAL(10, 2) NOT NULL,
  location VARCHAR(255) NOT NULL,
  type ENUM('residential', 'commercial') NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE property_images (
  id INT AUTO_INCREMENT,
  property_id INT NOT NULL,
  image_url VARCHAR(255) NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (property_id) REFERENCES properties (id)
);

CREATE TABLE agents (
  id INT AUTO_INCREMENT,
  user_id INT NOT NULL,
  name VARCHAR(255) NOT NULL,
  phone VARCHAR(20) NOT NULL,
  email VARCHAR(255) NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (user_id) REFERENCES users (id)
);

CREATE TABLE customers (
  id INT AUTO_INCREMENT,
  user_id INT NOT NULL,
  name VARCHAR(255) NOT NULL,
  phone VARCHAR(20) NOT NULL,
  email VARCHAR(255) NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (user_id) REFERENCES users (id)
);

CREATE TABLE bookings (
  id INT AUTO_INCREMENT,
  property_id INT NOT NULL,
  customer_id INT NOT NULL,
  booking_date DATE NOT NULL,
  check_in DATE NOT NULL,
  check_out DATE NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (property_id) REFERENCES properties (id),
  FOREIGN KEY (customer_id) REFERENCES customers (id)
);

CREATE TABLE payments (
  id INT AUTO_INCREMENT,
  booking_id INT NOT NULL,
  payment_date DATE NOT NULL,
  amount DECIMAL(10, 2) NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (booking_id) REFERENCES bookings (id)
);

INSERT INTO users (username, email, password, role)
VALUES
('admin', 'admin@example.com', 'password123', 'admin'),
('agent', 'agent@example.com', 'password123', 'agent'),
('customer', 'customer@example.com', 'password123', 'customer');

-- Insert data into properties table
INSERT INTO properties (title, description, price, location, type)
VALUES
('Beautiful House', 'This is a beautiful house with 3 bedrooms and 2 bathrooms.', 500000.00, 'New York', 'residential'),
('Office Space', 'This is an office space with 5 rooms and 2 bathrooms.', 1000000.00, 'Los Angeles', 'commercial');

-- Insert data into property_images table
INSERT INTO property_images (property_id, image_url)
VALUES
(1, 'https://example.com/image1.jpg'),
(1, 'https://example.com/image2.jpg'),
(2, 'https://example.com/image3.jpg');

-- Insert data into agents table
INSERT INTO agents (user_id, name, phone, email)
VALUES
(2, 'John Doe', '123-456-7890', 'john.doe@example.com');

-- Insert data into customers table
INSERT INTO customers (user_id, name, phone, email)
VALUES
(3, 'Jane Doe', '987-654-3210', 'jane.doe@example.com');

-- Insert data into bookings table
INSERT INTO bookings (property_id, customer_id, booking_date, check_in, check_out)
VALUES
(1, 1, '2022-01-01', '2022-01-05', '2022-01-10');

-- Insert data into payments table
INSERT INTO payments (booking_id, payment_date, amount)
VALUES
(1, '2022-01-01', 50000.00);
SELECT p.*, pi.image_url
FROM properties p
JOIN property_images pi ON p.id = pi.property_id;
SELECT b.*
FROM bookings b
JOIN customers c ON b.customer_id = c.id
WHERE c.id = 1;
SELECT p.*
FROM payments p
JOIN bookings b ON p.booking_id = b.id
WHERE b.id = 1;