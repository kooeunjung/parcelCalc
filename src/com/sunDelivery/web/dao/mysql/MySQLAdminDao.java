package com.sunDelivery.web.dao.mysql;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.sunDelivery.web.properties.Property;
import com.sunDelivery.web.dao.AdminDao;
import com.sunDelivery.web.entity.Admin;

public class MySQLAdminDao implements AdminDao{

	public Admin get(String id) {
		String sql = "SELECT * FROM ADMIN WHERE ID=?";
		Admin admin = null;

		try {
			Class.forName("com.mysql.jdbc.Driver");
			String url = Property.DB_URL;
			Connection con = DriverManager.getConnection(url, Property.DB_USER, Property.DB_PASSWD);
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, id);

			ResultSet rs = st.executeQuery();

			if (rs.next()) {
				admin=new Admin();
				admin.setId(rs.getString("ID"));
				admin.setPassword(rs.getString("PASSWORD"));
				admin.setEmail(rs.getString("EMAIL"));
			}

			rs.close();
			st.close();
			con.close();

		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return admin;
	}

}
