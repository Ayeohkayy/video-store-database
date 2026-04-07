# video-store-database
End-to-end PostgreSQL database project with ERD design, normalized schema, and SQL queries to analyze business operations for a video rental system

## Overview
This project demonstrates the design and implementation of a relational database for a video rental business using PostgreSQL. It includes schema design, SQL scripts for table creation and data seeding, and business queries used to analyze store operations.

## Tech Stack
- PostgreSQL
- SQL (DDL and DML)
- Database design / normalization

## Database Design
This database was designed to support:
- customer management
- movie inventory tracking
- rentals and rental items
- fee tracking
- business reporting queries

## Project Structure
- `/SQL` – table creation and seed scripts
- `/Queries` – business-driven SQL analysis queries
- `/ERD` – entity relationship diagram
- `/Data_Dictionary` – metadata and field definitions
- `/Documentation` – written proposal and supporting materials
- `/Screenshots` – execution and result screenshots

## How to Run
1. Run `SQL/create_tables.sql`
2. Run `SQL/seed_data.sql`
3. Run `Queries/business_queries.sql`

## Example Business Questions
- Which movies are currently available for rent?
- Which customers have overdue or unreturned rentals?
- What percentage of rentals are returned late?
- How much revenue comes from award-winning movies?

## Lessons Learned
This project strengthened my skills in relational database design, normalization, foreign key relationships, and writing SQL queries that answer real business questions.
