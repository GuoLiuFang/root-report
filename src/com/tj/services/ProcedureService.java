package com.tj.services;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.*;

import com.tj.beans.Procedure;
import com.tj.db.ProcedureDb;
import com.tj.extra.ProcedureExtra;

public class ProcedureService {
    private Properties properties;
    private Map<String, ProcedureExtra> procedureExtraMap;


    public Map<String, ProcedureExtra> getProcedureExtraMap() {
        return procedureExtraMap;
    }

    public List<Procedure> getResultList() {

        List<Procedure> procedureList = new ArrayList<>();
        ProcedureDb procedureDb = new ProcedureDb();
        procedureList = procedureDb.ExtractDatabase();
        Set<String> mappingSet = getMappingInfo();
        procedureExtraMap = new HashMap<>();
        for (Procedure procedure : procedureList) {
            fillAditionalInfo(procedure);
            for (String key : mappingSet) {
                Method[] methods = procedure.getClass().getDeclaredMethods();
                Method getMethod = null;
                Method setMethod = null;
                //对于每一个key找到其对应的get和set方法。
                for (Method method : methods) {
                    if (method.getName().contains(key) && method.getName().startsWith("get") && method.getName().endsWith("Lin")) {
                        getMethod = method;
                    }
                    if (method.getName().contains(key) && method.getName().startsWith("set") && method.getName().endsWith("Lin")) {
                        setMethod = method;
                    }
                }
                String fileName = properties.getProperty(key) + "_" + procedure.getRecordTime() + "_corver.txt";
                try {
                    String oldValue = (String) getMethod.invoke(procedure);
//                    String infoPath = "rootProcedureDetails/" + procedure.getRecordTime() + "/" + fileName;
                    String infoPath = "rootProcedureDetails/" + procedure.getRecordTime() + "/" + fileName + ".html";
                    String url = "<a href=\"" + infoPath + "\">" + oldValue + "</a>";
                    setMethod.invoke(procedure, url);
                } catch (IllegalAccessException e) {
                    e.printStackTrace();
                } catch (InvocationTargetException e) {
                    e.printStackTrace();
                }
            }
        }
        return procedureList;

    }

    private void fillAditionalInfo(Procedure procedure) {
        ProcedureExtra procedureExtra = new ProcedureExtra();
        procedureExtra.setCurrentNewIncrementLin("" + (Integer.valueOf(procedure.getUniqueAddressNewIncrementLin()) + Integer.valueOf(procedure.getAddEmpDirNewIncrementLin()) + Integer.valueOf(procedure.getUniAddLesMorDirNewIncrementLin()) + Integer.valueOf(procedure.getUniAddMorLesDirNewIncrementLin())));
        procedureExtra.setCurrentNewIncrementDid("" + (Integer.valueOf(procedure.getUniqueAddressNewIncrementDid()) + Integer.valueOf(procedure.getAddEmpDirNewIncrementDid()) + Integer.valueOf(procedure.getUniAddLesMorDirNewIncrementDid()) + Integer.valueOf(procedure.getUniAddMorLesDirNewIncrementDid())));
        procedureExtra.setCurrentNewDeleteLin("" + (Integer.valueOf(procedure.getOutAddMorLesZeroLin()) + Integer.valueOf(procedure.getOutAddMorLesHalfLin())));
        procedureExtra.setCurrentNewDeleteDid("" + (Integer.valueOf(procedure.getOutAddMorLesZeroDid()) + Integer.valueOf(procedure.getOutAddMorLesHalfDid())));
        procedureExtra.setCurrentBlackSizeLin("" + (Integer.valueOf(procedure.getUniqueAddressInBlackLin())));
        procedureExtra.setCurrentBlackSizeDid("" + (Integer.valueOf(procedure.getUniqueAddressInBlackDid())));
        procedureExtra.setCurrentWhiteSizeLin("" + (Integer.valueOf(procedure.getUniqueAddressInWhiteLin()) + Integer.valueOf(procedure.getAddEmpDirInWhiteLin()) + Integer.valueOf(procedureExtra.getCurrentNewIncrementLin())));
        procedureExtra.setCurrentWhiteSizeDid("" + (Integer.valueOf(procedure.getUniqueAddressInWhiteDid()) + Integer.valueOf(procedure.getAddEmpDirInWhiteDid()) + Integer.valueOf(procedureExtra.getCurrentNewIncrementDid())));

        procedureExtraMap.put(procedure.getRecordTime(), procedureExtra);

    }

    private Set getMappingInfo() {
        properties = new Properties();
        try {
            InputStream inputStream = this.getClass().getClassLoader().getResourceAsStream("mapping.properties");

            properties.load(inputStream);
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        Set<String> keySet = properties.stringPropertyNames();
        return keySet;
    }


    public static void main(String[] args) {
        List<Procedure> procedureList = new ArrayList<>();
        ProcedureService service = new ProcedureService();
//		procedureList = service.getResultList();
//		for (Procedure procedure : procedureList) {
//			System.out.println("日期是：" + procedure.getRecordTime());
//		}
        Set<String> set = service.getMappingInfo();
        for (String key : set) {
            System.out.println(key);
        }

    }

}
