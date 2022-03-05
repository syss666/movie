<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
 <%@include file="/movie/link.jsp" %> 
</head>
<body>
<%@page import="vo.*" %>
<%
	movieVO vo= (movieVO)session.getAttribute("vo");
	String id = vo.getId();
%>
<style>
	#aa{
		text-align: center;
		margin:0px;
	}
	.c_1{
	
	line-height:3;
	list-style:none;
   	padding-left:0px;
	position:relative;
	display:block;
	width:100%;
	height:100%;
	}
	.c_2{
	position:relative;		
	display:none;
	list-style:none;
   	padding-left:0px;
   	background-color: rgba(177, 162, 206, 0.432);
	}
	#logo{
	color:white;
	margin:0px;
	}
	#tb1{
		float: left; 
		width: 140px; 
		height: 50px; 
		background-color: black;
		text-align:center;
		margin-right: 50px;
	}

</style>
<div id="topbar">
	
    <div id="tb1">
        <a style="margin:0 auto;" href="/movie/main.jsp"><h1 id ="logo">SGS</h1></a>
    </div>
    <div id="tb2" style="align-items:center; justify-content:center; width: 75%; height: 50px;">
		        <form  id = "s_form" method="get" action="javascript:total_page()" >
 			<input type="text" name="m_name" id = "movie_name" style="margin:5px 5px; width:80%; height: 70%; border-radius : 0.5em 0.5em 0.5em 0.5em ;">
     		<input type="submit" value ="Search" id="searchbtn" class= "btn_group">
		</form>
		    </div>
    <div id="tb3" style=" float: right; width:15%; height: 50px; align-items:center; justify-content:center;">
        <div id = "aa" style="width:49%; height:100%; margin:0px auto;">
			<ul style="width:100%; height:100%; padding:0px; margin:0;">
				<li class="c_1"><a href="#" id="mypage"><%=id +"님"%></a>
                	<ul class="c_2">
                		<li><a href="/movie/mypage/mydata.jsp" >개인 정보 수정</a></li>
                		<li><a href="/moviefav_list.do" >관심 목록</a></li>
                		<li><a href="/movie/mypage/report_errors.jsp" >오류 신고</a></li>
                		<li><a href="/movie/mypage/delete_account.jsp" >회원 탈퇴</a></li>
                	</ul>
                </li>
            </ul>
        </div>
                
                <!-- <a href="/moive/signup.jsp" style="margin: 0px auto;">마이페이지</a> -->
        <div id="bb" style="width:49%; margin:0px;"><a href="/movieLogout.do" style="margin: 0px; width:100%;">로그아웃</a></div>
	</div>
</div>
<form name = "t_form" action="/movie/searchpage.jsp" method="get">
		<input type = "hidden" id= "t" name = "total_pages" value= "">
		<input type = "hidden" id= "m" name = "movie_name" value= "">
	</form>
<script>
var flag=false;
$('.c_1').on('click',function(){
	if(flag==false){
		$('.c_2').css('display','block');
		flag=true;
		
	}
	else{
		$('.c_2').css('display','none');
		flag=false;
	}

});
</script>





</body>
</html>