USE lol_analytics_cs5200;

INSERT INTO Region (RegionName) VALUES
('NA'), ('EUW'), ('EUNE'), ('KR'), ('CN'),
('OCE'), ('LAN'), ('BR'), ('RU'), ('TR'),
('JP'), ('SEA'), ('VN'), ('TW'), ('PH'),
('SG'), ('TH'), ('HK'), ('MY'), ('ID');

INSERT INTO Player (Username, SummonerLevel, Rank, RegionID, JoinDate) VALUES
('SummonerA', 120, 'Gold', 1, '2020-05-12'),
('SummonerB', 88, 'Silver', 2, '2019-11-01'),
('SummonerC', 150, 'Platinum', 3, '2021-07-25'),
('SummonerD', 45, 'Bronze', 4, '2022-02-10'),
('SummonerE', 200, 'Diamond', 5, '2018-09-17'),
('SummonerF', 30, 'Iron', 6, '2023-01-01'),
('SummonerG', 99, 'Silver', 7, '2021-03-14'),
('SummonerH', 170, 'Gold', 8, '2020-06-30'),
('SummonerI', 210, 'Master', 9, '2017-04-19'),
('SummonerJ', 189, 'Platinum', 10, '2019-10-05'),
('SummonerK', 60, 'Bronze', 11, '2022-06-22'),
('SummonerL', 135, 'Gold', 12, '2019-12-11'),
('SummonerM', 75, 'Silver', 13, '2023-03-03'),
('SummonerN', 190, 'Diamond', 14, '2018-08-08'),
('SummonerO', 100, 'Silver', 15, '2020-02-20'),
('SummonerP', 165, 'Platinum', 16, '2020-12-12'),
('SummonerQ', 47, 'Iron', 17, '2021-01-01'),
('SummonerR', 205, 'Challenger', 18, '2016-06-06'),
('SummonerS', 111, 'Gold', 19, '2020-09-09'),
('SummonerT', 80, 'Silver', 20, '2022-04-04');

INSERT INTO `Match` (`MatchType`, `Duration`, `GameMode`, `DatePlayed`) VALUES
('Ranked', 35, 'Classic', '2023-03-01 18:30:00'),
('Normal', 28, 'ARAM', '2023-03-01 19:00:00'),
('Ranked', 40, 'Classic', '2023-03-02 20:10:00'),
('Normal', 25, 'URF', '2023-03-02 21:00:00'),
('Ranked', 38, 'Classic', '2023-03-03 17:45:00'),
('Ranked', 32, 'Classic', '2023-03-03 22:30:00'),
('Normal', 27, 'ARAM', '2023-03-04 16:30:00'),
('Normal', 29, 'URF', '2023-03-04 20:15:00'),
('Ranked', 42, 'Classic', '2023-03-05 14:00:00'),
('Normal', 26, 'ARAM', '2023-03-05 19:30:00'),
('Ranked', 31, 'Classic', '2023-03-06 18:00:00'),
('Ranked', 33, 'Classic', '2023-03-07 15:10:00'),
('Normal', 28, 'URF', '2023-03-08 13:25:00'),
('Normal', 30, 'ARAM', '2023-03-09 12:00:00'),
('Ranked', 36, 'Classic', '2023-03-10 21:45:00'),
('Ranked', 39, 'Classic', '2023-03-11 22:00:00'),
('Normal', 25, 'URF', '2023-03-12 20:00:00'),
('Normal', 29, 'ARAM', '2023-03-13 19:00:00'),
('Ranked', 34, 'Classic', '2023-03-14 17:30:00'),
('Ranked', 37, 'Classic', '2023-03-15 16:30:00');

INSERT INTO Achievement (Name, Description, Requirement) VALUES
('First Blood', 'Get the first kill in a match', 'Kill an enemy champion first'),
('Pentakill', 'Kill all 5 enemies in a short span', 'Kill 5 enemy champions within 10s'),
('Ace', 'Kill all enemies as a team', 'All 5 enemy champions must die'),
('Unkillable', 'End the game with 0 deaths', 'No deaths in a match'),
('Farming God', 'Farm 300+ minions in a match', 'Kill 300 minions'),
('Support Star', 'Get 20 assists', '20+ assists in a match'),
('Jungle King', 'Control all jungle objectives', 'Take all dragons and Baron'),
('Carry Hard', 'Do 40k+ damage', '40,000 damage dealt'),
('Vision Master', 'Place 30 wards', 'Place 30+ wards in one game'),
('Early Bird', 'Kill enemy before 2 min', 'Get kill before 2:00'),
('Tower Destroyer', 'Destroy 5 towers', 'Take 5 turrets'),
('Comeback King', 'Win after losing early', 'Win after being behind 5k gold'),
('Quick Win', 'Win under 20 mins', 'Finish game in <20min'),
('Perfect KDA', 'KDA > 10.0', 'Kills + Assists / Deaths > 10'),
('Solo Baron', 'Kill Baron Nashor alone', 'Solo Baron'),
('Flash Mastery', 'Use Flash 5+ times', 'Cast Flash 5+ times'),
('Global Impact', 'Kill from across map', 'Hit ult cross-map'),
('Tank Wall', 'Absorb 50k damage', 'Tank 50,000+ damage'),
('Solo Lane God', 'Win 1v1 lane', 'Win solo lane'),
('Legendary', 'Go Legendary', '7+ kill streak');

INSERT INTO `Champion` (`Name`, `Role`, `Difficulty`, `Abilities`) VALUES
('Ahri', 'Mage', 5, 'Charm, Spirit Rush, Fox-Fire'),
('Garen', 'Fighter', 2, 'Demacian Justice, Courage, Judgment'),
('Jinx', 'Marksman', 6, 'Zap!, Super Mega Death Rocket!, Flame Chompers'),
('Lee Sin', 'Fighter', 8, 'Sonic Wave, Safeguard, Dragon’s Rage'),
('Lux', 'Mage', 4, 'Light Binding, Final Spark, Prismatic Barrier'),
('Zed', 'Assassin', 9, 'Living Shadow, Death Mark, Razor Shuriken'),
('Yasuo', 'Fighter', 10, 'Steel Tempest, Wind Wall, Last Breath'),
('Morgana', 'Support', 3, 'Dark Binding, Black Shield, Soul Shackles'),
('Thresh', 'Support', 7, 'Death Sentence, The Box, Flay'),
('Ezreal', 'Marksman', 6, 'Mystic Shot, Arcane Shift, Trueshot Barrage'),
('Teemo', 'Specialist', 3, 'Toxic Shot, Blinding Dart, Noxious Trap'),
('Vayne', 'Marksman', 7, 'Tumble, Final Hour, Condemn'),
('Darius', 'Fighter', 5, 'Hemorrhage, Apprehend, Noxian Guillotine'),
('Fiora', 'Duelist', 8, 'Riposte, Lunge, Grand Challenge'),
('Nami', 'Support', 4, 'Aqua Prison, Tidal Wave, Ebb and Flow'),
('Riven', 'Fighter', 8, 'Broken Wings, Valor, Blade of the Exile'),
('Katarina', 'Assassin', 9, 'Shunpo, Death Lotus, Sinister Steel'),
('Blitzcrank', 'Tank', 3, 'Rocket Grab, Static Field, Power Fist'),
('Malphite', 'Tank', 2, 'Unstoppable Force, Ground Slam, Seismic Shard'),
('Ziggs', 'Mage', 6, 'Bouncing Bomb, Mega Inferno Bomb, Satchel Charge');

INSERT INTO `ItemCategory` (`Type`, `Effect`) VALUES
('Attack', 'Increases AD'),
('Ability Power', 'Boosts magic damage'),
('Defense', 'Increases armor and MR'),
('Utility', 'Provides vision or healing'),
('Movement', 'Increases movement speed'),
('Mana Regen', 'Improves mana recovery'),
('Critical Strike', 'Increases crit chance'),
('Life Steal', 'Restores HP on hit'),
('Cooldown Reduction', 'Reduces ability CD'),
('Hybrid', 'Combines multiple effects'),
('Healing', 'Provides health regen'),
('Tank', 'Increases health and resistances'),
('Jungle', 'Special effects in jungle'),
('Gold Generation', 'Extra gold income'),
('Anti-Heal', 'Reduces enemy healing'),
('Slow Effect', 'Applies slow to target'),
('Tenacity', 'Reduces crowd control duration'),
('Armor Penetration', 'Ignore enemy armor'),
('Magic Penetration', 'Ignore magic resist'),
('Active Items', 'Use to trigger an effect');

INSERT INTO `Item` (`Name`, `CategoryID`, `Price`) VALUES
('Infinity Edge', 1, 3400),
('Rabadon\'s Deathcap', 2, 3600),
('Thornmail', 3, 2900),
('Redemption', 4, 2300),
('Boots of Swiftness', 5, 1000),
('Chalice of Harmony', 6, 900),
('Phantom Dancer', 7, 2800),
('Bloodthirster', 8, 3200),
('Lucidity Boots', 9, 950),
('Hextech Gunblade', 10, 3000),
('Warmog\'s Armor', 11, 3000),
('Sunfire Aegis', 12, 3100),
('Skirmisher\'s Sabre', 13, 3500),
('Frostfang', 14, 850),
('Mortal Reminder', 15, 2600),
('Rylai\'s Crystal Scepter', 16, 2700),
('Mercury\'s Treads', 17, 1100),
('Last Whisper', 18, 1450),
('Void Staff', 19, 2650),
('Zhonya\'s Hourglass', 20, 3000);

INSERT INTO `PlayerAchievement` (`PlayerID`, `AchievementID`, `DateUnlocked`) VALUES
(1, 1, '2023-03-01'),
(2, 2, '2023-03-02'),
(3, 3, '2023-03-02'),
(4, 4, '2023-03-03'),
(5, 5, '2023-03-03'),
(6, 6, '2023-03-04'),
(7, 7, '2023-03-04'),
(8, 8, '2023-03-05'),
(9, 9, '2023-03-06'),
(10, 10, '2023-03-06'),
(11, 11, '2023-03-07'),
(12, 12, '2023-03-07'),
(13, 13, '2023-03-08'),
(14, 14, '2023-03-08'),
(15, 15, '2023-03-09'),
(16, 16, '2023-03-10'),
(17, 17, '2023-03-11'),
(18, 18, '2023-03-11'),
(19, 19, '2023-03-12'),
(20, 20, '2023-03-12');

INSERT INTO `PlayerMatch` (`PlayerID`, `MatchID`) VALUES
(1, 1), (2, 1), (3, 2), (4, 2),
(5, 3), (6, 3), (7, 4), (8, 4),
(9, 5), (10, 5), (11, 6), (12, 6),
(13, 7), (14, 7), (15, 8), (16, 8),
(17, 9), (18, 9), (19, 10), (20, 10);

INSERT INTO `ChampionSelection` (`PlayerMatchID`, `ChampionID`) VALUES
(1, 1), (2, 2), (3, 3), (4, 4),
(5, 5), (6, 6), (7, 7), (8, 8),
(9, 9), (10, 10), (11, 11), (12, 12),
(13, 13), (14, 14), (15, 15), (16, 16),
(17, 17), (18, 18), (19, 19), (20, 20);

INSERT INTO `PlayerStats` (`PlayerMatchID`, `Kills`, `Deaths`, `Assists`, `GoldEarned`, `DamageDealt`) VALUES
(1, 5, 2, 8, 12000, 23000),
(2, 10, 1, 5, 15000, 34000),
(3, 2, 6, 12, 9000, 18000),
(4, 7, 3, 9, 14000, 29000),
(5, 12, 2, 4, 16000, 36000),
(6, 6, 5, 11, 13000, 24000),
(7, 3, 7, 14, 8000, 17000),
(8, 9, 2, 7, 14500, 31000),
(9, 11, 1, 3, 15500, 35000),
(10, 4, 6, 10, 10000, 20000),
(11, 5, 3, 8, 12000, 22000),
(12, 8, 4, 6, 13500, 27000),
(13, 1, 8, 15, 7000, 15000),
(14, 6, 2, 9, 12500, 25000),
(15, 10, 0, 5, 16500, 37000),
(16, 3, 7, 12, 8500, 19000),
(17, 4, 5, 11, 11000, 21000),
(18, 7, 1, 10, 14000, 28000),
(19, 2, 6, 13, 9500, 17000),
(20, 9, 2, 6, 15000, 33000);

INSERT INTO `Inventory` (`PlayerID`, `ItemID`, `DatePurchased`) VALUES
(1, 1, '2023-03-01'),
(2, 2, '2023-03-01'),
(3, 3, '2023-03-02'),
(4, 4, '2023-03-02'),
(5, 5, '2023-03-03'),
(6, 6, '2023-03-03'),
(7, 7, '2023-03-04'),
(8, 8, '2023-03-04'),
(9, 9, '2023-03-05'),
(10, 10, '2023-03-05'),
(11, 11, '2023-03-06'),
(12, 12, '2023-03-06'),
(13, 13, '2023-03-07'),
(14, 14, '2023-03-07'),
(15, 15, '2023-03-08'),
(16, 16, '2023-03-08'),
(17, 17, '2023-03-09'),
(18, 18, '2023-03-09'),
(19, 19, '2023-03-10'),
(20, 20, '2023-03-10');

INSERT INTO `MatchEvent` (`MatchID`, `EventType`, `TimeStamp`) VALUES
(1, 'First Blood', 120),
(2, 'Baron Kill', 1800),
(3, 'Dragon Kill', 1500),
(4, 'Tower Destroyed', 600),
(5, 'Ace', 2100),
(6, 'Pentakill', 2200),
(7, 'Turret Dive', 700),
(8, 'Early Kill', 90),
(9, 'Surrender', 1900),
(10, 'Triple Kill', 1600),
(11, 'Inhibitor Down', 1700),
(12, 'Base Rush', 2000),
(13, 'Tower Defense', 1200),
(14, 'Backdoor', 2100),
(15, 'Team Fight', 2500),
(16, 'Objective Secure', 1300),
(17, 'Teleport Play', 1000),
(18, 'Jungle Steal', 1400),
(19, 'Flash Engage', 800),
(20, 'Smite Steal', 2300);

-- Adding additional data to highlight the contrast
INSERT INTO `PlayerAchievement` (`PlayerID`, `AchievementID`, `DateUnlocked`) VALUES
(1, 2, '2023-03-02'),
(1, 3, '2023-03-03'),
(1, 4, '2023-03-04'),
(1, 5, '2023-03-05');

INSERT INTO `PlayerAchievement` (`PlayerID`, `AchievementID`, `DateUnlocked`) VALUES
(2, 6, '2023-03-02'),
(2, 7, '2023-03-03'),
(2, 8, '2023-03-04');

INSERT INTO `PlayerAchievement` (`PlayerID`, `AchievementID`, `DateUnlocked`) VALUES
(3, 9, '2023-03-05'),
(3, 10, '2023-03-06');

INSERT INTO `PlayerAchievement` (`PlayerID`, `AchievementID`, `DateUnlocked`) VALUES
(4, 11, '2023-03-06');

INSERT INTO `PlayerAchievement` (`PlayerID`, `AchievementID`, `DateUnlocked`) VALUES
(5, 12, '2023-03-07');

-- Adding additional data for match to highlight the change
INSERT INTO `Match` (`MatchType`, `Duration`, `GameMode`, `DatePlayed`) VALUES
('Ranked', 32, 'Classic', '2023-03-16 18:00:00'),
('Normal', 29, 'ARAM', '2023-03-17 19:00:00'),
('Ranked', 38, 'Classic', '2023-03-18 20:10:00'),
('Normal', 25, 'URF', '2023-03-19 21:00:00'),
('Ranked', 40, 'Classic', '2023-03-20 17:45:00'),
('Normal', 27, 'ARAM', '2023-03-21 16:30:00'),
('Ranked', 35, 'Classic', '2023-03-22 14:00:00'),
('Normal', 26, 'URF', '2023-03-23 19:30:00'),
('Ranked', 33, 'Classic', '2023-03-24 15:10:00'),
('Normal', 28, 'ARAM', '2023-03-25 12:00:00'),
('Ranked', 31, 'Classic', '2023-03-26 21:45:00'),
('Normal', 30, 'ARAM', '2023-03-27 22:00:00'),
('Ranked', 36, 'Classic', '2023-03-28 20:00:00'),
('Ranked', 34, 'Classic', '2023-03-29 19:00:00'),
('Normal', 25, 'URF', '2023-03-30 18:00:00'),
('Normal', 29, 'ARAM', '2023-03-31 17:30:00'),
('Ranked', 39, 'Classic', '2023-04-01 16:30:00'),
('Ranked', 37, 'Classic', '2023-04-02 18:30:00'),
('Normal', 27, 'URF', '2023-04-03 20:00:00'),
('Ranked', 30, 'Classic', '2023-04-04 21:00:00');

INSERT INTO `PlayerMatch` (`PlayerID`, `MatchID`) VALUES
(1, 21), (1, 26), (1, 31), (1, 36),
(2, 22), (2, 27), (2, 32), (2, 37),
(3, 23), (3, 28), (3, 33), (3, 38),
(4, 24), (4, 29), (4, 34), (4, 39),
(5, 25), (5, 30), (5, 35), (5, 40);

INSERT INTO `PlayerStats` (`PlayerMatchID`, `Kills`, `Deaths`, `Assists`, `GoldEarned`, `DamageDealt`) VALUES
(21, 6, 3, 9, 13000, 25000),
(22, 8, 2, 6, 15000, 30000),
(23, 4, 5, 10, 12000, 22000),
(24, 7, 1, 7, 14500, 27000),
(25, 5, 4, 8, 13500, 26000),
(26, 9, 0, 6, 16000, 31000),
(27, 3, 6, 11, 11000, 21000),
(28, 10, 2, 5, 17000, 33000),
(29, 6, 3, 9, 14000, 26000),
(30, 7, 2, 8, 15000, 29000),
(31, 2, 6, 13, 10000, 20000),
(32, 8, 3, 7, 15500, 28000),
(33, 5, 5, 9, 12500, 24000),
(34, 9, 1, 6, 16500, 31000),
(35, 4, 4, 10, 13000, 23000),
(36, 7, 2, 7, 14800, 27000),
(37, 6, 4, 8, 13800, 25000),
(38, 3, 5, 12, 11500, 22000),
(39, 10, 1, 5, 17500, 34000),
(40, 5, 3, 9, 14000, 26000);

