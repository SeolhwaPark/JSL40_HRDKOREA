<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>과정평가형 자격(CBQ)</title>
	<style>
		*{margin:0; padding:0;}
		ul,li{list-style:none}
		a{text-decoration:none; color:#fff;}
		.logo{color:#fff; text-align:center; background-color:#0040ff; padding:0;}
		.nav{padding:12px 0; overflow:hidden; background-color:#bca8f5;}
		.nav ul li{float:left; padding:0 29px; text-align:center;}
		.content{background-color:#e6e6e6; padding:16px; height:300px;}
		.content table{width:500px margin:0 auto;}
		.content table th, td{border:1px solid #bbb;}
		.content table. btn_group{text-align:center;}
		.title{text-align:center; padding:22px;}
		.footer{padding:16px 0; text-align:center; background-color:#0040ff}
	</style>
	
	<script type="text/javascript">
	function send() {
		
		if(insert.custname.value==""){
			alert("회원이름이 입력되지 않았습니다.");
			insert.custname.focus();
			return false;
		}
		if(insert.tel1.value==""){
			alert("전화번호가 정상적으로 입력되지 않았습니다.");
			insert.tel1.focus();
			return false;
		}
		if(insert.tel2.value==""){
			alert("전화번호가 정상적으로 입력되지 않았습니다.");
			insert.tel2.focus();
			return false;
		}
		if(insert.tel3.value==""){
			alert("전화번호가 정상적으로 입력되지 않았습니다.");
			insert.tel3.focus();
			return false;
		}
		if(insert.gender[0].checked == false && insert.gender[1].checked == false){
			alert("성별이 선택되지 않았습니다.");
			return false;
		}
		if(insert.joindate.value==""){
			alert("가입일자가 입력되지 않았습니다.");
			insert.joindate.focus();
			return false;
		}
		
		if(insert.grade.selectedIndex == 0){
			alert("고객등급이 선택되지 않았습니다.");
			insert.grade.focus();
			return false;
		}
		if(insert.city.selectedIndex == 0){
			alert("거주도시가 선택되지 않았습니다.");
			insert.city.focus();
			return false;
		}
		
		
		alert("회원정보입력이 정상적으로 등록되었습니다.");
		insert.submit();
	}

	function re() {
		alert("입력된 항목을 다시 씁니다.");
		insert.reset();
	}

	
	</script>
</head>
<body>
<div class="header">
<header>
<h1 class="logo">(과정평가형 정보처리산업기사) 쇼핑몰 매출현황 관리 프로그램 ver 2009-06</h1>
<div class="nav">
	<nav>
		<ul class="nav">
			<li><a href="insert">회원등록</a></li>
			<li><a href="list">회원목록조회및수정</a></li>
			<li><a href="money">회원매출조회</a></li>
			<li><a href="index">홈으로</a></li>
		</ul>
	</nav>
</div>
</header>
</div>

<div class="section">
<section>
	<div class="contents">
		<h2 class="title">쇼핑몰 회원관리 프로그램</h2>
			<form name="insert" method="post" action="insert">
			<table>
				<tr>
					<th>회원번호(자동발생)</th>
					<td><input type="text" name="custno" value="${custno+1}"></td>				
				</tr>
				<tr>
					<th>회원성명</th>
					<td><input type="text" name="custname"></td>				
				</tr>
				<tr>
					<th>회원전화</th>
					<td><input type="text" name="tel1" size=3>-
						<input type="text" name="tel2" size=4>-
						<input type="text" name="tel3" size=4>
					</td>				
				</tr>
				<tr>
					<th>회원성별</th>
					<td><input type="radio" name="gender" value="M">남자
						<input type="radio" name="gender" value="F">여자
					</td>				
				</tr>
				<tr>
					<th>가입일자</th>
					<td><input type="text" name="joindate" value="${date}"></td>				
				</tr>
				<tr>
					<th>고객등급</th>
					<td>
						<select name="grade">
							<option value="">고객등급</option>
							<option value="A">VIP</option>
							<option value="B">일반</option>
							<option value="C">직원</option>
						</select>
					</td>				
				</tr>
				<tr>
					<th>도시코드</th>
					<td>
						<select name="city">
							<option value="">도시코드</option>
							<option value="01">서울</option>
							<option value="02">경기</option>
							<option value="03">인천</option>
							<option value="04">강원</option>
							<option value="05">충북</option>
							<option value="06">충남</option>
							<option value="07">전북</option>
							<option value="08">전남</option>
							<option value="09">경북</option>
							<option value="10">경남</option>
							<option value="11">제주</option>
						</select>
					</td>				
				</tr>
				<tr>
					<td colspan = "2" class="btn_group">
						<input type="button" value="등록하기" onClick="send()">
						<input type="button" value="다시쓰기" onClick="re()">
					</td>				
				</tr>	
			</table>
			</form>
	</div>
</section>
</div>

<div class="footer">
<footer>
<p>HRDKOREA Copyright@2016 All rights reserved. Human Resources
				Development Service of Korea</p>
</footer>
</div>

</body>
</html>







