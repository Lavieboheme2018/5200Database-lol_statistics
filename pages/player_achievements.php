<?php
require_once('../config/db.php');
?>

<!DOCTYPE html>
<html>
<head>
    <title>Player Achievements</title>
    <link rel="stylesheet" href="../styles/player_achievements.css">
</head>
<body>
    <?php include 'navbar.php'; ?>
    <h1>🎯 Player Achievements</h1>
    <table>
        <tr>
            <th>Username</th>
            <th>Summoner Level</th>
            <th>Achievement</th>
            <th>Description</th>
            <th>Date Unlocked</th>
        </tr>

        <?php
        $sql = "
            SELECT p.Username, p.SummonerLevel, a.Name AS AchievementName, a.Description, pa.DateUnlocked
            FROM PlayerAchievement pa
            JOIN Player p ON pa.PlayerID = p.PlayerID
            JOIN Achievement a ON pa.AchievementID = a.AchievementID
            ORDER BY pa.DateUnlocked DESC
        ";

        $stmt = $conn->prepare($sql);
        $stmt->execute();
        $results = $stmt->fetchAll(PDO::FETCH_ASSOC);

        foreach ($results as $row) {
            echo "<tr>";
            echo "<td>" . htmlspecialchars($row['Username']) . "</td>";
            echo "<td>" . $row['SummonerLevel'] . "</td>";
            echo "<td>" . htmlspecialchars($row['AchievementName']) . "</td>";
            echo "<td>" . htmlspecialchars($row['Description']) . "</td>";
            echo "<td>" . $row['DateUnlocked'] . "</td>";
            echo "</tr>";
        }
        ?>
    </table>

    <p><a href="../index.php">🔙 Back to Home</a></p>
</body>
</html>
