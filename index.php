<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>LoL Game Analytics</title>
    <link rel="stylesheet" href="styles.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            text-align: center;
            padding: 40px;
        }

        h1 {
            color: #333;
        }

        ul {
            list-style-type: none;
            padding: 0;
            max-width: 500px;
            margin: 30px auto;
        }

        li {
            margin: 15px 0;
        }

        a {
            text-decoration: none;
            color: #007bff;
            font-size: 18px;
        }

        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <h1>🎮 Welcome to League of Legends Game Analytics</h1>
    <p>Explore real player data, match trends, and performance stats.</p>

    <ul>
        <li><a href="pages/leaderboard.php">🏆 View Leaderboard</a></li>
        <li><a href="pages/player_achievements.php">🎯 Player Achievements</a></li>
        <li><a href="pages/analytics.php">📊 Game Analytics</a></li>
        <li><a href="pages/update_profile.php">🛠 Update Player Profile</a></li>
        <li><a href="pages/delete_player.php">🗑 Delete Player</a></li>
        <li><a href="pages/dashboard.php">📈 Visual Dashboard</a></li>
    </ul>

    <footer style="margin-top: 40px; color: #888;">
        &copy; <?= date("Y") ?> LoL Analytics Project | CS5200
    </footer>
</body>
</html>
