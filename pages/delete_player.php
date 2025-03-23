<?php
require_once('../config/db.php');

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $playerID = $_POST['PlayerID'];

    $sql = "DELETE FROM Player WHERE PlayerID = ?";
    $stmt = $conn->prepare($sql);
    $stmt->execute([$playerID]);

    echo "<p style='color:red;'>🗑 Player deleted (and related data removed).</p>";
}

// 获取所有玩家供选择
$players = $conn->query("SELECT PlayerID, Username FROM Player")->fetchAll(PDO::FETCH_ASSOC);
?>

<!DOCTYPE html>
<html>
<head>
    <title>Delete Player</title>
    <link rel="stylesheet" href="../styles.css">
</head>
<body>
    <?php include 'navbar.php'; ?>
    <h1>🗑 Delete Player Account</h1>

    <form method="post">
        <label for="PlayerID">Select Player to Delete:</label>
        <select name="PlayerID" required>
            <?php foreach ($players as $player): ?>
                <option value="<?= $player['PlayerID'] ?>">
                    <?= $player['Username'] ?> (ID: <?= $player['PlayerID'] ?>)
                </option>
            <?php endforeach; ?>
        </select><br><br>

        <input type="submit" value="Confirm Delete" style="color:red;">
    </form>

    <p><a href="../index.php">🔙 Back to Home</a></p>
</body>
</html>
