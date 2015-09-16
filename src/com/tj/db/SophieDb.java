package com.tj.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.tj.beans.Sophie;

public class SophieDb {
	// 不那么费劲了，直接把infinidb当作mysql使用就好了。
	// private String infinidbUrl = "jdbc:infinidb:";

	private String protocal = "jdbc:mysql://";
//	private String hostNamePort = "192.168.12.15:5209/";//production
	private String hostNamePort = "localhost:5219/";//local test
	private String scheme = "sword_production?";
	private String user = "user=guoliufang&";
	private String passwd = "password=tiger2108";
	private String sql = "select * from sophie_monitor order by record_time desc;";

	public List<Sophie> ExtractDatabase() {
		List<Sophie> dataList = new ArrayList<>();
		try {
			Class.forName("com.mysql.jdbc.Driver");
			String url = this.protocal + this.hostNamePort + this.scheme + this.user + this.passwd;
			Connection connection = DriverManager.getConnection(url);
			Statement statement = connection.createStatement();
			ResultSet resultSet = statement.executeQuery(sql);
			while (resultSet.next()) {
				Sophie sophie = new Sophie();

				sophie.setRecord_time(resultSet.getString("record_time"));
				sophie.setWhich_log(resultSet.getString("which_log"));
				sophie.setCnt_lns(resultSet.getInt("cnt_lns"));
				sophie.setCnt_vld(resultSet.getInt("cnt_vld"));
				sophie.setCnt_scs(resultSet.getInt("cnt_scs"));
				sophie.setCnt_flt(resultSet.getInt("cnt_flt"));
				sophie.setCnt_err(resultSet.getInt("cnt_err"));
				sophie.setCnt_csv(resultSet.getInt("cnt_csv"));
				sophie.setCnt_jsn(resultSet.getInt("cnt_jsn"));
				sophie.setCnt_dstrbt(resultSet.getInt("cnt_dstrbt"));
				sophie.setVld_spc_cnt(resultSet.getInt("vld_spc_cnt"));
				sophie.setVld_info(resultSet.getString("vld_info"));
				sophie.setFlt_spc_cnt(resultSet.getInt("flt_spc_cnt"));
				sophie.setFlt_info(resultSet.getString("flt_info"));
				sophie.setErr_spc_cnt(resultSet.getInt("err_spc_cnt"));
				sophie.setErr_info(resultSet.getString("err_info"));
				sophie.setDb_log(resultSet.getString("db_log"));
				sophie.setDb_err(resultSet.getString("db_err"));
				sophie.setDb_bad(resultSet.getString("db_bad"));
				sophie.setCnt_db_prc(resultSet.getInt("cnt_db_prc"));
				sophie.setCnt_db_insrt(resultSet.getInt("cnt_db_insrt"));
//				System.out.println(sophie.getWhich_log());
				dataList.add(sophie);
			}

		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return dataList;

	}
	
	public static void main(String[] args) {
		List<Sophie> sophies = new ArrayList<>();
		SophieDb sophieDb = new SophieDb();
		sophies = sophieDb.ExtractDatabase();
	}
	

}
