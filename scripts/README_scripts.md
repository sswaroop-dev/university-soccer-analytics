# SQL Scripts Documentation

This directory contains SQL scripts for creating and managing a sports team statistics database.

## Files

### 1. create_tables.sql
Contains DDL (Data Definition Language) statements for:
- Creating tables for season records
- Setting up match details
- Establishing performance metrics
- Defining opponent information
- Creating tables for statistics and play records
- Setting up relationships and constraints between tables

### 2. insert_data.sql
Contains DML (Data Manipulation Language) statements for:
- Inserting season records (2021-2023)
- Adding match details
- Populating performance metrics
- Adding opponent information
- Inserting match statistics
- Creating play records

### 3. stats_views.sql
Contains view creation statements for analyzing team performance:
- TeamPenaltyPerformance: Analyzes penalty conversion rates by season
- TeamHomeAwayPerformance: Breaks down home vs away performance metrics
- TeamFirstHalfVsSecondHalf: Compares first and second-half performance
- TeamStatsAgainstOpponents: Details match statistics against each opponent

## Execution Order
For proper database setup, execute the scripts in the following order:
1. create_tables.sql
2. insert_data.sql
3. stats_views.sql
