# Library Management System (Web App JSP)

A web-based library management system built using Java Server Pages (JSP) and MySQL. The application provides an interface for students and library assistants to manage core library operations efficiently.
College project for JP Institute of Engineering & Technology (Meerut).

## Description
This project is designed to handle basic library workflows, including searching the catalog, issuing books to users, processing returns with fine calculation, and adding new books to the inventory. It utilizes a Java backend with JSP for front-end rendering and connects to a MySQL database using JDBC.

## Features
- **Role-Based Authentication**: Distinct access controls for `Student` and `Library Assistant`.
- **Book Issuing System**: 
  - Allows issuing up to 4 books per student.
  - Validates student ID and checks book availability dynamically.
  - Automatically records the issue timestamp.
- **Book Return & Fines**: Processes book returns and calculates delay fines.
- **Search Catalog**: Search for books by Book No., Book ID, Book Name, or Author Name.
- **Inventory Management**: Add new books and track available stock.

## Requirements to Run
To run this application locally, you will need the following software installed:
- **Java Development Kit (JDK)**: Version 8 or higher.
- **Web Server / Servlet Container**: Apache Tomcat (or compatible alternatives like GlassFish).
- **Database Server**: MySQL Server running on `localhost` (default port `3306`).
- **JDBC Driver**: MySQL Connector/Java (`org.gjt.mm.mysql.Driver`).

## Installation and Setup
1. **Database Setup**:
   - Create a new MySQL database.
   - Create the necessary tables (`StudentDetail`, `issue`, `BookNo`, `BookDetail`, `BookAvailable`).
   - Note: Make sure the database schema is correctly mapped as expected by the JSP scripts.
2. **Configuration**:
   - Update the database credentials in the JSP files. Primarily, ensure `login.jsp` has the correct port (change `306` to `3306` if it's a typo) and database connect strings.
3. **Deployment**:
   - Build the project using Ant (`build.xml`) or your preferred IDE (like NetBeans/Eclipse).
   - Alternatively, place the project folders inside the `webapps` directory of your Apache Tomcat server.
4. **Execution**:
   - Start your Tomcat server and navigate to `http://localhost:8080/library-mgt-sys-jsp/` (or the respective context path) in your web browser.
   - Proceed to login as a Student or Library Assistant.
