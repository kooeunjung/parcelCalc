package com.sunDelivery.web.dao.mysql;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.sunDelivery.web.dao.ParcelDao;
import com.sunDelivery.web.entity.Parcel;
import com.sunDelivery.web.properties.Property;

public class MySQLParcelDao implements ParcelDao {
	
	/**
	 * create
	 */
	
	//lastCode
	public String lastCode() {
		String sql = "select max(cast(PRICE_CODE as unsigned)) PRICE_CODE from PARCEL";
		String code = "0";

		try {
			Class.forName("com.mysql.jdbc.Driver");
			String url = Property.DB_URL;
			Connection con = DriverManager.getConnection(url, Property.DB_USER, Property.DB_PASSWD);
			Statement st = con.createStatement();

			// query: return ResultSet object

			ResultSet rs = st.executeQuery(sql);
			if (rs.next())
				code = rs.getString("PRICE_CODE");

			st.close();
			con.close();

		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return code;
	}
	
	//insert
	public int add(Parcel parcel) {
		String codeSql = "select max(cast(PRICE_CODE as unsigned))+1 PRICE_CODE from PARCEL";
		// insert sql
		String sql = "INSERT INTO PARCEL(PRICE_CODE,COMPANY,COMDETAIL,BOX_SIZE,BOX_WEIGHT,SAME_CITY,OTHER_CITY) VALUES(?,?,?,?,?,?,?)";
		int result = 0;

		try {
			Class.forName("com.mysql.jdbc.Driver");
			String url = Property.DB_URL;
			Connection con = DriverManager.getConnection(url, Property.DB_USER, Property.DB_PASSWD);

			// Code�� ��� ���� ��
			Statement codeSt = con.createStatement();
			ResultSet rs = codeSt.executeQuery(codeSql);
			rs.next();
			String code = rs.getString("PRICE_CODE");

			rs.close();
			codeSt.close();

			PreparedStatement st = con.prepareStatement(sql);

			st.setString(1, code);
			st.setString(2, parcel.getCompany());
			st.setString(3, parcel.getComdetail());
			st.setInt(4, parcel.getBoxSize());
			st.setInt(5, parcel.getBoxWeigtht());
			st.setInt(6, parcel.getSameCity());
			st.setInt(7, parcel.getOtherCity());
			
			result = st.executeUpdate();

			st.close();
			con.close();

		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	/**
	 * read
	 */
	public List<Parcel> getList() {
		// TODO Auto-generated method stub
		return getList(1, "");
	}

	public List<Parcel> getList(int page) {
		// TODO Auto-generated method stub
		return getList(page, "");
	}


	public List<Parcel> getList(int page, String query) {
		String sql = "SELECT * FROM PARCEL where COMPANY LIKE ? order by cast(PRICE_CODE as unsigned) LIMIT ?,10";

		List<Parcel> list = new ArrayList<>();
		try {
			Class.forName("com.mysql.jdbc.Driver");
			String url = Property.DB_URL;
			Connection con = DriverManager.getConnection(url, Property.DB_USER, Property.DB_PASSWD);
			PreparedStatement st = con.prepareStatement(sql);

			st.setString(1, "%" + query + "%");
			st.setInt(2, 10 * (page - 1));

			ResultSet rs = st.executeQuery();

			Parcel parcel = null;

			while (rs.next()) {
				parcel = new Parcel();
				// parcel.setCode(rs.getString("CODE"));
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
	
	//��ϵ� ������ ���� ��ȯ
	public int getSize() {
		// TODO Auto-generated method stub
		return getSize("");
	}

	public int getSize(String query) {
		String sql = "SELECT count(PRICE_CODE) SIZE FROM PARCEL where COMPANY LIKE ?";
		int size = 0;

		try {
			Class.forName("com.mysql.jdbc.Driver");
			String url = Property.DB_URL;
			Connection con = DriverManager.getConnection(url, Property.DB_USER, Property.DB_PASSWD);
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, "%" + query + "%");

			// query: return�� ResultSet object
			ResultSet rs = st.executeQuery();

			if (rs.next()) {
				size = rs.getInt("SIZE");
			}

			rs.close();
			st.close();
			con.close();

		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return size;
	}
	
	//�ڵ� �ϳ��� ���� ���� ���
	public Parcel get(String priceCode) {
		String sql = "SELECT * FROM PARCEL WHERE PRICE_CODE=?";
		Parcel parcel = null;

		try {
			Class.forName("com.mysql.jdbc.Driver");
			String url = Property.DB_URL;
			Connection con = DriverManager.getConnection(url, Property.DB_USER, Property.DB_PASSWD);
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, priceCode);

			ResultSet rs = st.executeQuery();

			if (rs.next()) {
				parcel = new Parcel();
				// parcel.setCode(rs.getString("CODE"));
				parcel.setCompany(rs.getString("COMPANY"));
				parcel.setComdetail(rs.getString("COMDETAIL"));
				parcel.setPriceCode(rs.getString("PRICE_CODE"));
				parcel.setBoxSize(rs.getInt("BOX_SIZE"));
				parcel.setBoxWeigtht(rs.getInt("BOX_WEIGHT"));
				parcel.setSameCity(rs.getInt("SAME_CITY"));
				parcel.setOtherCity(rs.getInt("OTHER_CITY"));
			}

			rs.close();
			st.close();
			con.close();

		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return parcel;
	}

	/**
	 * update
	 */
	public int update(Parcel parcel) {
		String sql = "UPDATE PARCEL SET COMPANY = ?, COMDETAIL = ?, BOX_SIZE = ?, BOX_WEIGHT = ?, SAME_CITY = ?, OTHER_CITY = ? WHERE PRICE_CODE = ?";
		int result = 0;

		try {
			Class.forName("com.mysql.jdbc.Driver");
			String url = Property.DB_URL;
			Connection con = DriverManager.getConnection(url, Property.DB_USER, Property.DB_PASSWD);
			PreparedStatement st = con.prepareStatement(sql);

			st.setString(1, parcel.getCompany());
			st.setString(2, parcel.getComdetail());
			st.setInt(3, parcel.getBoxSize());
			st.setInt(4, parcel.getBoxWeigtht());
			st.setInt(5, parcel.getSameCity());
			st.setInt(6, parcel.getOtherCity());
			st.setString(7, parcel.getPriceCode());
			// executeUpdate: ��ȯ���� int
			result = st.executeUpdate();

			st.close();
			con.close();

		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	public int update(String priceCode, String company, String comdetail, int boxWeigtht, int sameCity, int otherCity) {
		String sql = "UPDATE PARCEL SET COMPANY = ?, COMDETAIL = ?, BOX_WEIGHT = ?, SAME_CITY = ?, OTHER_CITY = ? WHERE PRICE_CODE = ?";
		int result = 0;

		try {
			Class.forName("com.mysql.jdbc.Driver");
			String url = Property.DB_URL;
			Connection con = DriverManager.getConnection(url, Property.DB_USER, Property.DB_PASSWD);
			PreparedStatement st = con.prepareStatement(sql);

			st.setString(1, company);
			st.setString(2, comdetail);
			st.setInt(3, boxWeigtht);
			st.setInt(4, sameCity);
			st.setInt(5, otherCity);
			st.setString(6, priceCode);
			// executeUpdate: ��ȯ���� int
			result = st.executeUpdate();

			st.close();
			con.close();

		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	/**
	 * delete
	 */
	public int delete(String priceCode) {
		String sql = "DELETE FROM PARCEL WHERE PRICE_CODE=?";
		int result = 0;

		try {
			Class.forName("com.mysql.jdbc.Driver");
			String url = Property.DB_URL;
			Connection con = DriverManager.getConnection(url, Property.DB_USER, Property.DB_PASSWD);
			PreparedStatement st = con.prepareStatement(sql);

			st.setString(1, priceCode);

			result = st.executeUpdate();

			st.close();
			con.close();

		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
}
