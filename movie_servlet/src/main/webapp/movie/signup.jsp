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
        <jsp:include page="topmenu.jsp" />
        <!-- 로고랑 topmenu 끝 -->
        <!-- 회원가입 화면 시작 -->
        <div class="sign_main">
           	<h2 >회원가입</h2>
            <form  action="/movieJoin.do" class="container2">
                <p id="p1">아이디</p> <label class="lab2"><input type="text" placeholder="   사용하실아이디 입력" name="id" id="id" class="account2"  oninput="checkId()" required></label>
                <p>비밀번호</p> <label class="lab2"> <input type="password" placeholder="    Password" name="pw" id="password" class="account2" required oninput="checkPw()"></label>
               	<p>비밀번호 확인</p> <label class="lab2"> <input type="password" placeholder="    Password" name="pw2" id="password2" class="account2" required oninput="checkPw()"></label>
                <p>이름</p> <label class="lab2"><input type"text" placeholder="  이름 입력" name="name" class="account2" required></label>
                <p>이메일</p> <label class="lab2"><input type"email" placeholder="  이메일 입력" name="email" class="account2" required></label>
                <p>핸드폰번호</p><label class="lab2"><input type"text" placeholder=" ex)010-xxxx-xxxx" name="phone" class="account2" required></label>
            	<button id="signbt" class="a" disabled="disabled">회원가입</button>
            </form>
        </div>   
        
        <script>
        var idcheck=0;
       
        function checkId(){ //아이디 중복 체크 함수
            var id = $('#id').val(); //id값이 "id"인 입력란의 값을 저장
            $.ajax({
                url:"/idcheck.do", //Controller에서 인식할 주소
                type:'post', //POST 방식으로 전달
                data:{id:id}, 
                success:function(a){
                	if(a ==0)//아이디 중복 아닐때
                	{
                		$('#signbt').prop("disabled", false);
                		$('#id').css("background-color","white" );
                		//$('#id').prop("oninput", "사용가능한 아이디입니다.");
                		idcheck = 1;
                		
                	}
                	else//아이디 중복일때 
                	{
                		$('#signbt').prop("disabled", true);
                		$('#id').css("background-color","#FFCECE" );
                		idcheck=0;
                	}
                }
            });
        };
        function checkPw(){ // 패스워드 일치 확인 함수
        	var id1 = $('#password').val();
        	var id2 = $('#password2').val();
        	
        	if( id1==id2)//비번 일치할때 
        	{
        		if(idcheck ==1)
        		{
        			$('#signbt').prop("disabled", false);	
        		}
        		$('#password2').css("background-color","white" );
        	}
        	else // 비번 일치 안할때
        	{
        		$('#signbt').prop("disabled", true);
        		$('#password2').css("background-color","#FFCECE" );
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