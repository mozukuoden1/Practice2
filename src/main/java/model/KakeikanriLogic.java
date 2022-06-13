package model;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import bean.Kakeibo;
import dao.KakeiboDao;

public class KakeikanriLogic {
	public void create(Kakeibo kakeibo) {

		KakeiboDao kakeiboDao = new KakeiboDao();
		kakeiboDao.create(kakeibo);
	}

	public List<Kakeibo> find() {//絞り込み機能なし:直近28日分のデータの抽出

		List<Kakeibo> kakeibolist = new ArrayList();
		KakeiboDao kakeibodao = new KakeiboDao();

		LocalDate localdate =  LocalDate.now();
		DateTimeFormatter fmt = DateTimeFormatter.ofPattern("yyyyMMdd");

		String end = localdate.plusDays(1).format(fmt);
		String begin = localdate.minusDays(27).format(fmt);

		kakeibolist = kakeibodao.find(begin, end);

		return kakeibolist;
	}

	public List<Kakeibo> find(String year, String month) {//絞り込み機能あり:指定月のデータを抽出

		List<Kakeibo> kakeibolist = new ArrayList();
		KakeiboDao kakeibodao = new KakeiboDao();

		LocalDate localdate = LocalDate.of(Integer.parseInt(year), Integer.parseInt(month), 01);
		DateTimeFormatter fmt = DateTimeFormatter.ofPattern("yyyyMMdd");

		String begin = localdate.minusDays(1).format(fmt);
		String end = localdate.plusMonths(1).format(fmt);

		kakeibolist = kakeibodao.find(begin, end);

		return kakeibolist;
	}

	public Kakeibo calcZandaka() {

		KakeiboDao kakeibodao = new KakeiboDao();
		Kakeibo kakeibo = null;

		kakeibo = kakeibodao.calcZandaka().get(0);
		return kakeibo;
	}

	public Kakeibo selectData(String id) {

		KakeiboDao kakeibodao = new KakeiboDao();
		Kakeibo kakeibo = null;

		kakeibo = kakeibodao.selectData(id);
		return kakeibo;
	}

	public void kakeiboUpdate(Kakeibo kakeibo) {

		KakeiboDao kakeibodao = new KakeiboDao();
		kakeibodao.kakeiboUpdate(kakeibo);
	}

	public void recordDelete(String id) {

		KakeiboDao kakeibodao = new KakeiboDao();
		kakeibodao.recordDelete(id);
	}
}
