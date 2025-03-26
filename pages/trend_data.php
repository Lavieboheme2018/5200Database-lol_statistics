<?php
require_once('../config/db.php');

if (isset($_GET['player_id'])) {
    $playerID = $_GET['player_id'];

    $stmt = $conn->prepare("
        SELECT m.DatePlayed, m.Duration
        FROM PlayerMatch pm
        JOIN `Match` m ON pm.MatchID = m.MatchID
        WHERE pm.PlayerID = ?
        ORDER BY m.DatePlayed
    ");
    $stmt->execute([$playerID]);
    $rows = $stmt->fetchAll(PDO::FETCH_ASSOC);

    // Format data as JSON output
    $data = [
        'labels' => array_map(function($row) {
            return date("m-d", strtotime($row['DatePlayed']));
        }, $rows),
        'durations' => array_column($rows, 'Duration')
    ];

    header('Content-Type: application/json');
    echo json_encode($data);
}
?>
