package controller.user;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.MemberDAO;
import model.MemberVO;

// Servlet implementation class SignupController 

@WebServlet("/signUp")
public class SignupController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		request.getRequestDispatcher("/WEB-INF/view/user/signUpForm.jsp").forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		String mem_name = request.getParameter("mem_name");
		String mem_id = request.getParameter("mem_id");
		String mem_pwd = request.getParameter("mem_pwd");
		String mem_num = request.getParameter("mem_num");

		MemberDAO dao = new MemberDAO();
		MemberVO vo = dao.idcheck(mem_id);

		if (vo == null) {
			System.out.println("사용가능한 아이디");

			vo = new MemberVO(mem_name, mem_id, mem_pwd, mem_num);
			dao.signup(vo);
			response.sendRedirect("/main");
		} else {
			request.setAttribute("vo1", vo);

			request.getRequestDispatcher("/WEB-INF/view/user/signUpForm.jsp").forward(request, response);
		}
	}
}
