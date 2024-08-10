<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>To-Do List</title>
<link href="<c:url value='/resources/css/task/list.css' />" rel="stylesheet" type="text/css">
</head>
<body>
    <jsp:include page="../include/header.jsp"/>
    <jsp:include page="../include/nav.jsp"/>

    <div id="section_wrap">
        <div class="word">
            <h3><sec:authentication property="principal.member.user_name"/>님의 할 일</h3>
        </div>

        <div class="task_list">
            <table>
                <thead>
                    <tr>
                        <th></th> 
                        <th>카테고리</th>
                        <th>할 일</th>
                        <th>시작일</th>
                        <th>마감일</th>
                        <th>상태</th>
                    </tr>
                </thead>
                <tbody>
                    <c:choose>
                        <c:when test="${empty resultList}">
                            <tr>
                                <td colspan="5">할 일이 없습니다.</td>
                            </tr>
                        </c:when>
                        <c:otherwise>
                            <c:forEach items="${resultList}" var="t">
                                <tr>
                                    <td><input type="checkbox" /></td> 
                                    <td><c:out value="${t.category_name}"/></td>                        
                                    <td><c:out value="${t.task_title}"/></td>                        
                                    <td><fmt:formatDate pattern="yy-MM-dd" value="${t.start_date}"/></td>
                                    <td><fmt:formatDate pattern="yy-MM-dd" value="${t.end_date}"/></td>                        
                                    <td>
									    <c:choose>
									        <c:when test="${t.status == 1}">
									            대기
									        </c:when>
									        <c:when test="${t.status == 2}">
									            진행중
									        </c:when>
									        <c:when test="${t.status == 3}">
									            완료
									        </c:when>
									    </c:choose>
									</td>
                                </tr>
                            </c:forEach>
                        </c:otherwise>
                    </c:choose>
                </tbody>
            </table>
            <a href="/taskAddPage/<sec:authentication property="principal.member.user_no"/>" class="add_new">새로운 할 일을 추가하세요!</a> 
        </div>
    </div>
</body>
</html>
