<?php
$host = "localhost";
$dbname = "lol_analytics_cs5200";
$username = "root";
$password = "butterfly2023"; 

try {
    $conn = new PDO("mysql:host=$host;dbname=$dbname", $username, $password);
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
    die("数据库连接失败：" . $e->getMessage());
}
?>
