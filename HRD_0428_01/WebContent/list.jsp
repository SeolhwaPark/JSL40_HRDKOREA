<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import ="java.util.*, model.*"%>
    <%
    DAO dao= DAO.getInstance();
    String id = request.getParameter("id");
    VO vo = dao.idSearch(id);
    if(vo == null){
    %>

<script type="text/javascript">

	alert("등록된 사원이 없습니다");
	history.back();
</script>


    <%
    }else {
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
			<table>
				<tr>
					<th>성명
					</th>
					<th>사번
					</th>
					<th>직급
					</th>
					<th>직책
					</th>
					<th>연락처
					</th>
					<th>소속부서
					</th>
				</tr>
			
				<tr>
					<td><%= vo.getName()%>
					</td>
					<td><%= vo.getId()%>
					</td>
					<td><%= vo.getDuty()%>
					</td>
					<td><%= vo.getPosition()%>
					</td>
					<td><%= vo.getPhone()%>
					</td>
					<td><%= vo.getDept()%>
					</td>
				</tr>
				
					<td colspan="6" class="btn_group">
						<input type="button" value="확인" onClick="send()">
					</td>
				</tr>
			</table>
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