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

public class ProcedureService {
    private Properties properties;

    public List<Procedure> getResultList() {

        List<Procedure> procedureList = new ArrayList<>();
        ProcedureDb procedureDb = new ProcedureDb();
        procedureList = procedureDb.ExtractDatabase();
        Set<String> mappingSet = getMappingInfo();
        for (Procedure procedure : procedureList) {
            for (String key : mappingSet) {
                Method[] methods = procedure.getClass().getDeclaredMethods();
                Method getMethod = null;
                Method setMethod = null;
                //对于每一个key找到其对应的get和set方法。
                for (Method method : methods) {
                    if (method.getName().contains(key) && method.getName().startsWith("get")) {
                        getMethod = method;
                    }
                    if (method.getName().contains(key) && method.getName().startsWith("set")) {
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
