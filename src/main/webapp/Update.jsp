<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="bean.Kakeibo, bean.DateData" %>
<% Kakeibo kakeibo = (Kakeibo) request.getAttribute("kakeibo"); %>
<% DateData datedata = (DateData) request.getAttribute("datedata"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>【家計管理プロジェクト】修正ページ</title>
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
				<h2>家計簿修正</h2>
				<p>修正したい家計簿のIDを入力し、「決定」ボタンを押した後<br>
				修正してください</p>
				<p id="errermessage"> ${errermessage }</p>
				<form action="/kakeiboproject/MainServlet?selectid=done" method="post">
					<table>
						<tr>
							<th>修正ID</th>
							<td class="inputid">
								<input id="selectUpdateId" type="text" name="recordid">　<input type="submit" value="決定">
							</td>
						</tr>
					</table>
				</form>
				<form action="/kakeiboproject/MainServlet?update=done" method="post">

					<table>
						<tr>
							<th>ID</th>
							<td>${kakeibo.recordid} <input id="updateId" type="hidden" name="id" value="${kakeibo.recordid}"></td>
						</tr>
						<tr>
							<th>日付</th>
							<td>
								<select id="date_year" name="date_year">

									<option value="year2022" <% if(datedata != null && datedata.getYear().equals("2022")) { %> selected <% } %>>2022</option>
									<option value="year2023" <% if(datedata != null && datedata.getYear().equals("2023")) { %> selected <% } %>>2023</option>
									<option value="year2024" <% if(datedata != null && datedata.getYear().equals("2024")) { %> selected <% } %>>2024</option>
								</select>年　
								<select id="date_month" name="date_month">
									<option value="month01" <% if(datedata != null && datedata.getMonth().equals("01")) { %> selected <% } %>>01</option>
									<option value="month02" <% if(datedata != null && datedata.getMonth().equals("02")) { %> selected <% } %>>02</option>
									<option value="month03" <% if(datedata != null && datedata.getMonth().equals("03")) { %> selected <% } %>>03</option>
									<option value="month04" <% if(datedata != null && datedata.getMonth().equals("04")) { %> selected <% } %>>04</option>
									<option value="month05" <% if(datedata != null && datedata.getMonth().equals("05")) { %> selected <% } %>>05</option>
									<option value="month06" <% if(datedata != null && datedata.getMonth().equals("06")) { %> selected <% } %>>06</option>
									<option value="month07" <% if(datedata != null && datedata.getMonth().equals("07")) { %> selected <% } %>>07</option>
									<option value="month08" <% if(datedata != null && datedata.getMonth().equals("08")) { %> selected <% } %>>08</option>
									<option value="month09" <% if(datedata != null && datedata.getMonth().equals("09")) { %> selected <% } %>>09</option>
									<option value="month10" <% if(datedata != null && datedata.getMonth().equals("10")) { %> selected <% } %>>10</option>
									<option value="month11" <% if(datedata != null && datedata.getMonth().equals("11")) { %> selected <% } %>>11</option>
									<option value="month12" <% if(datedata != null && datedata.getMonth().equals("12")) { %> selected <% } %>>12</option>
								</select>月　
								<select id="date_day" name="date_day">
									<option value="day01" <% if(datedata != null && datedata.getDay().equals("01")) { %> selected <% } %>>01</option>
									<option value="day02" <% if(datedata != null && datedata.getDay().equals("02")) { %> selected <% } %>>02</option>
									<option value="day03" <% if(datedata != null && datedata.getDay().equals("03")) { %> selected <% } %>>03</option>
									<option value="day04" <% if(datedata != null && datedata.getDay().equals("04")) { %> selected <% } %>>04</option>
									<option value="day05" <% if(datedata != null && datedata.getDay().equals("05")) { %> selected <% } %>>05</option>
									<option value="day06" <% if(datedata != null && datedata.getDay().equals("06")) { %> selected <% } %>>06</option>
									<option value="day07" <% if(datedata != null && datedata.getDay().equals("07")) { %> selected <% } %>>07</option>
									<option value="day08" <% if(datedata != null && datedata.getDay().equals("08")) { %> selected <% } %>>08</option>
									<option value="day09" <% if(datedata != null && datedata.getDay().equals("09")) { %> selected <% } %>>09</option>
									<option value="day10" <% if(datedata != null && datedata.getDay().equals("10")) { %> selected <% } %>>10</option>
									<option value="day11" <% if(datedata != null && datedata.getDay().equals("11")) { %> selected <% } %>>11</option>
									<option value="day12" <% if(datedata != null && datedata.getDay().equals("12")) { %> selected <% } %>>12</option>
									<option value="day13" <% if(datedata != null && datedata.getDay().equals("13")) { %> selected <% } %>>13</option>
									<option value="day14" <% if(datedata != null && datedata.getDay().equals("14")) { %> selected <% } %>>14</option>
									<option value="day15" <% if(datedata != null && datedata.getDay().equals("15")) { %> selected <% } %>>15</option>
									<option value="day16" <% if(datedata != null && datedata.getDay().equals("16")) { %> selected <% } %>>16</option>
									<option value="day17" <% if(datedata != null && datedata.getDay().equals("17")) { %> selected <% } %>>17</option>
									<option value="day18" <% if(datedata != null && datedata.getDay().equals("18")) { %> selected <% } %>>18</option>
									<option value="day19" <% if(datedata != null && datedata.getDay().equals("19")) { %> selected <% } %>>19</option>
									<option value="day20" <% if(datedata != null && datedata.getDay().equals("20")) { %> selected <% } %>>20</option>
									<option value="day21" <% if(datedata != null && datedata.getDay().equals("21")) { %> selected <% } %>>21</option>
									<option value="day22" <% if(datedata != null && datedata.getDay().equals("22")) { %> selected <% } %>>22</option>
									<option value="day23" <% if(datedata != null && datedata.getDay().equals("23")) { %> selected <% } %>>23</option>
									<option value="day24" <% if(datedata != null && datedata.getDay().equals("24")) { %> selected <% } %>>24</option>
									<option value="day25" <% if(datedata != null && datedata.getDay().equals("25")) { %> selected <% } %>>25</option>
									<option value="day26" <% if(datedata != null && datedata.getDay().equals("26")) { %> selected <% } %>>26</option>
									<option value="day27" <% if(datedata != null && datedata.getDay().equals("27")) { %> selected <% } %>>27</option>
									<option value="day28" <% if(datedata != null && datedata.getDay().equals("28")) { %> selected <% } %>>28</option>
									<option value="day29" <% if(datedata != null && datedata.getDay().equals("29")) { %> selected <% } %>>29</option>
									<option value="day30" <% if(datedata != null && datedata.getDay().equals("30")) { %> selected <% } %>>30</option>
									<option value="day31" <% if(datedata != null && datedata.getDay().equals("31")) { %> selected <% } %>>31</option>
								</select>日
							</td>
						</tr>
						<tr>
							<th>費目</th>
							<td>
								<select id="himoku" name="himoku">
									<option value="H01" <% if(kakeibo != null && kakeibo.getHimoku().equals("給与")) { %> selected <% } %>>給与</option>
									<option value="H02" <% if(kakeibo != null && kakeibo.getHimoku().equals("住宅費")) { %> selected <% } %>>住宅費</option>
									<option value="H03" <% if(kakeibo != null && kakeibo.getHimoku().equals("食費")) { %> selected <% } %>>食費</option>
									<option value="H04" <% if(kakeibo != null && kakeibo.getHimoku().equals("日用品")) { %> selected <% } %>>日用品</option>
									<option value="H05" <% if(kakeibo != null && kakeibo.getHimoku().equals("交通費")) { %> selected <% } %>>交通費</option>
									<option value="H06" <% if(kakeibo != null && kakeibo.getHimoku().equals("おこずかい")) { %> selected <% } %>>おこづかい</option>
									<option value="H07" <% if(kakeibo != null && kakeibo.getHimoku().equals("水道光熱費")) { %> selected <% } %>>水道光熱費</option>
									<option value="H08" <% if(kakeibo != null && kakeibo.getHimoku().equals("その他")) { %> selected <% } %>>その他</option>
								</select>
							</td>
						</tr>
						<tr>
							<th>メモ</th>
							<td>
								<input type="text" name="memo" <% if(kakeibo != null && kakeibo.getMemo() != null) { %> value="${kakeibo.memo}" <% } %>>
							</td>
						</tr>
						<tr>
							<th>入金額</th>
							<td>
								<input id="nyukin" type="number" name="nyukin" <% if(kakeibo != null) { %> value="${kakeibo.nyukin}" <% } %> min="0"> <!-- 入出金がnullのレコードは登録できないのでnyukin,syukkinがnullの場合は考慮せず -->
							</td>
						</tr>
						<tr>
							<th>出金額</th>
							<td>
								<input id="syukkin" type="number" name="syukkin" <% if(kakeibo != null) { %> value="${kakeibo.syukkin}" <% } %> min="0">
							</td>
						</tr>
					</table>



					<div class="center">
						<input id="update" type="submit" value="　　修 正　　" class="btn" onClick="return inputCheck()">
					</div>
				</form>
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