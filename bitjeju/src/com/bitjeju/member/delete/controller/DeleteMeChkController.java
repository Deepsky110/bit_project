package com.bitjeju.member.delete.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bitjeju.member.MemberDao;
import com.bitjeju.member.MemberDto;

@WebServlet("/deletemechk.bit")
public class DeleteMeChkController extends HttpServlet {
	private int num;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MemberDao dao = new MemberDao();
		MemberDto bean = null;
		
		try {
			bean = dao.selectOne(num);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		request.setAttribute("bean", bean);
		request.getRequestDispatcher("mypageDeleteMeChk.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int num = Integer.parseInt(request.getParameter("idx"));
		this.num = num;
		
		
		
		System.out.println(num+"<<ȸ����ȣ");
	}

}
