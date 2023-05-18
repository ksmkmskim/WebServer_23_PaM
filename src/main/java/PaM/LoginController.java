package PaM;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class LoginController
 */
@WebServlet("/login")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final String MAIN_PAGE = "/pages/mainpage.jsp";
	private final String LOGIN_PAGE = "/pages/loginpage.jsp";
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		getServletContext().getRequestDispatcher(LOGIN_PAGE).forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String uid = request.getParameter("id");
		String upwd = request.getParameter("pwd");

		UserDAO udao = new UserDAO();
		
		User u = udao.getUser(uid);

		if(u != null) {
			if(u.getUser_pw().equals(upwd)) {
				HttpSession session = request.getSession();
				session.setAttribute("sign_in_user", u);
				getServletContext().getRequestDispatcher(MAIN_PAGE).forward(request, response);
			}
			else {
				request.setAttribute("errmsg", "비밀번호를 확인해주세요.");
				getServletContext().getRequestDispatcher(LOGIN_PAGE).forward(request, response);
			}
		}
		else {
			request.setAttribute("errmsg", "아이디를 확인해주세요.");
			getServletContext().getRequestDispatcher(LOGIN_PAGE).forward(request, response);
		}
	}

}
