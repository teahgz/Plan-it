<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>마이페이지</title>
    <link href="<c:url value='/resources/css/member/mypage.css'/>" rel="stylesheet" type="text/css">
</head>
<body>
    <jsp:include page="../include/header.jsp" />
    <jsp:include page="../include/nav.jsp" />

    <div class="container">
        <h1>마이페이지</h1>
        <div class="content-wrapper">
            <div class="section user-info">
                <h2>사용자 정보</h2>
                <p>닉네임: <sec:authentication property="principal.member.user_name" /></p>
            </div>

            <div class="section task-summary">
                <h2>할 일 요약</h2>
                <ul>
                    <li>남은 할 일: <span class="count"><c:out value="${taskCount}" /></span></li>
                    <li>완료한 할 일: <span class="count"><c:out value="${taskEndCount}" /></span></li>
                </ul>
            </div>

            <div class="section categories">
                <h2>카테고리 목록</h2>
				<ul id="categoryList">
					<c:forEach items="${cateList}" var="cate" varStatus="status">
						<li name="cate_name"><span class="category-name">
							<c:out value="${cate.category_name}" /></span>
							<button type="button" class="updateBtn" onclick="updateFrm(this)">수정</button>
							
							<button type="submit" class="deleteBtn" value="${cate.category_no }" onclick="cateDelete(this);">삭제</button>
							<form id="updateForm" style="display: none;">
								<input type="hidden" name="category_no" value="${cate.category_no }"/>
								<input type="text" class="addInput" name="category_name" value="${cate.category_name}" placeholder="수정할 카테고리 이름을 입력하세요" />
								<input type="submit" class="addBtn" value="등록" />
							</form>
						</li>
					</c:forEach>


					<li>
						<form id="cateAddFrm">
							<input type="hidden" name="user_no" value="<sec:authentication property="principal.member.user_no"/>" />
							<input type="text" class="addInput" name="category_name" placeholder="새 카테고리 이름을 입력하세요" />
							<input type="submit" class="addBtn" value="등록" />
						</form>
					</li>
				</ul>
			</div>
        </div>
    </div>

	<script>
    const cateAddFrm = document.getElementById("cateAddFrm");
    
    cateAddFrm.addEventListener('submit',(e)=>{
    	e.preventDefault();
    	
    	let vali_check = false;
    	let vali_text="";
    	
    	if(cateAddFrm.category_name.value == ""){
    		vali_text += "카테고리를 입력하세요.";
    	}else{
    		vali_check = true;
    	}
    	
    	if(vali_check == false){
    		alert(vali_text);
    	}else{

			let object = {};
			const payload = new FormData(cateAddFrm);
			payload.forEach(function(value,key){
				object[key] = value;
			});
			const jsonData = JSON.stringify(object);
			
			fetch('<%=request.getContextPath()%>/category/create',{
				method : 'POST',
				headers : {
					"Content-Type" : "application/json;charset=utf-8",
					"Accept" : "application/json",
					"X-CSRF-TOKEN" : "${_csrf.token}"
				},
				body : jsonData
			})
    		
    		
    		.then(response => response.json())
    		.then(data => {
    			alert(data.res_msg);
    			if(data.res_code == '200'){
    			        location.href=`<%=request.getContextPath()%>/myPage/<sec:authentication property='principal.member.user_no'/>`;
    			}
    		})
    	}
    	
    })
    
function updateFrm(button) {
    const listItem = button.closest('li');
    const categoryNameSpan = listItem.querySelector('.category-name');
    const updateForm = listItem.querySelector('#updateForm');
    const deleteBtn = listItem.querySelector('.deleteBtn'); 

    categoryNameSpan.style.display = 'none';
    button.style.display = 'none';
    deleteBtn.style.display = 'none'; 
    updateForm.style.display = 'block'; 
}
    
    const updateForms = document.querySelectorAll('#updateForm');

    updateForms.forEach(updateForm => {
        updateForm.addEventListener('submit', (e) => {
            e.preventDefault();

            let vali_check = false;
            let vali_text = "";

            if (updateForm.category_name.value === "") {
                vali_text += "카테고리를 입력하세요.";
            } else {
                vali_check = true;
            }

            if (vali_check === false) {
                alert(vali_text);
            } else {
                // FormData를 JSON으로 변환
                const formData = new FormData(updateForm);
                let object = {};
                formData.forEach(function(value, key) {
                    object[key] = value;
                });
                const jsonData = JSON.stringify(object);

                fetch('<%=request.getContextPath()%>/category/update', {
                    method: 'POST',
                    headers: {
                        "Content-Type": "application/json;charset=utf-8",
                        "Accept": "application/json",
                        "X-CSRF-TOKEN" : "${_csrf.token}"
                    },
                    body: jsonData
                })
                .then(response => response.json())
                .then(data => {
                    alert(data.res_msg);
                    if (data.res_code === '200') {
                        location.href = `<%=request.getContextPath()%>/myPage/<sec:authentication property='principal.member.user_no'/>`;
                    }
                })
            }
        });
    });
    
    function cateDelete(button) {
        const categoryNo = button.value;
        
        if (confirm("정말 삭제하시겠습니까?")) {
            fetch('<%=request.getContextPath()%>/category/' + categoryNo, {
                method: 'DELETE',
                headers: {
                    'Content-Type': 'application/json',
                    'X-CSRF-TOKEN': '${_csrf.token}'
                }
            })
            .then(response => response.json())
            .then(data => {
                alert(data.res_msg);
                if (data.res_code === '200') {
                	location.href = `<%=request.getContextPath()%>/myPage/<sec:authentication property='principal.member.user_no'/>`;
                }
            })
        }
    }

    
    </script>
</body>
</html>