<%@page import="java.time.LocalDate"%>
<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.*, model.*" %>
<%
	DAO dao = DAO.getInstance();
	List<VO> list = dao.rankList();
    
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>생산관리 시스템 Ver 1.0</title>
<style type="text/css">
*{margin:0; padding:0}
.logo{text-align:center;background-color:#fdeff2; color:#c85179; padding:40px 0}
.navi{background-color:#e198b4; padding:10px; overflow:hidden}
.navi ul, li{float:left; list-style:none; padding:0 10px}
a{text-decoration:none; color:#fff}

.section{color:#c85179}
.title{text-align:center}
.content{margin:0 auto}
.content table{margin:0 auto}
.content table th,td{text-align:center;color:#c85179; border:1px solid #e198b4}
.btn_group{text-align:center;}

.footer{background-color:#fdeff2; padding:10px 0}
.footer p{text-align:center; color:#e198b4}
</style>
<script type="text/javascript">

</script>

</head>
<body>
<div class="header">
<header>
	<h1 class="logo">(과정평가형 정보처리산업기사)생산관리 시스템 Ver 1.0</h1>
	<nav class="navi">
	<ul>
		<li><a href="insert.jsp">제품입력</a></li>
		<li><a href="view.jsp">제품조회</a></li>
		<li><a href="list.jsp">우선생산제품</a></li>
		<li><a href="rankList.jsp">이익순위</a></li>
		<li><a href="groupList.jsp">그룹별재고수량</a></li>
		<li><a href="index.jsp">홈으로</a></li>
	</ul>
	</nav>
</header>	
</div>

<div class="section">
<section>
	<h2 class="title">이익 우선 순위</h2>
	<div class="content">
		<table>
		<tr>
			<th>제품코드</th>
			<th>제품이름</th>
			<th>제품원가</th>
			<th>재고수량</th>
			<th>출고가</th>
			<th>총이익</th>
		</tr>
		<%
		DecimalFormat df = new DecimalFormat("#,###");
		int cost, sale, money;
		for(int x=0; x<list.size(); x++){
		%>
		<tr>
			<td><%= list.get(x).getCode()%></td>
			<td><%= list.get(x).getPname()%></td>
			<td><%= df.format(list.get(x).getCost())%></td>
			<td><%= df.format(list.get(x).getJnum())%></td>
			<td><%= df.format(list.get(x).getSale())%></td>
			<td><%= df.format(list.get(x).getMoney())%></td>
		</tr>
		<%
		}
		%>
		</table>
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