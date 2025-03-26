<?php
require_once('../config/db.php');

// Data: GoldEarned
$goldData = $conn->query("
    SELECT p.Username, SUM(ps.GoldEarned) as TotalGold
    FROM Player p
    JOIN PlayerMatch pm ON p.PlayerID = pm.PlayerID
    JOIN PlayerStats ps ON pm.PlayerMatchID = ps.PlayerMatchID
    GROUP BY p.Username
")->fetchAll(PDO::FETCH_ASSOC);

// Data: Achievements
$achievementData = $conn->query("
    SELECT p.Username, COUNT(pa.AchievementID) as AchievementCount
    FROM Player p
    JOIN PlayerAchievement pa ON p.PlayerID = pa.PlayerID
    GROUP BY p.Username
")->fetchAll(PDO::FETCH_ASSOC);

// Fetch players for dropdown
$players = $conn->query("SELECT PlayerID, Username FROM Player")->fetchAll(PDO::FETCH_ASSOC);
?>

<!DOCTYPE html>
<html>
<head>
    <title>Dashboard</title>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <link rel="stylesheet" href="../styles/dashboard.css">
</head>
<body>
    <?php include 'navbar.php'; ?>
    <h1>📊 Game Dashboard (Chart.js + AJAX)</h1>

    <h2>1. Gold Earned by Player</h2>
    <canvas id="goldChart" width="600" height="300"></canvas>

    <h2>2. Achievement Distribution</h2>
    <canvas id="achievementChart" width="600" height="300"></canvas>

    <h2>3. Match Duration Trend (Per Player)</h2>
    <label for="playerSelect">Choose Player:</label>
    <select id="playerSelect">
        <?php foreach ($players as $player): ?>
            <option value="<?= $player['PlayerID'] ?>">
                <?= htmlspecialchars($player['Username']) ?> (ID: <?= $player['PlayerID'] ?>)
            </option>
        <?php endforeach; ?>
    </select>

    <canvas id="trendChart" width="600" height="300"></canvas>

    <p><a href="../index.php">🔙 Back to Home</a></p>

    <script>
        // Chart 1: Gold Earned
        const goldCtx = document.getElementById('goldChart').getContext('2d');
        new Chart(goldCtx, {
            type: 'bar',
            data: {
                labels: <?= json_encode(array_column($goldData, 'Username')) ?>,
                datasets: [{
                    label: 'Total Gold Earned',
                    data: <?= json_encode(array_column($goldData, 'TotalGold')) ?>,
                    backgroundColor: 'rgba(75, 192, 192, 0.6)'
                }]
            }
        });

        // Chart 2: Achievement Distribution
        const achieveCtx = document.getElementById('achievementChart').getContext('2d');
        new Chart(achieveCtx, {
            type: 'pie',
            data: {
                labels: <?= json_encode(array_column($achievementData, 'Username')) ?>,
                datasets: [{
                    label: 'Achievements',
                    data: <?= json_encode(array_column($achievementData, 'AchievementCount')) ?>,
                    backgroundColor: [
                        '#FF6384', '#36A2EB', '#FFCE56',
                        '#AA65F0', '#4BC0C0', '#FF9F40',
                        '#9966FF', '#E7E9ED', '#5A9', '#F70'
                    ]
                }]
            }
        });

        // Chart 3: AJAX - Match Duration Trend
        let trendChart = null;
        function loadTrendChart(playerId) {
            fetch(`trend_data.php?player_id=${playerId}`)
                .then(res => res.json())
                .then(data => {
                    const ctx = document.getElementById('trendChart').getContext('2d');
                    if (trendChart) trendChart.destroy();

                    trendChart = new Chart(ctx, {
                        type: 'line',
                        data: {
                            labels: data.labels,
                            datasets: [{
                                label: 'Match Duration (min)',
                                data: data.durations,
                                fill: false,
                                borderColor: 'rgba(255, 99, 132, 1)',
                                tension: 0.2
                            }]
                        }
                    });
                });
        }

        document.addEventListener("DOMContentLoaded", function () {
            const select = document.getElementById('playerSelect');
            loadTrendChart(select.value);
            select.addEventListener("change", function () {
                loadTrendChart(this.value);
            });
        });
    </script>
</body>
</html>
