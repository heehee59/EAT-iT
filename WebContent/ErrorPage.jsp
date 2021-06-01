<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8" isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EAT iT - 에러 페이지</title>
<link rel="shortcut icon" href="https://blog.kakaocdn.net/dn/k3HEx/btqXXkUK7Mn/C3fJjMv7RIoFzVxa3W9MU1/favicon%20%282%29.ico?attach=1&knm=tfile.ico">
<style>
#button {
	border-radius:10px;
	background-color:#3450b4;
	color:white;
	font-weight:bold;
	font-size:15pt;
	cursor:pointer;
}
</style>
<script>
function toMain() {
	location.href="main.jsp";
}

function goBack() {
	window.history.back();
}
</script>
</head>
<body onload="setTimeout('toMain()',10000)">
<center>
<img src="https://blog.kakaocdn.net/dn/Ds8Ni/btqWsHqsAMw/28brg2nSU3g8DZIPARH8j1/img.jpg"><br>
<input id="button" type="button" value="이전 페이지으로" onclick="goBack()">
</center>
</body>
</html>