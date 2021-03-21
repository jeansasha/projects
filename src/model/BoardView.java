package model;

import java.util.Date;

public class BoardView extends BoardVO {

	private int cmtCount;
	private int num;
	public int getCmtCount() {
		return cmtCount;
	}

	public void setCmtCount(int cmtCount) {
		this.cmtCount = cmtCount;
	}

	public int getnum() {
		return num;
	}

	public void setNUM(int num) {
		this.num = num;
	}


	public BoardView(int num, int b_no, String b_title, Date b_date, int b_view, int b_commview, String mem_name,
			int cmtCount) {
		super(b_no, b_title, b_date, b_view, b_commview, mem_name);

		this.cmtCount = cmtCount;
		this.num = num;
	}

}
