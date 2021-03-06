<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import ="java.util.*, model.*"%>
<%
	DAO dao = DAO.getInstance();

	String code = request.getParameter("code");
	VO vo = dao.view(code);
	if(vo == null){
%>
<script type="text/javascript">
	alert("등록된 제품이 존재하지 않습니다.");
	history.back();
</script>
<%
	}else{
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>생산관리 시스템 Ver 1.0</title>
<style type="text/css">
*{margin:0; padding:0}
.logo{text-align:center;background-color:#fdeff2; color:#c85179; padding:40px 0}
.navi{background-color:#e198b4; padding:10px; overflow:hidden}
.navi ul, li{float:left; list-style:none; padding:0 10px}
a{text-decoration:none; color:#fff}

.section{color:#c85179}
.title{text-align:center}
.content{margin:0 auto}
.content table{margin:0 auto}
.content table th,td{text-align:center;color:#c85179; border:1px solid #e198b4}
.btn_group{text-align:center;}

.footer{background-color:#fdeff2; padding:10px 0}
.footer p{text-align:center; color:#e198b4}
</style>
<script type="text/javascript">

function modi() {
	alert("제품정보를 수정합니다.");
	product.submit();
}
function del() {
	alert("제품정보를 삭제하시겠습니까?");
	location.href="delete.jsp?code=<%= vo.getCode() %>";
	
}
function main() {
	alert("제품등록을 취소하고 메인을 이동합니다.");
	location.href="index.jsp";
	
}
</script>

</head>
<body>
<div class="header">
<header>
	<h1 class="logo">(과정평가형 정보처리산업기사)생산관리 시스템 Ver 1.0</h1>
	<nav class="navi">
	<ul>
		<li><a href="insert.jsp">제품입력</a></li>
		<li><a href="view.jsp">제품조회</a></li>
		<li><a href="list.jsp">우선생산제품</a></li>
		<li><a href="rankList.jsp">이익순위</a></li>
		<li><a href="groupList.jsp">그룹별재고수량</a></li>
		<li><a href="index.jsp">홈으로</a></li>
	</ul>
	</nav>
</header>	
</div>

<div class="section">
<section>
	<h2 class="title">생산관리 조회 & 수정 화면</h2>
	<div class="content">
		<form name ="product" method="post" action="productList_pro.jsp">
			<table>
				<tr>
					<th>제품코드</th>
					<td><input type="text" name="code" value="<%= vo.getCode()%>" readonly></td>
				</tr>
				<tr>
					<th>제품이름</th>
					<td><input type="text" name="pname" value="<%= vo.getPname()%>" readonly></td>
				</tr>
				<tr>
					<th>제품원가</th>
					<td><input type="text" name="cost" value="<%= vo.getCost()%>"></td>
				</tr>
				<tr>
					<th>목표수량</th>
					<td><input type="text" name="pnum" value="<%= vo.getPnum()%>"></td>
				</tr>
				<tr>
					<th>재고수량</th>
					<td><input type="text" name="jnum" value="<%= vo.getJnum()%>"></td>
				</tr>
				<tr>
					<th>출고가</th>
					<td><input type="text" name="sale" value="<%= vo.getSale()%>"></td>
				</tr>
				<tr>
					<th>그룹이름</th>
					<td>
						<select name="gcode">
							<option value="">그룹이름</option>
							<option value="A" <% if(vo.getGcode().contains("A")){ %> selected <% } %>>컴퓨터</option>
							<option value="B" <% if(vo.getGcode().contains("B")){ %> selected <% } %>>냉장고</option>
							<option value="C" <% if(vo.getGcode().contains("C")){ %> selected <% } %>>냉장소모품</option>
						</select>
					</td>
				</tr>
				<tr>
					<td colspan="2" class="btn_group">
					<input type="button" value="조회" onClick="view()">
					<input type="button" value="수정" onClick="modi()">
					<input type="button" value="삭제" onClick="del()">
					<input type="button" value="메인화면" onClick="main()">
					</td>
				</tr>
			</table>
		</form>
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

<%
}
%>