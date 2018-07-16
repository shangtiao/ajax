package com;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ajaxD;
import daoImp.ajaxDimp;
import user.user;

/**
 * Servlet implementation class ajax
 */

public class ajax extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ajax() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String mobliephone = request.getParameter("mobliephone");
		System.out.println(username + password + mobliephone );
		response.setCharacterEncoding("utf-8");
		String str = "´æ´¢³É¹¦";
		ajaxD ajax = new ajaxDimp();
		user u = new user();
		u.setUsername(username);
		u.setPassword(password);
		u.setMobliephone(mobliephone);
		ajax.save(u);
		response.getWriter().write(str);
	}

}
