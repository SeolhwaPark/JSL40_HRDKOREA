<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.* , model.*"%>  

<%
	DAO dao = DAO.getInstance();
	List<VO> list = dao.list();

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>(과정평가형 정보처리산업기사)학생관리 프로그램 ver 1.0</title>

<style type="text/css">
*{padding:0;margin:0}
.logo{padding:40px 0;text-align:center;color:#c85179; background-color:#fdeff2}
.navi{padding:10px 0;overflow:hidden; background-color:#e198b4}
.navi ul, li{padding:0 10px;float:left;list-style:none}
a{text-decoration:none; color:#fff}

.section{color:#c85179;}
.title{text-align:center;padding:20px;}
.content{margin:0 auto}
.content table{margin:0 auto}
.content table th, td{text-align:center;color:#c85179; border: 1px solid #e198b4}
.btn_group{text-align:center;}

.footer{padding:20px 0;background-color:#e198b4}
.footer p{text-align:center;color:#fdeff2;}
</style>
<script type="text/javascript">
</script>

</head>
<body>

<div class="header">
	<header>
		<h1 class="logo">(과정평가형 정보처리산업기사)학생관리 프로그램 ver 1.0</h1>
		<nav class="navi">
			<ul>
				<li><a href="insert.jsp">학생정보등록</a></li>
				<li><a href="list.jsp">학생정보조회</a></li>
				<li><a href="input.jsp">성적정보등록</a></li>
				<li><a href="view.jsp">학생성적조회</a></li>
				<li><a href="view2.jsp">학년성적조회</a></li>
				<li><a href="index.jsp">홈으로</a></li>
			</ul>
		</nav>
	</header>
</div>
<div class="section">
	<section>
		<h2 class="title">학생정보 조회</h2>
		<div class="content">
		
				<table>
					<tr>
						<th>학생번호</th>
						<th>학생이름</th>
						<th>전화번호</th>
						<th>성별</th>
						<th>생년월일</th>
						<th>가입일자</th>
					</tr>
				<%
					String date;
					String str;
					
					for(int x=0;x<list.size();x++){				
					str = list.get(x).getBirth();
					date = list.get(x).getRegdate();
				%>
					<tr>
						<td style="background-color:#e198b4"><a href="modify.jsp?hakbun=<%= list.get(x).getHakbun() %>"><%= list.get(x).getHakbun() %></a></td>
						<td><%= list.get(x).getName() %></td>
						<td><%= list.get(x).getPhone1()+"-"+list.get(x).getPhone2()+"-"+list.get(x).getPhone3() %></td>
						
						<% if(list.get(x).getGender().equalsIgnoreCase("M")){ %>
						<td>남자</td>
						<% }else{ %>
						<td>여자</td>
						<% } %>
						
						<td><%= str.substring(0,4)+"-"+str.substring(4,6)+"-"+str.substring(6,8) %></td>
						<td><%= date.substring(0,4)+"년"+date.substring(5,7)+"월"+date.substring(8,10)+"일" %></td>
					</tr>
				<%
					}
				%>
				</table>
			<br><br>
		</div>
		
	</section>
</div>
<div class="footer">
	<footer>
		<p>HRDKOREA Copyright@2016 All rights reserve. Human Resources Development Service of Korea</p>
	</footer>
</div>
</body>
</html>