<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<%@ page session="true" %>
<%@ include file="include/head.jsp" %>
<%@ include file="include/header.jsp" %>
<%@ include file="include/plug_in.jsp" %>


<!DOCTYPE html>
<!--
This is a starter template page. Use this page to start your new project from
scratch. This page gets rid of all links and provides the needed markup only.
-->
<html>
<style>

#member_wrap{
	width:100%;
	height:700px;
	margin:auto; /*가운데 정렬*/
}

#member_box1{
	width:13%;
	height:700px;
	float:left;
}
#member_box2{
	width:80%;
	height:700px;
	float:left;
}
#member_box3{
	width:10%;
	height:700px;
	float:left;
}
</style>

<script>
function fn_prev(page, range, rangeSize) {      
	   var page = ((range - 2) * rangeSize) + 1;      
	   var range = range - 1;      
	   //var upId = document.getElementById("hidden_upId").value;
	   var url = "${contextPath}/board/Management";      
	   url = url + "?page=" + page;      
	   url = url + "&range=" + range;            
	   location.href = url;   
	}  

	//페이지 번호 클릭   
	function fn_pagination(page, range, rangeSize, searchType, keyword) {   
	   //var upId = document.getElementById("hidden_upId").value;
	   var url = "${contextPath}/board/Management";         
	   url = url + "?page=" + page;      
	   url = url + "&range=" + range;      
	   location.href = url;      
	}   

	//다음 버튼 이벤트   
	function fn_next(page, range, rangeSize) {      
	   var page = parseInt((range * rangeSize)) + 1;      
	   var range = parseInt(range) + 1;      
	   //var upId = document.getElementById("hidden_upId").value;
	   var url = "${contextPath}/board/Management";         
	   url = url + "?page=" + page;      
	   url = url + "&range=" + range;            
	   location.href = url;   
	}
</script>


<!--
BODY TAG OPTIONS:
=================
Apply one or more of the following classes to get the
desired effect
|---------------------------------------------------------|
| SKINS         | skin-blue                               |
|               | skin-black                              |
|               | skin-purple                             |
|               | skin-yellow                             |
|               | skin-red                                |
|               | skin-green                              |
|---------------------------------------------------------|
|LAYOUT OPTIONS | fixed                                   |
|               | layout-boxed                            |
|               | layout-top-nav                          |
|               | sidebar-collapse                        |
|               | sidebar-mini                            |
|---------------------------------------------------------|
-->
<body>
<div>
<!-- title Start -->
   <div class="container-fluid bg-primary py-5 bg-header" >
         <div class="col-2 pt-lg-2 mt-lg-2 text-center">       
          </div>
   </div>
    <div class="container-fluid py-5 wow fadeInUp" data-wow-delay="0.1s" >
            <div class="section-title text-center position-relative pb-3 mb-5 mx-auto" style="max-width:500px;text-align:left;" >
                <h1 class="mb-0">전체회원 조회</h1>
            </div>
   </div>
<!-- title end-->

<div id="member_wrap">
<div id="member_box1"></div>
  <div id="member_box2">
    <!-- Main content --><br>
    <section class="content container-fluid">
		<div class="table-responsive">
		  <table class="table">

			<tr>
				<td>아이디</td>
				<td>이름</td>
				<td>닉네임</td>
				<td>전화번호</td>
				<td>이메일</td>
				<td>자세히보기</td>
			</tr>
			
			<c:forEach var="Management" items="${Management}">
				<tr>
		          <td><a href="management_detail?m_id=${Management.m_id}">${Management.m_id}</a></td>
		          <td>${Management.m_name}</td>
		          <td>${Management.m_ename}</td>
		          <td>${Management.m_tel}</td>
		          <td>${Management.m_email}</td>
		          <td>${Management.m_ste}</td>
		          
		          <!-- 마이페이지로 이동 링크
		          <td><a href="detail?BD_NUM=${tb_membership.M_ID}"> 회원정보 </a></td>
		           -->      
	          </tr>
      		</c:forEach>
      		
		  </table>
		</div>
		
		<!-- pagination{s} -->
			<div id="paginationBox">      
          <ul class="pagination">         
           <c:if test="${pagination.prev}">            
              <li class="page-item">
                 <a class="page-link" href="#" onClick="fn_prev('${pagination.page}', '${pagination.range}', '${pagination.rangeSize}')">Previous</a>
              </li>         
           </c:if>                     
           <c:forEach begin="${pagination.startPage}" end="${pagination.endPage}" var="idx">            
              <li class="page-item <c:out value="${pagination.page == idx ? 'active' : ''}"/> ">
                 <a class="page-link" href="#" onClick="fn_pagination('${idx}', '${pagination.range}', '${pagination.rangeSize}')"> ${idx} </a>
              </li>         
           </c:forEach>                     
           <c:if test="${pagination.next}">            
              <li class="page-item">
                 <a class="page-link" href="#" onClick="fn_next('${pagination.range}', '${pagination.range}', '${pagination.rangeSize}')" >Next</a>
              </li>         
           </c:if>      
          </ul>   
         </div>     
        <!-- pagination{e} -->
        
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
</div>


</body>

<%@ include file="include/footer.jsp" %>
</html>