<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import= "java.util.*, model.*"%>
<%
	List<VO> list = (List)request.getAttribute("list");

%>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서관리 프로그램 ver2.0</title>
<style type="text/css">
* {padding: 0;margin: 0}
.logo {text-align: center;background-color: #fdeff2;color: #c85179;padding: 40px}
.navi {background-color: #e198b4;padding: 10px 0;overflow: hidden}
.navi ul li {text-align: center;list-style: none;float: left;padding: 10px}

a {color: #fff;text-decoration: none}
.title {text-align: center;padding: 10px 0;color: #e198b4}
.content {margin: 10px 0}
.content table{margin:0 auto}
.content table th, td{text-align: center;border:1px solid #e198b4}
.content table .btn_group{text-align:center}

.section {color: #c85179;}

.footer {background-color: #fdeff2;padding: 10px 0}
.footer p {text-align: center;color: #e198b4;}
</style>

</head>
<body>


<div class="header">
<header>
		<h1 class="logo">(과정평가형 정보처리산업기사)도서 관리 프로그램 ver 2.0</h1>
<nav class="navi">
	<ul>
		<li><a href="insert">도서대출</a></li>
		<li><a href="list">도서대출현황조회</a></li>
		<li><a href="return">도서반납</a></li>
		<li><a href="book_insert">도서등록</a></li>
		<li><a href="book_list">도서별대출현황조회</a></li>
		<li><a href="index">홈으로</a></li>
	</ul>
</nav>
</header>
</div>

<div class="section">
<section>
		<h2 style="text-align:center">도서 대출 현황 조회</h2>
<div class="content">
		<table>
			<tr>
				<th>대출번호</th>
				<th>고객성명</th>
				<th>전화번호</th>
				<th>성별</th>
				<th>도서명코드</th>
				<th>대출일자</th>
				<th>반납일자</th>
			</tr>
		<% 
		for(int x=0; x<list.size(); x++){
		%>
			<tr>
				<td><%= list.get(x).getLentno()%></td>
				<td><%= list.get(x).getCustname()%></td>
				<td><%= list.get(x).getPhone()%></td>
				<td><%= list.get(x).getGender()%></td>
				<td><%= list.get(x).getBookname()%></td>
				<td><%= list.get(x).getOutdate()%></td>
				<td><%= list.get(x).getIndate()%></td>
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
		<p>HRDKORA Copyright@2016 All rights reserved. Human Resources
				Development Service of Korea</p>

</footer>
</div>


</body>
</html>