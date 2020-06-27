<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, model.*" %>

<%
	DAO dao = DAO.getInstance();
	int row = dao.max();
	if(row != 0){

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>인사관리 시스템 Ver 1.0</title>
<style type="text/css">
*{margin:0;padding:0}
.logo{color:#c85179;background-color:#fdeff2;text-align:center; padding:40px 0}
.navi{background-color:#e198b4; overflow:hidden ;padding:10px 0}
.navi ul,li{float:left; list-style:none; padding:0 10px}
a{text-decoration:none; color:#fff}

.section{color:#c85179;}
.title{text-align:center; color:#e198b4; padding:20px 0}
.content{margin:0 auto}
.content table{margin:0 auto}
.content table th,td{text-align:center; border:1px solid #c85179; color:#c85179}
.btn_group{text-align:center;}

.footer{background-color:#fdeff2; padding:10px 0}
.footer p{text-align:center;color:#e198b4}

</style>

<script type="text/javascript">
function send() {
	if(person.id.value==""){
	alert("사원정보가 입력되지 않았습니다.");
		person.id.focus();
		return false;
	}
	if(person.name.value==""){
	alert("사원이름이 입력되지 않았습니다.");
		person.name.focus();
		return false;
	}
	if(person.dept.selectedIndex == 0){
	alert("소속부서가 선택되지 않았습니다.");
		person.dept.focus();
		return false;
	}
	if(person.position.selectedIndex == 0){
	alert("직급이 선택되지 않았습니다.");
		person.position.focus();
		return false;
	}
	if(person.duty.value==""){
	alert("직책이 입력되지 않았습니다.");
		person.duty.focus();
		return false;
	}
	if(person.phone.value==""){
	alert("연락처가 입력되지 않았습니다.");
		person.phone.focus();
		return false;
	}
	alert("사원정보를 등록합니다");
	person.submit();
}
function del() {
	alert("모든 항목을 지우고 다시 입력합니다.");
	history.back();
	
}
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
	<h2 class="title">사원등록
	</h2>
	<div class="content">
 		<form name="person" method="post" action="insert_pro.jsp">
			<table>
				<tr>
					<th>사원번호(자동)
					</th>
					<td><input type="text" name="id" value="<%= row+1%>" readonly>
					</td>
				</tr>
				<tr>
					<th>성명
					</th>
					<td><input type="text" name="name">
					</td>
				</tr>
				<tr>
					<th>소속부서
					</th>
					<td>
						<select name="dept">
							<option value="">선택하세요</option>
							<option value="인사부">인사부</option>
							<option value="기획부">기획부</option>
							<option value="홍보부">홍보부</option>
							<option value="영업부">영업부</option>
							<option value="경리부">경리부</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>직급
					</th>
					<td>
						<select name="position">
							<option value="">선택하세요</option>
							<option value="1">1급</option>
							<option value="2">2급</option>
							<option value="3">3급</option>
							<option value="4">4급</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>직책
					</th>
					<td><input type="text" name="duty">
					</td>
				</tr>
				<tr>
					<th>연락처
					</th>
					<td><input type="text" name="phone">
					</td>
				</tr>
				<tr>
					<td colspan="2" class="btn_group">
						<input type="button" value="등록" onClick="send()">
						<input type="button" value="취소" onClick="del()">
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