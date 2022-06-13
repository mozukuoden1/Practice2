<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>家計管理プロジェクト</title>
<link rel="stylesheet" href="css/style.css">
</head>
<body>

	<div id="wrapper">
		<!-- ヘッダー -->
		<header class="header">
			<div><h1 class="logo"><a href="index.jsp"><img src="img/kakeikanri_project.png" alt="家計管理プロジェクト" width="230px"></a></h1></div>
		</header>
		<!-- ヘッダーここまで -->

			<!-- メイン -->
			<main>
				<div class="login">
					<p>ログインしてください</p>
					<form action="/kakeiboproject/LoginServlet" method="post">
						<table class="mb20">
							<tr><th>ユーザーID　</th><td><input type="text" name="userid"></td></tr>
							<tr><th>パスワード　</th><td><input type="text" name="pass"></td></tr>
						</table>
						<div class="center"><input type="submit" value="ログイン" class="btn"></div>
					</form>
				</div>
				<a href="MainServlet">テストmain.jsp</a>
			</main>
			<!-- メインここまで -->

		<!-- フッター -->
		<footer class="footer">
			<p>&copy;Copyright kakeibokanri project. All rights reserved.</p>
		</footer>
		<!-- フッターここまで -->

	</div>
</body>
</html>