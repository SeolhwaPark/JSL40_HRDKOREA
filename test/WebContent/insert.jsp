<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

*{padding:0;margin:0}
.logo{text-align:center; background-color:#fdeff2 ; color: #c85179 ; padding:40px 0}
.navi{background-color:#e198b4; padding:10px 0; overflow:hidden}
.navi ul, li{float:left; padding:0 10px; list-style:none}
a{text-decoration:none;color:#fff}

.section{color: #c85179}
.title{text-align:center; color: #e198b4; padding:20px 0}
.content{margin:0 auto;}
.content table{margin:0 auto}
.content th, td{color: #c85179; text-align:center; border:1px solid #e198b4}
.btn-group{text-align:center}

.footer{background-color:#fdeff2; padding:10px 0}
.footer p{text-align:center;color:#e198b4}



</style>

<script type="text/javascript">
	function send() {
		//입력란
		if(form.custname.value==""){
			alert("회원이름이 입력되지 않았습니다.");
			form.custname.focus();
			return false;
		}
		//라디오버튼,첵크박스
		if(form.gender[0].checked == false && form.gender[1].checked == false){
			alert("성별이 선택되지 않았습니다.");
			return false;
		}
		//셀레트박스
		if(form.grade.selectedIndex == 0){
			alert("고객등급이 선택되지 않았습니다.");
			form.grade.focus();
			return false;
		}
		alert("회원정보입력이 정상적으로 등록되었습니다.");
		form.submit();
	}

	function re() {
		alert("입력된 항목을 다시 씁니다.");
		form.reset();
	}
</script>
</head>
<body>
<div class="header">
	<header>
		<h1 class="logo"> ddddddddddddddddddddddd </h1>
	<nav class="navi">
		<ul>
			<li><a href=""> ddddddddddddddddddddddd </a></li>
			<li><a href=""> ddddddddddddddddddddddd </a></li>
		</ul>
	</nav>
	</header>
</div>

<div class="section">
<section>
	<h2 style="text-align:center; color:#e198b4">ddddddddddddddddddddddd</h2>
	<div class="content">
	<form name="" method="" action="">
		<table>
		<!-- 입력란 -->
			<tr>
				<th>회원번호(자동발생)</th>
				<td><input type="text" name="custno" value="${custno+1}"></td>				
				</tr>
			<tr>
				<th>ddddddddddddddddddddddd</th>
				<td><input type="text" name="ddd" value="d">ddddddddddddddddddddddd
				</td>
			</tr>
		<!-- 라디오버튼, 첵크박스 : checkbox -->
			<tr>
				<th>ddddddddddddddddddddddd</th>
				<td><input type="radio" name="ddd" value="d">d
					<input type="radio" name="ddd" value="d">d
				</td>
			</tr>
		<!-- 셀렉트박스 (?)-->
			<tr>
				<th>ddddddddddddddddddddddd</th>
				<td>	
					<select name="">
							<option value="">ddd</option>
							<option value="ddd">ddd</option>
							<option value="ddd">ddd</option>
						</select>
				</td>
			</tr>
		<!-- 버튼 -->
			<tr>
				<td colspan="2" class="btn-group">
				<input type="button" value="end" style="color:#fff; background-color:#c85179; border:0 solid #fdeff2" onclick="">
				<input type="button" value="end" style="color:#fff; background-color:#c85179; border:0 solid #fdeff2" onclick="">
				</td>
			</tr>
		
		</table>
	</form>
	</div>
</section>
</div>

<div class ="footer">
	<footer>
		<p>ddddddddddddddddddddddd</p>
	</footer>
</div>

</body>
</html>