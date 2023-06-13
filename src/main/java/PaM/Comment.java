package PaM;

public class Comment {
	private int cmt_id;
	private int cmt_post_id;
	private String cmt_date;
	private String cmt_user_id;
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
	public String getCmt_user_id() {
		return cmt_user_id;
	}
	public void setCmt_user_id(String cmt_user_id) {
		this.cmt_user_id = cmt_user_id;
	}
	public String getCmt_text() {
		return cmt_text;
	}
	public void setCmt_text(String cmt_text) {
		this.cmt_text = cmt_text;
	}
}
