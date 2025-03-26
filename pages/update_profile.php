<?php
require_once('../config/db.php');

// Handle form submission
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $playerID = $_POST['PlayerID'];
    $level = $_POST['SummonerLevel'];
    $rank = $_POST['Rank'];
    $regionID = $_POST['RegionID'];

    $sql = "UPDATE Player SET SummonerLevel = ?, Rank = ?, RegionID = ? WHERE PlayerID = ?";
    $stmt = $conn->prepare($sql);
    $stmt->execute([$level, $rank, $regionID, $playerID]);

    echo "<p class='success-message'>✅ Profile updated successfully!</p>";
}

// Fetch players for dropdown
$players = $conn->query("SELECT PlayerID, Username FROM Player")->fetchAll(PDO::FETCH_ASSOC);

// Fetch regions for dropdown
$regions = $conn->query("SELECT RegionID, RegionName FROM Region")->fetchAll(PDO::FETCH_ASSOC);
?>

<!DOCTYPE html>
<html>
<head>
    <title>Update Player Profile</title>
    <link rel="stylesheet" href="../styles/update_profile.css">
</head>
<body>
    <?php include 'navbar.php'; ?>
    <h1>🛠 Update Player Profile</h1>

    <form method="post">
        <label for="PlayerID">Select Player:</label>
        <select name="PlayerID" required>
            <?php foreach ($players as $player): ?>
                <option value="<?= $player['PlayerID'] ?>">
                    <?= $player['Username'] ?> (ID: <?= $player['PlayerID'] ?>)
                </option>
            <?php endforeach; ?>
        </select>

        <label for="SummonerLevel">Summoner Level:</label>
        <input type="number" name="SummonerLevel" required>

        <label for="Rank">Rank:</label>
        <select name="Rank">
            <option>Iron</option>
            <option>Bronze</option>
            <option>Silver</option>
            <option>Gold</option>
            <option>Platinum</option>
            <option>Diamond</option>
            <option>Master</option>
            <option>Grandmaster</option>
            <option>Challenger</option>
        </select>

        <label for="RegionID">Region:</label>
        <select name="RegionID">
            <?php foreach ($regions as $region): ?>
                <option value="<?= $region['RegionID'] ?>"><?= $region['RegionName'] ?></option>
            <?php endforeach; ?>
        </select>

        <input type="submit" value="Update Profile">
    </form>

    <p><a href="../index.php">🔙 Back to Home</a></p>
</body>
</html>
