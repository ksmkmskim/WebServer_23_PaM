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
	final String JDBC_URL = "jdbc:h2:tcp://localhost/D:\\Git\\WebServer_23_PaM\\database\\PaMDB";
	final String JDBC_USER = "admin";
	final String JDBC_PASSWD = "admin";
	// JDBC_URL 로컬 환경마다 변경 필요 -> 학교 서버에 구축해서 vpn으로 접속해서 사용할 수 있도록 하면 좋을 듯
	
	public void open() {
		try {
			Class.forName(JDBC_DRIVER);
			conn = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWD);
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
		String sql_post = "insert into post_table(car_name, car_brand, car_type, car_price, car_mile, car_etc, post_date, post_user) values(?, ?, ?, ?, ?, ?, CURRENT_TIMESTAMP, ?)";
		String sql_img = "insert into img_table(img_post_id, car_img) values(LAST_INSERT_ID(), ?)";
				
		try {
			pstmt = conn.prepareStatement(sql_post);
			pstmt.setString(1, p.getCar_name());
			pstmt.setString(2, p.getCar_brand());
			pstmt.setString(3, p.getCar_type());
			pstmt.setString(4, p.getCar_price());
			pstmt.setLong(5, p.getCar_mile());
			pstmt.setString(6, p.getCar_etc());
			pstmt.setString(7, p.getPost_user().getUser_id());
			pstmt.executeUpdate();
			
			pstmt = conn.prepareStatement(sql_img);
			for(String img : p.getImg_list()) {
				pstmt.setString(1, img.replace("\\","/"));
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
		String sql_post = "update post_table set car_name=? car_brand=? car_type=? car_price=? car_mile=? car_etc=? where post_id=?";
		String sql_del_img = "delete from img_table where img_post_id=?";
		String sql_add_img = "insert into img_table(img_post_id, car_img) values(?, ?)";	//duplicate로 수정할 수 있을 듯, addPost랑 합칠 수도 있을 듯
		
		try {
			pstmt = conn.prepareStatement(sql_post);
			pstmt.setString(1, p.getCar_name());
			pstmt.setString(2, p.getCar_brand());
			pstmt.setString(3, p.getCar_type());
			pstmt.setString(4, p.getCar_price());
			pstmt.setLong(5, p.getCar_mile());
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
		String sql = "delete from post_table where post_id=?";
		
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
		String sql_post = "select * from post_table where post_id=?";
		String sql_img = "select * from img_table where img_post_id=?";
		Post p = null;
		List<String> imgs = new ArrayList<>();
		UserDAO udao = new UserDAO();
		
		try {
			pstmt = conn.prepareStatement(sql_post);
			pstmt.setInt(1, pid);
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next()) {
				p = new Post();
				p.setPost_id(rs.getInt("post_id"));
				p.setCar_name(rs.getString("car_name"));
				p.setCar_brand(rs.getString("car_brand"));
				p.setCar_type(rs.getString("car_type"));
				p.setCar_price(rs.getLong("car_price"));
				p.setCar_mile(rs.getLong("car_mile"));
				p.setCar_etc(rs.getString("car_etc"));
				p.setPost_date(rs.getString("post_date"));
				p.setPost_user(udao.getUser(rs.getString("post_user")));
				
				pstmt = conn.prepareStatement(sql_img);
				pstmt.setInt(1, pid);
				rs = pstmt.executeQuery();
				
				while(rs.next()){
					imgs.add(rs.getString("car_img").replace("\\","/"));
				}
				p.setImg_list(imgs);
				//System.out.println(p);
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
		return p;
	}
	
	public List<Post> getPostList(List<String> filter_b, List<String> filter_t, String search_n){
		open();
		String sql = "select * from post_table";
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
				sql += " and car_type in(";
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
		sql += ";";
		//System.out.println(sql);
		try {
			pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) // 문제 발생 지점
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
