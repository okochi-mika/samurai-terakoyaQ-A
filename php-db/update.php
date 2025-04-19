<?php
$dsn = 'mysql:dbname=php_db;host=localhost;charset=utf8mb4';
$user = 'root';
$password = 'root';

// submitパラメータの値が存在するとき（「登録」ボタンを押したとき）の処理
if (isset($_POST['submit'])) {
    try {
        $pdo = new PDO($dsn, $user, $password);

        // 動的に変わる値をプレースホルダに置き換えたINSERT文をあらかじめ用意する
        $sql = '
            INSERT INTO users (name, furigana, email, age, address)
            VALUES (:name, :furigana, :email, :age, :address)
        ';
        $stmt = $pdo->prepare($sql);

        // bindValue()メソッドを使って実際の値をプレースホルダにバインドする（割り当てる）
        $stmt->bindValue(':name', $_POST['user_name'], PDO::PARAM_STR);
        $stmt->bindValue(':furigana', $_POST['user_furigana'], PDO::PARAM_STR);
        $stmt->bindValue(':email', $_POST['user_email'], PDO::PARAM_STR);
        $stmt->bindValue(':age', $_POST['user_age'], PDO::PARAM_INT);
        $stmt->bindValue(':address', $_POST['user_address'], PDO::PARAM_STR);

        // SQL文を実行する
        $stmt->execute();

        // header()関数を使ってselect.phpにリダイレクトさせる
        header('Location: select.php');
    } catch (PDOException $e) {
        exit($e->getMessage());
    }
}

// idのパラメータの値が存在すれば処理を行う
if (isset($_GET['id'])) {
  try {
    $pdo = new PDO($dsn, $user, $password);

    // idカラムの値をプレースホルダ(:id)に置き換えたSQL文をあらかじめ用意する
    $sql = 'SELECT * FROM users WHERE id = :id';
    $stmt = $pdo->prepare($sql);

    // bindValue()メソッドを使って実際の値をブレースホルダにバインドする（割り当てる）
    $stmt->bindValue(':id', $_GET['id'], PDO::PARAM_INT);

    //SQL文を実行する
    $stmt->execute();

    // SQL文の実行結果を配列で取得する
    // 補足：1のレコード（横一列のデータ）のみ取得したい場合、fetch（）メソッドを使えば絡むめいがキーになった１次元配列を取得できる
    $user = $stmt->fetch(PDO::FETCH_ASSOC);

    // idのパラメータの値と同じidのデータが存在しない場合はエラーメッセージを表示して処理を終了する
    // 補足：fetch()メソッドは実行結果が崇得できなかった場合にFALSEを返す
    if ($user === FALSE) {
        exit('idパラメータの値が不正です。');
    }
  } catch (PDOException $e) {
    exit($e->getMessage());
  }
} else {
  // idパラメータの値が存在しない場合はエラーメッセージを表示させて処理を提出する
  exit('idパラメータが存在しません。');
}
?>

<!DOCTYPE html>
<html lang="ja">

<head>
   <meta charset="UTF-8">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>PHP+DB</title>
   <link rel="stylesheet" href="css/style.css">
</head>

<body>
   <h1>ユーザー更新</h1>
   <p>更新する内容をを入力してください。</p>

   <form action="updeta.php" method="post">
  <div class="form-group">
    <label for="user_name">お名前 <span class="required">【必須】</span></label>
    <input type="text" id="user_name" name="user_name" value="<?= $user['name'] ?>" maxlength="60" required>
  </div>

  <div class="form-group">
    <label for="user_furigana">ふりがな <span class="required">【必須】</span></label>
    <input type="text" id="user_furigana" name="user_furigana" value="<?= $user['furigana'] ?>" maxlength="60" required>
  </div>

  <div class="form-group">
    <label for="user_email">メールアドレス <span class="required">【必須】</span></label>
    <input type="email" id="user_email" name="user_email" value="<?= $user['email'] ?>" maxlength="255" required>
  </div>

  <div class="form-group">
    <label for="user_age">年齢</label>
    <input type="number" id="user_age" name="user_age" value="<?= $user['age'] ?>" min="13" max="130">
  </div>

  <div class="form-group">
    <label for="user_address">住所</label>
    <input type="text" id="user_address" name="user_address" value="<?= $user['address'] ?>" maxlength="255
  </div>

  <div style="text-align: center;">
  <button class="submit-btn" type="submit" name="submit" value="insert">更新</button>
  </div>

</form>


</body>

</html>