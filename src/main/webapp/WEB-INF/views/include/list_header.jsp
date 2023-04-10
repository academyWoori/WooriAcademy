<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<style type="text/css">
#list_header1{
	width:25%;
	height:40px;
	float:left;
	text-align:center;
}

#list_header2{
	width:25%;
	height:40px;
	float:left;
	text-align:center;
}

#list_header3{
	width:25%;
	height:40px;
	float:left;
	text-align:center;
}

#list_header4{
	width:25%;
	height:40px;
	float:left;
	text-align:center;
}

</style>
<body>
	<div style="margin:auto">
			<div id="list_header1">
				<a href="${contextPath}/board/list" class="nav-item nav-link">공지사항</a>
			</div>
			<div id="list_header2">
				<a href="${contextPath}/board/list_pop" class="nav-item nav-link">인기게시판</a>
			</div>
			<div id="list_header3">
		        <a href="${contextPath}/board/list_main" class="nav-item nav-link">메인게시판</a>
		    </div>
			<div id="list_header4">
		        <a href="${contextPath}/board/list_free" class="nav-item nav-link">자유게시판</a>
		    </div>
		</div>

</body>
</html>
