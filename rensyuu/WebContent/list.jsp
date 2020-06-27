<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.*, model.*" %>
<%
	DAO dao = DAO.getInstance();
	List<VO> list = dao.list();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>(과정평가형 정보처리산업기사) 오디션관리 프로그램 Ver 1.0</title>
<style type="text/css">
*{margin:0; padding:0}
.logo{}
.navi{}
.navi ul,li{}
a{}

.section{}
.title{}
.content{}
.content table{}
.content table th, td{}
.btn-group{}

.footer{}
.footer p{}

</style>
<script type="text/javascript">

</script>
</head>
<body>
<div class="header">
<header>
	<h1 class="logo">(과정평가형 정보처리산업기사) 오디션관리 프로그램 Ver 1.0</h1>
	
	<nav class="navi">
		<ul>
			<li><a href="insert.jsp">오디션등록</a></li>
			<li><a href="list.jsp">참가자목록조회</a></li>
			<li><a href="">멘토점수조회</a></li>
			<li><a href="">참가자등록조회</a></li>
			<li><a href="index.jsp">홈으로</a></li>
		</ul>
	</nav>
</header>
</div>

<div class="section">
<section>
	<h2 class="title"></h2>
	<div class="content">
	
			<table>
				<tr>
					<th>참가번호</th>
					<th>참가자명</th>
					<th>생년월일</th>
					<th>성별</th>
					<th>특기</th>
					<th>소속사</th>
				</tr>
			<%
				String str;
				String artist_birth;
					
				for(int x=0; x<list.size(); x++){
				str = list.get(x).getArtist_birth();
			%>
				<tr>
					<td><%= list.get(x).getArtist_id()%></td>
					<td><%= list.get(x).getArtist_name()%></td>
					<td><%= str.substring(0,4)+"년"+str.substring(4,6)+"월"+str.substring(6,8)+"일"%></td>
					
				<%
						if(list.get(x).getArtist_gender().equalsIgnoreCase("M")){
				%>	
					<td>남성</td>
				<%
						}else{
				%>
					<td>여성</td>
				<%
						}
						if(list.get(x).getTalent().equals("1")){
				
				%>	
					<td>댄스</td>
				<%
						}else if(list.get(x).getTalent().equals("2")){
				%>					
					<td>랩</td>
				<%
						}else{
				%>	
					<td>노래</td>
				<%
						}
				%>	
					<td><%= list.get(x).getAgency()%></td>
					
				</tr>
			<%
				}
			%>
			</table>
	</div>
</section>
</div>

<div>
<footer class="footer">
		<p>HRDKOREA Copyright@2016 All rights reserve. Human Resources Development Service of Korea</p>
</footer>
</div>

</body>
</html>