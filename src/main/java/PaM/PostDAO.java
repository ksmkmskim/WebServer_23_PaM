package PaM;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class PostDAO {
	Connection conn = null;
	PreparedStatement pstmt;
	
	final String JDBC_DRIVER = "org.h2.Driver";
	final String JDBC_URL = "jdbc:h2:tcp://locahost/C:\\Users\\Administrator\\Desktop\\4-1\\웹서버프로그래밍\\기말프로젝트/PaMDB";
	
	public void open() {
		try {
			Class.forName(JDBC_DRIVER);
			conn = DriverManager.getConnection(JDBC_URL, "admin", "admin");
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public void close() {
		try {
			pstmt.close();
			conn.close();
		} catch(SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void addPost(Post p) {
		open();
		String sql_post = "insert into post(car_name, car_brand, car_type, car_price, car_mile, car_etc, post_date, post_user) values(?, ?, ?, ?, ?, ?, ?, ?)";
		String sql_img = "insert into img(post_id, car_img) values(?, ?)";
				
		try {
			pstmt = conn.prepareStatement(sql_post);
			pstmt.setString(1, p.getCar_name());
			pstmt.setString(2, p.getCar_brand());
			pstmt.setString(3, p.getCar_type());
			pstmt.setInt(4, p.getCar_price());
			pstmt.setInt(5, p.getCar_mile());
			pstmt.setString(6, p.getCar_etc());
			pstmt.setString(7, p.getPost_date());
			pstmt.setString(8, p.getPost_user().getUser_id());
			pstmt.executeUpdate();
			
			pstmt = conn.prepareStatement(sql_img);
			pstmt.setInt(1, p.getPost_id());
			
			for(String img : p.getImg_list()) {
				pstmt.setString(2, img);
				pstmt.executeUpdate();
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
	}
	
	public void revisePost(Post p) {
		open();
		String sql_post = "update post set car_name=? car_brand=? car_type=? car_price=? car_mile=? car_etc=? where post_id=?";
		String sql_del_img = "delete from img where post_id=?";
		String sql_add_img = "insert into img(post_id, car_img) values(?, ?)";
		
		try {
			pstmt = conn.prepareStatement(sql_post);
			pstmt.setString(1, p.getCar_name());
			pstmt.setString(2, p.getCar_brand());
			pstmt.setString(3, p.getCar_type());
			pstmt.setInt(4, p.getCar_price());
			pstmt.setInt(5, p.getCar_mile());
			pstmt.setString(6, p.getCar_etc());
			pstmt.setInt(7, p.getPost_id());
			pstmt.executeUpdate();
			
			pstmt = conn.prepareStatement(sql_del_img);
			pstmt.setInt(1, p.getPost_id());
			pstmt.executeUpdate();
			
			pstmt = conn.prepareStatement(sql_add_img);
			pstmt.setInt(1, p.getPost_id());
			
			for(String img : p.getImg_list()) {
				pstmt.setString(2, img);
				pstmt.executeUpdate();
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
	}
	
	public void deletePost(Post p) {
		open();
		String sql = "delete from post where post_id=?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, p.getPost_id());
			pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
	}
	
	public Post getPost(int pid) {
		open();
		String sql_post = "select * from post where post_id=?";
		String sql_img = "select * from post where post_id=?";
		Post p = new Post();
		List<String> imgs = new ArrayList<>();
		UserDAO udao = new UserDAO();
		
		try {
			pstmt = conn.prepareStatement(sql_post);
			pstmt.setInt(1, pid);
			ResultSet rs = pstmt.executeQuery();
			
			p.setPost_id(rs.getInt("post_id"));
			p.setCar_name(rs.getString("car_name"));
			p.setCar_brand(rs.getString("car_brand"));
			p.setCar_type(rs.getString("car_type"));
			p.setCar_price(rs.getInt("car_price"));
			p.setCar_mile(rs.getInt("car_mile"));
			p.setCar_etc(rs.getString("car_etc"));
			p.setPost_date(rs.getString("car_date"));
			p.setPost_user(udao.getUser(rs.getString("post_user")));
			
			pstmt = conn.prepareStatement(sql_img);
			pstmt.setInt(1, pid);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				imgs.add(rs.getString("car_img"));
			}
			p.setImg_list(imgs);
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
		return p;
	}
	
	public List<Post> getPostList(List<String> filter_b, List<String> filter_t, String search_n){
		open();
		String sql = "select * from post";
		List<Post> posts = new ArrayList<>();
		boolean flag = false;
		
		if(!filter_b.isEmpty()) {
			flag = true;
			sql += " where car_brand in(";
			
			for(String brand : filter_b)
			{
				if(filter_b.indexOf(brand) != 0) {
					sql += ",";
				}
				sql += "'" + brand + "'";
			}
			sql += ")";
		}
		if(!filter_t.isEmpty()) {
			if(flag) {
				sql += " and car_type in('";
			} else {
				flag = true;
				sql += " where car_type in(";
			}
			for(String type : filter_t) {
				if(filter_t.indexOf(type) != 0) {
					sql += ",";
				}
				sql += "'" + type + "'";
			}
			sql += ")";
		}
		if(!search_n.isEmpty()) {
			if(flag) {
				sql += " and car_name like '%" + search_n + "%'";
			} else {
				sql += " where car_name like '%" + search_n + "%'";
			}
		}
		try {
			pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next())
			{
				posts.add(this.getPost(rs.getInt("post_id")));
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
		return posts;
	}
	
}
