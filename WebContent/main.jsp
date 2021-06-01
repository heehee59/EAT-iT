<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EAT iT - 테마별 맛집 추천</title>
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<link rel="shortcut icon" href="https://blog.kakaocdn.net/dn/k3HEx/btqXXkUK7Mn/C3fJjMv7RIoFzVxa3W9MU1/favicon%20%282%29.ico?attach=1&knm=tfile.ico">
<link rel="stylesheet" type="text/css" href="CSS\main_style.css">
<script>
	//로그인할시 찾아감
	function Login() {
		width = 800;
		height = 600;
		popupX = (window.screen.width/2) - (width/2);
		popupY = (window.screen.height/2) - (height/2);
		console.log(window.screen.width);
		console.log(window.screen.height);
		url = "Client/Client_Login.jsp";
		window.open(url,"_blank", "width="+width+", height="+height+",left="+popupX+",top="+popupY);
	}


	$(function() {/* 메인 페이드인 아웃 슬라이드쇼 부분  */
		$(".slide a:eq(1)").hide();
		$(".slide a:eq(2)").hide();
		var t;
		var logo = 0;

		function stop() {
			clearInterval(t);
		}

		function logoChg() {
			if (logo == 0) {
				$(".slide a:eq(0)").fadeOut(1500);
				$(".slide a:eq(1)").fadeIn(1500);
				logo = 1;
			} else if (logo == 1) {
				$(".slide a:eq(1)").fadeOut(1500);
				$(".slide a:eq(2)").fadeIn(1500);
				logo = 2;
			} else {
				$(".slide a:eq(2)").fadeOut(1500);
				$(".slide a:eq(0)").fadeIn(1500);
				logo = 0;
			}
		}

		function reverselogoChg() {
			if (logo == 0) {
				$(".slide a:eq(0)").fadeOut(1500);
				$(".slide a:eq(2)").fadeIn(1500);
				logo = 1;
			} else if (logo == 1) {
				$(".slide a:eq(2)").fadeOut(1500);
				$(".slide a:eq(1)").fadeIn(1500);
				logo = 2;
			} else {
				$(".slide a:eq(1)").fadeOut(1500);
				$(".slide a:eq(0)").fadeIn(1500);
				logo = 0;
			}
		}
		var t = setInterval(logoChg, 3500);

		$(".slide").hover(function() {
			clearInterval(t);
		}, function() {
			t = setInterval(logoChg, 3500);
		});

		$(".slidebutnext input").on("click", function() {
			stop();
			logoChg();
			t = setInterval(logoChg, 3500);

		});
		$(".slidebutprev input").on("click", function() {
			stop();
			reverselogoChg();
			t = setInterval(logoChg, 3500);
		});

	});

	/* ㅈㅈㅈㅈ부분 버튼클릭 슬라이드  */
	function smallbutnextClick1() {
		$('.smallcontainer1').animate({
			marginLeft : "-100%"
		});
		$('.smallsuv1').animate({
			marginLeft : "-100%"
		});
		$('.smallbutnext1 input').css("visibility", "hidden");
		$('.smallbutprev1 input').css("visibility", "visible");

	}
	function smallbutprevClick1() {
		$('.smallcontainer1').animate({
			marginLeft : "0"
		});
		$('.smallsuv1').animate({
			marginLeft : "0"
		});
		$('.smallbutnext1 input').css("visibility", "visible");
		$('.smallbutprev1 input').css("visibility", "hidden");

	}

	function smallbutnextClick2() {
		$('.smallcontainer2').animate({
			marginLeft : "-100%"
		});
		$('.smallsuv2').animate({
			marginLeft : "-100%"
		});
		$('.smallbutnext2 input').css("visibility", "hidden");
		$('.smallbutprev2 input').css("visibility", "visible");

	}
	function smallbutprevClick2() {
		$('.smallcontainer2').animate({
			marginLeft : "0"
		});
		$('.smallsuv2').animate({
			marginLeft : "0"
		});
		$('.smallbutnext2 input').css("visibility", "visible");
		$('.smallbutprev2 input').css("visibility", "hidden");

	}
	/////////좌우움직이는 슬라이드 기능
	/*   setInterval(function(){
		  
	   $('.bigthema2 ul').delay(2500);
	   $('.bigthema2 ul').animate({marginLeft:"-100%"},2500);
	   $('.bigthema2 ul').delay(2500);
	   $('.bigthema2 ul').animate({marginLeft:"0%"},2500);
	   
	   });
	 */
	$(function() {

		$('.thebutnex1 input').click(function() {
			nextChkPlay();
		});

		$('.thebutpre1 input').click(function() {
			prevChkPlay();
		});

		function nextChkPlay() {
			$('.thebutnex1 input').css("visibility", "hidden");
			$('.thebutpre1 input').css("visibility", "visible");
			$('.bigthema1 ul').animate({
				marginLeft : "-100%"
			});
		}

		function prevChkPlay() {
			$('.thebutpre1 input').css("visibility", "hidden");
			$('.thebutnex1 input').css("visibility", "visible");
			$('.bigthema1 ul').animate({
				marginLeft : "0px"
			});
		}

	});
</script>
<script>
	$(document).ready(function() {
		var navHeight = $(".search").width();
		$(".search").css("visibility", "hidden");
		$(".dropbtn").css("color", "white");
		$(".gotop").css("display", "none");
		$(".menubar").css("border", "none");
		$(window).scroll(function() {
			var rollit = $(this).scrollTop() >= 500;

			if (rollit) {
				$(".menubar").css("background", "white");
				$(".search").css("visibility", "visible");
				$(".dropbtn").css("color", "black");
				$(".gotop").css("display", "block");
				$(".menubar").css("border-bottom", "1px solid gray");

			} else {
				$(".search").css("visibility", "hidden");
				$(".menubar").css("background", "rgba(0,0,0,0.0)");
				$(".dropbtn").css("color", "white");
				$(".gotop").css("display", "none");
				$(".menubar").css("border", "none");
			}
		});
	});
</script>

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
	function zoomIn(event) {
		event.target.style.transform = "scale(1.1)";
		event.target.style.zIndex = 1;

		event.target.style.transition = "all 0.5s";
	}

	function zoomOut(event) {
		event.target.style.transform = "scale(1)";
		event.target.style.zIndex = 0;
		event.target.style.transition = "all 0.5s";
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
	<header class="header"
		style="background-image: url('https://blog.kakaocdn.net/dn/ZUwFl/btqXwcjgu5N/qWpnL8r4UqmtunXpx6MCeK/img.jpg');">
		<div class="menubar">
			<div class="logo">
				<a href="main.jsp"><img src="img\logo.png"  /></a>
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
						<button class="dropbtn" onclick="Login();">로그인</button>

					</c:if>
				</div>
			</div>
		</div>
		<p class="text">
			Enjoy your food life,<br> EAT IT!
			<!-- 출처 https://codepen.io/caseycallow/pen/yMNqPY -->
		</p>
		<div class="header_search">
			<form action="Mutual_allinfo_search.do">
				<span><img
					src="https://blog.kakaocdn.net/dn/clvEUU/btqWNcv5xUx/FlLiOLOK2VhzUAbT1nKrF0/img.png" /></span>
				<input class="search_input" type="text" name="search"
					placeholder="지역, 식당 또는 음식"> <input class="search_btn"
					type="submit" value="검색">
			</form>
		</div>
	</header>
	<div class="gotop">
		<a href="#">TOP</a>
	</div>
	<section>
		<div class="slidecontainer">
			<div class="slidebutprev">
				<input type="button" style="cursor: pointer" />
			</div>
			<div class="slide">
				<a href="detail.do?mutual=파씨오네"> <img
					src="https://blog.kakaocdn.net/dn/cR7waL/btqXu4FLKS7/vYSN9vBsWRghFL53cUO3m1/img.jpg" /></a>
				<a href="detail.do?mutual=미라이"> <img
					src="https://blog.kakaocdn.net/dn/b8Bj8p/btqXrDIuL8J/Q8j9820lZR0qnhuD8TH5y0/img.jpg" /></a>
				<a href="detail.do?mutual=진만두"> <img
					src="https://blog.kakaocdn.net/dn/UVA5M/btqXDfFWUs0/NHZbwEvQh9IMYpvekuDa60/img.jpg" /></a>

			</div>
			<div class="slidebutnext">
				<input type="button" style="cursor: pointer" />
			</div>
		</div>
	</section>
	<hr>
	<section>
		<div>
			<h1 class="text2">테마별 맛집 추천!</h1>
		</div>
		<div class="container">
			<div class="thebutpre1">
				<input type="button" />
			</div>
			<div class="bigthema1">
				<ul>
					<li><a href="Mutual_allinfo_kind.do?kinds=일식"><img
							src="https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FnjQWW%2FbtqXBXynAFE%2Fh1cc4qPnnCafLRmlkSC05k%2Fimg.png
"
							onmouseenter="zoomIn(event)" onmouseleave="zoomOut(event)" /></a></li>
					<li><a href="Mutual_allinfo_kind.do?kinds=한식"><img
							src="https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FnIw82%2FbtqXu5KZfOX%2F4SwgnHXr3Hvd30QYX5Mk8K%2Fimg.png"
							onmouseenter="zoomIn(event)" onmouseleave="zoomOut(event)" /></a></li>
					<li><a href="Mutual_allinfo_kind.do?kinds=이태리"><img
							src="https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FeDOX98%2FbtqXDeUbjYQ%2FdvBQQdxk7W7YpCioTAxZSk%2Fimg.png
"
							onmouseenter="zoomIn(event)" onmouseleave="zoomOut(event)" /></a></li>
					<li><a href="Mutual_allinfo_add.do?address=마포"><img
							src="https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FrWLPM%2FbtqXyMRrPKS%2Fvv5Mnw7K7z2NI1Zezop750%2Fimg.png"
							onmouseenter="zoomIn(event)" onmouseleave="zoomOut(event)" /></a></li>
					<li><a href="Mutual_allinfo_add.do?address=강남"><img
							src="https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FbyCWJ7%2FbtqXDe0Wwav%2FJLh5lakby1xg7T7kEwmvc1%2Fimg.png
"
							onmouseenter="zoomIn(event)" onmouseleave="zoomOut(event)" /></a></li>
					<li><a href="Mutual_allinfo_add.do?address=서울"><img
							src="https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FHFiVz%2FbtqXBXd4B4b%2FLZ7KZJoMbfRFtcXL3KbRu0%2Fimg.png"
							onmouseenter="zoomIn(event)" onmouseleave="zoomOut(event)" /></a></li>

				</ul>
			</div>
			<div class="thebutnex1">
				<input type="button" />
			</div>
		</div>

	</section>
	<hr>
	<section>
		<div class="smalltitle">
			<h1 class="text1">일식이 땡길때!</h1>
		</div>
		<div class="smallslide">
			<div class="smallbutprev1">
				<input type="button" onclick="smallbutprevClick1()" />
			</div>
			<div class="smallthema">
				<div class="smallcontainer1">
					<a href="detail.do?mutual=미라이"><img
						src="https://mp-seoul-image-production-s3.mangoplate.com/281547/753280_1550146766591_11966"
						onmouseenter="zoomIn(event)" onmouseleave="zoomOut(event)" /></a> <a
						href="detail.do?mutual=스시소라"><img
						src="https://mp-seoul-image-production-s3.mangoplate.com/54303_1528720802986009.jpg"
						onmouseenter="zoomIn(event)" onmouseleave="zoomOut(event)" /></a> <a
						href="detail.do?mutual=이치에"><img
						src="https://mp-seoul-image-production-s3.mangoplate.com/added_restaurants/27907_1458188159981819.jpg"
						onmouseenter="zoomIn(event)" onmouseleave="zoomOut(event)" /></a> <a
						href="detail.do?mutual=갓포아키"><img
						src="https://mp-seoul-image-production-s3.mangoplate.com/689979_1539971244122359.jpg"
						onmouseenter="zoomIn(event)" onmouseleave="zoomOut(event)" /></a> <a
						href="detail.do?mutual=요코쵸"><img
						src="https://mp-seoul-image-production-s3.mangoplate.com/added_restaurants/104601_1455211944844.jpg"
						onmouseenter="zoomIn(event)" onmouseleave="zoomOut(event)" /></a> <a
						href="detail.do?mutual=스시코우지"><img
						src="https://mp-seoul-image-production-s3.mangoplate.com/185003/565729_1545727396959_19581"
						onmouseenter="zoomIn(event)" onmouseleave="zoomOut(event)" /></a> <a
						href="detail.do?mutual=크레이지카츠"><img
						src="https://mp-seoul-image-production-s3.mangoplate.com/724957_1515576675198806.jpg"
						onmouseenter="zoomIn(event)" onmouseleave="zoomOut(event)" /></a> <a
						href="detail.do?mutual=텐동요츠야"><img
						src="https://mp-seoul-image-production-s3.mangoplate.com/881793_1512208063612527.jpg"
						onmouseenter="zoomIn(event)" onmouseleave="zoomOut(event)" /></a>
				</div>
				<div class="smallsuv1">
					<a href="detail.do?mutual=미라이"><h3>미라이</h3>
						<h5>강남구</h5></a> <a href="detail.do?mutual=스시소라"><h3>스시소라</h3>
						<h5>종로구</h5></a> <a href="detail.do?mutual=이치에"><h3>이치에</h3>
						<h5>강남구</h5></a> <a href="detail.do?mutual=갓포아키"><h3>갓포아키</h3>
						<h5>강남구</h5></a> <a href="detail.do?mutual=요코쵸"><h3>요코쵸</h3>
						<h5>마포구</h5></a> <a href="detail.do?mutual=스시코우지"><h3>스시코우지</h3>
						<h5>강남구</h5></a> <a href="detail.do?mutual=크레이지카츠"><h3>크레이지카츠</h3>
						<h5>마포구</h5></a> <a href="detail.do?mutual=텐동요츠야"><h3>텐동요츠야</h3>
						<h5>관악구</h5></a>
				</div>
			</div>

			<div class="smallbutnext1" onclick="smallbutnextClick1()">
				<input type="button" />
			</div>
		</div>
		<hr>
		<div class="smalltitle">
			<h1 class="text1">이태리 음식이 땡길땐?</h1>
		</div>
		<div class="smallslide">
			<div class="smallbutprev2">
				<input type="button" onclick="smallbutprevClick2()" />
			</div>
			<div class="smallthema">
				<div class="smallcontainer2">
					<a href="detail.do?mutual=쿠촐로오스테리아"><img
						src="https://mp-seoul-image-production-s3.mangoplate.com/194068/453255_1500349420258_453255_1500349399556_453255_1500349373411_44945"
						onmouseenter="zoomIn(event)" onmouseleave="zoomOut(event)" /></a> <a
						href="detail.do?mutual=다로베"><img
						src="https://mp-seoul-image-production-s3.mangoplate.com/331354/555732_1533224838952_50391"
						onmouseenter="zoomIn(event)" onmouseleave="zoomOut(event)" /></a> <a
						href="detail.do?mutual=티톨로"><img
						src="https://mp-seoul-image-production-s3.mangoplate.com/347965/696785_1607505960339_36918"
						onmouseenter="zoomIn(event)" onmouseleave="zoomOut(event)" /></a> <a
						href="detail.do?mutual=카밀로라자네리아"><img
						src="https://mp-seoul-image-production-s3.mangoplate.com/33537_1507709052817669.jpg"
						onmouseenter="zoomIn(event)" onmouseleave="zoomOut(event)" /></a> <a
						href="detail.do?mutual=파스토"><img
						src="https://mp-seoul-image-production-s3.mangoplate.com/259634_1542766836347534.jpg"
						onmouseenter="zoomIn(event)" onmouseleave="zoomOut(event)" /></a> <a
						href="detail.do?mutual=엘리스리틀이태리"><img
						src="https://mp-seoul-image-production-s3.mangoplate.com/added_restaurants/277947_1460717124430735.jpg"
						onmouseenter="zoomIn(event)" onmouseleave="zoomOut(event)" /></a> <a
						href="detail.do?mutual=톡톡"><img
						src="https://mp-seoul-image-production-s3.mangoplate.com/12873_1435484239422"
						onmouseenter="zoomIn(event)" onmouseleave="zoomOut(event)" /></a> <a
						href="detail.do?mutual=알라프리마"><img
						src="https://mp-seoul-image-production-s3.mangoplate.com/added_restaurants/63176_1468144532794478.jpg"
						onmouseenter="zoomIn(event)" onmouseleave="zoomOut(event)" /></a>
				</div>
				<div class="smallsuv2">
					<a href="detail.do?mutual=쿠촐로오스테리아"><h3>쿠촐로오스테리아</h3>
						<h5>용산구</h5></a> <a href="detail.do?mutual=다로베"><h3>다로베</h3>
						<h5>성동구</h5></a> <a href="detail.do?mutual=티톨로"><h3>티톨로</h3>
						<h5>강남구</h5></a> <a href="detail.do?mutual=카밀로라자네리아"><h3>카밀로라자네리아</h3>
						<h5>마포구</h5></a> <a href="detail.do?mutual=파스토"><h3>파스토</h3>
						<h5>강남구</h5></a> <a href="detail.do?mutual=엘리스리틀이태리"><h3>엘리스리틀이태리</h3>
						<h5>송파구</h5></a> <a href="detail.do?mutual=톡톡"><h3>톡톡</h3>
						<h5>강남구</h5></a> <a href="detail.do?mutual알라프리마="><h3>알라프리마</h3>
						<h5>강남구</h5></a>
				</div>
			</div>
			<div class="smallbutnext2">
				<input type="button" onclick="smallbutnextClick2()" />
			</div>
		</div>
	</section>


	<%@ include file="/mainframe/footer.jsp"%>


</body>
</html>