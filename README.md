# Video Store Database

## Overview
This project designs and implements a relational database for a video rental business using PostgreSQL, including schema development, data population, and business-focused SQL analysis.

## Tech Stack
- PostgreSQL
- SQL (DDL and DML)
- Relational database design

## Database Design
The database was designed to support:
- customer management
- movie inventory tracking
- rental transactions
- fee tracking (late, damage, rewind)
- business analytics queries

## Project Structure
- `/SQL` – table creation and data seeding scripts  
- `/Queries` – business-driven SQL queries  
- `/ERD` – entity relationship diagram  
- `/Data_Dictionary` – field definitions and metadata  
- `/Documentation` – project proposal  
- `/Screenshots` – query results and execution  

## Lessons Learned

- Designed a normalized relational database from business requirements  
- Built SQL queries to answer real operational and financial questions  
- Practiced joins, aggregations, and conditional logic for analysis  

## Example Query

Which movies are currently available for rent?

```sql
SELECT DISTINCT
    m.movieid,
    m.title
FROM inventory i
JOIN movies m ON i.movieid = m.movieid
JOIN status s ON i.statusid = s.statusid
WHERE s.status = 'Available'
ORDER BY m.title;

```

## Example Output

![Available Movies](https://raw.githubusercontent.com/Ayeohkayy/video-store-database/main/Screenshots/Queries/question1_available_movies.jpg)




## Revenue Analysis

![Revenue](Screenshots/Queries/question8_revenue_breakdown.jpg)
