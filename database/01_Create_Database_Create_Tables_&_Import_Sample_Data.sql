-- ============================================================
-- PEDALPOINT BIKE RENTALS DATABASE
-- ============================================================

-- 1.0 CREATE DATABASE
CREATE DATABASE IF NOT EXISTS pedalpoint_bike_rentals;

-- "IF NOT EXISTS" ensures the query does not try to create a second 
-- database when ran more than once, an action that will return an error.

USE pedalpoint_bike_rentals;

-- 1.1 RESET DATA:
-- Uncomment this section when rerunning the script during development,
-- so the tables can be dropped first and recreated later as the queries run.
-- Uncomment by deleting these: [/*] [*/]

/*
SET FOREIGN_KEY_CHECKS = 0;	-- Disable foreign-key checks to allow dependent tables to be dropped safely.

DROP TABLE IF EXISTS rentals;
DROP TABLE IF EXISTS bikes;
DROP TABLE IF EXISTS customers;

SET FOREIGN_KEY_CHECKS = 1;	-- Re-enable foreign-key checks to enforce referential integrity.
*/

-- 2.0 CREATE TABLES
-- Create three tables as follows: Bikes, Customers, Rentals
-- Run child tables first (follow the given order) so foreign-key constraints are respected,
-- as foreign-key relationships depend on the parent records.

-- 2.1 Bikes: Stores information about bikes available for rental.
CREATE TABLE bikes (
    bike_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,	-- UNSIGNED prevents negative values
    brand VARCHAR(100) NOT NULL,
    bike_type VARCHAR(50) NOT NULL,
    daily_rate DECIMAL(10, 2) NOT NULL,
    availability_status ENUM('available', 'rented', 'undergoing maintenance') 
        NOT NULL DEFAULT 'available',
    CONSTRAINT chk_bikes_daily_rental_rate
        CHECK (daily_rate >= 0)	-- Prevents negative rental rates
);

-- 2.2 Customers: Stores customer demographic and contact information.
CREATE TABLE customers (
    customer_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(150) NOT NULL,
    email_address VARCHAR(255) NOT NULL UNIQUE,
    date_of_birth DATE NOT NULL
);

-- 2.3 Rentals: Records each bike rental transaction.
CREATE TABLE rentals (
    rental_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    bike_id INT UNSIGNED NOT NULL,
    customer_id INT UNSIGNED NOT NULL,
    start_date DATE NOT NULL,
    expected_return_date DATE NOT NULL,
    actual_return_date DATE,
    total_amount_charged DECIMAL(10, 2) NOT NULL,

    FOREIGN KEY (bike_id) REFERENCES bikes (bike_id),
    FOREIGN KEY (customer_id) REFERENCES customers (customer_id),
    
	-- Apply the following constraints to ensure data integrity
    CHECK (expected_return_date >= start_date),
    CHECK (actual_return_date IS NULL OR actual_return_date >= start_date),
    CHECK (total_amount_charged >= 0)
);

-- 3.0 SHOW THE TABLES CREATED
SHOW TABLES;

-- 4.0 SHOW THE RELATIONSHIOP BETWEEN THE TABLES
SELECT
    TABLE_NAME,
    COLUMN_NAME,
    CONSTRAINT_NAME,
    REFERENCED_TABLE_NAME,
    REFERENCED_COLUMN_NAME
FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE
WHERE TABLE_SCHEMA = 'bike_rental_shop'
  AND REFERENCED_TABLE_NAME IS NOT NULL
ORDER BY TABLE_NAME, COLUMN_NAME;

-- ============================================================
-- Import Data
-- ============================================================

-- Use the Table Data Import Wizard in MySQL Workbench to import the data or sample data

-- View the sample bike data
SELECT *
FROM bikes;