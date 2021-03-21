package controller.board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.BoardDAO;

@WebServlet("/boardUpdate")
public class BoardUpdateController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

		request.getRequestDispatcher("/WEB-INF/view/board/boardUpdateForm.jsp").forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String update_title = request.getParameter("update_title");
		String update_content = request.getParameter("update_content");
		int no = Integer.parseInt(request.getParameter("no"));

		System.out.println("내용: " + update_content + " 게시판 넘버: " + no);

		BoardDAO dao = new BoardDAO();
		dao.update(no, update_title, update_content);

		response.sendRedirect("/boardMain");

	}

}
