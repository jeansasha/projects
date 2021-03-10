package project;

import java.io.IOException;

import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/boardMain")
public class BoardMainController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");

		// list?=title& q= a
		String field_ = request.getParameter("f"); // 제목
		String query_ = request.getParameter("q"); // 작성자?
		String page_ = request.getParameter("p");// 페이지

		// 값을 전달하기전에 기본값처리
		String field = "b_title";
		if (field_ != null && !field_.equals(""))
			field = field_;
		String query = "";
		if (query_ != null && !query_.equals(""))
			query = query_;

		int page = 1;
		if (page_ != null && !page_.equals(""))
			page = Integer.parseInt(page_);
		// 검색기능
		BoardService service = new BoardService();

		List<BoardView> list = service.getBoardList(field, query, page);

		request.setAttribute("list", list);

		// 마지막페이지처리

		int count = service.getBoardCount(field, query);

		request.setAttribute("count", count);

		request.getRequestDispatcher("/WEB-INF/view/board/boardMain.jsp").forward(request, response);
	}

}
