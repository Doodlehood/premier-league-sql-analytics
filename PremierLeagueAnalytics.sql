-- =========================================
-- PREMIER LEAGUE ANALYTICS SYSTEM
-- =========================================

CREATE DATABASE IF NOT EXISTS PremierLeagueAnalytics;

USE PremierLeagueAnalytics;

SET FOREIGN_KEY_CHECKS = 0;

DROP VIEW IF EXISTS PlayerPerformance;

DROP TABLE IF EXISTS Performance;
DROP TABLE IF EXISTS MatchDetails;
DROP TABLE IF EXISTS Stadium;
DROP TABLE IF EXISTS Player;
DROP TABLE IF EXISTS Team;

SET FOREIGN_KEY_CHECKS = 1;

-- =========================================
-- CREATE TABLES
-- =========================================

CREATE TABLE Team (
    TeamID INT PRIMARY KEY,
    TeamName VARCHAR(100) NOT NULL,
    ManagerName VARCHAR(100)
);

CREATE TABLE Player (
    PlayerID INT PRIMARY KEY,
    PlayerName VARCHAR(100) NOT NULL,
    Age INT,
    Position VARCHAR(50),
    JerseyNumber INT,
    TeamID INT,

    CONSTRAINT FK_PlayerTeam
    FOREIGN KEY (TeamID)
    REFERENCES Team(TeamID)
);

CREATE TABLE Stadium (
    StadiumID INT PRIMARY KEY,
    StadiumName VARCHAR(100),
    City VARCHAR(100),
    Capacity INT
);

CREATE TABLE MatchDetails (
    MatchID INT PRIMARY KEY,
    MatchDate DATE,
    Competition VARCHAR(100),
    HomeTeamID INT,
    AwayTeamID INT,
    StadiumID INT,

    CONSTRAINT FK_HomeTeam
    FOREIGN KEY (HomeTeamID)
    REFERENCES Team(TeamID),

    CONSTRAINT FK_AwayTeam
    FOREIGN KEY (AwayTeamID)
    REFERENCES Team(TeamID),

    CONSTRAINT FK_Stadium
    FOREIGN KEY (StadiumID)
    REFERENCES Stadium(StadiumID)
);

CREATE TABLE Performance (
    PerformanceID INT PRIMARY KEY,
    PlayerID INT,
    MatchID INT,
    GoalsScored INT,
    Assists INT,
    YellowCards INT,
    Rating DECIMAL(3,1),

    CONSTRAINT FK_PlayerPerformance
    FOREIGN KEY (PlayerID)
    REFERENCES Player(PlayerID),

    CONSTRAINT FK_MatchPerformance
    FOREIGN KEY (MatchID)
    REFERENCES MatchDetails(MatchID)
);

-- =========================================
-- INSERT DATA
-- =========================================

INSERT INTO Team
VALUES
(1, 'Arsenal', 'Mikel Arteta'),
(2, 'Manchester City', 'Pep Guardiola'),
(3, 'Liverpool', 'Arne Slot'),
(4, 'Chelsea', 'Enzo Maresca');

INSERT INTO Player
VALUES
(101, 'Bukayo Saka', 24, 'Right Winger', 7, 1),
(102, 'Martin Odegaard', 27, 'Midfielder', 8, 1),
(103, 'Erling Haaland', 26, 'Striker', 9, 2),
(104, 'Kevin De Bruyne', 35, 'Midfielder', 17, 2),
(105, 'Mohamed Salah', 34, 'Right Winger', 11, 3),
(106, 'Cole Palmer', 24, 'Attacking Midfielder', 20, 4);

INSERT INTO Stadium
VALUES
(1, 'Emirates Stadium', 'London', 60704),
(2, 'Etihad Stadium', 'Manchester', 53400),
(3, 'Anfield', 'Liverpool', 61276),
(4, 'Stamford Bridge', 'London', 40341);

INSERT INTO MatchDetails
VALUES
(1001, '2026-05-01', 'Premier League', 1, 2, 1),
(1002, '2026-05-10', 'Premier League', 2, 3, 2),
(1003, '2026-05-20', 'Premier League', 1, 3, 1),
(1004, '2026-05-28', 'Premier League', 4, 1, 4);

INSERT INTO Performance
VALUES
(1, 101, 1001, 2, 1, 0, 9.5),
(2, 102, 1001, 1, 2, 1, 9.0),
(3, 103, 1002, 3, 0, 0, 9.7),
(4, 104, 1002, 0, 3, 1, 8.9),
(5, 105, 1003, 2, 1, 0, 9.2),
(6, 106, 1004, 1, 1, 1, 8.8);

-- =========================================
-- CREATE VIEW
-- =========================================

CREATE VIEW PlayerPerformance AS
SELECT
    P.PlayerName,
    PF.GoalsScored,
    PF.Assists,
    PF.YellowCards,
    PF.Rating
FROM Player P
INNER JOIN Performance PF
ON P.PlayerID = PF.PlayerID;

-- =========================================
-- DISPLAY ALL TABLES
-- =========================================

SELECT * FROM Team;

SELECT * FROM Player;

SELECT * FROM Stadium;

SELECT * FROM MatchDetails;

SELECT * FROM Performance;

-- =========================================
-- TEAM-WISE PLAYERS
-- =========================================

SELECT
    T.TeamName,
    P.PlayerName
FROM Team T
INNER JOIN Player P
ON T.TeamID = P.TeamID;

-- =========================================
-- MATCH DETAILS
-- =========================================

SELECT
    M.MatchID,
    M.MatchDate,
    HT.TeamName AS HomeTeam,
    AT.TeamName AS AwayTeam,
    S.StadiumName
FROM MatchDetails M
INNER JOIN Team HT
ON M.HomeTeamID = HT.TeamID
INNER JOIN Team AT
ON M.AwayTeamID = AT.TeamID
INNER JOIN Stadium S
ON M.StadiumID = S.StadiumID;

-- =========================================
-- TOTAL GOALS BY PLAYERS
-- =========================================

SELECT
    P.PlayerName,
    SUM(PF.GoalsScored) AS TotalGoals
FROM Player P
INNER JOIN Performance PF
ON P.PlayerID = PF.PlayerID
GROUP BY P.PlayerName;

-- =========================================
-- AVERAGE PLAYER RATING
-- =========================================

SELECT
    AVG(Rating) AS AverageRating
FROM Performance;

-- =========================================
-- VIEW DATA
-- =========================================

SELECT * FROM PlayerPerformance;
