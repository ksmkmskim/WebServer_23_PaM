package PaM;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;

import java.util.Arrays;
import java.util.ArrayList;
import java.util.List;

/**
 * Servlet implementation class PostPageController
 */
@WebServlet("/post")
public class PostPageController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final String POST_PAGE = "/pages/postpage.jsp";
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PostPageController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int pid = Integer.parseInt(request.getParameter("id"));
		request.setAttribute("pid", pid);
		
		getServletContext().getRequestDispatcher(POST_PAGE).forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("application/x-json; charset=UTF-8");
		PostDAO pdao = new PostDAO();
		
		int pid = Integer.parseInt(request.getParameter("pid"));
		
		Post p = pdao.getPost(pid);
		
		ObjectMapper om = new ObjectMapper();
		String result = om.writeValueAsString(p);
		response.getWriter().write(result);
	}

}
