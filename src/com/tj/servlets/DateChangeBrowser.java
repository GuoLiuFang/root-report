package com.tj.servlets;

import com.tj.beans.Procedure;
import com.tj.extra.ProcedureExtra;
import com.tj.services.ProcedureService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.Map;

/**
 * Created by LiuFangGuo on 11/5/15.
 */
public class DateChangeBrowser extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
                ProcedureService procedureService = new ProcedureService();
        List<Procedure> procedureDetails = procedureService.getResultList();
        Map<String, ProcedureExtra> procedureExtraMap = procedureService.getProcedureExtraMap();
        //----------- 核心的地方把处理结果返回前台               ------------------//
        request.getSession().setAttribute("procedureDetails", procedureDetails);
        request.getSession().setAttribute("procedureExtraMap", procedureExtraMap);
        //                         --------------------//
        response.sendRedirect("dateChangeBrowser.jsp");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
