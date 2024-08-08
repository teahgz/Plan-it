<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
    <link href="<c:url value='/resources/css/include/nav.css'/>" rel="stylesheet" type="text/css">
</head>
<body>
    <nav>
        <ul>
        	<sec:authorize access="isAnonymous()">
	            <li class="btn"><a href="<c:url value='/loginPage'/>">로그인</a></li>
	            <li class="btn"><a href="<c:url value='/join'/>">회원가입</a></li>
        	</sec:authorize>
            
            <sec:authorize access="isAuthenticated()">
	            <li class="btn"><a href="<c:url value='/myPage/'/>" class="mypageLink" data_user_no="<sec:authentication property='principal.member.user_no'/>">
	            <sec:authentication property="principal.member.user_name"/>님의 마이페이지</a></li>
	            <li class="btn">
	                <form method="post" action="<c:url value='/logout'/>">
	                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> 
	                    <input type="submit" value="로그아웃">
	                </form>
	            </li>
            </sec:authorize>
        </ul>
    </nav>
    
    <script>
    	document.querySelector('.mypageLink').addEventListener('click',function(e){
    		e.preventDefault();
			const userNo = this.getAttribute('data_user_no');
			const href = this.getAttribute('href') + userNo;
			window.location.href = href;
    		
    	});
    </script>
</body>
</html>
