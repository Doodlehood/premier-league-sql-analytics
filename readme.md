# Premier League Analytics System

A MySQL database project that models and analyzes English Premier League team and player performance data — teams, players, stadiums, matches, and per-match performance stats.

## Overview

This project was built as a Database Systems lab exercise. It demonstrates core relational database concepts: table design, primary/foreign keys, joins, views, and aggregate functions, applied to a football (soccer) analytics use case.

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

A `PlayerPerformance` view joins `Player` and `Performance` for quick reporting.

## Requirements

- MySQL Server 8.0+ (or MySQL Workbench / XAMPP / MAMP)
- VS Code with the **MySQL** or **SQLTools** extension (optional, for running queries in-editor)

## Setup / Usage

1. Clone this repository.
2. Open `PremierLeagueAnalytics.sql` in MySQL Workbench, the MySQL CLI, or VS Code.
3. Run the full script — it creates the `PremierLeagueAnalytics` database, all tables, sample data, the view, and a set of demo queries.

```bash
mysql -u root -p < PremierLeagueAnalytics.sql
```

## Sample Queries Included

- List all players, teams, stadiums, matches, and performances
- Team-wise player rosters
- Match details with home/away teams and venue
- Total goals scored per player
- Average player rating across all matches
- Full `PlayerPerformance` view output

## Future Enhancements

- Real-time match tracking
- Mobile application integration
- AI-based performance prediction
- Graphical dashboard
- Injury management system

## Author

Azan Waseem — BSCS, University of Management and Technology (UMT), Lahore