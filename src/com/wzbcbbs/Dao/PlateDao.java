package com.wzbcbbs.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.wzbcbbs.db.DataBase;
import com.wzbcbbs.db.Plate;
import com.wzbcbbs.db.User;

public class PlateDao {
	public List<Plate> selectPlateList() {
		Connection conn = null;
		conn = DataBase.getConn();
		PreparedStatement ps = null;
		List<Plate> listPlate = new ArrayList<Plate>();
		String sql = "select * from plate";
		Plate plate = null;
		ResultSet rs = null;
		try {
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
				plate = new Plate();
				plate.setPlate(rs);
				listPlate.add(plate);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		DataBase.close(conn);
		DataBase.close(rs);
		DataBase.close(ps);
		return listPlate;
	}

	public Plate selectPlate(String id) {
		Connection conn = null;
		conn = DataBase.getConn();
		PreparedStatement ps = null;
		List<Plate> listPlate = new ArrayList<Plate>();
		String sql = "select * from plate where plate_id = " + id;
		Plate plate = null;
		ResultSet rs = null;
		try {
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
				plate = new Plate();
				plate.setPlate_id(Integer.parseInt(rs.getString("plate_id")));
				plate.setPlate_name(rs.getString("plate_name"));
				plate.setMotto_one(rs.getString("motto_one"));
				plate.setMotto_two(rs.getString("motto_two"));
				plate.setMotto_three(rs.getString("motto_three"));
				plate.setPlate_picture(rs.getString("plate_picture"));
				plate.setPlate_cont(rs.getString("plate_cont"));
				listPlate.add(plate);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		DataBase.close(conn);
		DataBase.close(rs);
		DataBase.close(ps);
		return plate;
	}

	public boolean changePlate(Plate plate) {
		boolean suc = false;
		Connection conn = null;
		conn = DataBase.getConn();
		PreparedStatement ps = null;
		String sql = null;
		sql = "update plate set plate_name = ?, motto_one = ?,motto_two = ?,motto_three = ?,plate_cont = ? where plate_id = ?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, plate.getPlate_name());
			ps.setString(2, plate.getMotto_one());
			ps.setString(3, plate.getMotto_two());
			ps.setString(4, plate.getMotto_three());
			ps.setString(5, plate.getPlate_cont());
			ps.setInt(6, plate.getPlate_id());
			if (ps.executeUpdate() > 0) {
				suc = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		DataBase.close(conn);
		DataBase.close(ps);
		return suc;
	}
	
	public boolean changePic(Plate plate) {
		boolean suc = false;
		Connection conn = null;
		conn = DataBase.getConn();
		PreparedStatement ps = null;
		String sql = null;
		sql = "update plate set plate_picture = ? where plate_id = ?";
		System.out.println("plate_picture --> " + plate.getPlate_picture());
		System.out.println("plate_id --> " + plate.getPlate_id());
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, plate.getPlate_picture());
			ps.setInt(2, plate.getPlate_id());
			if (ps.executeUpdate() > 0) {
				suc = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		DataBase.close(conn);
		DataBase.close(ps);
		return suc;
	}

	public boolean deletePlate(String id) {
		boolean suc = false;
		Connection conn = null;
		conn = DataBase.getConn();
		PreparedStatement ps = null;
		String sql = null;
		sql = "delete from plate where plate_id = ?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			if (ps.executeUpdate() > 0)
				suc = true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		DataBase.close(conn);
		DataBase.close(ps);
		return suc;
	}
	
	public boolean addPlate(Plate plate) {
		boolean suc = false;
		Connection conn = null;
		conn = DataBase.getConn();
		PreparedStatement ps = null;
		String sql = null;
		//sql语句问题
		sql = "insert into plate(plate_name, motto_one,motto_two,motto_three,plate_cont) values (?,?,?,?,?) ";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, plate.getPlate_name());
			ps.setString(2, plate.getMotto_one());
			ps.setString(3, plate.getMotto_two());
			ps.setString(4, plate.getMotto_three());
			ps.setString(5, plate.getPlate_cont());
			if (ps.executeUpdate() > 0) {
				suc = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		DataBase.close(conn);
		DataBase.close(ps);
		return suc;
	}
}
