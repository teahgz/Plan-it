<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="<c:url value='/resources/css/task/list.css' />" rel="stylesheet" type="text/css">
</head>
<body>
	<jsp:include page="../include/header.jsp"/>
	<jsp:include page="../include/nav.jsp"/>
<div id="section_wrap">
			<div class="word">
				<h3>to do List</h3>
			</div>
			<div class="task_list">
				<table>
					<colgroup>
						<col width="10%">
						<col width="40%">
						<col width="20%">
						<col width="20%">
						<col width="10%">
					</colgroup>
					<thead>
						<tr>
							<th>번호</th>
							<th><sec:authentication property="principal.member.user_name"/>님의 할 일</th>
							<th>시작일</th>
							<th>마감일</th>
							<th>상태</th>
						</tr>
					</thead>
					<tbody>
						<c:choose>
							<c:when test="${empty resultList }">
								<tr>
									<td colspan="5">할 일이 없습니다.</td>
								</tr>
							</c:when>
							<c:otherwise>
								<c:forEach items="${resultList }" var="t" varStatus="status">
									<tr>
										<td><c:out value="${status.count}"/></td>
										<td><c:out value="${t.task_title }"/></td>						
										<td>
   										  <fmt:formatDate pattern="yy-MM-dd" value="${t.start_date }"/>
										</td>
										<td>
											<fmt:formatDate pattern="yy-MM-dd" value="${t.end_date }"/>
										</td>						
										<td><c:out value="${t.status }"/></td>
									</tr>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</tbody>
				</table>
			</div>
		</div>
</body>
</html>