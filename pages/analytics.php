<?php
require_once('../config/db.php');
?>

<!DOCTYPE html>
<html>
<head>
    <title>Analytics Dashboard</title>
    <link rel="stylesheet" href="../styles/analytics.css">
</head>
<body>
    <?php include 'navbar.php'; ?>
    <h1>📊 Analytics Dashboard</h1>

    <h2>1. Average Playtime per Player</h2>
    <table>
        <tr>
            <th>Username</th>
            <th>Average Duration (minutes)</th>
        </tr>
        <?php
        $sql = "
            SELECT p.Username, ROUND(AVG(m.Duration), 2) AS AvgDuration
            FROM PlayerMatch pm
            JOIN Player p ON pm.PlayerID = p.PlayerID
            JOIN `Match` m ON pm.MatchID = m.MatchID
            GROUP BY p.PlayerID
        ";
        $stmt = $conn->prepare($sql);
        $stmt->execute();
        foreach ($stmt->fetchAll(PDO::FETCH_ASSOC) as $row) {
            echo "<tr><td>{$row['Username']}</td><td>{$row['AvgDuration']}</td></tr>";
        }
        ?>
    </table>

    <h2>2. Total Matches per Player</h2>
    <table>
        <tr>
            <th>Username</th>
            <th>Total Matches</th>
        </tr>
        <?php
        $sql = "
            SELECT p.Username, COUNT(pm.MatchID) AS MatchCount
            FROM PlayerMatch pm
            JOIN Player p ON pm.PlayerID = p.PlayerID
            GROUP BY p.PlayerID
        ";
        $stmt = $conn->prepare($sql);
        $stmt->execute();
        foreach ($stmt->fetchAll(PDO::FETCH_ASSOC) as $row) {
            echo "<tr><td>{$row['Username']}</td><td>{$row['MatchCount']}</td></tr>";
        }
        ?>
    </table>

    <h2>3. Total Playtime per Player per Week</h2>
    <table>
        <tr>
            <th>Username</th>
            <th>Week</th>
            <th>Total Duration</th>
        </tr>
        <?php
        $sql = "
            SELECT p.Username, WEEK(m.DatePlayed) AS WeekNumber, SUM(m.Duration) AS TotalDuration
            FROM PlayerMatch pm
            JOIN Player p ON pm.PlayerID = p.PlayerID
            JOIN `Match` m ON pm.MatchID = m.MatchID
            GROUP BY p.PlayerID, WeekNumber
            ORDER BY p.Username, WeekNumber
        ";
        $stmt = $conn->prepare($sql);
        $stmt->execute();
        foreach ($stmt->fetchAll(PDO::FETCH_ASSOC) as $row) {
            echo "<tr><td>{$row['Username']}</td><td>Week {$row['WeekNumber']}</td><td>{$row['TotalDuration']}</td></tr>";
        }
        ?>
    </table>

    <h2>4. Total Achievements per Player</h2>
    <table>
        <tr>
            <th>Username</th>
            <th>Total Achievements</th>
        </tr>
        <?php
        $sql = "
            SELECT p.Username, COUNT(pa.AchievementID) AS AchievementCount
            FROM PlayerAchievement pa
            JOIN Player p ON pa.PlayerID = p.PlayerID
            GROUP BY p.PlayerID
        ";
        $stmt = $conn->prepare($sql);
        $stmt->execute();
        foreach ($stmt->fetchAll(PDO::FETCH_ASSOC) as $row) {
            echo "<tr><td>{$row['Username']}</td><td>{$row['AchievementCount']}</td></tr>";
        }
        ?>
    </table>

    <p><a href="../index.php">🔙 Back to Home</a></p>
</body>
</html>
