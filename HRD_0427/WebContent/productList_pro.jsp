<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.util.*, model.*"%>
<%
	request.setCharacterEncoding("utf-8");
	DAO dao = DAO.getInstance();
	VO vo = new VO();
	vo.setCode(request.getParameter("code"));
	vo.setPname(request.getParameter("pname"));
	vo.setCost(Integer.parseInt(request.getParameter("cost")));
	vo.setPnum(Integer.parseInt(request.getParameter("pnum")));
	vo.setJnum(Integer.parseInt(request.getParameter("jnum")));
	vo.setSale(Integer.parseInt(request.getParameter("sale")));
	vo.setGcode(request.getParameter("gcode"));
	
	int row = dao.modify(vo);
	response.sendRedirect("view.jsp");


%>
