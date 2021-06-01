<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<style>
* {
	margin: 0px;
	padding: 0px;
	list-style: none;
	text-decoration: none;
	border-collapse: collapse;
}

.menubar {
	position: fixed;
	z-index: 3;
	display: flex;
	width: 100%;
	height: 60px;
	border-bottom: 1px solid gray;
	background: white;
}

.menubar_menulist {
	right: 0px;
	display: inline;
}

.align-right {
	margin-left: auto;
	position: relative
}

.header {
	width: 100%;
	height: 60px;
	text-align: center;
}

span {
	margin-left: -40px;
}

span img {
	height: 20px;
	margin-left: -50px;
}

.search {
	margin: auto;
	width: 500px;
	margin-left: 20px;
}

.dropdown {
	display: inline-block;
}

.dropbtn {
	color: black;
	background-color: transparent;
	padding: 16px;
	font-size: 1vw;
	border: none;
	cursor: pointer;
	outline: 0;
}

.dropdown-content {
	background-color: transparent;
	display: none;
	position: absolute;
	min-width: 160px;
	box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
	z-index: 1;
	border: 1px;
}

.dropdown-content a {
	color: black;
	padding: 12px 16px;
	text-decoration: none;
	display: block;
	background: #ffffff4a;
}

.dropdown-content a:hover {
	background-color: #ddd;
}

.dropdown:hover .dropbtn {
	background-color: transparent;
}

.search_btn {
	padding: 5px;
	border: solid 5px #3450b4;
	font-weight: bold;
	font-size: 14pt;
	border-radius: 20px;
	color: white;
	background-color: #3450b4;
}

.search_input {
	padding: 5px;
	width: 280px;
	height: 35px;
	border: 0;
	border-radius: 8px;
	font-size: 14pt;
}

.search_input:focus {
	outline: none;
}
</style>

<script>
	window.addEventListener("resize", homzzang);
	function homzzang() {
		var windowWidth = $(window).width();
		if (windowWidth < 750) {
			$('.dropbtn').css("visibility", "hidden");
			$('.dropdown-content a').css("display", "none");
			$('.dropdown-content hr').css("display", "none");
		} else {
			$('.dropbtn').css("visibility", "visible");
			$('.dropdown-content a').css("display", "block");
			$('.dropdown-content hr').css("display", "block");
		}

	}
</script>
<script>
	function Login() {
		width = 800;
		height = 600;
		popupX = (window.screen.width/2) - (width/2);
		popupY = (window.screen.height/2) - (height/2);
		url = "Client/Client_Login.jsp";
		window.open(url, "post", "width="+width+", height="+height+",left="+popupX+",top="+popupY);
	}

	function fade() {
		$('.dropdown-content').show(520);
	}
	function fadeo() {
		$('.dropdown-content').hide(520);
	}
</script>
</head>
<body>

	<header class="header">
		<div class="menubar">
			<div class="logo">
				<a href="main.jsp"><img src="img\logo.png"></a>
			</div>

			<div class="search">
				<form action="Mutual_allinfo_search.do">

					<input class="search_input" type="text" name="search"
						placeholder="검색어를 입력하세요">
					<!-- request.getParameter("search") -->
					<input class="search_btn" type="submit" value="search">
				</form>
			</div>

			<div class="align-right">
				<div class="dropdown" onmouseenter="fade()" onmouseleave="fadeo()">
					<button class="dropbtn">테마별 맛집 추천</button>
					<div class="dropdown-content">
						<a href="Mutual_allinfo_add.do?address=강남">지역별 </a>
						<hr>
						<a href="Mutual_allinfo_review.do">리뷰별 </a>
						<hr>
						<a href="Mutual_allinfo_kind.do?kinds=일식">종류별 </a>
					</div>
				</div>
				<div class="menubar_menulist">

					<c:if test="${(id1!=null&&id1!='ADMIN') ? true : false}">
						<a href="ClientDibsListView.do"><button class="dropbtn">찜
								리스트</button></a>
						<a href="ClientOneView.do"><button class="dropbtn">내정보</button></a>
						<a href="LogOut.do"><button class="dropbtn">로그아웃</button></a>
					</c:if>
					<c:if test="${(id1=='ADMIN') ? true : false }">
						<a href="ClientAllView.do"><button class="dropbtn">회원관리</button></a>
						<a href="LogOut.do"><button class="dropbtn">로그아웃</button></a>
					</c:if>
					<c:if test="${(id1==null) ? true : false}">
						<button class="dropbtn" onclick="Login()">로그인</button>

					</c:if>
				</div>
			</div>
		</div>

	</header>
</body>
</html>