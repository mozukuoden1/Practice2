package bean;

public class Kakeibo {
	private int recordid;
	private String date;
	private String himoku;
	private String memo;
	private int nyukin;
	private int syukkin;
	private static int zandaka;

	public Kakeibo(int recordid, String date, String himoku, String memo, int nyukin, int syukkin) {
		this.recordid = recordid;
		this.date = date;
		this.himoku = himoku;
		this.memo = memo;
		this.nyukin = nyukin;
		this.syukkin = syukkin;
	}
	public Kakeibo(String date, String himoku, String memo, int nyukin, int syukkin) {
		this.date = date;
		this.himoku = himoku;
		this.memo = memo;
		this.nyukin = nyukin;
		this.syukkin = syukkin;
	}
	public Kakeibo(int zandaka) {
		Kakeibo.zandaka =zandaka;
	}
	public Kakeibo() {

	}

	public int getRecordid() {
		return recordid;
	}
	public void setRecordid(int recordid) {
		this.recordid = recordid;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getHimoku() {
		return himoku;
	}
	public void setHimoku(String himoku) {
		this.himoku = himoku;
	}
	public String getMemo() {
		return memo;
	}
	public void setMemo(String memo) {
		this.memo = memo;
	}
	public int getNyukin() {
		return nyukin;
	}
	public void setNyukin(int nyukin) {
		this.nyukin = nyukin;
	}
	public int getSyukkin() {
		return syukkin;
	}
	public void setSyukkin(int syukkin) {
		this.syukkin = syukkin;
	}
	public int getZandaka() {
		return Kakeibo.zandaka;
	}
	public void setZandaka(int zandaka) {
		Kakeibo.zandaka = zandaka;
	}


}
