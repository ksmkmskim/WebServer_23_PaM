package PaM;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

/**
 * Servlet implementation class AddController
 */
@WebServlet("/add")
public class AddController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final String POSTUP_PAGE = "/pages/postuppage.jsp";   
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		getServletContext().getRequestDispatcher(POSTUP_PAGE).forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String directory = "D:/Git/WebServer_23_PaM/database/post_img";
		int sizeLimit = 100*1024*1024;	
		MultipartRequest multi = new MultipartRequest(request, directory, sizeLimit, "UTF-8", new DefaultFileRenamePolicy());
		
		System.out.println("post");
		System.out.println(multi.getParameter("car_name"));
		System.out.println(multi.getParameter("car_type"));
		System.out.println(multi.getParameter("car_brand"));
		System.out.println(multi.getParameter("car_price"));
		System.out.println(multi.getParameter("car_mile"));
		System.out.println(multi.getParameter("car_etc"));
		System.out.println(multi.getOriginalFileName("car_img0"));
		Enumeration e = multi.getFileNames();
		while(e.hasMoreElements()) {
			System.out.println(multi.getOriginalFileName(e.nextElement().toString()));
		}

		response.getWriter().write("");
	}
}
