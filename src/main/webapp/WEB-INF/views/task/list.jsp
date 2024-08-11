<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Plan !t</title>
<link href="<c:url value='/resources/css/task/list.css' />" rel="stylesheet" type="text/css">
</head>
<body>
	<jsp:include page="../include/header.jsp" />
	<jsp:include page="../include/nav.jsp" />

	<div id="section_wrap">
		<div class="word">
			<h3>
				<sec:authentication property="principal.member.user_name" />
				님의 할 일
			</h3>
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
						<th>관리</th>
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${empty resultList}">
							<tr>
								<td colspan="7">할 일이 없습니다.</td>
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach items="${resultList}" var="t">
								<tr>
									<td><input type="checkbox" onchange="toggleStrikethrough(this)" /></td>
									<td><c:out value="${t.category_name}" /></td>
									<td><c:out value="${t.task_title}" /></td>
									<td><fmt:formatDate pattern="yy-MM-dd" value="${t.start_date}" /></td>
									<td><fmt:formatDate pattern="yy-MM-dd" value="${t.end_date}" /></td>
									<td><a href="/taskUpdatePage/${t.task_no }">수정</a>
										<button value="${t.task_no }" onclick="deleteTask(this)">삭제</button>
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

<script>
function deleteTask(button) {
    const taskNo = button.value;
    if (confirm("정말 삭제하시겠습니까?")) {
        fetch('<%=request.getContextPath()%>/task/' + taskNo, {
            method: 'DELETE',
            headers: {
                'Content-Type': 'application/json', 
                'X-CSRF-TOKEN': '${_csrf.token}'
            }
        })
        .then(response => response.json())
        .then(data => {
            alert(data.res_msg);
            if (data.res_code == '200') {
                location.href = `<%=request.getContextPath()%>/task/<sec:authentication property='principal.member.user_no'/>`;
            }
        })
    }
}

function toggleStrikethrough(checkbox) {
    const row = checkbox.closest('tr');
    const cells = row.getElementsByTagName('td');
    for (let i = 1; i < cells.length - 1; i++) {  
        cells[i].style.textDecoration = checkbox.checked ? 'line-through' : 'none';
    }
}

document.addEventListener('DOMContentLoaded', function() {
    const checkboxes = document.querySelectorAll('input[type="checkbox"]');
    checkboxes.forEach(checkbox => {
        checkbox.addEventListener('change', function() {
            toggleStrikethrough(this);
        });
    });
});
</script>
</body>
</html>