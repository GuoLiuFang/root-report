package com.tj.servlets;

import com.tj.beans.ErrorAddress;
import com.tj.extra.ProcedureExtra;
import com.tj.services.ErrorAddressService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.Map;

/**
 * Servlet implementation class ShowProcedure
 */
public class ShowErrorAddress extends HttpServlet {

    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShowErrorAddress() {
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
		ErrorAddressService errorAddressService = ErrorAddressService.getErrorAddressService();
		List<ErrorAddress> errorAddressDetails = errorAddressService.getResultList();
//        Map<String, ProcedureExtra> procedureExtraMap = errorAddressService.getProcedureExtraMap();
		//----------- 核心的地方把处理结果返回前台               ------------------//
		request.getSession().setAttribute("errorAddressDetails", errorAddressDetails);
//		request.getSession().setAttribute("procedureExtraMap", procedureExtraMap);
		//                         --------------------//
		response.sendRedirect("errorAddressJobDetail.jsp");
	}

}
