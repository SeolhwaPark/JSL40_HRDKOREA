<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.util.* , model.*"%>

<%
	request.setCharacterEncoding("utf-8");
	DAO dao = DAO.getInstance();
	VO vo = new VO();
	vo.setSawon(Integer.parseInt(request.getParameter("sawon")));
	vo.setName(request.getParameter("name"));
	vo.setDuty(request.getParameter("duty"));
	vo.setPhone(request.getParameter("phone"));
	vo.setIndate(request.getParameter("indate"));
	vo.setDcode(request.getParameter("dcode"));
	
	int row = dao.insert(vo);
	response.sendRedirect("index.jsp");
	

%>