CREATE DATABASE IF NOT EXISTS `lol_analytics_cs5200`;
USE `lol_analytics_cs5200`;

-- 1. Region
CREATE TABLE `Region` (
    `RegionID` INT AUTO_INCREMENT PRIMARY KEY,
    `RegionName` VARCHAR(50) NOT NULL UNIQUE
);

-- 2. Player
CREATE TABLE `Player` (
    `PlayerID` INT AUTO_INCREMENT PRIMARY KEY,
    `Username` VARCHAR(50) NOT NULL UNIQUE,
    `SummonerLevel` INT,
    `Rank` VARCHAR(20),
    `RegionID` INT,
    `JoinDate` DATE,
    FOREIGN KEY (`RegionID`) REFERENCES `Region`(`RegionID`)
        ON DELETE SET NULL
);

-- 3. Achievement
CREATE TABLE `Achievement` (
    `AchievementID` INT AUTO_INCREMENT PRIMARY KEY,
    `Name` VARCHAR(50) NOT NULL UNIQUE,
    `Description` TEXT,
    `Requirement` TEXT
);

-- 4. Champion
CREATE TABLE `Champion` (
    `ChampionID` INT AUTO_INCREMENT PRIMARY KEY,
    `Name` VARCHAR(50) NOT NULL UNIQUE,
    `Role` VARCHAR(50),
    `Difficulty` INT,
    `Abilities` TEXT
);

-- 5. ItemCategory
CREATE TABLE `ItemCategory` (
    `CategoryID` INT AUTO_INCREMENT PRIMARY KEY,
    `Type` VARCHAR(50),
    `Effect` TEXT
);

-- 6. Item
CREATE TABLE `Item` (
    `ItemID` INT AUTO_INCREMENT PRIMARY KEY,
    `Name` VARCHAR(50) NOT NULL UNIQUE,
    `CategoryID` INT,
    `Price` INT,
    FOREIGN KEY (`CategoryID`) REFERENCES `ItemCategory`(`CategoryID`)
        ON DELETE SET NULL
);

-- 7. Match
CREATE TABLE `Match` (
    `MatchID` INT AUTO_INCREMENT PRIMARY KEY,
    `MatchType` VARCHAR(50),
    `Duration` INT,
    `GameMode` VARCHAR(50),
    `DatePlayed` DATETIME
);

-- 8. PlayerMatch
CREATE TABLE `PlayerMatch` (
    `PlayerMatchID` INT AUTO_INCREMENT PRIMARY KEY,
    `PlayerID` INT,
    `MatchID` INT,
    FOREIGN KEY (`PlayerID`) REFERENCES `Player`(`PlayerID`)
        ON DELETE CASCADE,
    FOREIGN KEY (`MatchID`) REFERENCES `Match`(`MatchID`)
        ON DELETE CASCADE
);

-- 9. ChampionSelection
CREATE TABLE `ChampionSelection` (
    `SelectionID` INT AUTO_INCREMENT PRIMARY KEY,
    `PlayerMatchID` INT,
    `ChampionID` INT,
    FOREIGN KEY (`PlayerMatchID`) REFERENCES `PlayerMatch`(`PlayerMatchID`)
        ON DELETE CASCADE,
    FOREIGN KEY (`ChampionID`) REFERENCES `Champion`(`ChampionID`)
        ON DELETE CASCADE
);

-- 10. PlayerStats
CREATE TABLE `PlayerStats` (
    `StatID` INT AUTO_INCREMENT PRIMARY KEY,
    `PlayerMatchID` INT,
    `Kills` INT,
    `Deaths` INT,
    `Assists` INT,
    `GoldEarned` INT,
    `DamageDealt` INT,
    FOREIGN KEY (`PlayerMatchID`) REFERENCES `PlayerMatch`(`PlayerMatchID`)
        ON DELETE CASCADE
);

-- 11. PlayerAchievement
CREATE TABLE `PlayerAchievement` (
    `PlayerID` INT,
    `AchievementID` INT,
    `DateUnlocked` DATE,
    PRIMARY KEY (`PlayerID`, `AchievementID`),
    FOREIGN KEY (`PlayerID`) REFERENCES `Player`(`PlayerID`)
        ON DELETE CASCADE,
    FOREIGN KEY (`AchievementID`) REFERENCES `Achievement`(`AchievementID`)
        ON DELETE CASCADE
);

-- 12. Inventory
CREATE TABLE `Inventory` (
    `PlayerID` INT,
    `ItemID` INT,
    `DatePurchased` DATE,
    PRIMARY KEY (`PlayerID`, `ItemID`),
    FOREIGN KEY (`PlayerID`) REFERENCES `Player`(`PlayerID`)
        ON DELETE CASCADE,
    FOREIGN KEY (`ItemID`) REFERENCES `Item`(`ItemID`)
        ON DELETE CASCADE
);

-- 13. MatchEvent
CREATE TABLE `MatchEvent` (
    `EventID` INT AUTO_INCREMENT PRIMARY KEY,
    `MatchID` INT,
    `EventType` VARCHAR(50),
    `TimeStamp` INT,
    FOREIGN KEY (`MatchID`) REFERENCES `Match`(`MatchID`)
        ON DELETE CASCADE
);
