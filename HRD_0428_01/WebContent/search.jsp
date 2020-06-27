<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.util.*, model.*"%>
    
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
	if(search.radio[0].checked == true && search.id.value == ""){
		alert("사원번호를 입력하세요");
		return false;
	}else if(search.radio[1].checked == true && search.dept.selectedIndex == 0){
		alert("부서명을 선택하세요");
		return false;
	}else if(search.radio[1].checked == true && search.dept.selectedIndex != 0){
		document.search.action="deptList.jsp";
		search.submit();
	}else if(search.radio[0].checked == true && search.id.value != ""){
		document.search.action="list.jsp";
		search.submit();
	}
}
function del() {
	location.href="search.jsp"
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
	<h2 class="title">사원정보 조회
	</h2>
	<div class="content">
 		<form name="search" method="post">
			<table>
				<tr>
					<th><input type="radio" name="radio" value="1" checked>사원번호로 조회
					</th>
					<td><input type="text" name="id">
					</td>
				</tr>
				<tr>
					<th><input type="radio" name="radio" value="2">부서명으로 조회
					</th>
					<td><select name="dept">
							<option value=""></option>
							<option value="인사부">인사부</option>
							<option value="기획부">기획부</option>
							<option value="홍보부">홍보부</option>
							<option value="영업부">영업부</option>
							<option value="경리부">경리부</option>
						</select>
					</td>
				</tr>
				<tr>
					<td colspan="2" class="btn_group">
						<input type="button" value="조회" onClick="send()">
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