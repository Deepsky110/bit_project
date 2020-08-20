package com.bitjeju.lms.teacher.stu.model;


import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.bitjeju.member.MemberDto;

public class StudentDao {
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
	
	public StudentDao() throws SQLException {
		String driver="oracle.jdbc.OracleDriver";
		String url="jdbc:oracle:thin:@localhost:1521:xe";
		String user="scott";
		String password="tiger";
		
		try {
			Class.forName(driver);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		conn=DriverManager.getConnection(url, user, password);
	}
	
	public ArrayList<MemberDto> selectAll() throws SQLException{
		ArrayList<MemberDto> list=new ArrayList<MemberDto>();
		String sql="select * from member where lvl=2";
		try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()) {			
				list.add(new MemberDto(rs.getInt("num"),rs.getString("name")));
			}
		}finally {
			if(rs!=null)rs.close();
			if(pstmt!=null)pstmt.close();
			if(conn!=null)conn.close();
		}
		
		return list;
	}//selectAll

	
	public StudentDto stuSelectOne(int num) throws SQLException {
		
	//�л������������� 
	//�̸�, ���¸�, �����, ���ǽ�, ��ȭ��ȣ, �⼮��, ����, �����Ⱓ
		StudentDto bean = new StudentDto();
		//String sql = "select * from member natural join grade where num =?";//�̸� ��ȭ��ȣ ���� ��
		String sql ="select * from member full outer join grade on member.num=grade.num where member.num=?";
		pstmt = conn.prepareStatement(sql);
		System.out.println(sql);
		pstmt.setInt(1, num);
		rs = pstmt.executeQuery();
		if(rs.next()) {
			bean.setNum(rs.getInt("num"));//�л� ȸ����ȣ
			bean.setPhone(rs.getString("phone"));//�л� ��ȭ��ȣ
			bean.setLecture_name(rs.getString("lecture"));//��� ���¸�
			bean.setName(rs.getString("name"));//�л��̸�
			bean.setExam1(rs.getInt("exam1"));
			bean.setExam2(rs.getInt("exam2"));//������
			bean.setExam3(rs.getInt("exam3"));
			bean.setId_email(rs.getString("id_email"));
			System.out.println(rs.getString("id_email"));
		}
		if(pstmt!=null)pstmt.close();
		
		
		String sql2 = "select lecture_name, lecture_num, lecture_room, name, start_day, end_day "
				+ "from lectures natural join member "
				+ "where lecture_name=(select lecture from member where num=?)";//���� ���ǽ�
		pstmt = conn.prepareStatement(sql2);
		pstmt.setInt(1, num);	
		System.out.println(sql2);
		rs = pstmt.executeQuery();
		
		if(rs.next()) {
			bean.setStart_day(rs.getDate("start_day"));//������
			bean.setEnd_day(rs.getDate("end_day"));//������
			bean.setTeacher_name(rs.getString("name"));//�����̸�
			bean.setLecture_room(rs.getInt("lecture_room"));//���ǽ�
			bean.setLecture_num(rs.getInt("lecture_num"));//���� ������ȣ
		}
		if(pstmt!=null)pstmt.close();
		
		
		String sql3 = "select * from attendance where num = ?"; //�⼮�� ��¥�ޱ�
		pstmt = conn.prepareStatement(sql3);
		System.out.println(sql3);
		pstmt.setInt(1, num);
		rs = pstmt.executeQuery();
		//��¥ + �⼮���¸� �����ؾ���. 
		ArrayList<String> attList = new ArrayList<String>();
		ArrayList<Date> attNaljaList = new ArrayList<Date>();
		while(rs.next()) {
			attList.add(rs.getString("state"));
			attNaljaList.add(rs.getDate("nalja"));
		}
		bean.setAttList(attList);//��Ʈ�ѷ����� bean.attRate()�޼���� �⼮�� ���� �� �ִ�. 
		bean.setAttNaljaList(attNaljaList);

		
		if(pstmt!=null)pstmt.close();
		if(conn!=null)conn.close();
		
		return bean;
	}//stuselectONE
	
	public void studeleteOne(int num) throws SQLException {
		String sql ="delete from member where num = ?";
		
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, num);
		pstmt.executeQuery();
		System.out.println(sql);
		if(rs!=null)rs.close();
		if(pstmt!=null)pstmt.close();
		
	}
	
	
}