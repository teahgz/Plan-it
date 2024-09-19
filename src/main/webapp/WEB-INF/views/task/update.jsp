<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Plan !t</title>
<link href="/resources/css/task/update.css" rel="stylesheet" type="text/css">
</head>
<body>
    <jsp:include page="../include/header.jsp"/>
    <jsp:include page="../include/nav.jsp"/>

    <div id="update_task_wrap">
        <h2>할 일 수정</h2>
        <form id="taskUpdateFrm">
            <input type="hidden" id="csrf_token" value="${_csrf.token}" name="_csrf" />
            <input type="hidden" id="task_no" value="${task.task_no}" name="task_no" />
            <div class="form_group">
                <label for="task_title">할 일</label>
                <input type="text" id="task_title" name="task_title" value="${task.task_title}" required>
            </div>

            <!-- 날짜 필드 -->
            <div class="form_group">
                <label for="start_date">시작일</label>
                <input type="datetime-local" id="start_date" name="start_date" value="${task.end_date}" required>
            </div>

            <div class="form_group">
                <label for="end_date">마감일</label>
                <input type="datetime-local" id="end_date" name="end_date" value="${task.start_date}" required>
            </div>

            <div class="form_group">
                <label for="category_no">카테고리</label>
                <select id="category_no" name="category_no" required>
                    <c:forEach items="${categoryList}" var="cate">
                        <option value="${cate.category_no}" <c:if test="${cate.category_no == task.category_no}">selected</c:if> >
                            <c:out value="${cate.category_name}" />
                        </option>
                    </c:forEach>
                </select>
            </div>

            <div class="form_group">
                <button type="submit">수정</button>
            </div>
        </form>
    </div>

<script>
const form = document.getElementById("taskUpdateFrm");
form.addEventListener('submit', (e) => {
    e.preventDefault();
    
    const taskNo = document.getElementById('task_no').value;
    const contextPath = '<%=request.getContextPath()%>';
    
    let vali_check = false;
    let vali_text = "";
    if(form.task_title.value === ""){
        vali_text += '할일을 입력하세요.';
        form.task_title.focus();
    } else {
        vali_check = true;
    }
    
    if(!vali_check){
        alert(vali_text);
    } else {
        let object = {};
        const payload = new FormData(form);
        payload.forEach(function(value, key) {
            object[key] = value;
        });
        
        const jsonData = JSON.stringify(object);
        
        fetch(`${contextPath}/task/update/`+taskNo, {
            method: 'POST',
            headers: {
                "Content-Type": "application/json;charset=utf-8",
                "Accept": "application/json",
                "X-CSRF-TOKEN": document.getElementById('csrf_token').value
            },
            body: jsonData
        })
        .then(response => response.json())
        .then(data => {
            alert(data.res_msg);
            if (data.res_code === '200') {
            	location.href = `<%=request.getContextPath()%>/task/<sec:authentication property='principal.member.user_no'/>`;
            }
        })
        .catch(error => {
            console.error('Error:', error);
            alert('서버 오류가 발생했습니다.');
        });
    }
});
</script>

</body>
</html>
