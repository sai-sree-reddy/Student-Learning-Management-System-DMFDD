

# Student Learning Management System (SLMS) - Database Design and Development

## Overview

This repository contains the final project for the Database Design and Development (DMDD) course, which is the Student Learning Management System (SLMS). This project includes the design and implementation of a database for managing student information, courses, and related data.

## Project Components

The SLMS project consists of various components and features as outlined below:

### 1. Stored Procedures

The project includes 3 stored procedures that contain input and output parameters. These procedures are designed to perform specific tasks within the database, such as enrolling students in courses, generating reports, and managing student records.

### 2. Views

Three views have been implemented in the database, primarily for reporting purposes. These views provide a convenient way to retrieve and display data from multiple tables, making it easier to generate reports and analyze student information.

### 3. DML Trigger

A Data Manipulation Language (DML) trigger has been implemented to automate certain actions in response to database changes. For example, a trigger might be used to update student records when they enroll in a new course.

### 4. Table-level CHECK Constraints

To ensure data integrity and enforce business rules, three table-level CHECK constraints have been defined in the database. These constraints validate data before it is inserted or updated in the database.

### 5. Computed Columns

Computed columns have been created based on user-defined functions (UDFs). These computed columns derive their values from other columns in the database, providing calculated data that can be used for various purposes, such as GPA calculation.

### 6. Column Data Encryption

Security is a top priority, and therefore, sensitive data, such as student passwords or personal information, is encrypted within the database to protect against unauthorized access.

### 7. Non-clustered Indexes

Three non-clustered indexes have been added to improve the performance of frequently executed queries. These indexes help speed up data retrieval operations by providing efficient access paths to the data.

### 8. Data Visualization

For data visualization and reporting, this project supports integration with Power BI or Tableau. These tools can be used to create insightful dashboards and visual representations of student data, course performance, and other relevant information.

### 9. Graphical User Interface (Optional)

A graphical user interface (GUI) for performing CRUD (Create, Read, Update, Delete) operations is an optional feature that can be developed to provide a user-friendly interface for interacting with the database. This can include web-based or desktop applications.

## Usage

To use the SLMS system and interact with the database, refer to the documentation provided in the project's documentation folder. It includes information on setting up the database, using stored procedures, views, and any optional GUI components.

