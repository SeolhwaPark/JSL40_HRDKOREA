<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>

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
	function modi() {
		alert("회원정보입력이 수정되었습니다.");
		insert.submit();
	}

	function can() {
		alert("취소합니다");
		insert.action="modify";
		insert.submit();
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
			<form name="insert" method="post" action="modify">
			<table>
				<tr>
					<th>회원번호(자동발생)</th>
					<td><input type="text" name="custno" value="${vo.custno}" readonly></td>				
				</tr>
				<tr>
					<th>회원성명</th>
					<td><input type="text" name="custname" value="${vo.custname}" readonly></td>		
				</tr>
				<tr>
					<th>회원전화</th>
					<td><input type="text" name="tel1" size=3 value="${tel1}" >-
						<input type="text" name="tel2" size=4 value="${tel2}" >-
						<input type="text" name="tel3" size=4 value="${tel3}" >
					</td>				
				</tr>
				<tr>
					<th>회원성별</th>
					<td><input type="radio" name="gender" value="M" ${M}>남자
						<input type="radio" name="gender" value="F" ${F}>여자
					</td>				
				</tr>
				<tr>
					<th>가입일자</th>
					<td><input type="text" name="joindate" value="${vo.joindate}" readonly></td>				
				</tr>
				<tr>
					<th>고객등급</th>
					<td>
						<select name="grade">
							<option value=""></option>
							<option value="A" ${A}>VIP</option>
							<option value="B" ${B}>일반</option>
							<option value="C" ${C}>직원</option>
						</select>
					</td>				
				</tr>
				<tr>
					<th>도시코드</th>
					<td>
						<select name="city">
							<option value="">도시코드</option>
							<option value="01" ${01}>서울</option>
							<option value="02" ${02}>경기</option>
							<option value="03" ${03}>인천</option>
							<option value="04" ${04}>강원</option>
							<option value="05" ${05}>충북</option>
							<option value="06" ${06}>충남</option>
							<option value="07" ${07}>전북</option>
							<option value="08" ${08}>전남</option>
							<option value="09" ${09}>경북</option>
							<option value="10" ${10}>경남</option>
							<option value="11" ${11}>제주</option>
						</select>
					</td>				
				</tr>
				<tr>
					<td colspan = "2" class="btn_group">
						<input type="button" value="수정하기" onClick="modi()">
						<input type="button" value="취소하기" onClick="can()">
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
