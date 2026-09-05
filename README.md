# PedalPoint Bike Rentals — Database Creation, Table Design & Business Analysis

![Data Analysis](https://img.shields.io/badge/Data%20Analysis-blue)
![Database Design](https://img.shields.io/badge/Database%20Design-blue)
![PedalPoint Bike Rentals](https://img.shields.io/badge/PedalPoint%20Bike%20Rentals-blue)
![SQL](https://img.shields.io/badge/SQL-blue)
![MIT](https://img.shields.io/badge/MIT%20License-blue)

## 📌 Project Overview

**PedalPoint Bike Rentals** is a relational database and table creation project designed to demonstrate how SQL can be used to structure, manage, and validate operational data for a bike rental business.

The project simulates a bike rental company's core operations, including its bike inventory, customer records, and rental transactions. A relational database was designed in **MySQL** to maintain data integrity and establish relationships between customers, bikes, and rentals.

Beyond database creation, the project will use SQL to answer practical business questions and generate insights that can support decisions around **bike utilization, revenue performance, customer activity, and inventory management**.

---

## 🎯 Project Objectives

The primary objectives of this project are to:

* Design a normalized relational database for a bike rental business.
* Create tables and relationships that accurately represent business operations.
* Apply SQL constraints to maintain data integrity and consistency.
* Import and manage operational data within MySQL.
* Validate the quality and integrity of the imported data.

---

## 🏢 Business Context

PedalPoint Bike Rentals manages a fleet of bikes that customers can rent for specified periods.

The business needs to maintain accurate records of:

* Bikes available within its fleet.
* Customers who use the rental service.
* Rental transactions and their associated dates.
* Expected and actual return dates.
* Revenue generated from rentals.
* Current bike availability and maintenance status.

A well-structured relational database allows these records to be stored consistently while making it easier to retrieve and analyze information for operational and strategic decision-making.

---

## 🗃️ Database Design

The database consists of three core tables:

### 1. `bikes`

Stores information about the bike inventory.

| Column                | Description                            |
| --------------------- | -------------------------------------- |
| `bike_id`             | Unique identifier for each bike        |
| `brand`               | Bike manufacturer/brand                |
| `bike_type`           | Type/category of bike                  |
| `daily_rate`          | Daily rental price                     |
| `availability_status` | Current operational status of the bike |

Possible availability statuses are:

* `available`
* `rented`
* `undergoing maintenance`

---

### 2. `customers`

Stores information about customers.

| Column          | Description                         |
| --------------- | ----------------------------------- |
| `customer_id`   | Unique identifier for each customer |
| `full_name`     | Customer's full name                |
| `email_address` | Customer's email address            |
| `date_of_birth` | Customer's date of birth            |

The email address is constrained to be unique to prevent duplicate customer contact records.

---

### 3. `rentals`

Stores individual rental transactions.

| Column                 | Description                          |
| ---------------------- | ------------------------------------ |
| `rental_id`            | Unique identifier for each rental    |
| `bike_id`              | Bike associated with the rental      |
| `customer_id`          | Customer associated with the rental  |
| `start_date`           | Date the rental began                |
| `expected_return_date` | Expected return date                 |
| `actual_return_date`   | Actual return date, where applicable |
| `total_amount_charged` | Total amount charged for the rental  |

The `rentals` table connects customers and bikes through foreign keys.

---

## 🔗 Entity Relationship

The database follows a simple relational structure:

```text
CUSTOMERS
    │
    │ 1
    │
    │
    │ Many
 RENTALS
    │
    │ Many
    │
    │ 1
    │
   BIKES
```

### Relationships

* One **customer** can have many rentals.
* One **bike** can appear in many rental transactions over time.
* Each rental belongs to one customer.
* Each rental is associated with one bike.

Foreign-key relationships are used to maintain referential integrity between the tables.

---

## 🛡️ Data Integrity

The database incorporates several SQL constraints to improve data quality and prevent invalid records.

Examples include:

* `PRIMARY KEY` — uniquely identifies records.
* `FOREIGN KEY` — maintains relationships between tables.
* `NOT NULL` — ensures required fields contain values.
* `UNIQUE` — prevents duplicate customer email addresses.
* `CHECK` — prevents invalid rental rates, dates, and transaction amounts.
* `ENUM` — restricts bike availability to predefined operational statuses.
* `AUTO_INCREMENT` — automatically generates unique identifiers.

For example, rental dates are constrained so that an expected return date cannot occur before the rental start date.

---

## 📥 Data Ingestion

A sample bike inventory dataset was provided as a CSV file and imported into the MySQL database using **MySQL Workbench's Table Data Import Wizard**.

The imported sample dataset contains the following fields:

```text
bike_id
brand
bike_type
daily_rate
availability_status
```

The data was imported directly into the existing `bikes` table because the CSV structure and values were aligned with the database schema.

This approach demonstrates a practical workflow for loading operational data into a relational database before performing quality checks and analysis. During the analytical phase of the project, the bike table will be truncated and the real PedalPoint datasets will be imported for subsequent analysis.

---

## 🔍 Data Quality Validation

Following data ingestion, SQL-based validation will be performed to assess:

* Record completeness.
* Duplicate records.
* Missing values.
* Invalid rental rates.
* Invalid dates.
* Referential integrity.
* Valid availability statuses.
* Consistency between related tables.

The validation phase is important because successful data import does not necessarily mean that the underlying data is accurate or analytically reliable.

---

## 📊 Business Analysis

The analytical phase of the project will use SQL to answer business-focused questions such as:

### Fleet & Inventory

* How many bikes does PedalPoint currently have?
* How is the fleet distributed by bike type and brand?
* How many bikes are currently available, rented, or undergoing maintenance?
* Which bike types have the highest rental rates?

### Rental Performance

* How many rentals has each bike generated?
* Which bikes are rented most frequently?
* Which customers have made the most rentals?
* What is the average rental value?
* How long do customers typically keep bikes?

### Revenue Analysis

* How much revenue has the business generated?
* Which bikes generate the most rental revenue?
* Which bike types contribute the most revenue?
* What is the average revenue per rental?
* How does revenue vary across different periods?

### Operational Performance

* Which rentals were returned late?
* Which bikes have high utilization?
* Are there bikes that remain underutilized?
* How much of the fleet is currently unavailable due to maintenance?

The final questions may be refined as the dataset and analysis develop.

---

## 🧰 Tools & Technologies

* **MySQL** — relational database creation, management, and analysis
* **MySQL Workbench** — database development and CSV data ingestion
* **SQL** — data manipulation, validation, querying, and business analysis
* **Git & GitHub** — version control and project documentation

---

## 📁 Project Structure

```text
PedalPoint Bike Rentals/
│
├── README.md
│
└── database/
    ├── 01_Create_Database_Create_Tables_&_Import_Sample_Data.sql
    ├── 02_Insert_PedalPoint_data.sql
    └── 03_business_queries.sql
```

---

## 🚀 Project Workflow

The project follows a practical data workflow:

```text
Business Requirements
        ↓
Database Design
        ↓
Database & Table Creation
        ↓
Data Ingestion
        ↓
Data Quality Validation
        ↓
Business Analysis
        ↓
Insights & Recommendations
```

This structure reflects the process a data analyst may follow when working with operational data: first ensuring that the data is properly structured and reliable before using it to answer business questions.

---

## 💡 Expected Business Value

The analysis is intended to help PedalPoint Bike Rentals understand:

* Fleet composition and availability.
* Customer rental behavior.
* Bike utilization.
* Revenue-generating assets.
* Maintenance-related availability issues.
* Opportunities to improve fleet allocation and operational efficiency.

The ultimate goal is to move beyond simply querying data and demonstrate how **SQL analysis can translate operational data into business decisions**.

---

## 📌 Project Status

**Current stage:** Database and table creation completed.

### Completed

* [x] Database created
* [x] Relational tables designed
* [x] Primary and foreign keys implemented
* [x] Data-integrity constraints implemented
* [x] Sample Bike dataset imported
* [x] Initial database setup completed

### Future Analytical Phase

* [ ] PedalPoint datasets imported
* [ ] Data quality validation
* [ ] Business questions and SQL analysis
* [ ] Business insights
* [ ] Recommendations
* [ ] Final project review

---

## 👤 Author

**Chidiebere David Ogbonna**

Data Analyst | SQL | Power BI | Tableau | Python | Excel

## Contact

Feel free to send your reviews, suggestions, questions and collaboration requests to chidieberedavid326@gmail.com

| Detail | Link |
| ------ | ---- |
| Email | chidieberedavid326@gmail.com |
| LinkedIn | [chidieberedavidogbonna](https://www.linkedin.com/in/chidieberedavidogbonna/) |
| GitHub | [iameberedavid](https://github.com/iameberedavid) |
| Medium | [eberedavid](https://eberedavid.medium.com) |
| Twitter | [iameberedavid](https://twitter.com/iameberedavid) |

## License

This project is licensed under the MIT License. See the LICENSE file for details.

## Important

**PedalPoint Bike Rentals** is a fictional bike rental business, and this entire project was developed to demonstrate practical skills in **relational database design, SQL, data quality, and business analysis**.
