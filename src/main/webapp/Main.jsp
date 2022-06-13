<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="bean.Kakeibo, java.util.List" %>
<%
List<Kakeibo> kakeibolist = (List<Kakeibo>) session.getAttribute("kakeibolist");
%>
<% Kakeibo kakeibozandaka = (Kakeibo) session.getAttribute("kakeibozandaka"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>【家計管理プロジェクト】メインページ</title>
<link rel="stylesheet" href="css/style.css">
</head>
<body onload="setSelectDate()">
	<div id="wrapper">
		<!-- ヘッダー -->
		<header class="header">
			<div>
				<h1 class="logo"><a href="index.jsp"><img src="img/kakeikanri_project.png" alt="家計管理プロジェクト" width="230px"></a></h1>
				<nav class="nav">
					<ul>
						<li><a href="Regist.jsp">登録</a></li>
						<li><a href="Main.jsp">家計簿</a></li>
						<li><a href="index.jsp">TOP</a></li>
					</ul>
				</nav>
			</div>
		</header>
		<!-- ヘッダーここまで -->

		<!-- メイン -->
		<main>
			<h2>家計簿</h2>
			<p> ${datemessage }</p>
			<form action="/kakeiboproject/MainServlet" method="post" class="shiborikomi">
				<select name="kikan_toshi" id="kikan_toshi"></select>
				<select name="kikan_tsuki" id="kikan_tsuki"></select>
				<input type="submit" value="絞り込み">
			</form>

			<table class="kakei_t">
				<tr>
					<th>ID</th>
					<th>日付</th>
					<th>費目</th>
					<th>メモ</th>
					<th>入金</th>
					<th>出金</th>
				</tr>
				<% for(Kakeibo kakeibo : kakeibolist) { %>
				<tr>
					<td><%= kakeibo.getRecordid() %></td>
					<td><%= kakeibo.getDate() %></td>
					<td><%= kakeibo.getHimoku() %></td>
					<td><%= kakeibo.getMemo() %></td>
					<td><%= String.format("%,d", kakeibo.getNyukin())  %></td>
					<td><%= String.format("%,d", kakeibo.getSyukkin()) %></td>
				</tr>
				<% } %>
				<tr>
					<td>2</td>
					<td>2022-04-21</td>
					<td>住宅費</td>
					<td>4月の住宅費</td>
					<td>0</td>
					<td>100,000</td>
				</tr>
				<tr>
					<td>3</td>
					<td>2022-04-22</td>
					<td>日用品</td>
					<td>薬</td>
					<td>0</td>
					<td>1,200</td>
				</tr>
			</table>
			<div class="zansaka"><span>残高</span> <%= String.format("%,d",kakeibolist.get(0).getZandaka()) %></div>

			<div class="btn_area">
				<a href="Regist.jsp"><div class="page_btn">　登 録　 &#8811</div></a>
				<a href="javascript:subwin_up();"><div class="page_btn">修 正 &#8811</div></a>
				<a href="javascript:subwin_del();"><div class="page_btn">削 除 &#8811</div></a>
			</div>

		</main>
		<!-- メインここまで -->

		<!-- フッター -->
		<footer class="footer">
			<p>&copy;Copyright kakeibokanri project. All rights reserved.</p>
            <a href="#wrapper" id="topbtn">&#8613</a>
		</footer>
		<!-- フッターここまで -->
	</div>
	<script type="text/javascript" src="js/script.js"></script>
</body>
</html>