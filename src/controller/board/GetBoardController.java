package controller.board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import project.BoardDAO;
import project.BoardVO;


@WebServlet("/getBoard")
public class GetBoardController extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		BoardDAO dao = new BoardDAO();
		int no = Integer.parseInt(request.getParameter("no"));

		BoardVO vo = dao.getBoard(no);
		
		vo.setB_contents(vo.getB_contents().replaceAll("\\r", "<br>"));

		request.setAttribute("vo", vo);
		request.setAttribute("no", no);
		// 포워드 처리
		request.getRequestDispatcher("/WEB-INF/view/board/getBoard.jsp").forward(request, response);
	}

}
