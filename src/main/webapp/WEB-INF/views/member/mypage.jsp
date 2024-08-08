<!-- mypage.jsp -->
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
                        <li><c:out value="${cate.category_name}" /></li>
                    </c:forEach>
                    <li>
                        <form id="cateAddFrm">
                        	<input type="hidden" name="user_no" value="<sec:authentication property="principal.member.user_no"/>"/>
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
    		val_text += "카테고리를 입력하세요.";
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
			
			fetch('<%=request.getContextPath()%>/cateAdd',{
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
    </script>
</body>
</html>