<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.util.*, model.*"%>
<%
	DAO dao = DAO.getInstance();
	String code = request.getParameter("code");
	int row = dao.delete(code);
	response.sendRedirect("view.jsp");



%>
