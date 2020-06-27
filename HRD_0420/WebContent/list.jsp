<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>과정평가형 자격(CBQ)</title>
	<style>
		*{margin:0; padding:0;}
		ul,li{list-style:none}
		a{text-decoration:none; color:#fff;}
		.logo{color:#fff; text-align:center; background-color:#0040ff; padding:0;}
		.nav{padding:12px 0; overflow:hidden; background-color:#bca8f5;}
		.nav ul li{float:left; padding:0 29px; text-align:center;}
		.content{background-color:#e6e6e6; padding:16px; height:300px;}
		.content table{width:500px margin:0 auto;}
		.content table th, td{border:1px solid #bbb;}
		.content table. btn_group{text-align:center;}
		.title{text-align:center; padding:22px;}
		.footer{padding:16px 0; text-align:center; background-color:#0040ff}
	</style>

</head>
<body>
<div class="header">
<header>
<h1 class="logo">(과정평가형 정보처리산업기사) 쇼핑몰 매출현황 관리 프로그램 ver 2009-06</h1>
<div class="nav">
	<nav>
		<ul class="nav">
			<li><a href="insert">회원등록</a></li>
			<li><a href="list">회원목록조회및수정</a></li>
			<li><a href="money">회원매출조회</a></li>
			<li><a href="index">홈으로</a></li>
		</ul>
	</nav>
</div>
</header>
</div>

<div class="section">
<section>
	<div class="contents">
		<h2 class="title">과정평가형 자격 CBQ</h2>
			<table>
				<tr>
					<th>회원번호</th>	
					<th>회원성명</th>	
					<th>전화번호</th>	
					<th>성별</th>	
					<th>가입일자</th>	
					<th>고객등급</th>	
					<th>거주지역</th>	
				</tr>
				<c:forEach var="vo" items="${list}">
				<tr>
					<td><a href="modify?custno=${vo.custno}">${vo.custno}</a></td>
					<td>${vo.custname}</td>
					<td>${vo.phone}</td>
					<td>${vo.gender}</td>
					<td>${vo.joindate}</td>
					<td>${vo.grade}</td>
					<td>${vo.cityname}</td>
				</tr>
				</c:forEach>
			</table>
	</div>
</section>
</div>

<div class="footer">
<footer>
<p>HRDKOREA Copyright@2016 All rights reserved. Human Resources
				Development Service of Korea</p>
</footer>
</div>

</body>
</html>







