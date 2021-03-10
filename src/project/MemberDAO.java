package project;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


public class MemberDAO {
//회원가입
	public int signup(MemberVO vo) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int count = 0;

		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");

			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			conn = DriverManager.getConnection(url, "desr", "desr");

			String query = "insert into d_member (Mem_code,Mem_name,Mem_id,Mem_pwd,Mem_num) values (seq_mem_code.nextval, ?, ?, ?, ?)";
			pstmt = conn.prepareStatement(query);

			pstmt.setString(1, vo.getMem_name());
			pstmt.setString(2, vo.getMem_id());
			pstmt.setString(3, vo.getMem_pwd());
			pstmt.setString(4, vo.getMem_num());

			count = pstmt.executeUpdate();

			System.out.println(count + "건 등록");
	

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
		return count;
	}

//	signup id check
	public MemberVO idcheck(String mem_id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		MemberVO vo = null;
		

		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");

			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			conn = DriverManager.getConnection(url, "desr", "desr");

			String query = "select mme_id from d_member where mem_id = ?";
			pstmt = conn.prepareStatement(query);

			pstmt.setString(1, mem_id);

			rs = pstmt.executeQuery();
			
			if(rs != null && rs.isBeforeFirst()) {
				vo = new MemberVO();
				rs.next();
				vo.setMem_id(rs.getString("mem_id"));
				System.out.println(vo.getMem_id() + "현재 사용중입니다.");
			}
			else rs.next();

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
		return vo;
	}
//	로그인
	public MemberVO login(String input_mem_id, String input_mem_pwd) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		MemberVO vo = null;
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			conn = DriverManager.getConnection(url, "desr", "desr");

			String query = "select mem_code,mem_name,mem_num , mem_rec from d_member where mem_id = ? and mem_pwd =?";
			pstmt = conn.prepareStatement(query);
			
			pstmt.setString(1, input_mem_id);
			pstmt.setString(2, input_mem_pwd);
			

			rs = pstmt.executeQuery();
			if(rs != null && rs.isBeforeFirst()) {
				vo = new MemberVO();
				rs.next();
				vo.setMem_code(rs.getInt("mem_code"));
				vo.setMem_name(rs.getString("mem_name"));
				vo.setMem_num(rs.getString("mem_num"));
				vo.setMem_rec(rs.getString("mem_rec"));

				System.out.println(vo.getMem_code() + "번 고객" + vo.getMem_name() + "님이 로그인하셨습니다");
			}
			else {
				vo = null;
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
				if (rs != null)
					rs.close();
			} catch (SQLException e) {
				System.out.println("error:" + e);
			}
		}
		return vo;
	}



//회원삭제 

	public int delete(MemberVO vo, int mmem_code_) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int count = 0;

		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			conn = DriverManager.getConnection(url, "desr", "desr");

			String query = "delete from D_MEMBER where MEM_ID= ? and MEM_PWD= ? and mem_code = ?";
			pstmt = conn.prepareStatement(query);

			pstmt.setString(1, vo.getMem_id());
			pstmt.setString(2, vo.getMem_pwd());
			pstmt.setInt(3, mmem_code_);

			count = pstmt.executeUpdate();

			System.out.println(count + "건 삭제 회원탈퇴");

		} catch (SQLException e) {
			System.out.println("error:" + e);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
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
		return count;
	}
	
//	회원정보 수정
	public int update(int mem_code,String new_pwd, String new_num, String id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int count = 0;

		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			conn = DriverManager.getConnection(url, "desr", "desr");

			String query = "update d_member set mem_pwd = ?, mem_num = ? where mem_id = ?";
			pstmt = conn.prepareStatement(query);

			pstmt.setString(1, new_pwd);
			pstmt.setString(2, new_num);
			pstmt.setString(3, id);

			count = pstmt.executeUpdate();

			System.out.println(count + "건 수정");

		} catch (SQLException e) {
			System.out.println("error:" + e);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
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
		return count;
	}
}

