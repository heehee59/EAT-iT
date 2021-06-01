<%@page import="DB_DAO.DAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<% 
	String id1= request.getParameter("id1");
	String mutual1 = request.getParameter("mutual1");
/* 	String likes1 = "1"; */
	DAO dao1 = new DAO();
	boolean overlapcheck = dao1.Client_OverlapCheck(id1, mutual1);
	boolean check = false;
	if(!overlapcheck){
		check = dao1.Client_DibsListInsert(id1, mutual1);	
	}
%>

<html>
<head>
<meta charset="UTF-8">
<title>EAT iT - ★내꺼 찜★</title>
<link rel="shortcut icon" href="https://blog.kakaocdn.net/dn/k3HEx/btqXXkUK7Mn/C3fJjMv7RIoFzVxa3W9MU1/favicon%20%282%29.ico?attach=1&knm=tfile.ico">
<style>
	.logo {
	   background-image: url(https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FQvMBl%2FbtqWU73BhKO%2F5wu0ncSqNIH9pLpQ6A4Pm1%2Fimg.png);
	   background-size: cover;
	   cursor: pointer;
	   width:100px;
	   height:50px;
	}

	table{
		width:100%;
		height:100%;
		text-align: center;
		margin: auto;
		border:3px solid #3450b4;
	}
	th, td {
    padding: 18px;
  	}
	.title{
		margin-bottom: 19px;
	    font-size: 30px;
	    line-height: 1;
	    font-weight: 900;
	    text-align: center;
	}
	.button{
		width:100px;    	
 	    background-color: #3450b4;
 	    color:#fff;
	    padding: 15px 0;
   		text-align: center;
    	display: inline-block;
    	font-size: 12px;
    	margin: 10px;
		border-radius:10px;
    	cursor: pointer;
	}

</style>


</head>
<body>
	<table>
	<tr>
		<td>
			<a onClick ="window.close();">
			<div class="logo"></div>
			 </a>
		</td>
	</tr>
	<tr>
		<td class="title">
			<% 
				if(check){
					out.println("찜목록에 넣었습니다.");
				}else{
					out.println("찜목록에 이미 들어있습니다.");					
				}
			%>
		</td>
	</tr>
	<tr>
		<td>
			<input type="submit" class="button" value="찜목록확인하기" 
			onClick ="window.close (),parent.opener.location='../ClientDibsListView.do';">
			<input type="button" class="button" value="닫기" onClick ="window.close ()">
		</td>
	</tr>

	</table>
</body>
</html>