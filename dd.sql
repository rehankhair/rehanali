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