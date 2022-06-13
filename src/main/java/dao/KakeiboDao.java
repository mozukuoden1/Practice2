package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import bean.Kakeibo;


public class KakeiboDao {
	public void create(Kakeibo kakeibo) {

		try(Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/kakeikanri_db?serverTimezone=JST","root","root")){

			String sql = "INSERT INTO kakeibo_t VALUES " +
						"('" + kakeibo.getDate() + "', " + 01 + ", '" + kakeibo.getMemo() + "', " + kakeibo.getNyukin() + " , " +  kakeibo.getSyukkin() + ");";
			PreparedStatement pStmt = conn.prepareStatement(sql);
			System.out.println(sql);
			pStmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public List<Kakeibo> find() {
		List<Kakeibo> kakeibolist = new ArrayList();
		Kakeibo kakeibo = null;

		try(Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/kakeikanri_db?serverTimezone=JST","root","root")){

			String sql = "SELECT * FROM kakeibo_t;";
			PreparedStatement pStmt = conn.prepareStatement(sql);

			ResultSet rs = pStmt.executeQuery();

			while(rs.next()) {
				String date = rs.getString("HIDSUKE_C");
				String himoku = rs.getString("HIMOKUID_C");
				String memo = rs.getString("MEMO_C");
				int nyukin = rs.getInt("NYUUKIN_C");
				int syukkin = rs.getInt("SHUKKIN_C");

				kakeibo = new Kakeibo(6789, date, himoku, memo, nyukin, syukkin);
				kakeibolist.add(kakeibo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return kakeibolist;
	}

	public List<Kakeibo> find(String begin, String end) {
		List<Kakeibo> kakeibolist = new ArrayList();
		Kakeibo kakeibo = null;

		try(Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/kakeikanri_db?serverTimezone=JST","root","root")){

			String sql = "SELECT * FROM kakeibo_t " +
					"WHERE HIDSUKE_C > " + begin + " AND HIDSUKE_C < " +  end;
			PreparedStatement pStmt = conn.prepareStatement(sql);
			System.out.println(sql);

			ResultSet rs = pStmt.executeQuery();

			while(rs.next()) {
				String date = rs.getString("HIDSUKE_C");
				String himoku = rs.getString("HIMOKUID_C");
				String memo = rs.getString("MEMO_C");
				int nyukin = rs.getInt("NYUUKIN_C");
				int syukkin = rs.getInt("SHUKKIN_C");

				kakeibo = new Kakeibo(1234, date, himoku, memo, nyukin, syukkin);
				kakeibolist.add(kakeibo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return kakeibolist;
	}

	public Kakeibo selectData(String id) {
		Kakeibo kakeibo = null;

		System.out.println("dao.selectdata:" + id);
		kakeibo = new Kakeibo(Integer.parseInt(id), "2023-04-28", "その他", "テスト", 0, 0);
		//kakeibo = new Kakeibo(Integer.parseInt(id), "2023-04-28", "その他", "テスト", 0, 0);
		return kakeibo;
	}

	public void kakeiboUpdate(Kakeibo kakeibo) {

		System.out.println("アップデート ID:" + kakeibo.getRecordid());
		System.out.println("アップデート 日付:" + kakeibo.getDate());
		System.out.println("アップデート 費目:" + kakeibo.getHimoku());
		System.out.println("アップデート 入金:" + kakeibo.getNyukin());
		System.out.println("アップデート 出金:" + kakeibo.getSyukkin());
	}
	public List<Kakeibo> calcZandaka() {
		List<Kakeibo> kakeibolist = new ArrayList();
		Kakeibo kakeibo = new Kakeibo(5000000);

		kakeibolist.add(kakeibo);
		return kakeibolist;
	}

	public void recordDelete(String id) {
		System.out.println("dao:デリートテスト実行 id:" + id);
	}
}
