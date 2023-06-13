package PaM;

import java.util.ArrayList;
import java.util.List;
import java.text.DecimalFormat;

public class Post {
	private int post_id;
	private String car_name;
	private String car_brand;
	private String car_type;
	private long car_price;
	private long car_mile;
	private String car_etc;
	private String post_date;
	private User post_user;
	private List<String> img_list;
	private List<Comment> cmt_list;
	
	public int getPost_id() {
		return post_id;
	}
	public void setPost_id(int post_id) {
		this.post_id = post_id;
	}
	public String getCar_name() {
		return car_name;
	}
	public void setCar_name(String car_name) {
		this.car_name = car_name;
	}
	public String getCar_brand() {
		return car_brand;
	}
	public void setCar_brand(String car_brand) {
		this.car_brand = car_brand;
	}
	public String getCar_type() {
		return car_type;
	}
	public void setCar_type(String car_type) {
		this.car_type = car_type;
	}
	public long getCar_price() {
		return car_price;
	}
	public void setCar_price(long car_price) {
		this.car_price = car_price;
	}
	public long getCar_mile() {
		return car_mile;
	}
	public void setCar_mile(long car_mile) {
		this.car_mile = car_mile;
	}
	public String getCar_etc() {
		return car_etc;
	}
	public void setCar_etc(String car_etc) {
		this.car_etc = car_etc;
	}
	public String getPost_date() {
		return post_date;
	}
	public void setPost_date(String post_date) {
		this.post_date = post_date;
	}
	public User getPost_user() {
		return post_user;
	}
	public void setPost_user(User post_user) {
		this.post_user = post_user;
	}
	public List<String> getImg_list() {
		return img_list;
	}
	public void setImg_list(List<String> img_list) {
		this.img_list = img_list;
	}
	public List<Comment> getCmt_list() {
		return cmt_list;
	}
	public void setCmt_list(List<Comment> cmt_list) {
		this.cmt_list = cmt_list;
	}
	
	@Override
	public String toString() {
		String s = "post_id:" + post_id +
				"\ncar_name: " + car_name +
				"\ncar_brand: " + car_brand +
				"\ncar_type: " + car_type +
				"\ncar_price: " + car_price +
				"\ncar_mile: " + car_mile +
				"\ncar_etc: " + car_etc +
				"\npost_date: " + post_date +
				"\npost_user: " + post_user +
				"\nimg_list: \n";
		for(String img : img_list) {
			s += "\t" + img + "\n";
		}
		
		return s;
	}
}
