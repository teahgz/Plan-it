<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인페이지</title>
<link href="<c:url value='/resources/css/task/task.css' />" rel="stylesheet" type="text/css">
</head>
<body>
	<jsp:include page="include/header.jsp"/>
	<jsp:include page="include/nav.jsp"/>
	<section>
		<sec:authorize access="isAnonymous()">
	     	<h1>Plan_!t에 오신 것을 환영합니다</h1>
	        <p>효율적인 일정 관리를 위한 최고의 도구, Plan_!t를 시작해보세요.</p>
	        <ul>
		         <li>간편한 작업 관리</li>
		         <li>우선순위 설정</li>
		         <li>카테고리 설정</li>
	        </ul>
	        <a href="<c:url value='/join'/>" class="joinBtn">지금 시작하기</a>
	    </sec:authorize>
			
	   <sec:authorize access="isAuthenticated()">
	   		<p><sec:authentication property="principal.member.user_name"/>님 환영합니다!</p>
	   		<p><a href="<c:url value='/task'/>" class="taskLink">할 일 목록 보러 가기</a></p>
	   </sec:authorize>
	</section>

</body>
</html>