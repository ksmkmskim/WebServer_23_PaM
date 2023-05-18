package PaM;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class DeleteController
 */
@WebServlet("/delete")
public class DeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final String MAIN_PAGE = "/pages/mainpage.jsp";
	private final String LOGIN_PAGE = "/pages/loginpage.jsp";   
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		User sin_user = (User) session.getAttribute("sign_in_user");
		int pid = Integer.parseInt(request.getParameter("id"));
		String bpage = "/post?id=" + pid;
		
		PostDAO pdao = new PostDAO();
		
		Post p = pdao.getPost(pid);
		
		if(sin_user != null) {
			//권한 확인을 자바스크립트로 수행한다면 페이지 재로드가 줄어들 것 -> 이렇게 반드시 해야 것네 referer
			if(sin_user.getUser_id().equals(p.getPost_user().getUser_id()) || sin_user.getUser_permission() == 3) {
				pdao.deletePost(p);
				request.setAttribute("msg", "게시물이 삭제되었습니다.");
				getServletContext().getRequestDispatcher(MAIN_PAGE).forward(request, response);
			}
			else {
				request.setAttribute("msg", "권한이 부족합니다.");
				getServletContext().getRequestDispatcher(bpage).forward(request, response);
			}
		}
		else {
			getServletContext().getRequestDispatcher(LOGIN_PAGE).forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
