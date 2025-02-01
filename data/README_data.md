# Data Directory Structure

This directory contains match and performance statistics datasets from 2021-2023.

## Files

### matches.csv 
Contains individual match statistics tracking shots and goals for both teams.

Structure:
| Column Name | Description |
|------------|-------------|
| year | Season year (2021-2023) |
| game_id | Unique identifier for each match |
| date | Match date (YYYY-MM-DD format) |
| opponent | Name of the opposing team |
| shots | Number of shots taken by university team |
| goals | Number of goals scored by university team | 
| opponent_shots | Number of shots by opposing team |
| opponent_goals | Number of goals by opposing team |

### season_performance.csv
Contains aggregated seasonal performance metrics.

Structure:
| Column Name | Description |
|------------|-------------|
| year | Season year (2021-2023) |
| total_shots | Total shots by university team |
| first_half_shots | Shots taken in first half |
| second_half_shots | Shots taken in second half |
| total_goals | Total goals scored |
| first_half_goals | Goals scored in first half |
| second_half_goals | Goals scored in second half |
| penalty_attempts | Number of penalty kicks attempted |
| penalty_conversions | Number of successful penalty kicks |
| home_wins | Number of games won at home |
| home_draws | Number of games drawn at home |
| away_wins | Number of games won away |
| away_losses | Number of games lost away |

## Notes
- All files are comma-separated CSVs
- Integer values for all statistics
- Dates formatted as YYYY-MM-DD
- matches.csv contains 53 matches ordered chronologically
- season_performance.csv contains 3 seasons (2021-2023)
