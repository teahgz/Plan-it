<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Plan !t</title>
 <link href="/resources/css/task/add.css" rel="stylesheet" type="text/css">
</head>
<body>
    <jsp:include page="../include/header.jsp"/>
    <jsp:include page="../include/nav.jsp"/>

    <div id="add_task_wrap">
        <h2>할 일 추가</h2>
        <form id="taskAddFrm">
            <div class="form_group">
                <label for="task_title">할 일</label>
                <input type="text" id="task_title" name="task_title" required>
            </div>

            <div class="form_group">
                <label for="start_date">시작일</label>
                <input type="datetime-local" id="start_date" name="start_date" required>
            </div>

            <div class="form_group">
                <label for="end_date">마감일</label>
                <input type="datetime-local" id="end_date" name="end_date" required>
            </div>

			<div class="form_group">
				<label for="category_no">카테고리</label> <select id="category_no"
					name="category_no" required>
					<c:forEach items="${categoryList}" var="cate">
						<option value="${cate.category_no}"><c:out value="${cate.category_name}" /></option>
					</c:forEach>
				</select>
			</div>

			<div class="form_group">
                <button type="submit">할 일 추가</button>
            </div>
        </form>
    </div>
    
    <script>
    	const form = document.getElementById("taskAddFrm");
    	form.addEventListener('submit', (e) => {
    		e.preventDefault();
    		
    		let vali_check = false;
    		let vali_text = "";
    		if(form.task_title.value == ""){
    			vali_text += '할일을 입력하세요.';
    			form.task_title.focus();
    		} else {
    			vali_check = true;
    		}
    		
    		if(vali_check == false){
    			alert(vali_text);
    		} else{
    			let object = {};
    			const payload = new FormData(form);
    			payload.forEach(function(value, key){
    				object[key] = value;
    			});
    			
    			const jsonData = JSON.stringify(object);
    			
    			fetch('<%=request.getContextPath()%>/task/add/<sec:authentication property='principal.member.user_no'/>',{
    				method : 'POST',
    				headers : {
    					 "Content-Type": "application/json;charset=utf-8",
                         "Accept": "application/json",
                         "X-CSRF-TOKEN": "${_csrf.token}"
                     },
                     body: jsonData
    			})
    			.then(response => response.json())
    			.then(data => {
    				alert(data.res_msg);
                    if (data.res_code == '200') {
                    	location.href = `<%=request.getContextPath()%>/task/<sec:authentication property='principal.member.user_no'/>`;
                    }
    			});
    		}
    	});
    </script>
</body>
</html>
