<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.* , model.*"%>

<%
	request.setCharacterEncoding("utf-8");
	DAO dao = DAO.getInstance();
	String id = request.getParameter("id");
	String name = request.getParameter("name");
	int row = dao.delete(id, name);
	response.sendRedirect("index.jsp");
%>