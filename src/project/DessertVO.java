package project;

public class DessertVO {
	private int des_code;
	private String des_name;
	private String des_rec;
	private String des_comment;
	private String des_img;
	private String des_mete;
	private String des_summ;
	private String des_link1;
	private String des_link2;
	private String des_link3;
	
	//게터세터

	public int getDes_code() {
		return des_code;
	}

	public void setDes_code(int des_code) {
		this.des_code = des_code;
	}

	public String getDes_name() {
		return des_name;
	}

	public void setDes_name(String des_name) {
		this.des_name = des_name;
	}

	public String getDes_rec() {
		return des_rec;
	}

	public void setDes_rec(String des_rec) {
		this.des_rec = des_rec;
	}

	public String getDes_comment() {
		return des_comment;
	}

	public void setDes_comment(String des_comment) {
		this.des_comment = des_comment;
	}

	public String getDes_img() {
		return des_img;
	}

	public void setDes_img(String des_img) {
		this.des_img = des_img;
	}

	public String getDes_mete() {
		return des_mete;
	}

	public void setDes_mete(String des_mete) {
		this.des_mete = des_mete;
	}

	public String getDes_summ() {
		return des_summ;
	}

	public void setDes_summ(String des_summ) {
		this.des_summ = des_summ;
	}

	public String getDes_link1() {
		return des_link1;
	}

	public void setDes_link1(String des_link1) {
		this.des_link1 = des_link1;
	}

	public String getDes_link2() {
		return des_link2;
	}

	public void setDes_link2(String des_link2) {
		this.des_link2 = des_link2;
	}

	public String getDes_link3() {
		return des_link3;
	}

	public void setDes_link3(String des_link3) {
		this.des_link3 = des_link3;
	}
	
	@Override
	public String toString() {
		return "DessertVO [des_code=" + des_code + ", des_name=" + des_name + ", des_rec=" + des_rec + ", des_comment="
				+ des_comment + ", des_img=" + des_img + ", des_mete=" + des_mete + ", des_summ=" + des_summ
				+ ", des_link1=" + des_link1 + ", des_link2=" + des_link2 + ", des_link3=" + des_link3 + "]";
	}

	/**
	 * @param des_code
	 * @param des_name
	 * @param des_rec
	 * @param des_comment
	 * @param des_img
	 * @param des_mete
	 * @param des_summ
	 * @param des_link1
	 * @param des_link2
	 * @param des_link3
	 */
	public DessertVO(int des_code, String des_name, String des_rec, String des_comment, String des_img, String des_mete,
			String des_summ, String des_link1, String des_link2, String des_link3) {
		super();
		this.des_code = des_code;
		this.des_name = des_name;
		this.des_rec = des_rec;
		this.des_comment = des_comment;
		this.des_img = des_img;
		this.des_mete = des_mete;
		this.des_summ = des_summ;
		this.des_link1 = des_link1;
		this.des_link2 = des_link2;
		this.des_link3 = des_link3;
	}

	public DessertVO() {}
	
}
