package com.wzbcbbs.db;

import java.sql.ResultSet;
import java.sql.SQLException;

public class User {
	
	private int user_id;
	private String user_name;
	private String user_pw;
	private String sex;
	private String slogan;
	private String user_faculty;
	private String userpicture_url;
	private String user_email;
	private int user_posts;
	private int level;
	private int fans;
	private boolean isadministrator;
	
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getUser_pw() {
		return user_pw;
	}
	public void setUser_pw(String user_pw) {
		this.user_pw = user_pw;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getSlogan() {
		return slogan;
	}
	public void setSlogan(String slogan) {
		this.slogan = slogan;
	}
	public String getUser_faculty() {
		return user_faculty;
	}
	public void setUser_faculty(String user_faculty) {
		this.user_faculty = user_faculty;
	}

	public String getUserpicture_url() {
		return userpicture_url;
	}
	public void setUserpicture_url(String userpicture_url) {
		this.userpicture_url = userpicture_url;
	}
	public String getUser_email() {
		return user_email;
	}
	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}
	public int getLevel() {
		return level;
	}
	public void setLevel(int level) {
		this.level = level;
	}
	public int getFans() {
		return fans;
	}
	public void setFans(int fans) {
		this.fans = fans;
	}
	public int getUser_posts() {
		return user_posts;
	}
	public void setUser_posts(int user_posts) {
		this.user_posts = user_posts;
	}
	public boolean isIsadministrator() {
		return isadministrator;
	}
	public void setIsadministrator(boolean isadministrator) {
		this.isadministrator = isadministrator;
	}
	
	public void initUser(ResultSet rsu){
		try {
			setUser_id(rsu.getInt("user_id"));
			setUser_name(rsu.getString("user_name"));
			setUser_pw(rsu.getString("user_pw"));
			setSex(rsu.getString("sex"));
			setSlogan(rsu.getString("slogan"));
			setUser_email(rsu.getString("user_email"));
			setUser_faculty(rsu.getString("user_faculty"));
			setUserpicture_url(rsu.getString("userpicture_url"));
			setUser_posts(rsu.getInt("user_posts"));
			setLevel(rsu.getInt("user_level"));
			setFans(rsu.getInt("fan"));
			setIsadministrator(rsu.getInt("isadministrator")==1 ? true:false);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
}
