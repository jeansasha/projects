package controller.board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.BoardDAO;
import model.BoardVO;


@WebServlet("/insertBoard")
public class InsertBoardController extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.getRequestDispatcher("/WEB-INF/view/board/insertBoardForm.jsp").forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();


		String b_title = request.getParameter("inp_title");
		String b_contents = request.getParameter("inp_contetns");
		int mem_code = (int) session.getAttribute("Usercode");

		BoardVO vo = new BoardVO(b_title, b_contents, mem_code);

		BoardDAO dao = new BoardDAO();
		dao.insert(vo);


		response.sendRedirect("/boardMain");
	}

}
