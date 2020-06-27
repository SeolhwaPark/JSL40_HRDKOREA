<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import= "java.util.*, model.*"%>
<%

	request.setCharacterEncoding("utf-8");
	DAO dao = DAO.getInstance();
	VO vo = new VO();
	
	vo.setId(request.getParameter("id"));
	vo.setName(request.getParameter("name"));
	vo.setDept(request.getParameter("dept"));
	vo.setPosition(request.getParameter("position"));
	vo.setDuty(request.getParameter("duty"));
	vo.setPhone(request.getParameter("phone"));
	
	int row = dao.insert(vo);
	response.sendRedirect("index.jsp");
%>