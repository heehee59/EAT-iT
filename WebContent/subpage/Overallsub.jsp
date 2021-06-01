<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon"
	href="https://blog.kakaocdn.net/dn/k3HEx/btqXXkUK7Mn/C3fJjMv7RIoFzVxa3W9MU1/favicon%20%282%29.ico?attach=1&knm=tfile.ico">
<title>EAT iT - 검색한 결과 맛집 추천</title>
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<%-- 메뉴바 스타일 --%>
<style>
/* 메뉴바 스타일 */
.nav-rec {
	width: 100%;
	height: 250px;
	background-color: #D8D8D8;
	opacity: 0.3;
	position: absolute;
	top: 61px;
}

.location {
	padding-top: 50px;
	font-weight: bold;
	font-size: 40pt;
	color: red;
}

.location-sub {
	font-size: 15pt;
	color: blue;
	padding-bottom: 10px;
	font-weight: bold;
}

.repeat {
	margin-top: 270px;
	align: center;
}

.button1 {
	background: #3450b4;
	border: none;
	border-radius: 3px;
	color: #ffffff;
	display: block;
	width: 50px;
	height: 30px;
	font: 13px "Gulim", "Dotum", Georgia, "Times New Roman", Times, serif;
	margin: 0 0 0 0;
	padding: 1px 1px 1px 1px;
	text-shadow: 0px 0px 0px 0px #e7e7e7;
}

table {
	margin: 0 auto;
	border-spacing: 10px;
	width: 800px;
}

table tr {
	border-spacing: 10px;
}

hr {
	margin: 0 auto;
}

.sangho {
	font-size: 25px;
	font-weight: bold;
}

.juso {
	color: #D8D8D8;
	font-weight: bold;
}
</style>


</head>
<body>
	<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
	<script>
   // 드롭메뉴 스르륵 효과
   function fade() {
      $('.dropdown-content').show(520);
   }
   function fadeo() {
      $('.dropdown-content').hide(520);
   }
</script>

	<script>
	function Button1_Click(str) {
		if(str != null){
				
			var id1 ='<%=application.getAttribute("id1")%>';
				if (id1 == 'null') {
					Swal.fire('로그인후에 찜 등록을 하실 수 있습니다.');
				} else {
					// 가게정보를 mutual값으로 변경하면됨
					url = "Client/Client_DibsListInsert.jsp?id1=" + id1
							+ "&mutual1="+ str;							
					 width = 500;
		             height = 280;
		             popupX = (window.screen.width/2) - (width/2);
				     popupY = (window.screen.height/2) - (height/2);
		               window.open(url,"_blank", "width="+width+", height="+height+",left="+popupX+",top="+popupY);}
			}
		}
	</script>

	<%@ include file="../mainframe/header.jsp"%>

	<nav>
		<div class="nav-rec">
			<div class="nav-text">
				<h1 class="location" align="center">내가 검색한 맛집</h1>
				<br> <br>
				<p class="location-sub" align="center">무슨 맛집이 있을까?</p>
			</div>
		</div>
	</nav>

	<section class="sect1">
		<div class="repeat">
			<form action="#">
				<c:forEach var="vo2" items="${alist3}">
					<table>
						<tr>
							<td rowspan=5><a href="detail.do?mutual=${vo2.mutual}"><img
									src="${vo2.firstimg}"
									style="width: 300px; height: 250px; padding: 35px;"></a></td>
							<td class="sangho">상호명: ${vo2.mutual}</td>

						</tr>
						<tr>
							<td class="juso">주소: ${vo2.address}</td>
						</tr>
						<tr>
							<td>소개: ${vo2.introduce}</td>
						</tr>
						<tr>

							<td><input type="hidden" value='${vo2.mutual}'
								name="mutual1"></td>
							<td><input type="button" value="찜" class="button1"
								onclick="Button1_Click('${vo2.mutual}');" /></td>

						</tr>
					</table>
					<br>
					<hr style="width: 800px">
					<br>
				</c:forEach>
			</form>
		</div>

	</section>

	<%@ include file="../mainframe/footer.jsp"%>


</body>
</html>