package PaM;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;

/**
 * Servlet implementation class SearchIdController
 */
@WebServlet("/SearchId")
public class SearchIdController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final String SEARCH_PAGE = "/pages/searchIDandPW.jsp";
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchIdController() {
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
		ObjectMapper om = new ObjectMapper();
		
		String input_tel = "";
		input_tel = request.getParameter("input_tel");
		
		User get_u = udao.getUser_search(input_tel);
		
		String result = om.writeValueAsString(get_u);
		response.getWriter().write(result);
	}

}
