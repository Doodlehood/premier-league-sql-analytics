# Premier League Analytics System

A relational database system built in MySQL that models and analyzes Premier League team, player, and match performance data — designed to demonstrate practical database engineering skills: schema design, normalization, referential integrity, and analytical querying.

## Skills Demonstrated

- **Relational schema design** — 5 normalized tables with clear entity boundaries
- **Referential integrity** — primary/foreign key constraints across all relationships
- **SQL joins** — multi-table INNER JOINs for cross-entity reporting
- **Aggregate functions & GROUP BY** — statistical summaries (totals, averages)
- **Views** — reusable query abstraction (`PlayerPerformance`)
- **Sample data modeling** — realistic seed data reflecting real-world entities

## Overview

The system tracks clubs, players, stadiums, fixtures, and per-match performance statistics in a single normalized database, replacing manual/spreadsheet-based tracking with structured, queryable storage.

## Database Schema

| Table | Description |
|---|---|
| `Team` | Club info — ID, name, manager |
| `Player` | Player info, linked to a `Team` |
| `Stadium` | Venue info — name, city, capacity |
| `MatchDetails` | Fixtures — date, competition, home/away teams, stadium |
| `Performance` | Per-player, per-match stats — goals, assists, yellow cards, rating |

**Relationships:**
- One `Team` → many `Player`s
- One `Stadium` → many `MatchDetails`
- One `MatchDetails` → many `Performance` records
- One `Player` → many `Performance` records

## Requirements

- MySQL Server 8.0+ (or MySQL Workbench / XAMPP / MAMP)
- VS Code with the **MySQL** or **SQLTools** extension (optional)

## Setup

```bash
mysql -u root -p < PremierLeagueAnalytics.sql
```

This single script creates the database, all tables, sample data, the reporting view, and runs a set of demonstration queries.

## Example Queries

- Team-wise player rosters (JOIN)
- Match details with home/away teams and venue (multi-table JOIN)
- Total goals scored per player (aggregate + GROUP BY)
- Average player rating across all matches (aggregate)
- Full performance report via the `PlayerPerformance` view

## Potential Extensions

- Real-time match tracking via API integration
- Mobile application front-end
- Predictive analytics (ML-based performance forecasting)
- Dashboard/BI layer (e.g. Power BI, Tableau connection)

## Author

**Azan Waseem** — BSCS student, University of Management and Technology (UMT), Lahore
[LinkedIn] · [GitHub] · [Portfolio]