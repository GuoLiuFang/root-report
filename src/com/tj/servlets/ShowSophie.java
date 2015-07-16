package com.tj.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tj.beans.Sophie;
import com.tj.services.SophieService;

/**
 * Servlet implementation class ShowSophie
 */
public class ShowSophie extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShowSophie() {
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
		// TODO Auto-generated method stub
		SophieService sophieService = new SophieService();
		List<Sophie> sophieDetails = sophieService.getResultList();
		//----------- 核心的地方把处理结果返回前台               ------------------//
		request.getSession().setAttribute("sophieDetails", sophieDetails);
		//                         --------------------//
		response.sendRedirect("sophieJobDetail.jsp");
	}

}
