<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="bean.Kakeibo, bean.DateData" %>
<% Kakeibo kakeibo = (Kakeibo) request.getAttribute("kakeibo"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>【家計管理プロジェクト】削除ページ</title>
<link rel="stylesheet" href="css/style.css">
</head>
<body>
	<div id="smallwindow">
		<!-- ヘッダー -->
		<header class="header">
			<div>
				<h1 class="logo"><a href="index.jsp"><img src="img/kakeikanri_project.png" alt="家計管理プロジェクト" width="230px"></a></h1>
			</div>
			<div class="close_btn"><button onClick="closebtn()">× 閉じる</button></div>
		</header>
		<!-- ヘッダーここまで -->

		<!-- メイン -->
		<main>
			<div class="kakei_touroku">
				<h2>家計簿削除</h2>
				<p>修正したい家計簿のIDを入力し、「決定」ボタンを押した後<br>
				削除項目を確認し、「削除」ボタンを押してください</p>
				<p> ${errermessage}</p>
				<form action="/kakeiboproject/MainServlet?selectid=done&deletejsp=done" method="post">
					<table>
						<tr>
							<th>削除ID</th>
							<td class="inputid">
								<input type="text" name="recordid">　<input type="submit" value="決定">
							</td>
						</tr>
					</table>
				</form>
				<% if(kakeibo != null) { %>
					<form action="/kakeiboproject/MainServlet?delete=done" method="post" onSubmit="return clickalert()">
						<table class="kakei_t">
							<tr>
								<th>ID</th><td>${kakeibo.recordid}<input type="hidden" name="deleteid" value="${kakeibo.recordid}"></td>
							</tr>
							<tr>
								<th>日付</th><td>${kakeibo.date}</td>
							</tr>
							<tr>
								<th>費目</th><td>${kakeibo.himoku}</td>
							</tr>
							<tr>
								<th>メモ</th><td>${kakeibo.memo}</td>
							</tr>
							<tr>
								<th>入金</th><td>${kakeibo.nyukin}</td>
							</tr>
							<tr>
								<th>出金</th><td>${kakeibo.syukkin}</td>
							</tr>
						</table>

						<div class="center">
							<input type="submit" value="　　削 除　　" class="btn">
						</div>
					</form>
				<% } %>
			</div>
		</main>
		<!-- メインここまで -->

		<!-- フッター -->
		<footer class="footer">
			<p>&copy;Copyright kakeibokanri project. All rights reserved.</p>
		</footer>
		<!-- フッターここまで -->
	</div>
	<script type="text/javascript" src="js/script.js"></script>
</body>
</html>