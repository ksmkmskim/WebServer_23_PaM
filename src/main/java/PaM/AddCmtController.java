package PaM;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AddCmtController
 */
@WebServlet("/addCmt")
public class AddCmtController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddCmtController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Comment c = new Comment();
		CommentDAO cdao = new CommentDAO();
		UserDAO udao = new UserDAO();
		
		c.setCmt_post_id(Integer.parseInt(request.getParameter("cmt_post_id")));
		c.setCmt_user(udao.getUser(request.getParameter("cmt_user_id")));
		c.setCmt_text(request.getParameter("cmt_text"));
		
		cdao.addComment(c);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
