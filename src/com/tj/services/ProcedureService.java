package com.tj.services;

import java.util.ArrayList;
import java.util.List;

import com.tj.beans.Procedure;
import com.tj.db.ProcedureDb;

public class ProcedureService {

	public List<Procedure> getResultList() {
		
		List<Procedure> procedureList = new ArrayList<>();
		ProcedureDb procedureDb = new ProcedureDb();
		procedureList = procedureDb.ExtractDatabase();
		// 对procedure的数据进行简单加工。
		for (Procedure procedure : procedureList) {
		}
		return procedureList;

	}

	public static void main(String[] args) {
		List<Procedure> procedureList = new ArrayList<>();
		ProcedureService service = new ProcedureService();
		procedureList = service.getResultList();
		for (Procedure procedure : procedureList) {
			System.out.println("日期是：" + procedure.getRecordTime());
		}

	}

}
