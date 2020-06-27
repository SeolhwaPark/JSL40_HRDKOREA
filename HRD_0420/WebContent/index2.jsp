<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쇼핑몰 매출현황 관리 프로그램 ver 2009-06</title>
<style type="text/css">
* {padding: 0;margin: 0}
.logo {text-align: center;background-color: #fdeff2;color: #c85179;padding: 40px}
.navi {background-color: #e198b4;padding: 10px 0;overflow: hidden}
.navi ul li {text-align: center;list-style: none;float: left;padding: 10px}

a {color: #fff;text-decoration: none}
.title {text-align: center;padding: 10px 0;color: #e198b4}
.contents {margin: 10px 0}
.section {text-align: center;color: #c85179;}

.footer {background-color: #fdeff2;padding: 10px 0}
.footer p {text-align: center;color: #e198b4;}
</style>
</head>
<body>
	<div class="header">
			<header>
			<h1 style="text-align: center;background-color: #fdeff2;color: #c85179; padding: 40px">
			홈쇼핑 회원매출관리 Ver 1.0</h1>
			<nav class="navi">
				<ul>
					<a href="insert.jsp">
					<li>회원매출등록</li></a>
					<a href="select.jsp">
					<li>회원조회</li></a>
					<a href="search.jsp">
					<li>회원매출조회수정</li></a>
					<a href="view.jsp">
					<li>회원별매출현황</li></a>
					<a href="index.jsp">
					<li>홈으로</li></a>
				</ul>
			</nav>
		</header>
	</div>

	<div class="section">
		<section>
			<h2 class="title" color="#e198b4">쇼핑몰 회원관리 프로그램</h2>
			<div class="contents">
				<br>쇼핑몰 회원정보와 회원매출정보데이터베이스를 구축하고 회원과리 프로그램을 작성하는 프로그램이다.
				<br>프로그램 작성 순서<br> 
				<br>1.회원정보 테이블을 생성한다.<br> 
				<br>2.매출정보 테이블을 생성한다.<br> 
				<br>3.회원정보,매출정보테이블에 제시된 문제지와 참조데이터를 추가 생성한다.<br> 
				<br>4.회원정보 입력화면 프로그램을 작성한다.<br> 
				<br>5.회원정보 조회 프로그램을 작성한다.<br> 
				<br>6.회원매출정보 조회 프로그램을 작성한다.<br> 
				<br><br>
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