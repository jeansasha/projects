package model;

public class MainVO {
	private String main_name1;
	private String main_img1;
	private int main_code1;
	
	private String main_name2;
	private String main_img2;
	private int main_code2;
	
	private String main_name3;
	private String main_img3;
	private int main_code3;
	
	
	public int getMain_code1() {
		return main_code1;
	}



	public void setMain_code1(int main_code1) {
		this.main_code1 = main_code1;
	}



	public int getMain_code2() {
		return main_code2;
	}



	public void setMain_code2(int main_code2) {
		this.main_code2 = main_code2;
	}



	public int getMain_code3() {
		return main_code3;
	}



	public void setMain_code3(int main_code3) {
		this.main_code3 = main_code3;
	}



	public String getMain_name1() {
		return main_name1;
	}



	public void setMain_name1(String main_name1) {
		this.main_name1 = main_name1;
	}



	public String getMain_img1() {
		return main_img1;
	}



	public void setMain_img1(String main_img1) {
		this.main_img1 = main_img1;
	}



	public String getMain_name2() {
		return main_name2;
	}



	public void setMain_name2(String main_name2) {
		this.main_name2 = main_name2;
	}



	public String getMain_img2() {
		return main_img2;
	}



	public void setMain_img2(String main_img2) {
		this.main_img2 = main_img2;
	}



	public String getMain_name3() {
		return main_name3;
	}



	public void setMain_name3(String main_name3) {
		this.main_name3 = main_name3;
	}



	public String getMain_img3() {
		return main_img3;
	}



	public void setMain_img3(String main_img3) {
		this.main_img3 = main_img3;
	}



	public MainVO(int main_code1, String main_name1, String main_img1, int main_code2, String main_name2, String main_img2,int main_code3, String main_name3,
			String main_img3) {
		super();
		
		this.main_code1 = main_code1;
		this.main_name1 = main_name1;
		this.main_img1 = main_img1;
		
		this.main_code2 = main_code2;
		this.main_name2 = main_name2;
		this.main_img2 = main_img2;
		
		this.main_code3 = main_code3;
		this.main_name3 = main_name3;
		this.main_img3 = main_img3;
	}
	



	public MainVO() {}
	
}
