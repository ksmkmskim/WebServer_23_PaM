package PaM;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fasterxml.jackson.databind.ObjectMapper;

/**
 * Servlet implementation class idCheckController
 */
@WebServlet("/idCheck")
public class IdCheckController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final String SIGNUP_PAGE = "/pages/signuppage.jsp";
    /**
     * @see HttpServlet#HttpServlet()
     */
    public IdCheckController() {
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
		ObjectMapper om = new ObjectMapper();
		
		String input_id = "";
		input_id = request.getParameter("input_id");
		
		User get_u = udao.getUser(input_id);
		
		String result = om.writeValueAsString(get_u);
		response.getWriter().write(result);
	}

}
