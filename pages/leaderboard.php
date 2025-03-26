<?php
// Include database connection
require_once('../config/db.php');
?>

<!DOCTYPE html>
<html>
<head>
    <title>Top 5 Players</title>
    <link rel="stylesheet" href="../styles/leaderboard.css">
</head>
<body>
    <?php include 'navbar.php'; ?>
    <h1>🏆 Top 5 Players by Gold Earned</h1>
    <table>
        <tr>
            <th>Username</th>
            <th>Summoner Level</th>
            <th>Rank</th>
            <th>Match ID</th>
            <th>Gold Earned</th>
        </tr>

        <?php
        $sql = "
            SELECT p.Username, p.SummonerLevel, p.Rank, pm.MatchID, ps.GoldEarned
            FROM PlayerStats ps
            JOIN PlayerMatch pm ON ps.PlayerMatchID = pm.PlayerMatchID
            JOIN Player p ON pm.PlayerID = p.PlayerID
            ORDER BY ps.GoldEarned DESC
            LIMIT 5
        ";

        $stmt = $conn->prepare($sql);
        $stmt->execute();
        $results = $stmt->fetchAll(PDO::FETCH_ASSOC);

        foreach ($results as $row) {
            echo "<tr>";
            echo "<td>" . htmlspecialchars($row['Username']) . "</td>";
            echo "<td>" . $row['SummonerLevel'] . "</td>";
            echo "<td>" . $row['Rank'] . "</td>";
            echo "<td>" . $row['MatchID'] . "</td>";
            echo "<td>" . $row['GoldEarned'] . "</td>";
            echo "</tr>";
        }
        ?>
    </table>

    <p><a href="../index.php">🔙 Back to Home</a></p>
</body>
</html>
