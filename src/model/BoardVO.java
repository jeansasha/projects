package model;

import java.util.Date;

public class BoardVO {

   private int b_no;
   private String b_title;
	private Date b_date;
   private String b_contents;
   private int b_view;
   private int b_commview;
   private String b_comment;
   private String mem_name;
   private int mem_code;


   public BoardVO() {}
   
   
//   insertBoard
   public BoardVO (String b_title, String b_contents, int mem_code ) {
	   this.b_title = b_title;
	   this.b_contents = b_contents;
	   this.mem_code = mem_code;
   }

   
/* boardMain에서 보여지는거*/
public BoardVO(int b_no, String b_title, Date b_date, int b_view, int b_commview, String mem_name) {
      super();
      this.b_no = b_no;
      this.b_title = b_title;
      this.b_date = b_date;
      this.b_view = b_view;
      this.b_commview = b_commview;
      this.mem_name = mem_name;
    
   }
   
	public BoardVO(String b_title, String b_contents, int b_view, Date b_date, int mem_code, String mem_name) {
	      super();
	      this.b_title = b_title;
	      this.b_date = b_date;
	      this.b_contents = b_contents;
	      this.b_view = b_view;
	      this.mem_code = mem_code;
	      this.mem_name = mem_name;
	    
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


public int getB_no() {
      return b_no;
   }



   public void setB_no(int b_no) {
      this.b_no = b_no;
   }



   public String getB_title() {
      return b_title;
   }



   public void setB_title(String b_title) {
      this.b_title = b_title;
   }



	public Date getB_date() {
      return b_date;
   }



	public void setB_date(Date b_date) {
      this.b_date = b_date;
   }



   public String getB_contents() {
      return b_contents;
   }



   public void setB_contents(String b_contents) {
      this.b_contents = b_contents;
   }



   public int getB_view() {
      return b_view;
   }



   public void setB_view(int b_view) {
      this.b_view = b_view;
   }



   public int getB_commview() {
      return b_commview;
   }



   public void setB_commview(int b_commview) {
      this.b_commview = b_commview;
   }



   public String getB_comment() {
      return b_comment;
   }



   public void setB_comment(String b_comment) {
      this.b_comment = b_comment;
   }



   @Override
   public String toString() {
      return "BoardVO "+"b_no"+"b_title" + "b_date"+"b_contents"+"b_view"+"b_commview"+"b_comment" + "\n";
   }
} 