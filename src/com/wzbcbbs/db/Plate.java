package com.wzbcbbs.db;

import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Plate {
	private int plate_id;
	private String plate_name;
	private int superadmin_id;
	private String motto_one;
	private String motto_two;
	private String motto_three;
	private Date pdate;
	private String plate_picture;
	private String plate_cont;
	
	
	public String getPlate_cont() {
		return plate_cont;
	}
	public void setPlate_cont(String plate_cont) {
		this.plate_cont = plate_cont;
	}
	public int getPlate_id() {
		return plate_id;
	}
	public void setPlate_id(int plate_id) {
		this.plate_id = plate_id;
	}
	public String getPlate_name() {
		return plate_name;
	}
	public void setPlate_name(String plate_name) {
		this.plate_name = plate_name;
	}
	public int getSuperadmin_id() {
		return superadmin_id;
	}
	public void setSuperadmin_id(int superadmin_id) {
		this.superadmin_id = superadmin_id;
	}
	public String getMotto_one() {
		return motto_one;
	}
	public void setMotto_one(String motto_one) {
		this.motto_one = motto_one;
	}
	public String getMotto_two() {
		return motto_two;
	}
	public void setMotto_two(String motto_two) {
		this.motto_two = motto_two;
	}
	public String getMotto_three() {
		return motto_three;
	}
	public void setMotto_three(String motto_three) {
		this.motto_three = motto_three;
	}
	public Date getPdate() {
		return pdate;
	}
	public void setPdate(Date pdate) {
		this.pdate = pdate;
	}
	public String getPlate_picture() {
		return plate_picture;
	}
	public void setPlate_picture(String plate_picture) {
		this.plate_picture = plate_picture;
	}
	
	public void setPlate(ResultSet rplate){
		try {
			setPlate_id(rplate.getInt("plate_id"));
			setPlate_name(rplate.getString("plate_name"));
			setSuperadmin_id(rplate.getInt("superadmin_id"));
			setMotto_one(rplate.getString("motto_one"));
			setMotto_two(rplate.getString("motto_two"));
			setMotto_three(rplate.getString("motto_three"));
			setPdate(rplate.getDate("pdate"));
			setPlate_picture(rplate.getString("plate_picture"));
			setPlate_cont(rplate.getString("plate_cont"));
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
	
}
