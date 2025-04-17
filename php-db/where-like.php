<?php
$dsn = 'mysql:dbname=php_db;host=localhost;charset=utf8mb4';
$user = 'root';
$password = 'root';

try {
    $pdo = new PDO($dsn, $user, $password);
    // usersテーブルからnameカラムとfuriganaカラムのデータを取得するためのSQL文を変数$sqlに代入する
    $sql = 'SELECT name, furigana FROM users';


    // SQL文を実行する
    $stmt = $pdo->query($sql);

    // SQL文の実行結果を配列で取得する
    $results = $stmt->fetchAll(PDO::FETCH_ASSOC);
} catch (PDOException $e) {
    exit($e->getMessage());
}
?>

<!DOCTYPE html>
<html lang="ja">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PHP+DB</title>
    <link rel="stylesheet" href="css/where-like.css">
</head>

<body>
<form action="where-like.php" method="get" class="search-form">
        <input type="text" placeholder="ふりがなで検索" name="keyword">
        <input type="submit" value="検索">
    </form>
<table>
        <tr>
            <th>氏名</th>
            <th>ふりがな</th>
        </tr>
        <?php
        // 配列の中身を順番に取り出し、表形式で出力する
        foreach ($results as $result) {
            echo "<tr><td>{$result['name']}</td><td>{$result['furigana']}</td></tr>";
        }
        ?>
    </table>
</body>

</html>