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

import com.fasterxml.jackson.databind.ObjectMapper;

/**
 * Servlet implementation class MainPageController
 */
@WebServlet("/main")
public class MainPageController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private final String MAIN_PAGE = "/pages/mainpage.jsp";   
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
		getServletContext().getRequestDispatcher(MAIN_PAGE).forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("application/x-json; charset=UTF-8");
		PostDAO pdao = new PostDAO();
		
		List<String> types = new ArrayList<>();
		if(request.getParameterValues("car_type[]") != null) {
			types.addAll(Arrays.asList(request.getParameterValues("car_type[]")));
			//System.out.println(types.get(0));
		}

		List<String> brands = new ArrayList<>();
		if(request.getParameterValues("car_brand[]") != null) {
			brands.addAll(Arrays.asList(request.getParameterValues("car_brand[]")));
			//System.out.println(brands.get(0));
		}
		
		String search = request.getParameter("search");
		//System.out.println(search);
		
		List<Post> post_list = pdao.getPostList(brands, types, search);
		/*
		if(!post_list.isEmpty()) {
			ObjectMapper om = new ObjectMapper();
			String result = om.writeValueAsString(post_list);
			response.getWriter().write(result);
		}*/
		ObjectMapper om = new ObjectMapper();
		String result = om.writeValueAsString(post_list);
		response.getWriter().write(result);
		
	}

}
