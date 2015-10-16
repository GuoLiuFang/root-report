package com.tj.db;

import com.tj.beans.ErrorAddress;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ErrorAddressDb {

    // 不那么费劲了，直接把infinidb当作mysql使用就好了。
    // private String infinidbUrl = "jdbc:infinidb:";

    private String protocal = "jdbc:mysql://";
        private String hostNamePort = "192.168.12.15:5209/";//production
//    private String hostNamePort = "localhost:5219/";//local test
    private String scheme = "sword_production?";
    private String user = "user=guoliufang&";
    private String passwd = "password=tiger2108";
    private String sql = "select * from address_verify order by record_time desc;";

    public List<ErrorAddress> ExtractDatabase() {
        List<ErrorAddress> dataList = new ArrayList<>();
        try {
            Class.forName("com.mysql.jdbc.Driver");
            String url = this.protocal + this.hostNamePort + this.scheme + this.user + this.passwd;
            Connection connection = DriverManager.getConnection(url);
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(sql);
            while (resultSet.next()) {
                ErrorAddress errorAddress = new ErrorAddress();

                errorAddress.setDid(resultSet.getString("did"));
                String record_time = resultSet.getString("record_time");
                errorAddress.setRecord_time(fixDateFormat(record_time));
                errorAddress.setError_info(resultSet.getString("error_info"));

                dataList.add(errorAddress);
            }

        } catch (ClassNotFoundException | SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        return dataList;

    }
    private String fixDateFormat(String record_time) {
        int index = record_time.lastIndexOf(".");
        return record_time.substring(0, index);
    }

    public static void main(String[] args) {
        List<ErrorAddress> procedureList = new ArrayList<>();
        ErrorAddressDb procedureDb = new ErrorAddressDb();
        procedureList = procedureDb.ExtractDatabase();
        for (ErrorAddress errorAddress : procedureList) {
            System.out.println("did是－－－－－－：" + errorAddress.getRecord_time());
        }
    }


}
