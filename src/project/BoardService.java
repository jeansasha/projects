package project;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class BoardService {


	public List<BoardView> getBoardList() {

		return getBoardList("B_TITLE", "", 1);
	}

	public List<BoardView> getBoardList(int page) {

		return getBoardList("B_TITLE", "", page);
	}

	// 실제 구현하는 곳
	public List<BoardView> getBoardList(String field, String query, int page) {
		// field > TITLE , WRIRER_ID query엔 A를 포함
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		List<BoardView> list = new ArrayList<>();

		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String user = "desr";
		String pass = "desr";

		String sql = "SElECT * FROM (" + "   SELECT  ROWNUM Num,N.* " + "   from (SELECT *FROM BOARD_VIEW where "
				+ field
				+ " LIKE ? ORDER BY  b_DATE desc) N" + "  )" + " where Num BETWEEN ? AND ?";
		// 1, 11 ,21 ,31 > an =1 +(page-1)*10 등차수열...
		// 10 20 30 40 > page*10
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, user, pass);
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, "%" + query + "%");
			pstmt.setInt(2, 1 + (page - 1) * 10);
			pstmt.setInt(3, page * 10);

			rs = pstmt.executeQuery();

			while (rs.next()) {

				int num = rs.getInt("NUM");
				int b_no = rs.getInt("b_no");
				String b_title = rs.getString("B_TITLE");
				Date b_date = rs.getDate("b_date");
				int b_view = rs.getInt("b_view");
				int b_commview = rs.getInt("b_commview");
				String mem_name = rs.getString("mem_name");
				int cmtCount = rs.getInt("CMT_COUNT");
						
				BoardView board = new BoardView(num, b_no, b_title, b_date, b_view, b_commview, mem_name, cmtCount);

				list.add(board);

			}


		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();

			} catch (Exception e) {
				e.printStackTrace();
			}

		}

		return list;
	}
   //사용자공개 메소드
	public int getBoardCount() {

		return getBoardCount("B_TITLE", "");
	}

	// 
	public int getBoardCount(String field, String query) {

		int count = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String user = "desr";
		String pass = "desr";
		// 검색된 게시글의 총 개수 		
		String sql = "SElECT Count(b_no) COUNT FROM (" + "   SELECT  ROWNUM Num,N.* "
				+ "   from (SELECT *FROM BOARD where " + field + " LIKE ? ORDER BY  b_DATE desc) N" + "  )";

		// 1, 11 ,21 ,31 > an =1 +(page-1)*10 등차수열...
		// 10 20 30 40 > page*10
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, user, pass);
			pstmt = conn.prepareStatement(sql);
		
			pstmt.setString(1, "%" + query + "%");

			rs = pstmt.executeQuery();

			while (rs.next()) {

				count = rs.getInt("count");

			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();

			} catch (Exception e) {
				e.printStackTrace();
			}

		}

		return count;
	}

	public BoardVO getBoards(int id) {

		BoardVO board = null;

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String user = "simt";
		String pass = "simt";

		String sql = "SELECT  * from BOARD WHERE B_no = ?";
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, user, pass);
			pstmt = conn.prepareStatement(sql);

			

			pstmt.setInt(1, id);

			rs = pstmt.executeQuery();

			if (rs.next()) {


				int b_no = rs.getInt("b_no");
				String b_title = rs.getString("B_TITLE");
				Date b_date = rs.getDate("b_date");
				int b_view = rs.getInt("b_view");
				int b_commview = rs.getInt("b_commview");
				String mem_code = rs.getString("mem_code");

				board = new BoardVO(b_no, b_title, b_date, b_view, b_commview, mem_code);

			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();

			} catch (Exception e) {
				e.printStackTrace();
			}

		}

		return board;
	}

	public BoardVO getNextBoard(int bno) {

		BoardVO board = null;

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String user = "simt";
		String pass = "simt";

		String sql = "SELECT  B_no from BOARD WHERE b_DATE > (SELECT b_DATE fROM BOARD WHERE B_no = ?	 \r\n"
				+ "AND ROwNUM =1) ";
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, user, pass);
			pstmt = conn.prepareStatement(sql);

			
			pstmt.setInt(1, bno);

			rs = pstmt.executeQuery();

			if (rs.next()) {

				int b_no = rs.getInt("b_no");
				String b_title = rs.getString("B_TITLE");
				Date b_date = rs.getDate("b_date");
				int b_view = rs.getInt("b_view");
				int b_commview = rs.getInt("b_commview");
				String mem_code = rs.getString("mem_code");

				board = new BoardVO(b_no, b_title, b_date, b_view, b_commview, mem_code);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();

			} catch (Exception e) {
				e.printStackTrace();
			}

		}

		return board;
	}

	public BoardVO getPrevBoard(int id) {



		BoardVO board = null;

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String user = "simt";
		String pass = "simt";

		String sql = " SELECT  B_no from (SELECT * FROM BOARD ORDER by b_DATE DESC )\r\n"
				+ " WHERE b_DATE < (SELECT b_DATE fROM BOARD WHERE B_no= ?) AND ROWNUM =1 ";

		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, user, pass);
			pstmt = conn.prepareStatement(sql);

			

			pstmt.setInt(1, id);

			rs = pstmt.executeQuery();

			if (rs.next()) {

				int b_no = rs.getInt("b_no");
				String b_title = rs.getString("B_TITLE");
				Date b_date = rs.getDate("b_date");
				int b_view = rs.getInt("b_view");
				int b_commview = rs.getInt("b_commview");
				String mem_code = rs.getString("mem_code");

				board = new BoardVO(b_no, b_title, b_date, b_view, b_commview, mem_code);

			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();

			} catch (Exception e) {
				e.printStackTrace();
			}

		}

		return board;

	}

	
}
