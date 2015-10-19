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
//            String exeStr = "ssh ny3 \"" + getExeContent(args) + "\"";
            String exeStr = getExeContent(args);
//            exeStr ="sh /tmp/grepDetails.sh /tmp/bingo.2015-10-18.log 4502fc26-6771-4bdf-9b89-7c513963f0dc 23:59:58";
//            String exeStr = "grep '2015-10-18 23:59:58' /tmp/bingo.2015-10-18.log | grep 4502fc26-6771-4bdf-9b89-7c513963f0dc";
            System.out.println("---要执行的语句是－－－－－" + exeStr);
            Process process = Runtime.getRuntime().exec(exeStr);
            BufferedReader err = new BufferedReader(new InputStreamReader(process.getErrorStream()));
            BufferedReader read = new BufferedReader(new InputStreamReader(process.getInputStream()));
            String line;
//            System.out.println("<INFO>");
            while ((line = read.readLine()) != null) {
                result.append(line);
//                System.out.println(line);
            }
//            System.out.println("</INFO>");
//            System.out.println("<ERROR>");
            while ((line = err.readLine()) != null) {
                result.append(line);
//                System.out.println(line);
            }
//            System.out.println("</ERROR>");
        } catch (IOException e) {
            e.printStackTrace();
        }
        String formateDetails = formatDetails(result.toString());
        return formateDetails;
    }

    private String formatDetails(String s) {
        String result = s.replaceAll("\\\\n","<br>");
        return result;
    }

    private String getExeContent(String... args) {
        String date_time = args[1];
        String[] dateAndTime = date_time.split("[ ]");
        String contentFileName = "bingo." + dateAndTime[0] + ".log";
        String exeContent = this.properties.getProperty("exeWay") + " " + this.properties.getProperty("shellPath") + " " + this.properties.getProperty("contentPath") + contentFileName + " " + args[0] + " " + dateAndTime[1];
        System.out.println(exeContent);
        return exeContent;
    }


    public static void main(String[] args) {
//        List<ErrorAddress> errorAddressList = new ArrayList<>();
//        ErrorAddressService service = new ErrorAddressService();
//        errorAddressList = service.getResultList();
//        for (ErrorAddress errorAddress : errorAddressList) {
//            System.out.println("日期是：" + errorAddress.getDid());
//        }
        ErrorAddressService errorAddressService = ErrorAddressService.getErrorAddressService();
        String result = errorAddressService.getDetails("4502fc26-6771-4bdf-9b89-7c513963f0dc", "2015-10-18 23:59:58");
//        String result = errorAddressService.getExeContent("4502fc26-6771-4bdf-9b89-7c513963f0dc", "2015-10-18 23:59:58");
        System.out.println("-------执行结果是-------" + result);
    }

}