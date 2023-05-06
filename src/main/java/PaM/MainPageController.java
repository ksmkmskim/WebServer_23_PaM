package PaM;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.util.Arrays;
import java.util.ArrayList;
import java.util.List;

/**
 * Servlet implementation class MainPageController
 */
@WebServlet("/maincontrol")
public class MainPageController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private final String START_PAGE = "/pages/mainpage.jsp";   
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MainPageController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PostDAO pdao = new PostDAO();
		
		List<String> types = new ArrayList<>();
		if(request.getParameterValues("car_type") != null) {
			types.addAll(Arrays.asList(request.getParameterValues("car_type")));
		}
		List<String> brands = new ArrayList<>();
		if(request.getParameterValues("car_brands") != null) {
			brands.addAll(Arrays.asList(request.getParameterValues("car_brands")));
		}
		
		
		List<Post> post_list = pdao.getPostList(brands, types, getServletInfo());
		if(!post_list.isEmpty()) {
			request.setAttribute("posts", post_list);
		}
		getServletContext().getRequestDispatcher(START_PAGE).forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
