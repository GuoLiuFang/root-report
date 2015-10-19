package com.tj.servlets;

import com.tj.services.ErrorAddressService;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * Created by LiuFangGuo on 10/15/15.
 */
public class ErrorAddressHandler extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setHeader("Content-Type", "text/html; charset=UTF-8");
//        response.setCharacterEncoding("UTF-8");
        ErrorAddressService errorAddressService = ErrorAddressService.getErrorAddressService();
        String did = request.getParameter("did");
        String record_time = request.getParameter("record_time");
        String error_info = request.getParameter("error_info");
        PrintWriter printWriter = response.getWriter();
        printWriter.println("did-----回传的数据是" + did + "<br>");
        printWriter.println("record_time-----回传的数据是" + record_time + "<br>");
        printWriter.println("error_info-----回传的数据是" + error_info+ "<br>");
        printWriter.println("<br>-------------日志详情--------------------------<br>");

        String details = errorAddressService.getDetails(did, record_time);

        printWriter.println(details);
        printWriter.flush();
        printWriter.close();

    }
}
