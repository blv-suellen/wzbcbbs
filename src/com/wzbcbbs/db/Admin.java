package com.wzbcbbs.db;

import java.sql.ResultSet;
import java.sql.SQLException;

public class Admin {
	private int admin_id;
	private String admin_name;
	private String admin_pw;
	private String sex;
	private String admin_faculty;
	private String adminpicture_url;
	private String admin_email;
	private int fans;
	private boolean isadmin;

	public int getAdmin_id() {
		return admin_id;
	}
	public void setAdmin_id(int admin_id) {
		this.admin_id = admin_id;
	}
	public String getAdmin_name() {
		return admin_name;
	}
	public void setAdmin_name(String admin_name) {
		this.admin_name = admin_name;
	}
	public String getAdmin_pw() {
		return admin_pw;
	}
	public void setAdmin_pw(String admin_pw) {
		this.admin_pw = admin_pw;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getAdmin_faculty() {
		return admin_faculty;
	}
	public void setAdmin_faculty(String admin_faculty) {
		this.admin_faculty = admin_faculty;
	}
	public String getAdminpicture_url() {
		return adminpicture_url;
	}
	public void setAdminpicture_url(String adminpicture_url) {
		this.adminpicture_url = adminpicture_url;
	}
	public String getAdmin_email() {
		return admin_email;
	}
	public void setAdmin_email(String admin_email) {
		this.admin_email = admin_email;
	}
	public int getFans() {
		return fans;
	}
	public void setFans(int fans) {
		this.fans = fans;
	}
	public boolean isIsadmin() {
		return isadmin;
	}
	public void setIsadmin(boolean isadmin) {
		this.isadmin = isadmin;
	}
	
	public void initUsers(ResultSet rsa){
		try {
			setAdmin_id(rsa.getInt("admin_id"));
			setAdmin_name(rsa.getString("admin_name"));
			setAdmin_pw(rsa.getString("admin_pw"));
			setSex(rsa.getString("sex"));
			setAdmin_faculty(rsa.getString("admin_faculty"));
			setAdminpicture_url(rsa.getString("adminpicture_url"));
			setAdmin_email(rsa.getString("admin_email"));
			setFans(rsa.getInt("fans"));
			setIsadmin(rsa.getInt("isadmin")==0 ? true:false);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
}
