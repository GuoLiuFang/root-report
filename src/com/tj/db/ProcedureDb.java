package com.tj.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.tj.beans.Procedure;

public class ProcedureDb {
	
	// 不那么费劲了，直接把infinidb当作mysql使用就好了。
	// private String infinidbUrl = "jdbc:infinidb:";

	private String protocal = "jdbc:mysql://";
//	private String hostNamePort = "192.168.12.15:5209/";//production
	private String hostNamePort = "localhost:5219/";//local test
	private String scheme = "sword_production?";
	private String user = "user=guoliufang&";
	private String passwd = "password=tiger2108";
	private String sql = "select * from root_report order by recordTime desc;";
	
	public List<Procedure> ExtractDatabase() {
		List<Procedure> dataList = new ArrayList<>();
		try {
			Class.forName("com.mysql.jdbc.Driver");
			String url = this.protocal + this.hostNamePort + this.scheme + this.user + this.passwd;
			Connection connection = DriverManager.getConnection(url);
			Statement statement = connection.createStatement();
			ResultSet resultSet = statement.executeQuery(sql);
			while (resultSet.next()) {
				Procedure procedure = new Procedure();

				procedure.setRecordTime("" + resultSet.getString("recordTime"));
				procedure.setTotalAllDid("" + resultSet.getInt("totalAllDid"));
				procedure.setTotalAllLin("" + resultSet.getInt("totalAllLin"));
				procedure.setTotalSuccessDid("" + resultSet.getInt("totalSuccessDid"));
				procedure.setTotalSuccessLin("" + resultSet.getInt("totalSuccessLin"));
				procedure.setTotalFailureDid("" + resultSet.getInt("totalFailureDid"));
				procedure.setTotalFailureLin("" + resultSet.getInt("totalFailureLin"));
				procedure.setSuccessHundredSeriesDid("" + resultSet.getInt("successHundredSeriesDid"));
				procedure.setSuccessHundredSeriesLin("" + resultSet.getInt("successHundredSeriesLin"));
				procedure.setSuccessOtherCategoryDid("" + resultSet.getInt("successOtherCategoryDid"));
				procedure.setSuccessOtherCategoryLin("" + resultSet.getInt("successOtherCategoryLin"));
				procedure.setHundredSeriesShellCodeZeroDid("" + resultSet.getInt("hundredSeriesShellCodeZeroDid"));
				procedure.setHundredSeriesShellCodeZeroLin("" + resultSet.getInt("hundredSeriesShellCodeZeroLin"));
				procedure.setHundredSeriesShellCodeNoZeroDid("" + resultSet.getInt("hundredSeriesShellCodeNoZeroDid"));
				procedure.setHundredSeriesShellCodeNoZeroLin("" + resultSet.getInt("hundredSeriesShellCodeNoZeroLin"));
				procedure.setShellCodeZeroTwoMeaningsDid("" + resultSet.getInt("shellCodeZeroTwoMeaningsDid"));
				procedure.setShellCodeZeroTwoMeaningsLin("" + resultSet.getInt("shellCodeZeroTwoMeaningsLin"));
				procedure.setShellCodeZeroUniqueAddressDid("" + resultSet.getInt("shellCodeZeroUniqueAddressDid"));
				procedure.setShellCodeZeroUniqueAddressLin("" + resultSet.getInt("shellCodeZeroUniqueAddressLin"));
				procedure.setShellCodeZeroAddressEmptyDid("" + resultSet.getInt("shellCodeZeroAddressEmptyDid"));
				procedure.setShellCodeZeroAddressEmptyLin("" + resultSet.getInt("shellCodeZeroAddressEmptyLin"));
				procedure.setUniqueAddressInBlackDid("" + resultSet.getInt("uniqueAddressInBlackDid"));
				procedure.setUniqueAddressInBlackLin("" + resultSet.getInt("uniqueAddressInBlackLin"));
				procedure.setUniqueAddressInWhiteDid("" + resultSet.getInt("uniqueAddressInWhiteDid"));
				procedure.setUniqueAddressInWhiteLin("" + resultSet.getInt("uniqueAddressInWhiteLin"));
				procedure.setUniqueAddressLessLessDid("" + resultSet.getInt("uniqueAddressLessLessDid"));
				procedure.setUniqueAddressLessLessLin("" + resultSet.getInt("uniqueAddressLessLessLin"));
				procedure.setUniqueAddressLessMoreDid("" + resultSet.getInt("uniqueAddressLessMoreDid"));
				procedure.setUniqueAddressLessMoreLin("" + resultSet.getInt("uniqueAddressLessMoreLin"));
				procedure.setUniqueAddressMoreLessDid("" + resultSet.getInt("uniqueAddressMoreLessDid"));
				procedure.setUniqueAddressMoreLessLin("" + resultSet.getInt("uniqueAddressMoreLessLin"));
				procedure.setUniqueAddressNewIncrementDid("" + resultSet.getInt("uniqueAddressNewIncrementDid"));
				procedure.setUniqueAddressNewIncrementLin("" + resultSet.getInt("uniqueAddressNewIncrementLin"));
				procedure.setUniAddLesMorDirectedDid("" + resultSet.getInt("uniAddLesMorDirectedDid"));
				procedure.setUniAddLesMorDirectedLin("" + resultSet.getInt("uniAddLesMorDirectedLin"));
				procedure.setUniAddLesMorUndirectedDid("" + resultSet.getInt("uniAddLesMorUndirectedDid"));
				procedure.setUniAddLesMorUndirectedLin("" + resultSet.getInt("uniAddLesMorUndirectedLin"));
				procedure.setUniAddLesMorDirLessLessDid("" + resultSet.getInt("uniAddLesMorDirLessLessDid"));
				procedure.setUniAddLesMorDirLessLessLin("" + resultSet.getInt("uniAddLesMorDirLessLessLin"));
				procedure.setUniAddLesMorDirLessMoreDid("" + resultSet.getInt("uniAddLesMorDirLessMoreDid"));
				procedure.setUniAddLesMorDirLessMoreLin("" + resultSet.getInt("uniAddLesMorDirLessMoreLin"));
				procedure.setUniAddLesMorDirMoreLessDid("" + resultSet.getInt("uniAddLesMorDirMoreLessDid"));
				procedure.setUniAddLesMorDirMoreLessLin("" + resultSet.getInt("uniAddLesMorDirMoreLessLin"));
				procedure.setUniAddLesMorDirNewIncrementDid("" + resultSet.getInt("uniAddLesMorDirNewIncrementDid"));
				procedure.setUniAddLesMorDirNewIncrementLin("" + resultSet.getInt("uniAddLesMorDirNewIncrementLin"));
				procedure.setUniAddMorLesDirectedDid("" + resultSet.getInt("uniAddMorLesDirectedDid"));
				procedure.setUniAddMorLesDirectedLin("" + resultSet.getInt("uniAddMorLesDirectedLin"));
				procedure.setUniAddMorLesUndirectedDid("" + resultSet.getInt("uniAddMorLesUndirectedDid"));
				procedure.setUniAddMorLesUndirectedLin("" + resultSet.getInt("uniAddMorLesUndirectedLin"));
				procedure.setUniAddMorLesDirLessLessDid("" + resultSet.getInt("uniAddMorLesDirLessLessDid"));
				procedure.setUniAddMorLesDirLessLessLin("" + resultSet.getInt("uniAddMorLesDirLessLessLin"));
				procedure.setUniAddMorLesDirLessMoreDid("" + resultSet.getInt("uniAddMorLesDirLessMoreDid"));
				procedure.setUniAddMorLesDirLessMoreLin("" + resultSet.getInt("uniAddMorLesDirLessMoreLin"));
				procedure.setUniAddMorLesDirMoreLessDid("" + resultSet.getInt("uniAddMorLesDirMoreLessDid"));
				procedure.setUniAddMorLesDirMoreLessLin("" + resultSet.getInt("uniAddMorLesDirMoreLessLin"));
				procedure.setUniAddMorLesDirNewIncrementDid("" + resultSet.getInt("uniAddMorLesDirNewIncrementDid"));
				procedure.setUniAddMorLesDirNewIncrementLin("" + resultSet.getInt("uniAddMorLesDirNewIncrementLin"));
				procedure.setAddEmpDirectedDid("" + resultSet.getInt("addEmpDirectedDid"));
				procedure.setAddEmpDirectedLin("" + resultSet.getInt("addEmpDirectedLin"));
				procedure.setAddEmpUndirectedDid("" + resultSet.getInt("addEmpUndirectedDid"));
				procedure.setAddEmpUndirectedLin("" + resultSet.getInt("addEmpUndirectedLin"));
				procedure.setAddEmpDirLessLessDid("" + resultSet.getInt("addEmpDirLessLessDid"));
				procedure.setAddEmpDirLessLessLin("" + resultSet.getInt("addEmpDirLessLessLin"));
				procedure.setAddEmpDirLessMoreDid("" + resultSet.getInt("addEmpDirLessMoreDid"));
				procedure.setAddEmpDirLessMoreLin("" + resultSet.getInt("addEmpDirLessMoreLin"));
				procedure.setAddEmpDirMoreLessDid("" + resultSet.getInt("addEmpDirMoreLessDid"));
				procedure.setAddEmpDirMoreLessLin("" + resultSet.getInt("addEmpDirMoreLessLin"));
				procedure.setAddEmpDirInBlackDid("" + resultSet.getInt("addEmpDirInBlackDid"));
				procedure.setAddEmpDirInBlackLin("" + resultSet.getInt("addEmpDirInBlackLin"));
				procedure.setAddEmpDirInWhiteDid("" + resultSet.getInt("addEmpDirInWhiteDid"));
				procedure.setAddEmpDirInWhiteLin("" + resultSet.getInt("addEmpDirInWhiteLin"));
				procedure.setAddEmpDirNewIncrementDid("" + resultSet.getInt("addEmpDirNewIncrementDid"));
				procedure.setAddEmpDirNewIncrementLin("" + resultSet.getInt("addEmpDirNewIncrementLin"));
				procedure.setTotalSuccessInLogExe("" + resultSet.getInt("totalSuccessInLogExe"));
				procedure.setTotalSuccessInLogIng("" + resultSet.getInt("totalSuccessInLogIng"));
				procedure.setTotalSuccessInLogLin("" + resultSet.getInt("totalSuccessInLogLin"));
				procedure.setTotalSuccessInDataBaseExe("" + resultSet.getInt("totalSuccessInDataBaseExe"));
				procedure.setTotalSuccessInDataBaseIng("" + resultSet.getInt("totalSuccessInDataBaseIng"));
				procedure.setTotalSuccessInDataBaseLin("" + resultSet.getInt("totalSuccessInDataBaseLin"));

                procedure.setOutAddMorMorDid("" + resultSet.getInt("outAddMorMorDid"));
                procedure.setOutAddMorMorLin("" + resultSet.getInt("outAddMorMorLin"));
                procedure.setOutAddLessDid("" + resultSet.getInt("outAddLessDid"));
                procedure.setOutAddLessLin("" + resultSet.getInt("outAddLessLin"));
                procedure.setOutAddMorLesZeroDid("" + resultSet.getInt("outAddMorLesZeroDid"));
                procedure.setOutAddMorLesZeroLin("" + resultSet.getInt("outAddMorLesZeroLin"));
                procedure.setOutAddMorLesHalfDid("" + resultSet.getInt("outAddMorLesHalfDid"));
                procedure.setOutAddMorLesHalfLin("" + resultSet.getInt("outAddMorLesHalfLin"));

				dataList.add(procedure);
			}

		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return dataList;

	}
	
	public static void main(String[] args) {
		List<Procedure> procedureList = new ArrayList<>();
		ProcedureDb procedureDb = new ProcedureDb();
		procedureList = procedureDb.ExtractDatabase();
		for (Procedure procedure : procedureList) {
			System.out.println("日期是：" + procedure.getRecordTime());
		}
	}
	

}
