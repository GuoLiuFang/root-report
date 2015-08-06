package com.tj.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.tj.beans.Address;

public class AddressDb {
	
	// 不那么费劲了，直接把infinidb当作mysql使用就好了。
	// private String infinidbUrl = "jdbc:infinidb:";

	private String protocal = "jdbc:mysql://";
	private String hostNamePort = "192.168.12.15:5209/";
//	private String hostNamePort = "localhost:5219/";
	private String scheme = "sword_production?";
	private String user = "user=guoliufang&";
	private String passwd = "password=tiger2108";
	private String sql = "select * from address_report order by record_time desc;";
	
	public List<Address> ExtractDatabase() {
		List<Address> dataList = new ArrayList<>();
		try {
			Class.forName("com.mysql.jdbc.Driver");
			String url = this.protocal + this.hostNamePort + this.scheme + this.user + this.passwd;
			Connection connection = DriverManager.getConnection(url);
			Statement statement = connection.createStatement();
			ResultSet resultSet = statement.executeQuery(sql);
			while (resultSet.next()) {
				Address address = new Address();
				
				address.setRecord_time(resultSet.getString("record_time"));
				address.setTotal(resultSet.getInt("total"));
				address.setMultiple(resultSet.getInt("multiple"));
				address.setMultiple_in_black(resultSet.getInt("multiple_in_black"));
				address.setMultiple_in_white(resultSet.getInt("multiple_in_white"));
				address.setMultiple_in_other(resultSet.getInt("multiple_in_other"));
				address.setUniq(resultSet.getInt("uniq"));
				address.setUniq_in_black(resultSet.getInt("uniq_in_black"));
				address.setUniq_in_white(resultSet.getInt("uniq_in_white"));
				address.setUniq_lt_threshold_lt_rate(resultSet.getInt("uniq_lt_threshold_lt_rate"));
				address.setUniq_lt_threshold_gt_rate(resultSet.getInt("uniq_lt_threshold_gt_rate"));
				address.setUniq_gt_threshold_lt_rate(resultSet.getInt("uniq_gt_threshold_lt_rate"));
				address.setNew_num(resultSet.getInt("new_num"));
				address.setDel_num(resultSet.getInt("del_num"));
				address.setBlack(resultSet.getInt("black"));
				address.setWhite(resultSet.getInt("white"));
				
				dataList.add(address);
			}

		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return dataList;

	}
	
	public static void main(String[] args) {
		List<Address> addresss = new ArrayList<>();
		AddressDb addressDb = new AddressDb();
		addresss = addressDb.ExtractDatabase();
		for (Address address : addresss) {
			System.out.println("日期是：" + address.getRecord_time());
		}
	}
	

}
