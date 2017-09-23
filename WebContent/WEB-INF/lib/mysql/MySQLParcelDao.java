package com.sunDelivery.web.dao.mysql;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.sunDelivery.web.dao.ParcelDao;
import com.sunDelivery.web.entity.Parcel;

public class MySQLParcelDao implements ParcelDao{

	@Override
	public List<Parcel> getList() {
		// TODO Auto-generated method stub
		return getList(1, "COMPANY", "");
	}

	@Override
	public List<Parcel> getList(int page) {
		// TODO Auto-generated method stub
		return getList(page, "COMPANY", "");
	}

	@Override
	public List<Parcel> getList(int page, String field, String query) {
		String sql = "SELECT * FROM PARCEL where binary " + field + " LIKE ? order by cast(PRICE_CODE as unsigned) LIMIT ?,10";
		List<Parcel> list = new ArrayList<>();
		try {
			Class.forName("com.mysql.jdbc.Driver");
			String url = "jdbc:mysql://211.238.142.84/sun?autoReconnect=true&amp;useSSL=false&characterEncoding=UTF-8";
			Connection con = DriverManager.getConnection(url, "smlab", "0916");
			PreparedStatement st = con.prepareStatement(sql);
			
			st.setString(1, "%" + query + "%");
			st.setInt(2, 10 * (page - 1));

			ResultSet rs = st.executeQuery();

			Parcel parcel = null;

			while (rs.next()) {
				parcel = new Parcel();
				//parcel.setCode(rs.getString("CODE"));
				parcel.setCompany(rs.getString("COMPANY"));
				parcel.setComdetail(rs.getString("COMDETAIL"));
				parcel.setPriceCode(rs.getString("PRICE_CODE"));
				parcel.setBoxSize(rs.getInt("BOX_SIZE"));
				parcel.setBoxWeigtht(rs.getInt("BOX_WEIGHT"));
				parcel.setSameCity(rs.getInt("SAME_CITY"));
				parcel.setOtherCity(rs.getInt("OTHER_CITY"));
				
				list.add(parcel);
			}

			rs.close();
			st.close();
			con.close();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
}
