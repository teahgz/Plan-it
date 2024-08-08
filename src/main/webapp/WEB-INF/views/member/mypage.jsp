<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>마이페이지</title>
    <link href="<c:url value='/resources/css/member/mypage.css' />" rel="stylesheet" type="text/css">
</head>
<body>
    <jsp:include page="../include/header.jsp" />
    <jsp:include page="../include/nav.jsp" />
    
    <div class="container">
        <h1>마이페이지</h1>
        <div class="content-wrapper">
            <div class="section task-summary">
                <h2>할 일 요약</h2>
                <ul>
                    <li>전체 할 일: <span class="count"><c:out value="${taskCount }"/></span></li>
                    <li>완료한 할 일: <span class="count"></span></li>
                    <li>마감 지난 할 일: <span class="count"></span></li>
                </ul>
            </div>
            
            <div class="section user-info">
                <h2>사용자 정보</h2>
                <p>닉네임: <sec:authentication property="principal.member.user_name" /></p>
                <!-- 추가 사용자 정보 -->
            </div>
            
            <div class="section categories">
                <h2>카테고리 목록</h2>
                <ul>
                    <c:forEach items="${categories}" var="category">
                        <li> <span class="count"></span></li>
                    </c:forEach>
                </ul>
            </div>
        </div>
    </div>

</body>
</html>