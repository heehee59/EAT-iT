<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EAT iT - 종류별 맛집 추천</title>
<link rel="shortcut icon" href="https://blog.kakaocdn.net/dn/k3HEx/btqXXkUK7Mn/C3fJjMv7RIoFzVxa3W9MU1/favicon%20%282%29.ico?attach=1&knm=tfile.ico">
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
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
               width = 500;
               height = 280;
               popupX = (window.screen.width/2) - (width/2);
			   popupY = (window.screen.height/2) - (height/2);
               url = "Client/Client_DibsListInsert.jsp?id1=" + id1 + "&mutual1="+ str;                     
               window.open(url,"_blank", "width="+width+", height="+height+",left="+popupX+",top="+popupY);
            }
         }
      }
   </script>
   <script>
   $(document).ready(function(){
 
    var select = $('.select-script select');
    select.change(function(){
        var select_name = $(this).children('option:selected').text();
        $(this).siblings("label").text(select_name);
    });
 
});

   </script>

<%-- 메뉴바 스타일 --%>
<style>

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

.sect1 {
margin-top:260px;
}

.repeat {
   margin-top: 20px;
   align: center;
}

.select-script{position:relative; width:90px; height:25px; line-height:30px; border:1px solid #606976; border-radius:4px; text-transform:uppercase; background:#fff; margin-left: 280px;}
.select-script label{position:absolute; width:90%; font-size:.80em; color:#606976; top:0; left:0; padding:0 5%;}
.select-script label:after{content:'▼'; width:40px; height:25px; position:absolute; top:10; right:0; font-size:.80em; color:#fff; text-align:center; background:#606976;}
.select-script select{width:100%; height:30px; opacity:0; filter:alpha(opacity=0); -ms-filter:alpha(opacity=0)/* IE 8 */;}

.loc {
font-size:12pt;
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
<!--    <script src="http://code.jquery.com/jquery-1.9.1.js"></script> -->


   <%@ include file="../mainframe/header.jsp" %>

   <nav>
      <div class="nav-rec">
         <div class="nav-text">
            <h1 class="location" align="center">종류별 맛집 TOP</h1><br><br>
            <p class="location-sub" align="center">종류별로는 무슨 맛집이 있을까?</p>
         </div>
      </div>
   </nav>




   <section class="sect1">
      <div class="repeat">
         <div class="select-box select-script">
         <form action="Mutual_allinfo_kind.do">
    <label for="selectbox">선택</label>
    <select id="selectbox" title="선택 구분" onChange="window.open(value,'_self');">
        <option class="loc" selected="selected" value="Mutual_allinfo_kind.do?kinds=일식">선택</option>
               <option class="loc" value="Mutual_allinfo_kind.do?kinds=일식">일식</option>
               <option class="loc" value="Mutual_allinfo_kind.do?kinds=양식">양식</option>
               <option class="loc" value="Mutual_allinfo_kind.do?kinds=한식">한식</option>
               <option class="loc" value="Mutual_allinfo_kind.do?kinds=이태리">이태리</option>
               <option class="loc" value="Mutual_allinfo_kind.do?kinds=브런치">브런치</option>
               <option class="loc" value="Mutual_allinfo_kind.do?kinds=기타">기타</option>
               
               
    </select>
    </form>
</div>
         <form action="#">
            <c:forEach var="i" items="${alist2}">
               <table>
                  <tr>
                     <td rowspan=5><a href="detail.do?mutual=${i.mutual}"><img src="${i.firstimg}"
                        style="width: 300px; height: 250px; padding: 35px;"></a></td>
                     <td class="sangho">상호명: ${i.mutual}</td>

                  </tr>
                  <tr>
                     <td>종류: ${i.kinds}</td>
                  </tr>
                  <tr>
                     <td class="juso">주소: ${i.address}</td>
                  </tr>
                  <tr>
                     <td>소개: ${i.introduce}</td>
                  </tr>
                  <tr>
                     <td><input type="hidden" value='${i.mutual}' name="mutual1"></td>
                     <td><input type="button" value="찜" class="button1"
                        onclick="Button1_Click('${i.mutual}')" /></td>
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