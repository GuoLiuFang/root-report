package com.tj.services;

import com.tj.beans.ErrorAddress;
import com.tj.db.ErrorAddressDb;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.*;

public class ErrorAddressService {
    private static ErrorAddressService errorAddressService;
    private Properties properties;

    private ErrorAddressService() {
        this.properties = new Properties();
        InputStream inputStream = this.getClass().getClassLoader().getResourceAsStream("shell.properties");
        try {
            this.properties.load(inputStream);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public static synchronized ErrorAddressService getErrorAddressService() {
        if (errorAddressService == null) {
            errorAddressService = new ErrorAddressService();
        }
        return errorAddressService;
    }


    public List<ErrorAddress> getResultList() {

        List<ErrorAddress> errorAddressList = new ArrayList<>();
        ErrorAddressDb errorAddressDb = new ErrorAddressDb();
        errorAddressList = errorAddressDb.ExtractDatabase();
        for (ErrorAddress errorAddress : errorAddressList) {
//            System.out.println("-----------" + errorAddress.getDid() );
        }
        return errorAddressList;

    }

    public String getDetails(String... args) {
        StringBuffer result = new StringBuffer();
        try {
//            String exeStr = this.properties.getProperty("exeWay") + " " + this.properties.getProperty("shellPath") + " " + this.properties.getProperty("contentPath") + " " + args[0] + " " + args[1];
//            System.out.println("---要执行的语句是－－－－－" + exeStr);
            Process process = Runtime.getRuntime().exec(getExeContent(args));
            BufferedReader read = new BufferedReader(new InputStreamReader(process.getInputStream()));
            process.waitFor();
            while (read.ready()) {
                result.append(read.readLine());
//                System.out.println(read.readLine());
            }
        } catch (IOException e) {
            e.printStackTrace();
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        return result.toString();
    }

    private String getExeContent(String... args) {
        String date_time = args[1];
        String contentFileName = "bingo." + date_time + ".log";
        return this.properties.getProperty("exeWay") + " " + this.properties.getProperty("shellPath") + " " + this.properties.getProperty("contentPath") + contentFileName + " " + args[0] + " " + args[1];
    }


    public static void main(String[] args) {
//        List<ErrorAddress> errorAddressList = new ArrayList<>();
//        ErrorAddressService service = new ErrorAddressService();
//        errorAddressList = service.getResultList();
//        for (ErrorAddress errorAddress : errorAddressList) {
//            System.out.println("日期是：" + errorAddress.getDid());
//        }
        ErrorAddressService errorAddressService = ErrorAddressService.getErrorAddressService();
        String result = errorAddressService.getDetails("4beaec8b-ec1b-4ff8-844d-5e5ddd579020", "2015-09-29 08:49:55");
        System.out.println("-------执行结果是-------" + result);
    }

}
