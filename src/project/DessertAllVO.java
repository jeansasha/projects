package project;

import java.util.ArrayList;
import java.util.List;

public class DessertAllVO {
	private List<Integer> des_code = new ArrayList<Integer>();

	public List<Integer> getDes_code() {
		return des_code;
	}

	public void setDes_code(List<Integer> des_code) {
		this.des_code = des_code;
	}
	
	public DessertAllVO(List<Integer> params) {
		this.des_code.addAll(params);
	}
	
}
