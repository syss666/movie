<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
 <%@include file="/movie/link.jsp" %>
<body>
	<%
		String MSG =(String)request.getAttribute("MSG");
		if(MSG==null)
			MSG="";
	%>	
	<script>
		var msg="<%=MSG%>";
		if(msg!="")
			alert(msg);	
	</script>
<div class="mainview">
        <!-- 로고랑 topmenu-->
        <jsp:include page="topmenu.jsp" />
        <!-- 로고랑 topmenu 끝 -->
        <!-- 로그인 화면 시작 -->
        <form method="post" action="/movieLogin.do" class="log_main">
            <img src="/movie/img/user-solid.svg" style="width: 70px; height: 70px; margin-bottom:50px;">
            <div class="container">
                <input type="text" placeholder=" ID" name="id" id="id" class="account" required  >
                <input type="password" placeholder="    Password" name="pw" id="password" class="account" required >
                <button id = "sign" class="account btn_group" >login</button>
            </div>
            <br>
            <h4>혹시 회원이 아니신가요? <br> <a href="/movie/signup.jsp">이곳</a>을 눌러 회원가입을 해주세요</h4>
        </form>   
        
        <!-- 로그인 화면 끝 -->
        <!-- footer -->     
        <jsp:include page="/movie/footer.jsp" />
        <!-- footer -->  
    </div>
</body>
</html>