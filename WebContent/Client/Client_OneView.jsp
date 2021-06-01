<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EAT iT - 내 정보 보기</title>
<link rel="shortcut icon" href="https://blog.kakaocdn.net/dn/k3HEx/btqXXkUK7Mn/C3fJjMv7RIoFzVxa3W9MU1/favicon%20%282%29.ico?attach=1&knm=tfile.ico">
<style>
.Login_Logo img {
	margin-top:50px;
	margin-bottom:50px;
}

.Login_Logo {
	text-align: center;
}

.Table1 {
	margin-left: auto;
	margin-right: auto;
}

.Table1 td {
	padding: 5px;
	margin: 20px;
}

.Join {
	text-align: center;
}

.Join h3 {
	margin-top: -5px;
	margin-bottom: -5px;
}

.Id1 input,.Pw1 input,.PwCheck1 input, .Nick1 input, .Irum1 input {
	width: 200px;
	height: 30px;
}

.PwChecked{
	color: red;
	font-size: 10px;
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


</head>
<body>
	<!-- 상단부분 -->
	 <%@ include file="../mainframe/header.jsp"%>



	<!-- 중간부분 -->
	<div class="Login_Logo">
		<img src="img\logo.png">
	</div>
	<section>
		<form method="post" name="Form">
			<table class="Table1">
				<tr>
					<td class="Join" colspan="3"><h3>정보조회</h3></td>
				</tr>
				<tr>
					<td class="Id">아이디</td>
					<td class="Id1"><input type="text" value="${vo1.id}"
						name="id1" disabled/></td>
				</tr>
				<tr>
					<td class="Pw">비밀번호</td>
					<td class="Pw1"><input type="password" name="pw1" id="pwc1" value="${vo1.pw }"
						maxlength="30"
						pattern="^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,30}$"
						title="8자이상 하나의 문자 숫자 특수기호를 포함해야합니다" required onblur="Pw1()"/></td>
				</tr>
				<tr>
					<td></td>
					<td id="PwChecked1"></td>
				</tr>
				<tr>
					<td class="PwCheck">비밀번호 확인</td>
					<td class="PwCheck1"><input type="password" name="pw2" id=pwc2 value="${vo1.pw }"
						maxlength="30"
						pattern="^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,30}$"
						title="8자이상 하나의 문자 숫자 특수기호를 포함해야합니다" required onblur="PwCheck();" /></td>
				</tr>
				<tr>
					<td></td>
					<td id="PwChecked"></td>
				</tr>
				<tr>
					<td class="Nick">닉네임</td>
					<td class="Nick1"><input type="text" value="${vo1.nick}"
						name="nick1" required maxlength="10" /></td>
				</tr>
				<tr>
					<td class="Irum">이름</td>
					<td class="Irum1"><input type="text" value="${vo1.name}"
						name="name1" maxlength="30" pattern="^([a-zA-Z가-힣]){0,30}$"
						title="특수기호 숫자는 불가능합니다." required /></td>
				</tr>
				<tr>
					<td class="Tel">전화번호</td>
					<td class="Tel1"><input type="tel" value="010" name="phone1"
						readonly />- <input type='tel' value="${vo1.phone2}"
						name='phone2' pattern="^([0-9]){4,4}$" maxlength="4"
						title="숫자만 가능합니다." required />- <input type='tel'
						value="${vo1.phone3}" name='phone3' pattern="^([0-9]){4,4}$"
						maxlength="4" title="숫자만 가능합니다." required /></td>
				</tr>
			</table>
			<input type="hidden" value="${vo1.d}" name="d1" />
			<div class="ButtonDiv">
				<input type="submit" value="수정" onclick="Button1_Click('Insert');" />
				<input type="submit" value="취소" onclick="Button1_Click('NoInsert')" /><br />
				<br /> 정말 <a href="ClientDelete.do?id1=${vo1.id}"> 탈퇴</a> 하실건가요?
			</div>

		</form>
	</section>

	<br />
	<br />
	<br />


	<!-- 하단부분 -->
	<%@ include file="/mainframe/footer.jsp"%>

</body>

<!-- script부분 -->
<script>
	$(document).ready(function() {
		document.getElementById("pwc1").focus();
	})
	
	function Pw1() {
		var pwpatten = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,30}$/g;
		if($('#pwc1').val().length>1){
		if(!pwpatten.test($('#pwc1').val())){
			document.getElementById("PwChecked1").innerHTML = "<p class='PwChecked'>8자이상 하나의 문자 숫자 특수기호를 포함 해야합니다.</p>";
			document.getElementById('pwc1').focus();
		}else{
			document.getElementById("PwChecked1").innerHTML = "";
		}
	}
	}
	
	function PwCheck() {
		var p1 = document.getElementById('pwc1').value;
		var p2 = document.getElementById('pwc2').value;
		if(p2.length>1){
		if (p1 == p2) {
			document.getElementById("PwChecked").innerHTML = "<p class='PwChecked'> 비밀번호가 일치합니다.</p>";
		} else {
			document.getElementById("PwChecked").innerHTML = "<p class='PwChecked'> 비밀번호가 일치하지 않습니다.</p>";
			document.getElementById('pwc2').focus();
		}
		}
	}
	
	function Button1_Click(str) {
		if (str == "Insert") {
			Form.action = "ClientUpdate.do";
		} else if (str == "NoInsert") {
			Form.action = "/EAT-iT/main.jsp"
		}
	}

</script>

</html>