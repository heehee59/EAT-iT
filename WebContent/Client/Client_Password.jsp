<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String X = request.getParameter("popupX");
	String Y = request.getParameter("popupY");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EAT iT - 암호 찾기</title>
<link rel="shortcut icon" href="https://blog.kakaocdn.net/dn/k3HEx/btqXXkUK7Mn/C3fJjMv7RIoFzVxa3W9MU1/favicon%20%282%29.ico?attach=1&knm=tfile.ico">

<!-- section -->
<style>
.Login_Logo {
	text-align: center;
}

* {
   margin:0px;
   padding:0px;
   list-style:none;
   text-decoration:none;
   border-collapse:collapse;
}

.Login_Logo img {
	margin-top:50px;
	margin-bottom:50px;
}

.Table1 {
	margin-left: auto;
	margin-right: auto;
}

.Table1 td {
	padding: 5px;
	margin: 20px;
}

.FindPw, .Id_Join {
	text-align: center;
}

.Id1 input, .Irum1 input {
	width: 200px;
	height: 30px;
}

.Tel1 input:nth-child(1) {
	width: 40px;
	height: 30px;
}

.Tel1 input:nth-child(n+2) {
	width: 64px;
	height: 30px;
}

.ButtonDiv {
	text-align: center;
	padding: 5px;
	margin: 10px;
}

.ButtonDiv input {
	width: 80px;
	height: 40px;
	background-color: #5882FA;
	color: white;
}


</style>

<!-- footer -->



</head>
<body>

	<!-- 상단부분 -->
	<header>
		<div class="menubar">
			<div class="logo">
				<a href="/EAT-iT/main.jsp"></a>
			</div>
		</div>
	</header>

	<!-- 중간부분 -->
	<section>
		<div class="Login_Logo">
			<img src="../img\logo.png">
		</div>
		<form action="ClientFindPw.do" method="get">
			<table class="Table1">
				<tr>
					<td class="FindPw" colspan="2"><h1>비밀번호 찾기</h1></td>
				</tr>
				<tr>
					<td class="Id">아이디</td>
					<td class="Id1"><input type="text" name="id1" required /></td>
				</tr>
				<tr>
					<td class="Irum">이름</td>
					<td class="Irum1"><input type="text" name="irum1" required />
					</td>
				</tr>
				<tr>
					<td class="Tel">전화번호</td>
					<td class="Tel1"><input type='tel' name='phone1' value="010"
						required readonly />- <input type='tel' name='phone2' required
						maxlength="4" />- <input type='tel' name='phone3' required
						maxlength="4" /></td>
				</tr>
			</table>
			<input type="hidden" name="X" value=<%=X%>/>
			<input type="hidden" name="Y" value=<%=Y%>/>
			<div class="ButtonDiv">
				<input type="submit" value="찾기" />
				<input type="button" value="취소" onclick="Button1_Click()" />
			</div>
			<div class="Id_Join">
				EAT iT ID를 잊어버린 경우 <a href="/EAT-iT/Client/Client_Id.jsp?popupX=<%=X%>&popupY=<%=Y %>">아이디 찾기</a>
			</div>
		</form>
	</section>

	<br />
	<br />
	<br />

</body>

<!-- script -->
<script>
	function Button1_Click() {
		window.close();
	}
</script>

</html>