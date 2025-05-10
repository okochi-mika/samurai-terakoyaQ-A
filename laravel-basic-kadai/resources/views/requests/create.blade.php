<!DOCTYPE html>
<html lang="ja">

<head>
   <meta charset="UTF-8">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>Laravel基礎</title>
</head>

<body>
   <h1>投稿作成</h1>
   <form action="{{ route('requests.confirm') }}" method="POST">
       @csrf
       <table>
           <tr>
               <th>タイトル</th>
               <td>
                   <input type="text" name="title">
               </td>
           </tr>
            <tr>
                <th>本文</th>
                <td>                     
                    <textarea name="content" cols="30" rows="10"></textarea>
                </td>
            </tr>      
       </table>
       <input type="submit" value="投稿">
   </form>
</body>

</html>