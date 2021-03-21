
package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;



public class RecipesDAO {
	
	public RecipesVO getRecipes(int code) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		RecipesVO rvo = null;
		int count = 0;
		ResultSet rs = null;
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");

			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			conn = DriverManager.getConnection(url, "desr", "desr");

			String query = "SELECT d.des_code, d.des_name, d.des_rec, d.des_img, d.des_mete, d.des_summ, kn.KINDS_NAME  \r\n"
					+ "FROM DESSERT d INNER JOIN KINDS kn ON kn.KINDS_CODE = d.KINDS_CODE \r\n"
					+ "WHERE des_code = ?";
			pstmt = conn.prepareStatement(query);
			
			pstmt.setInt(1, code);

			rs = pstmt.executeQuery();
			while (rs.next()) {
			int des_code = rs.getInt(1);
			String des_name = rs.getString(2);
			String des_rec = rs.getString(3);
			String des_img = rs.getString(4);
			String des_mete = rs.getString(5);
			String des_summ = rs.getString(6);
			String kinds_name = rs.getString(7);
			
			rvo = new RecipesVO(des_code,des_name, des_rec, des_img, des_mete, des_summ, kinds_name);
			}
			 
		} catch (ClassNotFoundException e) {
			System.out.println("error: 드라이버 로딩 실패 - " + e);
		} catch (SQLException e) {
			System.out.println("error:" + e);
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				System.out.println("error:" + e);
			}
		}
		return rvo;

	}
}
