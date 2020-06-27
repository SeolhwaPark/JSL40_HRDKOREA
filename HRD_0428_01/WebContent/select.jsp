<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import ="java.util.*, model.*" %>
    <%
    request.setCharacterEncoding("utf-8");
    DAO dao = DAO.getInstance();
    String id = request.getParameter("id");
    String name = request.getParameter("name");
    VO vo = dao.search(id, name);    
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
	if(dele.name.value==""){
		alert("성명이 입력되지 않았습니다.");
			dele.name.focus();
			return false;
		}
	if(dele.id.value==""){
		alert("사원정보가 입력되지 않았습니다.");
			dele.id.focus();
			return false;
		}
	alert("사원의 퇴사처리를 진행합니다");
	dele.submit();
}
function del() {
	location.href="index.jsp";
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
	<h2 class="title">퇴사처리
	</h2>
	<div class="content">
 		<form name ="dele" method="post" action="select_pro.jsp">
			<table>
				<tr>
					<th>성명
					</th>
					<td><input type="text" name="name">
					</td>
				</tr>
				<tr>
					<th>사원번호
					</th>
					<td><input type="text" name="id">
					</td>
				</tr>
				
				
				<tr>
					<td colspan="2" class="btn_group">
						<input type="button" value="삭제" onClick="send()">
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