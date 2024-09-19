<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Plan !t</title>
<link href="<c:url value='/resources/css/task/list.css' />" rel="stylesheet" type="text/css">
 <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
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
                                <td colspan="6">할 일이 없습니다.</td>
                            </tr>
                        </c:when>
                        <c:otherwise>
                            <c:forEach items="${resultList}" var="t">
                                <tr>
                                    <td>
                                        <input type="checkbox" onchange="updateTaskStatus(${t.task_no}, this.checked ? 3 : 2)"
                                        <c:if test="${t.status == 3}">checked</c:if> />
                                    </td>
                                    <td><c:out value="${t.category_name}" /></td>
                                    <td><c:out value="${t.task_title}" /></td>
                                    <td>
                                        <fmt:parseDate value="${t.start_date}" pattern="yyyy-MM-dd'T'HH:mm" var="startDate"/>
                                        <fmt:formatDate value="${startDate}" pattern="yyyy-MM-dd HH:mm" />
                                    </td>
                                    <td>
                                        <fmt:parseDate value="${t.end_date}" pattern="yyyy-MM-dd'T'HH:mm" var="endDate"/>
                                        <fmt:formatDate value="${endDate}" pattern="yyyy-MM-dd HH:mm" />
                                    </td>
                                    <td>
                                        <a href="/taskUpdatePage/${t.task_no }">수정</a>
                                        <button data-task-no="${t.task_no }" onclick="deleteTask(this)">삭제</button>
                                    </td>
                                </tr>
                            </c:forEach>
                        </c:otherwise>
                    </c:choose>
                </tbody>
            </table>
            <a href="/taskAddPage/<sec:authentication property='principal.member.user_no'/>" class="add_new">새로운 할 일을 추가하세요!</a>
        </div>
    </div>

<script>
function updateTaskStatus(taskNo, newStatus) {
    fetch('<%=request.getContextPath()%>/task/status/' + taskNo, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
            'X-CSRF-TOKEN': '${_csrf.token}'
        },
        body: JSON.stringify({ status: newStatus })
    })
    .then(response => response.json())
    .then(data => {
        if (data.res_code === '200') {
            alert(data.res_msg);
            const checkbox = document.querySelector(`input[type="checkbox"][onchange*="updateTaskStatus(${taskNo},"]`);
            if (checkbox) {
                checkbox.checked = newStatus === 3;
            }
        } else {
            alert('상태 업데이트에 실패했습니다: ' + data.res_msg);
            const checkbox = document.querySelector(`input[type="checkbox"][onchange*="updateTaskStatus(${taskNo},"]`);
            if (checkbox) {
                checkbox.checked = !checkbox.checked;
            }
        }
    });
}

function deleteTask(button) {
    const taskNo = button.getAttribute('data-task-no');
    
    Swal.fire({
        text: '삭제하시겠습니까?',
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#EEB3B3',
        cancelButtonColor: '#C0C0C0',
        confirmButtonText: '삭제',
        cancelButtonText: '취소'
    }).then((result) => {
        if (result.isConfirmed) {
            fetch('<%=request.getContextPath()%>/task/' + taskNo, {
                method: 'DELETE',
                headers: {
                    'Content-Type': 'application/json',
                    'X-CSRF-TOKEN': '${_csrf.token}'
                }
            })
            .then(response => response.json())
            .then(data => {
                if (data.res_code == '200') {
                    Swal.fire({
                        icon: 'success',
                        text: data.res_msg,
                        confirmButtonColor: '#B1C2DD',
                        confirmButtonText: "확인"
                    }).then(() => {
                        location.href = `<%=request.getContextPath()%>/task/<sec:authentication property='principal.member.user_no'/>`;
                    });
                } else {
                    Swal.fire({
                        icon: 'error',
                        text: data.res_msg,
                        confirmButtonColor: '#B1C2DD',
                        confirmButtonText: "확인"
                    });
                }
            });
        }
    });
}
</script>
</body>
</html>
