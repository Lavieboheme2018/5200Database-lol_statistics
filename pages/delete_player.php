<?php
require_once('../config/db.php');

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $playerID = $_POST['PlayerID'];

    $sql = "DELETE FROM Player WHERE PlayerID = ?";
    $stmt = $conn->prepare($sql);
    $stmt->execute([$playerID]);

    echo "<p class='error-message'>🗑 Player deleted (and related data removed).</p>";
}

// Fetch all players for selection
$players = $conn->query("SELECT PlayerID, Username FROM Player")->fetchAll(PDO::FETCH_ASSOC);
?>

<!DOCTYPE html>
<html>
<head>
    <title>Delete Player</title>
    <link rel="stylesheet" href="../styles/delete_player.css">
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
        </select>

        <input type="submit" value="Confirm Delete">
    </form>

    <p><a href="../index.php">🔙 Back to Home</a></p>
</body>
</html>
