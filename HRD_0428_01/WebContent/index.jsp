<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.util.*, model.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>인사관리 시스템 Ver 1.0</title>
<style type="text/css">
*{margin:0;padding:0} 
.logo{color:#c85179;　background-color:#fdeff2;　text-align:center; padding:40px 0} 
.navi{background-color:#e198b4; overflow:hidden; padding:10px 0} 
.navi ul,li{float:left; list-style:none; padding:0 10px} 
a{text-decoration:none; color:#fff} 

.section{color:#c85179}
.title{text-align:center; color:#e198b4; padding:20px 0}
.content{margin:0 auto}
.content table{margin:0 auto}
.content table th,td{text-align:center; border:1px solid #c85179; color:#c18579}
.btn_group{text-align:center}

.footer{background-color:#fdeff2; padding:10px 0}
.footer p{text-align:center;color:#e198b4} 

</style>

<script type="text/javascript">

</script>
</head>
<body>


<div class="header">
<header>
	<h1 class="logo">인사관리 시스템 Ver 1.0
	</h1>
	<nav class="navi">
		<ul>
			<li><a href="insert.jsp">사원등록</a></li>
			<li><a href="search.jsp">사원조회</a></li>
			<li><a href="select.jsp">퇴사처리</a></li>
			<li><a href="index.jsp">홈으로</a></li>
		</ul>
	</nav>
</header>
</div>

<div class="section">
<section>
	<h2 class="title">인사관리 시스템 
	</h2>
	<div class="content">
		<br>다음은 인사관리 프로그램이다.<br>
		<br>1.인사관리 데이터베이스를 구축한다<br>
		<br>2.사원정보를 저장할 테이블(pesonnel)을 생성한다<br>
		<br>3.샘플 사원정보 테이터를 삽입한다<br>
		<br>4.업무 요건에 맞는 화면을 만든다<br>
		<br>5.등록,수정,검색,삭제 프로그램을 만든다<br>
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