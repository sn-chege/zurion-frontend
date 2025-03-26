# Phone Directory Web App

## Overview
The **Phone Directory Web App** is a Maven-based Java web application that consumes the **Contact Registry API** for searching contacts. It allows users to retrieve contact details based on various search parameters while ensuring data privacy through hashing and masking techniques.

## Features
- Search contacts by:
  - Phone number hash
  - Masked name and masked phone number
  - Organization name
- REST API integration with the Contact Registry
- Secure and efficient data retrieval
- User-friendly web interface

## Technologies Used
- **Java 17**
- **Maven**
- **NetBeans 16**
- **Apache Tomcat**
- **REST API consumption**
- **MySQL Workbench** (if applicable)

## Setup Instructions
### Prerequisites
Ensure you have the following installed:
- Java 17
- Apache Tomcat (configured and running)
- MySQL (if applicable)
- Maven
- NetBeans or any preferred IDE

**Important:**  
Before running this application, you must first **compile and run** the [Zurion Middleware](https://github.com/sn-chege/zurion-middleware.git). Once it is running, proceed with the following steps.

### Installation Steps
1. Clone the repository:
   ```sh
   git clone https://github.com/sn-chege/zurion-frontend.git
   ```
2. Navigate to the project directory:
   ```sh
   cd phone-directory-web-app
   ```
3. Build the project using Maven:
   ```sh
   mvn clean install
   ```
4. Deploy the WAR file to Apache Tomcat:
   - **If using NetBeans:** Right-click the project and select **Run**.
   - **Alternatively, deploy manually:**
     - Copy `target/phone-directory-web-app.war` to Tomcat’s `webapps` folder.
     - Start Tomcat and access the app at:  
       ```
       http://localhost:8080/RestContactRegistry/
       ```

## API Integration
The app consumes the **Contact Registry API** from the [Zurion Middleware](https://github.com/sn-chege/zurion-middleware.git) to retrieve contact details. Ensure the middleware is running and accessible before using this application.

