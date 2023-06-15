# Headura Campaign Management System

The Headura Campaign Management System is a database solution developed to assist Headura, a promotions company, in managing their advertising campaigns for clients. This repository contains the code and documentation for the complete project, providing a comprehensive solution to track and monitor campaigns effectively.

## Problem Statement

Headura has experienced challenges in keeping track of their growing number of campaigns and clients. Their current paper-based system has become inefficient and prone to errors, leading to concerns about campaign management and potential business loss. To address these issues, Headura decided to develop a database system to centralize and streamline their campaign management process.

## Information Requirements

### Staff
The database includes comprehensive information about Headura's staff members, such as their roles, salary grades, contact details (telephone number, fax number, and email), and unique staff numbers for identification.

### Clients and Campaigns
For each client, the database stores the details of two designated contacts for each campaign. This includes their names, positions, email addresses, and telephone numbers. Additionally, an account manager is assigned to each client, responsible for maintaining ongoing communication and managing client relationships. Each campaign is assigned a unique campaign code and name, along with a campaign manager who oversees its day-to-day operations. A campaign team is formed by the campaign manager, consisting of staff members who may work on multiple campaigns simultaneously.

### The Campaign Process
The database captures the entire lifecycle of a campaign, starting from initial meetings with the client to the creation and management of campaign assets. Meeting records store information such as date, time, duration, purpose, and staff attendance. A campaign summary sheet summarizes the campaign details throughout its duration. Adverts, the core elements of a campaign, are classified by types (e.g., newspaper, magazine, radio) and contain descriptions, intended audience details, and size specifications. Components of each advert, such as photographs, text, and graphics, are tracked in separate folders, ensuring a complete overview of the campaign's progress. Purchasing assistants handle the procurement of advertising placements, and each placement is assigned a unique code within the campaign.

## System Requirements

The Headura Campaign Management System fulfills the following requirements:

- Staff details and their involvement in campaigns
- Client details and contacts for campaigns
- Campaign details, including campaign code, name, and manager
- Meeting details, capturing meeting information and attendance
- Advert and placement details, tracking advert information and purchasing placements

## Design and Development

The project was developed using Oracle as the database management system. The implementation stage involved converting the conceptual design, including an ER diagram, into an SQL database. Sample data was populated to test the database, and SQL queries were created and executed to ensure the system meets the information requirements.

## Repository Contents

This repository contains the following files:

- `csv`: The folder containing all the csv files filled with mock data to test the SQL queries.
- `ER_diagram.png`: The ER diagram representing the conceptual design of the database.
- `create_tables.sql`: SQL scripts containing the table definitions.
- `queries.sql`: SQL queries demonstrating the system's functionality and compliance with the information requirements.
- `report.pdf`: A comprehensive report documenting the project, including the ER diagram, table definitions, queries, and a critical evaluation of the final product.

## Report Structure

The report provided in this repository consists of the following chapters:

1. Introduction: A brief overview of the project's aims and objectives.
2. The Class Diagram: Detailed representation of the ER diagram with constraints and assumptions.
3. Queries: Six sample queries showcasing the system's ability to meet the requirements.
4. Conclusion: A critical evaluation of the final product and an overall review of the project.
5. Appendix: Detailed data tables used in the database.

Please refer to the report.pdf file for a comprehensive understanding of the project and its outcomes.
