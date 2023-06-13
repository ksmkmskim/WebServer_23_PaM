package PaM;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CommentDAO {
	
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
	
	
	public void addComment(Comment c){
		open();
		String sql = "insert into commnet_table(cmt_post_id, cmt_user_id, cmt_date, cmt_text) values(?, ?, CURRENT_TIMESTAMP, ?)";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, c.getCmt_id());
			pstmt.setString(2, c.getCmt_user_id());
			pstmt.setString(3, c.getCmt_text());
			pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
	}
	
	public void deleteComment(Comment c){
		open();
		String sql = "delete from commnet_table where cmt_id=?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, c.getCmt_id());
			pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
	}
	
	public void reviseComment(Comment c){
		open();
		String sql = "update comment_table set cmt_text=?, cmt_date=CURRENT_TIMESTAMP where cmt_id=?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, c.getCmt_text());
			pstmt.setInt(2, c.getCmt_id());
			pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
	}
	
	public Comment getComment(int cid){
		open();
		String sql = "select * from comment_table where cmt_id=?";
		Comment c = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cid);
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next()) {
				c = new Comment();
				c.setCmt_id(rs.getInt("cmt_id"));
				c.setCmt_post_id(rs.getInt("cmt_post_id"));
				c.setCmt_user_id(rs.getString("cmt_user_id"));
				c.setCmt_date(rs.getString("cmt_date"));
				c.setCmt_text(rs.getString("cmt_text"));
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
		return c;
	}
	
	public List<Comment> getCommentAll(int pid){
		open();
		String sql = "select * from comment_table where cmt_post_id=?";
		List<Comment> cmt_list = new ArrayList<>();
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, pid);
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				cmt_list.add(this.getComment(rs.getInt("cmt_id")));
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
		return cmt_list;
	}
}
