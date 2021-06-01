<%@page import="javafx.scene.Parent"%>
<%@page import="com.sun.java.swing.plaf.windows.resources.windows"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EAT iT - 로그인</title>
<link rel="shortcut icon"
	href="https://blog.kakaocdn.net/dn/k3HEx/btqXXkUK7Mn/C3fJjMv7RIoFzVxa3W9MU1/favicon%20%282%29.ico?attach=1&knm=tfile.ico">

<script src="http://code.jquery.com/jquery-1.9.1.js"></script>




<!-- section -->
<style>
* {
	margin: 0px;
	padding: 0px;
	list-style: none;
	text-decoration: none;
	border-collapse: collapse;
}

.Login_Logo img {
	margin-top:50px;
}

.Line {
	margin-top: 0.5em;
	margin-bottom: 0.5em;
	margin-left: auto;
	margin-right: auto;
	border: 2px;
	text-align: center;
	width: 300px;
	height: 10px;
	box-shadow: 0 10px 10px -10px aqua inset;
}

.Login_Check {
	text-align: center;
	width: 300px;
	height: 40px;
}

.Login_CheckColor {
	color: red;
	font-size: 15px;
}

.Login_IdPw input {
	width: 300px;
	border-radius: 5px;
	height: 40px;
}

.Id_No, .Pw_No {
	color: red;
	font-size: 10px;
}

.Login_Button input {
	width: 300px;
	height: 40px;
	border-radius: 5px;
	background-color: #5882FA;
	color: white;
}

.Login_Logo {
	text-align: center;
	margin: 5px;
	padding: 5px;
}

.Table1 {
	margin-left: auto;
	margin-right: auto;
}

.Table1 td {
	padding: 8px;
}
</style>

<!-- footer -->

</head>



<body>

	<!-- 중간부분 -->
	<section>
		<div class="Login_Logo">
			<img src="../img\logo.png">
		</div>
		<form name="User_Input" action="LoginCheck.do" method="post">
			<table class="Table1">
				<tr>
					<td class="Login_Check" colspan="1">
						<%
							String check = (String) request.getAttribute("check");
							if (check == "false") {
						%><pre class="Login_CheckColor"><%out.print("해당 정보는 없는 정보입니다!! \n확인후 다시 로그인해주세요.");%></pre> 
						<% }else if(check == "true") {
							String go = (String)request.getAttribute("go");
							out.print(go);
						}
						%>
					</td>
				</tr>
				<tr class="Login_IdPw">
					<td><input type="text" name="id1" id="id1"
						placeholder="EAT iT ID" onkeyup="IdKeyUp();" /></td>
				</tr>
				<tr>
					<td id="Id_No"></td>
				</tr>
				<tr class="Login_IdPw">
					<td><input type="password" name="pw1" id="pw1"
						placeholder="암호" onkeyup="PwKeyUp();" onkeypress="PwKeyUp();" /></td>
				</tr>
				<tr>
					<td id="Pw_No"></td>
				</tr>
				<tr class="Login_Button">
					<td><input type="button" value="로그인" onclick="Login();" /></td>
				</tr>
				<tr class="PassWord_Join">
					<td><a href="#" onclick="PwJoin()">EAT iT ID또는 암호를
							잊어버리셨나요??</a></td>
				</tr>
				<tr class="Clinet_Insert">
					<td><a href="#" onclick="Insert()">EAT iT ID가 아직 없으신가요??</a></td>
				</tr>
			</table>
		</form>
	</section>

	<br />
	<br />
	<br />
</body>

<!-- Script부분 -->
<script>
	function IdKeyUp() {
		document.getElementById("Id_No").innerHTML = "";
	}
	function PwKeyUp() {
		document.getElementById("Pw_No").innerHTML = "";
		if (window.event.keyCode == 13) {
			Login();
		}
	}

	function Login() {

		var form = document.User_Input;
		var id1 = document.getElementById("id1").value;
		var pw1 = document.getElementById("pw1").value;
		if (id1 == "") {
			document.getElementById("Id_No").innerHTML = "<p class='Id_No'>EAT iT 아이디가 누락되었습니다.</p>";
			document.getElementById("id1").focus();
		}
		if (pw1 == "") {
			document.getElementById("Pw_No").innerHTML = "<p class='Pw_No'>암호가 누락되었습니다.</p>";
			document.getElementById("pw1").focus();
		}
		if (id1 == "" && pw1 == "") {
			document.getElementById("id1").focus();
		}
		if (id1 != "" && pw1 != "") {
			form.submit();
		}
	}
	
	function PwJoin() {
		var width = 800;
		var height = 600;
		var popupX = (window.screen.width/2)-(width/2);
		var popupY = (window.screen.height/2)-(height/2);
		var width1 = 500;
		var height1 = 280;
		var popupX1 = (window.screen.width/2)-(width1/2);
		var popupY1 = (window.screen.height/2)-(height1/2);
		url = "Client_Password.jsp?popupX="+popupX1+"&popupY="+popupY1+"";
		window.open(url,"_blank", "width="+width+", height="+height+",left="+popupX+",top="+popupY);
	}
	
	function Insert() {
		var width = 800;
		var height = 600;
		var popupX = (window.screen.width/2) - (width/2);
		var popupY = (window.screen.height/2) - (height/2);
		url = "Client_Insert.jsp";
		window.open(url, "_blank", "width="+width+", height="+height+",left="+popupX+",top="+popupY);
	}

</script>
</html>

