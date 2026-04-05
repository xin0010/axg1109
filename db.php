<?php
// ==========================================
// 資料庫連線核心 (Database Connection)
// ==========================================

// 你的 InfinityFree 資料庫連線資訊
$host = 'sql300.infinityfree.com';
$dbname = 'if0_41587017_axg_shop';
$username = 'if0_41587017';
$password = '4u8kJoBKoE4';

try {
    // 使用 PDO (PHP Data Objects) 建立連線，這是防範 SQL Injection 的最佳實踐
    $pdo = new PDO("mysql:host=$host;dbname=$dbname;charset=utf8mb4", $username, $password);
    
    // 設定錯誤模式為 Exception，方便我們捕捉並處理錯誤
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    
    // 設定預設獲取資料的格式為關聯陣列 (Associative Array)
    $pdo->setAttribute(PDO::ATTR_DEFAULT_FETCH_MODE, PDO::FETCH_ASSOC);

} catch(PDOException $e) {
    // 如果連線失敗，回傳 JSON 格式的錯誤訊息並終止程式
    header('Content-Type: application/json');
    http_response_code(500);
    die(json_encode([
        'success' => false,
        'error' => '資料庫連線失敗，請檢查系統設定。'
    ]));
}
?>