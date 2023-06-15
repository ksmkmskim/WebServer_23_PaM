package PaM;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;

/**
 * Servlet implementation class searchPwController
 */
@WebServlet("/searchPw")
public class searchPwController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final String SEARCH_PAGE = "/pages/searchIDandPW.jsp";
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public searchPwController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		getServletContext().getRequestDispatcher(SEARCH_PAGE).forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("application/x-json; charset=UTF-8");
		UserDAO udao = new UserDAO();
		User user = new User();
		ObjectMapper om = new ObjectMapper();
		
		String input_id = request.getParameter("input_id");
		String input_pw = request.getParameter("input_pwd");
		
		user.setUser_id(input_id);
		user.setUser_pw(input_pw);
		System.out.println(user.getUser_id());
		
		udao.updateUser(user);
		
		User get_u = udao.getUser(input_id);
		
		String result = om.writeValueAsString(get_u);
		response.getWriter().write(result);
	}

}
