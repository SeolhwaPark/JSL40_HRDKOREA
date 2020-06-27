<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.* , model.*"%>  

<%
	DAO dao = DAO.getInstance();
	String hakbun = request.getParameter("hakbun");
	VO vo = dao.selectList(hakbun);
%>
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
	alert(modify.hakbun.value+"학번의 "+modify.name.value+"학생의 정보를 수정합니다");
	modify.submit();
}
function del() {
	alert("입력된 모든 항목을 삭제합니다");
	modify.reset();
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
		<h2 class="title">학생정보 수정</h2>
		<div class="content">
		
			<form name="modify" method="post" action="modify_pro.jsp">
				<table>
					<tr>
						<th>학번</th>
						<td><input type="text" name="hakbun" value="<%= vo.getHakbun() %>" readonly></td>
					</tr>
					<tr>
						<th>이름</th>
						<td><input type="text" name="name" value="<%= vo.getName() %>" readonly></td>
					</tr>
					<tr>
						<th>전화</th>
						<td><input type="text" name="phone1" value="<%= vo.getPhone1() %>">-
							<input type="text" name="phone2" value="<%= vo.getPhone2() %>">-
							<input type="text" name="phone3" value="<%= vo.getPhone3() %>">
						</td>
					</tr>
					<tr>
						<th>성별</th>
					<%
					if(vo.getGender().contains("M")){
					%>
						<td><input type="radio" name="gender" value="M" checked>남자
							<input type="radio" name="gender" value="F" >여자</td>
					<%
					}else{
					%>
						<td><input type="radio" name="gender" value="M" >남자
							<input type="radio" name="gender" value="F" checked>여자</td>
					<%
					}
					%>
					</tr>
					<tr>
						<th>생년월일</th>
						<td><input type="text" name="birth" value="<%= vo.getBirth() %>"></td>
					</tr>
					<%
						String str = vo.getRegdate();
					%>
					<tr>
						<th>등록일자</th>
						<td><input type="text" name="regdate" value="<%= str.replace("-", "").substring(0,8)%>">예)20200207</td>
					</tr>
					
					<tr>
						<td colspan="2" class="btn_group">
						<input type="button" value="수정하기" onClick="send()">
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