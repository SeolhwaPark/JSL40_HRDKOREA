<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>(과정평가형 정보처리산업기사)오디션 관리 프로그램 Ver 1.0</title>
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
	if(insert.artist_id.value==""){
	alert('참가번호가 입력되지 않았습니다.');
	insert.artist_id.focus();	
		return false;
	}
	if(insert.artist_name.value==""){
	alert('참가자명이 입력되지 않았습니다.');
	insert.artist_name.focus();	
		return false;
	}
	if(insert.artist_birth1.value==""){
	alert('생년월일이 입력되지 않았습니다.');
	insert.artist_birth1.focus();	
		return false;
	}
	if(insert.artist_birth2.value==""){
	alert('생년월일이 입력되지 않았습니다.');
	insert.artist_birth2.focus();	
		return false;
	}
	if(insert.artist_birth3.value==""){
	alert('생년월일이 입력되지 않았습니다.');
	insert.artist_birth3.focus();	
		return false;
	}
	if(insert.artist_gender[0].checked == false && insert.artist_gender[1].checked == false){
	alert('성별이 선택되지 않았습니다.');
		return false;
	}
	if(insert.talent.selectedIndex == 0){
	alert('특기가 선택되지 않았습니다.');
	insert.talent.focus();	
		return false;
	}
	if(insert.agency.value==""){
	alert('소속사가 입력되지 않았습니다.');
	insert.agency.focus();	
		return false;
	}
	alert('오디션 지원자 정보가 등록되었습니다');
	insert.submit();
	return true;
}
function del() {
	alert('정보를 지우고 처음부터 다시 입력합니다');
	insert.reset();
	
}
</script>
</head>
<body>

<div class="header">
<header>
	<h1 class="logo">(과정평가형 정보처리산업기사)오디션 관리 프로그램 Ver 1.0</h1>
	<nav class="navi">
		<ul>
			<li><a href="insert.jsp">오디션등록</a></li>
			<li><a href="list.jsp">참가자목록조회</a></li>
			<li><a href="mento_list.jsp">멘토점수조회</a></li>
			<li><a href="rank_list.jsp">참가자등수조회</a></li>
			<li><a href="index.jsp">홈으로</a></li>
		</ul>
	</nav>
</header>
</div>

<div class="section">
<section>
	<h2 class="title">오디션 등록</h2>
	<div class="content">
		<form name ="insert" method="post" action="insert_pro.jsp">
			<table>
				<tr>
					<th>참가번호</th>
					<td><input type="text" name="artist_id" value="">*참가번호는(A000)4자리입니다</td>
				</tr>
				<tr>
					<th>참가자명</th>
					<td><input type="text" name="artist_name" value=""></td>
				</tr>
				<tr>
					<th>생년월일</th>
					<td><input type="text" name="artist_birth1" value="">년
						<input type="text" name="artist_birth2" value="">월
						<input type="text" name="artist_birth3" value="">일</td>
				</tr>
				<tr>
					<th>성별</th>
					<td><input type="radio" name="artist_gender" value="F">남성
						<input type="radio" name="artist_gender" value="M">여성
					</td>
				</tr>
				<tr>
					<th>특기</th>
					<td>
						<select name="talent">
							<option value="">특기선택</option>
							<option value="1">댄스</option>
							<option value="2">랩</option>
							<option value="3">노래</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>소속사</th>
					<td><input type="text" name="agency" value=""></td>
				</tr>
				<tr>
					<td colspan=2 class="btn-group">
						<input type="button" value="오디션등록" onClick="send()">
						<input type="button" value="다시쓰기" onClick="del()">
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