package com.bitjeju.mypage.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bitjeju.member.MemberDao;
import com.bitjeju.member.MemberDto;

/**
 * Servlet implementation class MypageEdit
 */
@WebServlet("/mypageedit.bit")
public class MypageEdit extends HttpServlet {

	private int num;
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
		MemberDao dao = new MemberDao();
		MemberDto bean = null;
		
		try {
			bean = dao.selectOne(num);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		request.setAttribute("bean", bean);
		request.getRequestDispatcher("mypageEdit.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		int num = Integer.parseInt(request.getParameter("idx"));
		this.num  = num;
		System.out.println(num+"<<회원번호");
		//MemberDao dao = new MemberDao();
		//MemberDto bean = null;
		
		
		/*
		 * PrintWriter out = response.getWriter(); out.print("<성공>1</성공>"); out.close();
		 */
		
		//try {
		//	bean = dao.selectOne(num);
		//} catch (SQLException e) {
			// TODO Auto-generated catch block
		//	e.printStackTrace();
		//}
		
		//request.setAttribute("bean", bean);
		//request.getRequestDispatcher("mypageEdit.jsp").forward(request, response);
	}

}
