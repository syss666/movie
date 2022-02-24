<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <%@include file="/movie/link.jsp" %>
</head>

<body>

<div class="mainview">
	<!-- 로고랑 topmenu시작 -->
        <jsp:include page="topmenu.jsp" />]
        <!-- 로고랑 topmenu 끝 -->
        <!-- 회원가입 화면 시작 -->
        <div class="sign_main">
           	<h2 >회원가입</h2>
            <form  action="/movieJoin.do" class="container2">
                <p id="p1">아이디</p> <label class="lab2"><input type="text" placeholder="   사용하실아이디 입력" name="id" id="id" class="account2" ></label>
                <p>비밀번호</p> <label class="lab2"> <input type="password" placeholder="    Password" name="pw" id="password" class="account2" required></label>
               	<p>비밀번호 확인</p> <label class="lab2"> <input type="password" placeholder="    Password" name="pw2" id="password" class="account2" required></label>
                <p>이름</p> <label class="lab2"><input type"text" placeholder="  이름 입력" name="name" class="account2" required></label>
                <p>이메일</p> <label class="lab2"><input type"email" placeholder="  이메일 입력" name="email" class="account2" required></label>
                <p>핸드폰번호</p><label class="lab2"><input type"text" placeholder=" ex)010-xxxx-xxxx" name="phone" class="account2" required></label>
            	<button id="signbt" class="btn_group">회원가입</button>
            </form>
        </div>   
        
        <script>
        function checkId(){
            var id = $('#id').val(); //id값이 "id"인 입력란의 값을 저장
            $.ajax({
                url:"/idcheck.do", //Controller에서 인식할 주소
                type:'post', //POST 방식으로 전달
                data:{id:id}, 
                success:function(a){
                
                },
                error:function(){
                    alert("에러입니다");
                }
            });
            if(session.getAttribute("check")=='0')
            {
            	console.log("aaa");
            	 $(".signbt").prop("disabled", true);
            }
        };
        </script>
        
        
        
        
        <!-- 로그인 화면 끝 -->
        <!-- footer -->
        <footer >

        </footer>
        <!-- footer end -->
        <!-- 회원가입 화면 끝 -->
        <!-- footer -->
        <footer >

        </footer>
        <!-- footer end -->



</div>
</body>
</html>