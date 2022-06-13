<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List, bean.Kakeibo, bean.DateData" %>

<% List<Kakeibo> addkakeibo = (List<Kakeibo>) session.getAttribute("addkakeibo"); %>
<% DateData datedata = (DateData) request.getAttribute("datedata"); %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>【家計管理プロジェクト】登録ページ</title>
<link rel="stylesheet" href="css/style.css">
</head>
<body>
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
			<div class="kakei_touroku">
				<h2>家計簿登録</h2>
				<p id="errermessage"> ${errermessage }</p>
				<form action="/kakeiboproject/MainServlet?action=done" method="post" onSubmit="createCookie()">
					<table>
						<tr>
							<th>日付</th>
							<td>
								<select id="date_year" name="date_year"></select> 年　
								<select id="date_month" name="date_month"></select> 月　
								<select id="date_day" name="date_day"></select> 日

								<!-- <select id="date_year" name="date_year"></select>年　
								<select id="date_month" name="date_month"></select>月　
								<select id="date_day" name="date_day"></select>日 -->
								<!-- <select id="date_year" name="date_year">
									<option value="year2022">2022</option>
									<option value="year2023">2023</option>
									<option value="year2024">2024</option>
								</select>年　
								<select id="date_month" name="date_month">
									<option value="month01">01</option>
									<option value="month02">02</option>
									<option value="month03">03</option>
									<option value="month04">04</option>
									<option value="month05">05</option>
									<option value="month06">06</option>
									<option value="month07">07</option>
									<option value="month08">08</option>
									<option value="month09">09</option>
									<option value="month10">10</option>
									<option value="month11">11</option>
									<option value="month12">12</option>
								</select>月　
								<select id="date_day" name="date_day">
									<option value="day01">01</option>
									<option value="day02">02</option>
									<option value="day03">03</option>
									<option value="day04">04</option>
									<option value="day05">05</option>
									<option value="day06">06</option>
									<option value="day07">07</option>
									<option value="day08">08</option>
									<option value="day09">09</option>
									<option value="day10">10</option>
									<option value="day11">11</option>
									<option value="day12">12</option>
									<option value="day13">13</option>
									<option value="day14">14</option>
									<option value="day15">15</option>
									<option value="day16">16</option>
									<option value="day17">17</option>
									<option value="day18">18</option>
									<option value="day19">19</option>
									<option value="day20">20</option>
									<option value="day21">21</option>
									<option value="day22">22</option>
									<option value="day23">23</option>
									<option value="day24">24</option>
									<option value="day25">25</option>
									<option value="day26">26</option>
									<option value="day27">27</option>
									<option value="day28">28</option>
									<option value="day29">29</option>
									<option value="day30">30</option>
									<option value="day31">31</option>
								</select>日 -->
							</td>
						</tr>
						<tr>
							<th>費目</th>
							<td>
								<select id="himoku" name="himoku">
									<option value="H01">給与</option>
									<option value="H02">住宅費</option>
									<option value="H03">食費</option>
									<option value="H04">日用品</option>
									<option value="H05">交通費</option>
									<option value="H06">おこづかい</option>
									<option value="H07">水道光熱費</option>
									<option value="H08">その他</option>
								</select>
							</td>
						</tr>
						<tr>
							<th>メモ</th>
							<td>
								<input type="text" name="memo">
							</td>
						</tr>
						<tr>
							<th>入金額</th>
							<td>
								<input id="nyukin" type="number" name="nyukin" value="0" min="0">
							</td>
						</tr>
						<tr>
							<th>出金額</th>
							<td>
								<input id="syukkin" type="number" name="syukkin" value="0" min="0">
							</td>
						</tr>
					</table>



					<div class="center">
						<input id="regist" type="submit" value="　　登 録　　" class="btn"  onClick="return inputCheck()">
						<input id="reset" type="reset" value="リセット" class="btn reset">
					</div>
				</form>
			</div>

				<table class="kakei_t">

					<tr>
						<th>日付</th>
						<th>費目</th>
						<th>メモ</th>
						<th>入金</th>
						<th>出金</th>
					</tr>
				<% if(addkakeibo != null) { %>
					<% for(Kakeibo kakeibo : addkakeibo) { %>
					<tr>
						<td><%= kakeibo.getDate() %></td>
						<td><%= kakeibo.getHimoku() %></td>
						<td><%= kakeibo.getMemo() %></td>
						<td><%= kakeibo.getNyukin() %></td>
						<td><%= kakeibo.getSyukkin() %></td>
					</tr>
					<% } %>
				<% } %>
					<tr>
						<td>2022-04-21</td>
						<td>住宅費</td>
						<td>4月の住宅費</td>
						<td>0</td>
						<td>100,000</td>
					</tr>
				</table>

			<div class="btn_area"><a href="/kakeiboproject/MainServlet?check=done"><div class="page_btn">&#8810 家計簿メインに戻る</div></a></div>
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