<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.* , model.*"%>  

<%
	request.setCharacterEncoding("utf-8");
	DAO dao = DAO.getInstance();
	VO vo = new VO();
	
	vo.setHakbun(request.getParameter("hakbun"));
	vo.setName(request.getParameter("name"));
	vo.setPhone1(request.getParameter("phone1"));
	vo.setPhone2(request.getParameter("phone2"));
	vo.setPhone3(request.getParameter("phone3"));
	vo.setGender(request.getParameter("gender"));
	vo.setBirth(request.getParameter("birth"));
	vo.setRegdate(request.getParameter("regdate"));
	
	int row = dao.insert(vo);
	response.sendRedirect("index.jsp");

%>