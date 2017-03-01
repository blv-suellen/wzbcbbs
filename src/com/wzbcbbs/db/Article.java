package com.wzbcbbs.db;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;

public class Article {
	private int id;
	private int pid;
	private int rootid;
	private String title;
	private String cont;
	private Date pdate;
	private boolean isLeaf;
	private int user_id;
	private int plate_id;
	private int grade;
	
	public int getGrade() {
		return grade;
	}
	public void setGrade(int grade) {
		this.grade = grade;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getPid() {
		return pid;
	}
	public void setPid(int pid) {
		this.pid = pid;
	}
	public int getRootid() {
		return rootid;
	}
	public void setRootid(int rootid) {
		this.rootid = rootid;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getCont() {
		return cont;
	}
	public void setCont(String cont) {
		this.cont = cont;
	}
	public Date getPdate() {
		return pdate;
	}
	public void setPdate(Date pdate) {
		this.pdate = pdate;
	}
	public boolean isLeaf() {
		return isLeaf;
	}
	public void setLeaf(boolean isLeaf) {
		this.isLeaf = isLeaf;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public int getPlate_id() {
		return plate_id;
	}
	public void setPlate_id(int plate_id) {
		this.plate_id = plate_id;
	}
	
	public void initFromRs(ResultSet rs){
		try {
			setId(rs.getInt("id"));
			setPid(rs.getInt("pid"));
			setRootid(rs.getInt("rootid"));
			setTitle(rs.getString("title"));
			setLeaf(rs.getInt("isleaf")==0 ? true:false);
			setPdate(rs.getTimestamp("pdate"));
			setCont(rs.getString("cont"));
			setUser_id(rs.getInt("user_id"));
			setPlate_id(rs.getInt("plate_id"));
			setGrade(grade);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
}
