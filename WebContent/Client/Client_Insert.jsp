<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EAT iT - 회원가입</title>
<link rel="shortcut icon" href="https://blog.kakaocdn.net/dn/k3HEx/btqXXkUK7Mn/C3fJjMv7RIoFzVxa3W9MU1/favicon%20%282%29.ico?attach=1&knm=tfile.ico">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ed569c66d15e26e2676b3d419b79379e"></script>
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>


<!-- section -->
<style>
* {
   margin:0px;
   padding:0px;
   list-style:none;
   text-decoration:none;
   border-collapse:collapse;
}

.Login_Logo {
	text-align:center;
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

}

.Insert {
	text-align: center;
}

.Id1 input, .Pw1 input, .PwCheck1 input, .Nick1 input, .Irum1 input {
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

.Check1 input {
	margin-top: 10px;
	zoom: 1.2;
}

.PwChecked, .IdChecked {
	color: red;
	font-size: 10px;
}


.Text {
	font-size: 20px;
}

.ButtonDiv {
	text-align: center;
	padding: 5px;
	margin: 10px;
}

.ButtonDiv input {
	width: 80px;
	height: 50px;
	border-radius: 5px;
	background-color: #5882FA;
	color: white;
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
		<form method="post" name="Form">
			<table class="Table1">
				<tr>
					<td class="Insert" colspan="2"><h1>회원가입</h1></td>
				</tr>
				<tr></tr>
				<tr>
					<td class="Id">아이디</td>
					<td class="Id1"><input type="text" name="id1" id="id1"
						maxlength="12" pattern="^([a-z0-9]){6,12}$"
						title="영문소문자, 숫자포함 6자리이상 필요합니다" required onblur="IdCheck();" /></td>
				</tr>
				<tr>
					<td></td>
					<td id="IdChecked" ></td>
				</tr>
				<tr>
					<td class="Pw">비밀번호</td>
					<td class="Pw1"><input type="password" name="pw1" id="pwc1"
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
					<td class="PwCheck1"><input type="password" name="pw2" id=pwc2
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
					<td class="Nick1"><input type="text" name="nick1" id="nick1" required />
					</td>
				</tr>
				<tr>
					<td class="Irum">이름</td>
					<td class="Irum1"><input type="text" name="irum1" id="irum1"
						maxlength="30" pattern="^([a-zA-Z가-힣]){0,30}$"
						title="특수기호 숫자는 불가능합니다." required/></td>
				</tr>
				<tr>
					<td class="Tel">전화번호</td>
					<td class="Tel1"><input type='tel' name='phone1' value="010" readonly />
					- <input type='tel' name='phone2' id="phone2" pattern="^([0-9]){4,4}$" maxlength="4" title="숫자만 가능합니다." required />
					- <input type='tel' name='phone3' id="phone3" pattern="^([0-9]){4,4}$" maxlength="4" title="숫자만 가능합니다." required /></td>
				</tr>
				<tr>
					<td class="Check1" colspan="2"><input type="checkbox"
						id="check1" /> <b class="Text">개인 정보 수집에 동의 하십니까?</b></td>
				</tr>
			</table>
			<div class="ButtonDiv">
				<input type="button" value="가입" onclick="Button1_Click('Insert');" />
				<input type="button" value="취소" onclick="Button1_Click('NoInsert');" />
			</div>
		</form>
	</section>

	<br />
	<br />
	<br />

</body>

<!-- script -->
<script>
	$(document).ready(function() {
		document.getElementById('id1').focus();
	})
	
	function IdCheck() {
		var userID = $('#id1').val();
		var idpatten = /^([a-z0-9]){6,12}$/g;
		if(!idpatten.test($('#id1').val())){
			$('#IdChecked').html('<p class="IdChecked">영문소문자 숫자포함 6자이내 입력하세요</p>');
			document.getElementById('id1').focus();
		}else{
			$.ajax({
				type:'POST',
				url: './IdCheck.do',
				data:{userID: userID},
				success : function (result) {
					if(result==1){
						$('#IdChecked').html('<p class="IdChecked">사용할 수 있는 아이디 입니다.</p>');
						
					}else{
						$('#IdChecked').html('<p class="IdChecked">이미 사용중인 아이디 입니다.</p>');
						document.getElementById('id1').focus();
					}
				}
			});
		}
	}

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
			var id1 = document.getElementById("id1").value;
			var pw1 = document.getElementById('pwc1').value;
			var pw2 = document.getElementById('pwc2').value;
			var nick1 = document.getElementById("nick1").value;
			var name1 = document.getElementById("irum1").value;
			var tel1 = document.getElementById("phone2").value;
			var tel2 = document.getElementById("phone3").value;
			if ($(check1).prop("checked")) {
				Form.action = "ClientInsert.do";
				Form.submit();
			} else if (id1!="" && pw1!="" && pw2!="" && nick1!="" && name1!="" && tel1!="" && tel2!="") {
				Swal.fire('개인 정보 수집에 동의하세요');
				$("#id1").val=id1;
				$("#pwc1").val=pw1;
				$("#pwc2").val=pw2;
				$("#nick1").val=nick1;
				$("#irum1").val=name1;
				$("#phone2").val=tel1;
				$("#phone3").val=tel2;
				return false;
			}

		}
		if (str == "NoInsert") {
			window.close();
		}
	}
</script>

</html>