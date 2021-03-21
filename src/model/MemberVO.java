package model;

public class MemberVO {
	private int virtual1;
	private int mem_code;
	private String virtual;
	private String mem_name;
	private String mem_id;
	private String mem_pwd;
	private String mem_num;
	private String mem_rec;
	
	
	
//	생성자
	
	

//signup
	public MemberVO( String mem_name, String mem_id, String mem_pwd, String mem_num) {
		super();

		this.mem_name = mem_name;
		this.mem_id = mem_id;
		this.mem_pwd = mem_pwd;
		this.mem_num = mem_num;
	
	}
	public MemberVO(String mem_id, String mem_pwd, int mem_code, String mem_name) {
		super();
		this.mem_id = mem_id;
		this.mem_pwd = mem_pwd;
		this.mem_code = mem_code;
		this.mem_name = mem_name;
	}
	public MemberVO() {}

//	delete
	public MemberVO(String mem_id, String mem_pwd ,String virtual) {
		super();
		this.mem_id = mem_id;
		this.mem_pwd = mem_pwd;
		this.virtual = virtual;
	}
	

	//	login X
	public MemberVO(String mem_id, String mem_pwd) {
	      super();
	      this.mem_id = mem_id;
	      this.mem_pwd = mem_pwd;
	   }
	
//	idcheck
	public MemberVO(String mem_id) {
	      super();
	      this.mem_id = mem_id;
	}
	
//	update
	public MemberVO(int mem_code, String mem_pwd, String mem_num ,String mem_id) {
		super();
		this.mem_code = mem_code;
		this.mem_pwd = mem_pwd;
		this.mem_num = mem_num;
		this.mem_id = mem_id;
	}
	   
	/**
	 * @param mem_code
	 * @param mem_name
	 * @param mem_id
	 * @param mem_pwd
	 * @param mem_num
	 * @param des_code
	 */
//	로그인시 d_member 의 모든 정보를 vo에 넣어줍니다.
	public MemberVO(int mem_code, String mem_name, String mem_id, String mem_pwd, String mem_num, String mem_rec) {
		super();
		this.mem_name = mem_name;
		this.mem_id = mem_id;
		this.mem_pwd = mem_pwd;
		this.mem_num = mem_num;
		this.mem_code = mem_code;
		this.mem_rec = mem_rec;

	}
	//게터세터
	public String getVirtual() {
		return virtual;
	}
	public void setVirtual(String virtual) {
		this.virtual = virtual;
	}
	public int getVirtual1() {
		return virtual1;
	}
	
	public void setVirtual1(int virtual1) {
		this.virtual1 = virtual1;
	}
	public String getMem_rec() {
		return mem_rec;
	}
	public void setMem_rec(String mem_rec) {
		this.mem_rec = mem_rec;
	}
	public int getMem_code() {
		return mem_code;
	}
	public void setMem_code(int mem_code) {
		this.mem_code = mem_code;
	}
	public String getMem_name() {
		return mem_name;
	}
	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getMem_pwd() {
		return mem_pwd;
	}
	public void setMem_pwd(String mem_pwd) {
		this.mem_pwd = mem_pwd;
	}
	public String getMem_num() {
		return mem_num;
	}
	public void setMem_num(String mem_num) {
		this.mem_num = mem_num;
	}


	
	@Override
	public String toString() {
		return "MemberVO [mem_code=" + mem_code + ", mem_name=" + mem_name + ", mem_id=" + mem_id
				+ ", mem_pwd=" + mem_pwd + ", mem_num=" + mem_num + "]";
	}

	
}
