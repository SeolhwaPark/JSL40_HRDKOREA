<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서관리 프로그램 ver2.0</title>
<style type="text/css">
* {padding: 0;margin: 0}
.logo {text-align: center;background-color: #fdeff2;color: #c85179;padding: 40px}
.navi {background-color: #e198b4;padding: 10px 0;overflow: hidden}
.navi ul li {text-align: center;list-style: none;float: left;padding: 10px}

a {color: #fff;text-decoration: none}
.title {text-align: center;padding: 10px 0;color: #e198b4}
.content {margin: 10px 0}
.content table{margin:0 auto}
.content table th, td{border:1px solid #e198b4}
.content table .btn_group{text-align:center}

.section {color: #c85179;}

.footer {background-color: #fdeff2;padding: 10px 0}
.footer p {text-align: center;color: #e198b4;}
</style>
<script type="text/javascript">
function send() {
	if(book.lentno.value==""){
		alert("대출번호가 입력되지 않았습니다");
		book.lentno.focus();
		return false;
	}
	if(book.custname.value==""){
		alert("고객성명이 입력되지 않았습니다");
		book.custname.focus();
		return false;
	}
	if(book.phone.value==""){
		alert("고객전화가 입력되지 않았습니다");
		book.phone.focus();
		return false;
	}
	if(book.gender[0].checked == false && book.gender[1].checked == false){
		alert("고객성별이 선택되지 않았습니다");
		return false;		
	}
	if(book.bookno.value==""){
		alert("도서코드가 입력되지 않았습니다");
		book.bookno.focus();
		return false;
	}
	if(book.outdate.value==""){
		alert("대출일자가 입력되지 않았습니다");
		book.outdate.focus();
		return false;
	}
	
	alert("대출 정보 정보가 등록되었습니다");
	book.submit();
}
function re() {
	alert("입력된 모든 항목을 지우고 다시 시작합니다");
	book.reset;
}
</script>
</head>
<body>


<div class="header">
<header>
		<h1 class="logo">(과정평가형 정보처리산업기사)도서 관리 프로그램 ver 2.0</h1>
<nav class="navi">
	<ul>
		<li><a href="insert">도서대출</a></li>
		<li><a href="list">도서대출현황조회</a></li>
		<li><a href="return">도서반납</a></li>
		<li><a href="book_insert">도서등록</a></li>
		<li><a href="book_list">도서별대출현황조회</a></li>
		<li><a href="index">홈으로</a></li>
	</ul>
</nav>
</header>
</div>

<div class="section">
<section>
		<h2 style="text-align:center">과정평가형 자격 CBQ</h2>
<div class="content">
		<form name="book" method="post" action="insert">
		<table>
			<tr>
				<th>대출번호</th>
				<td><input type="text" name="lentno">정수 4자리(1001)</td>
			</tr>
			<tr>
				<th>고객성명</th>
				<td><input type="text" name="custname"></td>
			</tr>
			<tr>
				<th>고객전화</th>
				<td><input type="text" name="phone"></td>
			</tr>
			<tr>
				<th>회원성별</th>
				<td><input type="radio" name="gender" value="M">남자
					<input type="radio" name="gender" value="F">여자
				</td>
			</tr>
			<tr>
				<th>도서코드</th>
				<td><input type="text" name="bookno"></td>
			</tr>
			<tr>
				<th>대출일자</th>
				<td><input type="text" name="outdate">예)20200207</td>
			</tr>
			<tr>
				<td colspan="2" class="btn_group">
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
		<p>HRDKORA Copyright@2016 All rights reserved. Human Resources
				Development Service of Korea</p>

</footer>
</div>


</body>
</html>