package PaM;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;

/**
 * Servlet implementation class SignupController
 */
@WebServlet("/signup")
public class SignupController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final String SIGNUP_PAGE = "/pages/signuppage.jsp";
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SignupController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		getServletContext().getRequestDispatcher(SIGNUP_PAGE).forward(request, response);
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
		String input_pw = request.getParameter("input_pw");
		String input_name = request.getParameter("input_name");
		String input_tel = request.getParameter("input_tel");
		String input_addr = request.getParameter("input_addr");
		int input_permission = Integer.parseInt(request.getParameter("input_permission"));
		
		user.setUser_id(input_id);
		user.setUser_pw(input_pw);
		user.setUser_name(input_name);
		user.setUser_tel(input_tel);
		user.setUser_addr(input_addr);
		user.setUser_permission(input_permission);
		System.out.println(user.getUser_id());
		
		udao.addUser(user);
		
		User get_u = udao.getUser(input_id);
		
		String result = om.writeValueAsString(get_u);
		response.getWriter().write(result);
		
	}

}
