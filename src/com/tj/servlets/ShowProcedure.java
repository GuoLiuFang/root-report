package com.tj.servlets;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tj.beans.Procedure;
import com.tj.extra.ProcedureExtra;
import com.tj.services.ProcedureService;

/**
 * Servlet implementation class ShowProcedure
 */
public class ShowProcedure extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShowProcedure() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ProcedureService procedureService = new ProcedureService();
		List<Procedure> procedureDetails = procedureService.getResultList();
        Map<String, ProcedureExtra> procedureExtraMap = procedureService.getProcedureExtraMap();
		//----------- 核心的地方把处理结果返回前台               ------------------//
		request.getSession().setAttribute("procedureDetails", procedureDetails);
		request.getSession().setAttribute("procedureExtraMap", procedureExtraMap);
		//                         --------------------//
		response.sendRedirect("procedureJobDetail.jsp");
	}

}
