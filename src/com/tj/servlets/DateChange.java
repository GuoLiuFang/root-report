package com.tj.servlets;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by LiuFangGuo on 11/5/15.
 */
public class DateChange extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //        ProcedureService procedureService = new ProcedureService();
//        List<Procedure> procedureDetails = procedureService.getResultList();
//        Map<String, ProcedureExtra> procedureExtraMap = procedureService.getProcedureExtraMap();
//        //----------- 核心的地方把处理结果返回前台               ------------------//
//        request.getSession().setAttribute("procedureDetails", procedureDetails);
//        request.getSession().setAttribute("procedureExtraMap", procedureExtraMap);
//        //                         --------------------//
        response.sendRedirect("dateChange.jsp");

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
