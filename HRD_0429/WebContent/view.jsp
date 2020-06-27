<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import ="java.util.* , model.*"%>

<%
	DAO dao = DAO.getInstance();
	List<VO> list = dao.dnameList();
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>인사관리 시스템 Ver 2.0</title>
<style type="text/css">
*{padding:0;margin:0}
.logo{padding:40px 0; text-align:center; color:#c85179; background-color:#fdeff2}
.navi{padding:10px 0; overflow:hidden;background-color:#e198b4}
.navi ul, li{padding:0 10px; float:left; list-style:none}
a{padding:20px; text-decoration:none; color:#fff}

.section{color:#e198b4}
.title{text-align:center;padding:20px}
.content{margin:0}
.content table{margin:0 auto}
.content table th,td{text-align:center; color:#e198b4;border:1px solid #c85179}
.btn_group{text-align:center;}

.footer{padding:20px;background-color:#fdeff2}
.footer p{text-align:center;color:#c85179}

</style>
<script type="text/javascript">
</script>
</head>
<body>

<div class="header">
<header>
	<h1 class="logo">인사관리 시스템 Ver 2.0</h1>
	<nav class="navi">
		<ul>
			<li><a href="insert.jsp">사원등록</a></li>
			<li><a href="list.jsp">사원조회</a></li>
			<li><a href="modify.jsp">사원정보변경</a></li>
			<li><a href="view.jsp">부서별 사원현황</a></li>
			<li><a href="select.jsp">퇴사처리</a></li>			
			<li><a href="index.jsp">홈으로</a></li>			
		</ul>
	</nav>
</header>
</div>
<div class="section">
<section>
	<h2 class="title">인사관리 시스템 직원정보 조회 화면</h2>
	<div class="content">
			<table>
				<tr>
					<th>부서코드</th>
					<th>부서명</th>
					<th>부서정원</th>
					<th>부서현인원</th>
				</tr>
				<%
				int sum=0; //부서정원
				int summ=0;//현인원
				
				for(int x=0;x<list.size();x++){
					sum += list.get(x).getInwon();
					summ += list.get(x).getCnt();
				%>
				<tr>
					<td><%= list.get(x).getDcode()%>
					</td>
					<td><%= list.get(x).getDname()%>
					</td>
					<td><%= list.get(x).getInwon()%>
					</td>
					<td><%= list.get(x).getCnt()%>
					</td>

				</tr>
				<%
				}
				%>
				<tr>
					<td	colspan="2" class="btn_group">합계
					</td>
					<td><%= sum %></td>
					<td><%= summ %></td>
				</tr>
			</table>
	</div>
</section>
</div>
<br><br>
<div class="footer">
<footer>
	<p>HRDKOREA Copyright@2016 All rights reserve. Human Resources Development Service of Korea</p>
</footer>
</div>


</body>
</html>