package PaM;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UserDAO {
	Connection conn = null;
	PreparedStatement pstmt;
	
	final String JDBC_DRIVER = "org.h2.Driver";
	final String JDBC_URL = "jdbc:h2:tcp://localhost/E:\\WebserverProject\\database/PaMDB";
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
	
	public void addUser(User u) {
		open();
		String sql = "insert into user_table(user_id, user_pw, user_name, user_tel, user_addr, user_permission) values(?,?,?,?,?,?)";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, u.getUser_id());
			pstmt.setString(2, u.getUser_pw());
			pstmt.setString(3, u.getUser_name());
			pstmt.setString(4, u.getUser_tel());
			pstmt.setString(5, u.getUser_addr());
			pstmt.setInt(6, u.getUser_permission());
			pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
	}
	
	public User getUser(String uid) {
		open();
		String sql = "select * from user_table where user_id=?";
		User u = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, uid);
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next()) {
				u = new User();
				u.setUser_id(rs.getString("user_id"));
				u.setUser_pw(rs.getString("user_pw"));
				u.setUser_name(rs.getString("user_name"));
				u.setUser_tel(rs.getString("user_tel"));
				u.setUser_addr(rs.getString("user_addr"));
				u.setUser_permission(rs.getInt("user_permission"));
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
		return u;
	}
	
	public User getUser_search(String tel) {
		open();
		String sql = "select * from user_table where user_tel=?";
		User u = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, tel);
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next()) {
				u = new User();
				u.setUser_id(rs.getString("user_id"));
				u.setUser_pw(rs.getString("user_pw"));
				u.setUser_name(rs.getString("user_name"));
				u.setUser_tel(rs.getString("user_tel"));
				u.setUser_addr(rs.getString("user_addr"));
				u.setUser_permission(rs.getInt("user_permission"));
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
		return u;
	}
	
	public void updateUser(User u) {
		open();
		String sql = "update user_table set user_pw=? where user_id=?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, u.getUser_pw());
			pstmt.setString(2, u.getUser_id());
			pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
	}
}
