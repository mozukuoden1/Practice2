package model;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

import javax.servlet.http.HttpServletRequest;

import bean.Kakeibo;

public class DataControllerLogic {

	public Kakeibo kakeiboData(HttpServletRequest request) {
		//入力されたデータからDAOで使用できるオブジェクトを生成

		Kakeibo kakeibo = null;

		String year = request.getParameter("date_year");
		year = this.retrieveNum(year);

		String month = request.getParameter("date_month");
		month = this.retrieveNum(month);
		month = (month.length() < 2)? "0" + month : month;

		String day = request.getParameter("date_day");
		day = this.retrieveNum(day);
		day = (day.length() < 2)? "0" + day : day;

		String date = year + month + day;
		String himoku = request.getParameter("himoku");
		String memo = request.getParameter("memo").replaceAll("[;\"\',]", "-");

		int nyukin;
		if(request.getParameter("nyukin") == null || request.getParameter("nyukin") == "") {
			 nyukin = 0;
		} else {
			nyukin = Integer.parseInt(request.getParameter("nyukin"));
		}

		int syukkin;
		if(request.getParameter("syukkin") == null || request.getParameter("syukkin") == "") {
			 syukkin = 0;
		} else {
			syukkin = Integer.parseInt(request.getParameter("syukkin"));
		}

		kakeibo = new Kakeibo(date, himoku, memo, nyukin, syukkin);
		return kakeibo;
	}

	public String retrieveNum(String str) {
		String result = null;
		while(str.matches("^[a-z].*")) {
			str = str.substring(1);
		}
		return result = str;
	}

	public Kakeibo dateFormat(Kakeibo kakeibo) {
		//出力される日付の書式を「yyyy-MM-dd」に変更する
		LocalDate localdate = LocalDate.of(Integer.parseInt(
				kakeibo.getDate().substring(0, 4)),Integer.parseInt(kakeibo.getDate().substring(4, 6)), Integer.parseInt(kakeibo.getDate().substring(6, 8)));
		DateTimeFormatter fmt = DateTimeFormatter.ofPattern("yyyy-MM-dd");

		kakeibo.setDate(localdate.format(fmt));
		return kakeibo;
	}

	public String himokuChange(String himokunum) {
		//引数「himokunum」の値は「H01」などの文字列 「H00」は存在しない
		String[] himokus = {"ダミー", "給与", "住宅費", "食費", "日用品", "交通費", "おこづかい", "水道光熱費", "その他"};
		himokunum = himokunum.substring(1).startsWith("0") ? himokunum.substring(2) : himokunum.substring(1);
		String himoku = himokus[Integer.parseInt(himokunum)];

		return himoku;
	}
}
