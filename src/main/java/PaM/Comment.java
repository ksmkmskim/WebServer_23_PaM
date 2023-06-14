package PaM;

public class Comment {
	private int cmt_id;
	private int cmt_post_id;
	private String cmt_date;
	private User cmt_user;
	private String cmt_text;
	
	public int getCmt_id() {
		return cmt_id;
	}
	public void setCmt_id(int cmt_id) {
		this.cmt_id = cmt_id;
	}
	public int getCmt_post_id() {
		return cmt_post_id;
	}
	public void setCmt_post_id(int cmt_post_id) {
		this.cmt_post_id = cmt_post_id;
	}
	public String getCmt_date() {
		return cmt_date;
	}
	public void setCmt_date(String cmt_date) {
		this.cmt_date = cmt_date;
	}
	public User getCmt_user() {
		return cmt_user;
	}
	public void setCmt_user(User cmt_user) {
		this.cmt_user = cmt_user;
	}
	public String getCmt_text() {
		return cmt_text;
	}
	public void setCmt_text(String cmt_text) {
		this.cmt_text = cmt_text;
	}
}
