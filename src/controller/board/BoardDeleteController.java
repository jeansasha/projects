package controller.board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import project.BoardDAO;

@WebServlet("/boardDelete")
public class BoardDeleteController extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");

		HttpSession session = request.getSession();

		BoardDAO dao = new BoardDAO();
		int no = Integer.parseInt(request.getParameter("no"));

		Integer usercode = (Integer) session.getAttribute("Usercode");

		if (usercode != null) {
			dao.delete(no, usercode);

			// 포워드 처리
			request.getRequestDispatcher("/WEB-INF/view/board/boardMain.jsp").forward(request, response);

		} else if (usercode == null)
			response.sendRedirect("/WEB-INF/view/board/login.jsp");
	}

}
