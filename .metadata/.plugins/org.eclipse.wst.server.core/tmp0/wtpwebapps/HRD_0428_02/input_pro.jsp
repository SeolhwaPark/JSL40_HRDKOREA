<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.* , model.*"%>  

<%
	request.setCharacterEncoding("utf-8");
	DAO dao = DAO.getInstance();
	VO vo = new VO();
	String hakbun;
	hakbun = request.getParameter("hakbun");
	
	VO vo2 = dao.selectList(hakbun);
	if(vo2 == null){
		out.print("<script> alert('" + hakbun + " 학번의 학생은 존재하지 않습니다. 확인 후 다시 입력하세요');history.back();</script>");

		}else{

	vo.setKor(Integer.parseInt(request.getParameter("kor")));	
	vo.setEng(Integer.parseInt(request.getParameter("eng")));	
	vo.setMat(Integer.parseInt(request.getParameter("mat")));	
	
	int row = dao.input(vo);
	response.sendRedirect("input.jsp");
	}
%>
