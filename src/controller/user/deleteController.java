package controller.user;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import project.BoardDAO;
import project.MemberDAO;
import project.MemberVO;

@WebServlet("/delete")
public class deleteController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");

		request.getRequestDispatcher("/WEB-INF/view/user/deleteForm.jsp").forward(request, response);

	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String actionName = request.getParameter("a");

		if ("delete".equals(actionName)) {

		String id = request.getParameter("input_mem_id");
		String pwd = request.getParameter("input_mem_pwd");
		String mem_code = request.getParameter("mem_code");

		MemberVO vo = new MemberVO(id, pwd);


		MemberDAO member = new MemberDAO();
		BoardDAO board = new BoardDAO();

		int mem_code_ = Integer.parseInt(mem_code);

		int count_ = board.delete(mem_code_);

		if (count_ != 0) {

			int count = member.delete(vo, mem_code_);

			if (count == 0) {

				request.setAttribute("fa", 0);
				request.getRequestDispatcher("/WEB-INF/view/user/deleteForm.jsp").forward(request, response);

			} else

				response.sendRedirect("/logout");

		}
		else {
			int count = member.delete(vo, mem_code_);
			response.sendRedirect("/logout");
		}
			
	}

	else

		request.getRequestDispatcher("/WEB-INF/view/user/deleteForm.jsp").forward(request, response);

}

}
