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
	final String IMG_PATH="D:/Git/WebServer_23_PaM/database/post_img";
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
		if(request.getParameter("id") != null) {
			int id = Integer.parseInt(request.getParameter("id"));
			request.setAttribute("id", id);
		}

		getServletContext().getRequestDispatcher(POSTUP_PAGE).forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int sizeLimit = 100*1024*1024;	
		MultipartRequest multi = new MultipartRequest(request, IMG_PATH, sizeLimit, "UTF-8", new DefaultFileRenamePolicy());
		// 지정경로에 파일 자동 저장됨
		Post p = new Post();
		List<String> img_list = new ArrayList<>();
		PostDAO pdao = new PostDAO();
		UserDAO udao = new UserDAO();
		
		if(multi.getParameter("post_id") != null) {
			p.setPost_id(Integer.parseInt(multi.getParameter("post_id")));
		}
		p.setCar_name(multi.getParameter("car_name"));
		p.setCar_type(multi.getParameter("car_type"));
		p.setCar_brand(multi.getParameter("car_brand"));
		p.setCar_price(Long.parseLong(multi.getParameter("car_price")));
		p.setCar_mile(Long.parseLong(multi.getParameter("car_mile")));
		p.setCar_etc(multi.getParameter("car_etc"));
		p.setPost_user(udao.getUser(multi.getParameter("post_user")));

		Enumeration e = multi.getFileNames();
		while(e.hasMoreElements()) {
			img_list.add("/post_img/" + multi.getFilesystemName(e.nextElement().toString()));
		}
		
		p.setImg_list(img_list);
		
		if(multi.getParameter("post_id") == null) {
			pdao.addPost(p);
		} else {
			pdao.revisePost(p);
		}
		

		response.getWriter().write("");
	}
}
