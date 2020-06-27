<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import = "java.util.*, model.*" %>
<%
	request.setCharacterEncoding("utf-8");
	DAO dao = DAO.getInstance();
	VO vo = new VO();
	
	vo.setArtist_id(request.getParameter("artist_id"));
	vo.setArtist_name(request.getParameter("artist_name"));
	
	vo.setArtist_birth(request.getParameter("artist_birth1")+request.getParameter("artist_birth2")+request.getParameter("artist_birth3"));
	vo.setArtist_gender(request.getParameter("artist_gender"));
	
	vo.setTalent(request.getParameter("talent"));
	vo.setAgency(request.getParameter("agency"));
	
	int row = dao.insert(vo);
	response.sendRedirect("index.jsp");

	
%>
