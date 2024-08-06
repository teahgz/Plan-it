<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html> 
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link href="<c:url value='/resources/css/member/login.css' />" rel="stylesheet" type="text/css">
</head>
<body>
    <%@ include file="../include/header.jsp" %>
    <%@ include file="../include/nav.jsp" %>
    <section>
        <div id="section_wrap">
            <div class="word">
                <h3>로그인</h3>
            </div>
            <div class="login_form">
                <form action='/user/loginEnd' name="login_form" method="post">
                    <div class="form-group">
                        <input type="text" name="user_id" placeholder="아이디"> 
                        <input type="password" name="user_pw" placeholder="비밀번호"> 
                    </div>
                    <div class="button-group">
                        <input type="button" value="로그인" onclick="loginForm();">
                    </div>
                </form>
            </div>
            <div class="find_id_password">
                <a href="#">아이디 찾기</a>
                <a href="#">비밀번호 찾기</a>
            </div>
        </div>
    </section>        
    <script type="text/javascript">
        function loginForm() {
            let form = document.login_form;
            if (form.user_id.value == '') {
                alert('아이디를 입력하세요.');
                form.user_id.focus();    
            } else if (form.user_pw.value == '') {
                alert('비밀번호를 입력하세요.');
                form.user_pw.focus();
            } else {
                form.submit();
            }
        }
    </script>
</body>
</html>
