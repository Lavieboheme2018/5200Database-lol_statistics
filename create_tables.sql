CREATE DATABASE IF NOT EXISTS lol_analytics_cs5200;
USE lol_analytics_cs5200;

CREATE TABLE Region (
    RegionID INT AUTO_INCREMENT PRIMARY KEY,
    RegionName VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE Player (
    PlayerID INT AUTO_INCREMENT PRIMARY KEY,
    Username VARCHAR(50) NOT NULL UNIQUE,
    SummonerLevel INT,
    Rank VARCHAR(20),
    RegionID INT,
    JoinDate DATE,
    FOREIGN KEY (RegionID) REFERENCES Region(RegionID)
        ON DELETE SET NULL
);

CREATE TABLE Achievement (
    AchievementID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(50) NOT NULL UNIQUE,
    Description TEXT,
    Requirement TEXT
);

CREATE TABLE Champion (
    ChampionID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(50) NOT NULL UNIQUE,
    Role VARCHAR(50),
    Difficulty INT,
    Abilities TEXT
);

CREATE TABLE ItemCategory (
    CategoryID INT AUTO_INCREMENT PRIMARY KEY,
    Type VARCHAR(50),
    Effect TEXT
);

CREATE TABLE Item (
    ItemID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(50) NOT NULL UNIQUE,
    CategoryID INT,
    Price INT,
    FOREIGN KEY (CategoryID) REFERENCES ItemCategory(CategoryID)
        ON DELETE SET NULL
);

CREATE TABLE PlayerAchievement (
    PlayerID INT,
    AchievementID INT,
    DateUnlocked DATE,
    PRIMARY KEY (PlayerID, AchievementID),
    FOREIGN KEY (PlayerID) REFERENCES Player(PlayerID)
        ON DELETE CASCADE,
    FOREIGN KEY (AchievementID) REFERENCES Achievement(AchievementID)
        ON DELETE CASCADE
);

CREATE TABLE ChampionSelection (
    SelectionID INT AUTO_INCREMENT PRIMARY KEY,
    PlayerMatchID INT,
    ChampionID INT,
    FOREIGN KEY (PlayerMatchID) REFERENCES PlayerMatch(PlayerMatchID)
        ON DELETE CASCADE,
    FOREIGN KEY (ChampionID) REFERENCES Champion(ChampionID)
        ON DELETE CASCADE
);

CREATE TABLE PlayerStats (
    StatID INT AUTO_INCREMENT PRIMARY KEY,
    PlayerMatchID INT,
    Kills INT,
    Deaths INT,
    Assists INT,
    GoldEarned INT,
    DamageDealt INT,
    FOREIGN KEY (PlayerMatchID) REFERENCES PlayerMatch(PlayerMatchID)
        ON DELETE CASCADE
);

CREATE TABLE Inventory (
    PlayerID INT,
    ItemID INT,
    DatePurchased DATE,
    PRIMARY KEY (PlayerID, ItemID),
    FOREIGN KEY (PlayerID) REFERENCES Player(PlayerID)
        ON DELETE CASCADE,
    FOREIGN KEY (ItemID) REFERENCES Item(ItemID)
        ON DELETE CASCADE
);

CREATE TABLE `Match` (
    MatchID INT AUTO_INCREMENT PRIMARY KEY,
    MatchType VARCHAR(50),
    Duration INT,
    GameMode VARCHAR(50),
    DatePlayed DATETIME
);

CREATE TABLE `PlayerMatch` (
    PlayerMatchID INT AUTO_INCREMENT PRIMARY KEY,
    PlayerID INT,
    MatchID INT,
    FOREIGN KEY (PlayerID) REFERENCES `Player`(PlayerID)
        ON DELETE CASCADE,
    FOREIGN KEY (MatchID) REFERENCES `Match`(MatchID)
        ON DELETE CASCADE
);

CREATE TABLE `MatchEvent` (
    EventID INT AUTO_INCREMENT PRIMARY KEY,
    MatchID INT,
    EventType VARCHAR(50),
    TimeStamp INT,
    FOREIGN KEY (MatchID) REFERENCES `Match`(MatchID)
        ON DELETE CASCADE
);

