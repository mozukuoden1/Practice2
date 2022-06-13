package bean;

import java.time.LocalDate;

public class DateData {
	private String year;
	private String month;
	private String day;

	public DateData(String year, String month, String day) {
		this.year = year;
		this.month = month;
		if(month.length() == 1) {
			this.month = 0 + month;
		}
		this.day = day;
		if(day.length() == 1) {
			this.day = 0 + day;
		}
	}

	public DateData() {
		LocalDate date = LocalDate.now();
		year = new Integer(date.getYear()).toString();
		month = new Integer(date.getMonthValue()).toString();
		if(month.length() == 1) {
			this.month = 0 + month;
		}
		day = new Integer(date.getDayOfMonth()).toString();
		if(day.length() == 1) {
			this.day = 0 + day;
		}
	}

	public String getYear() {
		return year;
	}

	public void setYear(String year) {
		this.year = year;
	}

	public String getMonth() {
		return month;
	}

	public void setMonth(String month) {
		this.month = month;
	}

	public String getDay() {
		return day;
	}

	public void setDay(String day) {
		this.day = day;
	}
}
