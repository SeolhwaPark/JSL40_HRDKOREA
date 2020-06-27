<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.* , model.*"%>  


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
function send() {
	if(insert.hakbun.value==""){
		alert("학번이 입력되지 않았습니다!");
		insert.hakbun.focus();
		return false;
	}
	if(insert.kor.value==""){
		alert("국어성적이 입력되지 않았습니다!");
		insert.kor.focus();
		return false;
	}
	if(insert.eng.value==""){
		alert("영어성적이 입력되지 않았습니다!");
		insert.eng.focus();
		return false;
	}
	if(insert.mat.value==""){
		alert("수학성적이 입력되지 않았습니다!");
		insert.mat.focus();
		return false;
	}
	alert("학생성적을 등록합니다!");
	insert.submit();
}
function del() {
	alert("입력된 모든 항목을 삭제합니다");
	insert.reset();
}
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
		<h2 class="title">학생성적 등록</h2>
		<div class="content">
		
			<form name="insert" method="post" action="input_pro.jsp">
				<table>
					<tr>
						<th>학번</th>
						<td><input type="text" name="hakbun" value="">예)1101</td>
					</tr>
					<tr>
						<th>국어점수</th>
						<td><input type="text" name="kor" value=""></td>
					</tr>
					<tr>
						<th>영어점수</th>
						<td><input type="text" name="eng" value=""></td>
					</tr>
					<tr>
						<th>수학점수</th>
						<td><input type="text" name="mat" value=""></td>
					</tr>
					
					<tr>
						<td colspan="2" class="btn_group">
						<input type="button" value="성적저장" onClick="send()">
						<input type="button" value="다시쓰기" onClick="del()"></td>
					</tr>
					
				</table>
			</form>
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
