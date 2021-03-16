package controller.user;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import project.MemberDAO;
import project.MemberVO;

/**
 * Servlet implementation class login
 */
@WebServlet("/login")
public class loginController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		request.getRequestDispatcher("/WEB-INF/view/user/loginForm.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");

		HttpSession session = request.getSession();
		MemberDAO dao = new MemberDAO();

		String input_mem_id = request.getParameter("input_mem_id");
		String input_mem_pwd = request.getParameter("input_mem_pwd");

		MemberVO vo = dao.login(input_mem_id, input_mem_pwd);

		if (vo == null) {
			// 
			System.out.println("정보 일치하지 않음");

			request.setAttribute("vo", vo);

			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert(\"정보가 일치하지 않습니다.\"); history.back()</script>");

			// request.getRequestDispatcher("/WEB-INF/view/user/loginForm.jsp").forward(request, response);

		}
		// 세션에 저장
		else {
			session.setAttribute("Userid", input_mem_id);
			session.setAttribute("Userpwd", input_mem_pwd);
			session.setAttribute("Usercode", vo.getMem_code());
			session.setAttribute("Username", vo.getMem_name());
			session.setAttribute("Usernum", vo.getMem_num());
			session.setAttribute("Userrec", vo.getMem_rec());

			// 로그인 후 메인화면으로 이동

			request.getRequestDispatcher("/WEB-INF/view/Main.jsp").forward(request, response);
		}
	}
}
