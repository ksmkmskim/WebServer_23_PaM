package PaM;

import java.io.IOException;
import java.util.List;
import java.io.File;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class DeleteController
 */
@WebServlet("/delete")
public class DeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final String MAIN_PAGE = "/pages/mainpage.jsp";
	final String IMG_PATH="D:/Git/WebServer_23_PaM/database";
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		int pid = Integer.parseInt(request.getParameter("pid"));
		PostDAO pdao = new PostDAO();
		Post p = pdao.getPost(pid);
		List<String> img_list = p.getImg_list();
		
		for(String img : img_list) {
		    	
			File file = new File(IMG_PATH + img);
			    
			   if( file.exists() ){
			   	if(file.delete()){
			   		System.out.println("파일삭제 성공");
			   	}else{
			   		System.out.println("파일삭제 실패");
			   	}
			   }else{
			   	System.out.println("파일이 존재하지 않습니다.");
			   }
		}
		
		pdao.deletePost(p);
		request.setAttribute("msg", "게시물이 삭제되었습니다.");
		getServletContext().getRequestDispatcher(MAIN_PAGE).forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
