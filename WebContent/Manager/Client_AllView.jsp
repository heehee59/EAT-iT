<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EAT iT - 관리자 페이지</title>
<link rel="shortcut icon" href="https://blog.kakaocdn.net/dn/k3HEx/btqXXkUK7Mn/C3fJjMv7RIoFzVxa3W9MU1/favicon%20%282%29.ico?attach=1&knm=tfile.ico">

<style>
.Table1 {
	margin-top: 100px;
	margin-left: auto;
	margin-right: auto;
}

.Table1 td {
	padding: 5px;
	margin: 20px;
	border: 1px solid;
}

.Join {
	text-align: center;
}

.Join h3 {
	margin-top: -5px;
	margin-bottom: -5px;
}

.Id1 input, .Irum1 input {
	width: 162px;
	border-radius: 5px;
}

.Id1, .Irum1 {
	width: 150px;
}
.Button input{
	border-radius: 5px;
	background-color: #5882FA;
	color: white;
}
.ButtonDiv {
	text-align: center;
	padding: 5px;
	margin: 10px;
}

.ButtonDiv input {
	width: 150px;
	height: 50px;
	border-radius: 5px;
	background-color: #5882FA;
	color: white;
}


</style>

</head>
<body>
	<!-- 상단부분 -->
	<%@ include file="../mainframe/header.jsp"%>


	<!-- 중간부분 -->
	<section>
		<table class="Table1">
			<tr>
				<td class="Join" colspan="4"><h1>전체 회원 정보 조회</h1></td>
			</tr>
			<tr>
				<td class="Count">NO.</td>
				<td class="Id">아이디</td>
				<td class="irum">이름</td>
				<td class="out">BAN</td>
			</tr>
			<c:forEach var="i" items="${alist1}">
				<c:set var="count" value="${count+1}" />
				<tr>
					<td class="Count1">${count}.</td>
					<td class="Id1">${i.id}</td>
					<td class="Irum1">${i.name}</td>
					<td class="Button"><input type="button" value="BAN"
						onclick="location.href='ClientDeleteManager.do?id1=${i.id}'" /></td>
				</tr>
			</c:forEach>
			<tr>
			</tr>
		</table>
		<div class="ButtonDiv">
			<input type="button" value="이전으로 돌아가기"
				onclick="location.href='/EAT-iT/main.jsp'" />
		</div>
	</section>

	<br />
	<br />
	<br />

	<!-- 하단부분 -->
	<%@ include file="/mainframe/footer.jsp"%>
</body>
</html>