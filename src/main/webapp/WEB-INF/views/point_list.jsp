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

#list_wrap{
	width:100%;
	height:700px;
	margin:auto; /*가운데 정렬*/
}

#list_box1{
	width:12%;
	height:700px;
	float:left;
}
#list_box2{
	width:80%;
	height:800px;
	float:left;

}
#list_box3{
	width:10%;
	height:700px;
	background-color:red;
	float:left;
}

</style>


<script>
function fn_prev(page, range, rangeSize) {      
	   var page = ((range - 2) * rangeSize) + 1;      
	   var range = range - 1;      
	   //var upId = document.getElementById("hidden_upId").value;
	   var url = "${contextPath}/board/point_list";      
	   url = url + "?page=" + page;      
	   url = url + "&range=" + range;            
	   location.href = url;   
	}  

	//페이지 번호 클릭   
	function fn_pagination(page, range, rangeSize, searchType, keyword) {   
	   //var upId = document.getElementById("hidden_upId").value;
	   var url = "${contextPath}/board/point_list";         
	   url = url + "?page=" + page;      
	   url = url + "&range=" + range;      
	   location.href = url;      
	}   

	//다음 버튼 이벤트   
	function fn_next(page, range, rangeSize) {      
	   var page = parseInt((range * rangeSize)) + 1;      
	   var range = parseInt(range) + 1;      
	   //var upId = document.getElementById("hidden_upId").value;
	   var url = "${contextPath}/board/point_list";         
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
    <div class="container-fluid py-5" >
            <div class="section-title text-center position-relative pb-3 mb-5 mx-auto" style="max-width:500px;text-align:left;" >
                <h1 class="mb-0">포인트 전환</h1>
            </div>
   </div>
<!-- title end-->


<div id="list_wrap">
	<div id="list_box1"></div>
	<div id="list_box2">
			

    <!-- Main content --><br>
    <section class="content container-fluid">
		<div class="table-responsive">
		  <table class="table" style="text-align:center">

			<tr>
				<td><h6>신청번호</h6></td>
				<td><h6>상품명</h6></td>				
				<td><h6>수신자</h6></td>
				<td><h6>발송휴대전화</h6></td>
				<td><h6>신청일</h6></td>		
				<td><h6>신청자</h6></td>
				<td><h6>신청상태</h6></td>
			</tr>
			
			<c:forEach var="board" items="${point_list}">
				<tr>
				  <td>${board.p_num} 	 </td>
				  <td>${board.p_cd_name} </td>		          
		          <td>${board.p_name}    </td>
		          <td>${board.p_tel}    </td>
		          <td>${board.p_date}  	 </td>		          
		          <td>${board.m_ename}   </td>
		          <td>${board.p_condition}</td>
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

</div>


</body>

<%@ include file="include/footer.jsp" %>
</html>