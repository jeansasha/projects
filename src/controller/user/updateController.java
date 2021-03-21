package controller.user;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.MemberDAO;
import model.MemberVO;

@WebServlet("/update")
public class updateController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		request.getRequestDispatcher("/WEB-INF/view/user/updateForm.jsp");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)	throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");

		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("Userid");

		int mem_code = (int) session.getAttribute("Usercode");
		String new_pwd = request.getParameter("new_pwd");
		String new_pwd2 = request.getParameter("new_pwd2");
		String new_num = request.getParameter("new_num");

		MemberDAO dao = new MemberDAO();

		if (new_pwd.equals(new_pwd2)) {
			dao.update(mem_code, new_pwd, new_num, id);

			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert(\"정상적으로 변경되었습니다.\"); location.href='logout'</script>" );

			
		} else {

			System.out.println("등록 안됨");
			
			request.getRequestDispatcher("/WEB-INF/view/user/updateForm.jsp").forward(request, response);
		}
	}
}
