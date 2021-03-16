package controller.user;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/mypage")
public class mypageController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

		request.getRequestDispatcher("/WEB-INF/view/user/mypageForm.jsp").forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");

		HttpSession session = request.getSession();

		String input_pwd_check = request.getParameter("input_pwd_check");

		String Upwd = (String) session.getAttribute("Userpwd");

		if (Upwd.equals(input_pwd_check)) {

			request.getRequestDispatcher("/WEB-INF/view/user/updateForm.jsp").forward(request, response);

		} else {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert(\"비밀번호가 일치하지 않습니다.\"); history.back()</script>" );
		}

	}

}