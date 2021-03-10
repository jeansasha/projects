package project;

public class KindsVO {
	private int kinds_code;
	private int kinds_num;
	private String kinds_name;
	private int des_code;
	//게터세터
	public int getKinds_code() {
		return kinds_code;
	}
	public void setKinds_code(int kinds_code) {
		this.kinds_code = kinds_code;
	}
	public int getKinds_num() {
		return kinds_num;
	}
	public void setKinds_num(int kinds_num) {
		this.kinds_num = kinds_num;
	}
	public String getKinds_name() {
		return kinds_name;
	}
	public void setKinds_name(String kinds_name) {
		this.kinds_name = kinds_name;
	}
	public int getDes_code() {
		return des_code;
	}
	public void setDes_code(int des_code) {
		this.des_code = des_code;
	}
	
	@Override
	public String toString() {
		return "kinds [kinds_code=" + kinds_code + ", kinds_num=" + kinds_num + ", kinds_name=" + kinds_name
				+ ", des_code=" + des_code + "]";
	}
	
	/**
	 * @param kinds_code
	 * @param kinds_num
	 * @param kinds_name
	 * @param des_code
	 */
	public KindsVO(int kinds_code, int kinds_num, String kinds_name, int des_code) {
		super();
		this.kinds_code = kinds_code;
		this.kinds_num = kinds_num;
		this.kinds_name = kinds_name;
		this.des_code = des_code;
	}
	public KindsVO() {}
	
}
