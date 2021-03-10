package project;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;



public class MainDAO {

	
	public MainVO getDessert(int name1,int name2,int name3) {
		Connection conn = null;
		PreparedStatement pstmt1 = null;
		ResultSet rs1 = null;
		PreparedStatement pstmt2 = null;
		ResultSet rs2 = null;
		PreparedStatement pstmt3 = null;
		ResultSet rs3 = null;
		MainVO vo = null;

		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");

			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			conn = DriverManager.getConnection(url, "desr", "desr");

			String query1 = "SELECT * FROM \n"
					+ "(select des_code, des_name, des_img from dessert where kinds_code = ? \n"
					+ "order by dbms_random.value)\n"
					+ "dessert where rownum = 1";
			pstmt1 = conn.prepareStatement(query1);
			pstmt1.setInt(1, name1);
			rs1 = pstmt1.executeQuery();
			
			String query2 = "SELECT * FROM \n"
					+ "(select des_code, des_name, des_img from dessert where kinds_code = ? \n"
					+ "order by dbms_random.value)\n"
					+ "dessert where rownum = 1";
			pstmt2 = conn.prepareStatement(query2);
			pstmt2.setInt(1, name2);
			rs2 = pstmt2.executeQuery();

			String query3 = "SELECT * FROM \n"
					+ "(select des_code,des_name, des_img from dessert where kinds_code = ? \n"
					+ "order by dbms_random.value)\n"
					+ "dessert where rownum = 1";
			pstmt3 = conn.prepareStatement(query3);
			pstmt3.setInt(1, name3);
			rs3 = pstmt3.executeQuery();
			
			if (rs1.next() && rs2.next() && rs3.next()) {
		        
				int des_code = rs1.getInt("des_code");
	            String des_name = rs1.getString("des_name");
	            String des_img = rs1.getString("des_img");
	            
	            int des_code2 = rs2.getInt("des_code");
	            String des_name2 = rs2.getString("des_name");
	            String des_img2 = rs2.getString("des_img");
	            
	            int des_code3 = rs3.getInt("des_code");
	            String des_name3 = rs3.getString("des_name");
	            String des_img3 = rs3.getString("des_img");


	         vo = new MainVO(des_code ,des_name, des_img, des_code2, des_name2, des_img2, des_code3,des_name3, des_img3);
	      
	      }
			
		} catch (ClassNotFoundException e) {
			System.out.println("error: 드라이버 로딩 실패 - " + e);
		} catch (SQLException e) {
			System.out.println("error:" + e);
		} finally {
			try {
				if (pstmt1 != null)
					pstmt1.close();
				if (pstmt2 != null)
					pstmt2.close();
				if (pstmt3 != null)
					pstmt3.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				System.out.println("error:" + e);
			}
		}

		return vo;
	}
	
	public DessertAllVO get_dessertList() {
		
		Connection conn = null;
		PreparedStatement pstmt1 = null;
		ResultSet rs = null;
		DessertAllVO vo = null;
		
		List<Integer> des_code = new ArrayList<Integer>();
		
		
		try {
			//DB연결
			Class.forName("oracle.jdbc.driver.OracleDriver");
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			conn = DriverManager.getConnection(url, "desr", "desr");
			
			//쿼리 생성
			String query1 = "select des_code from dessert";
			pstmt1 = conn.prepareStatement(query1);
			
			//쿼리 호출 및 결과 조회
			rs = pstmt1.executeQuery();
			
			//쿼리 결과를 List 변수에 저장
			while(rs.next()) {
				des_code.add(rs.getInt("des_code"));
			}
			
			//vo에 결과 저장
			vo = new DessertAllVO(des_code);
			
			
		} catch(Exception e) {
			System.out.println("error:" + e);
		}
		
		return vo;
	}
}
