<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.* , model.*"%>  

<%
	DAO dao = DAO.getInstance();
	List<VO> list = dao.hakscore();

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
		<h2 class="title">과정평가형 자격(학년별 통계)</h2>
		<div class="content">
		
				<table>
					<tr>
						<th>학년</th>
						<th>국어총점</th>
						<th>영어총점</th>
						<th>수학총점</th>
						<th>국어평균</th>
						<th>영어평균</th>
						<th>수학평균</th>
					</tr>
					<% for(int x=0;x<list.size();x++){%>
					<tr>
						<td><%= list.get(x).getHakbun()%></td>
						<td><%= list.get(x).getKortot()%></td>
						<td><%= list.get(x).getEngtot()%></td>
						<td><%= list.get(x).getMattot()%></td>
						<td><%= list.get(x).getKoravg()%></td>
						<td><%= list.get(x).getEngavg()%></td>
						<td><%= list.get(x).getMatavg()%></td>
					</tr>
					<% 
					}%>
					
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