<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.footer {
	width: 100%;
	height: 250px;
	background: #f5f5f7;
	float: left;
}

.footer div {
	float: left;
}

.foomain div {
	margin: 18% 10%;
}

.foot_a_link a img {
	width: 17px;
	height: 17px;
}

.foot_a_link a {
	padding: 5px;
}

.foot_a_link {
	text-align: left;
	margin-left: 12%;
}

.flogo {
	margin: 5px;
	left: 0;
	width: 80%;
	height: 80px;
	text-align: left;
}

.flogo a {
	width: 100%;
}

.flogo a img {
	margin-top:50px;
	width: 70%;
	height: 100%;
}

.footnav {
	width: 22%;
	height: 87%;
}

.footmain {
	width: 22%;
	height: 87%;
}

.footmain ul li {
	font-size: 12px;
	margin: 5px auto;
}

.footmain2 ul li {
	font-size: 12px;
	margin: 5px auto;
}

.footmain2 {
	width: 22%;
	height: 87%;
}

.footaside {
	width: 34%;
	height: 87%;
}

.footertext {
	height: 13%;
	text-align: left;
	margin-left: 2%;
	font-size: 10px;
	background: #f5f5f7;
}
.footaside .imagebox{
width:400px;
height:200px;
margin-left:20px;
text-align:center;
line-height:200px;
}
.text5 {
 font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
  font-size:100px;
  font-weight: 300;
  letter-spacing: 2px;
  color: black;
  background-image: -webkit-linear-gradient(aqua, pink, white);
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;
  -webkit-animation: hue 10s infinite linear;
  
}
@-webkit-keyframes hue {
  from {
    -webkit-filter: hue-rotate(0deg);
  }
  to {
    -webkit-filter: hue-rotate(-360deg);
  }
}

</style>
</head>
<body>
	<footer class="footer">

		<div class="footnav">
			<div class="flogo">
				<img src="img\logo.png">
			</div>

			<div class="foot_a_link">
				<a href="https://www.instagram.com/chef_woong/"><img
					src="https://blog.kakaocdn.net/dn/FntBy/btqXu5wNUwe/6vRrQL3SIIP8GhbvpKE9t0/img.png" /></a>
				<a href="https://www.instagram.com/chef_woong/"><img
					src="https://blog.kakaocdn.net/dn/82Msk/btqXrD8sZes/8wNuBhQZHKZ8dals9KJtu1/img.png" /></a>
				<a href="https://www.facebook.com/"><img
					src="https://blog.kakaocdn.net/dn/cal5R8/btqXb2VPP82/zI49LcFgsLj3L2fw2S0a11/img.png" /></a>
			</div>
		</div>

		<div class="footmain">

			<div style="margin: 12% 10%">
				<h5>프로젝트 2조</h5>
				<ul>
					<li>강민규</li>
					<li>최유정</li>
					<li>엄희경</li>
					<li>함지웅</li>
					<li>김진환</li>
					<li>이해준</li>

				</ul>
			</div>
		</div>
		<div class="footmain2">
			<div style="margin: 12% 10%">
				<h5>개발 도구</h5>
				<ul>
					<li>SQLDeveloper</li>
					<li>JSTL</li>
					<li>JSP</li>
					<li>frontcontroller</li>
					<li>html</li>
					<li><a href="">servlet</a></li>

				</ul>
			</div>
		</div>
		<div class="footaside">
		
		<div class="imagebox"><div class="text5">EAT IT</div></div>
		</div>

		<div class="footertext">
			<div style="margin-bottom: 3%">
				Copyright ⓒ 2021 Team 2 Inc. 모든 권리 보유.<br> 대표이사 : 없음 ㅣ 주소 :
				서울특별시 종로구 ㅣ 대표전화 : 00-0000-0000 ㅣ 팩스 : 00-0000-0000
			</div>

		</div>
	</footer>

</body>
</html>