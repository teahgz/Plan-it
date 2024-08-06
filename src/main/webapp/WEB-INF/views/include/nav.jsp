<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <link href="<c:url value='/resources/css/include/nav.css'/>" rel="stylesheet" type="text/css">
</head>
<body>
    <nav>
        <ul>
            <li class="btn"><a href="<c:url value='/loginPage'/>">로그인</a></li>
            <li class="btn"><a href="<c:url value='/join'/>">회원가입</a></li>
            <li class="btn">
                <form method="post" action="<c:url value='/logout'/>">
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> 
                    <input type="submit" value="로그아웃">
                </form>
            </li>
        </ul>
    </nav>
</body>
</html>
