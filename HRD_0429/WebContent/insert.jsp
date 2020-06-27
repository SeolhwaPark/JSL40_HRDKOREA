<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import ="java.util.* , model.*"%>

<%
	DAO dao = DAO.getInstance();
	int row = dao.max();
	if(row != 0){
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
function send() {
	if(insert.sawon.value==""){
		alert("사원번호가 입력되지 않았습니다.");		
		insert.sawon.focus();
		return false;
	}
	if(insert.name.value==""){
		alert("성명이 입력되지 않았습니다.");		
		insert.name.focus();
		return false;
	}
	if(insert.duty.selectedIndex==0){
		alert("직책이 선택되지 않았습니다.");		
		insert.duty.focus();
		return false;
	}
	if(insert.phone.value==""){
		alert("연락처가 입력되지 않았습니다.");		
		insert.phone.focus();
		return false;
	}
	if(insert.indate.value==""){
		alert("입사일자가 입력되지 않았습니다.");		
		insert.indate.focus();
		return false;
	}
	if(insert.dcode.value==""){
		alert("부서코드가 입력되지 않았습니다.");		
		insert.dcode.focus();
		return false;
	}
	alert("사원정보를 등록합니다");
	insert.submit();
}
function del() {
	alert("입력된 모든 항목을 삭제합니다");
	insert.reset;
}
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
	<h2 class="title">인사관리 시스템 사원등록 화면</h2>
	<div class="content">
		<form name="insert" method="post" action="insert_pro.jsp">
			<table>
				<tr>
					<th>사원번호(자동입력)</th>
					<td><input type="text" name="sawon" value="<%= row+1%>">
					</td>
				</tr>
				<tr>
					<th>성 명</th>
					<td><input type="text" name="name" value="">
					</td>
				</tr>
				<tr>
					<th>직 책</th>
					<td>
						<select name="duty">
							<option value="">상무</option>
							<option value="01">상무</option>
							<option value="02">과장</option>
							<option value="03">대리</option>
							<option value="04">사원</option>
						
						</select>
					</td>
				</tr>
				<tr>
					<th>연락처</th>
					<td><input type="text" name="phone" value="">
					</td>
				</tr>
				<tr>
					<th>입사일자</th>
					<td><input type="text" name="indate" value="">
					</td>
				</tr>
				<tr>
					<th>부서코드</th>
					<td><input type="text" name="dcode" value="">
					</td>
				</tr>
				<tr>
					<td	colspan="2" class="btn_group">
						<input type="button" value="등록하기" onClick="send()">
						<input type="button" value="다시쓰기" onClick="del()">
					</td>
				</tr>
			</table>
		</form>
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

<%
	}
%>