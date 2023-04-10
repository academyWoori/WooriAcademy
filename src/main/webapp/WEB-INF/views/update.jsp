<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%@ page session="true" %>
<%@ include file="include/head.jsp" %>
<%@ include file="include/header.jsp" %>


<!DOCTYPE html>
<!--
This is a starter template page. Use this page to start your new project from
scratch. This page gets rid of all links and provides the needed markup only.
-->


<html>

<style>

#update_wrap{
	width:100%;
	height:700px;
	margin:auto; /*가운데 정렬*/
}

#update_box1{
	width:20%;
	height:700px;
	float:left;
}
#update_box2{
	width:60%;
	height:700px;
	float:left;

}
#update_box3{
	width:10%;
	height:700px;
	background-color:red;
	float:left;
}

</style>

<script>

function validate(){
    var TL = document.getElementById("bd_tl").value;
    var CON = document.getElementById("bd_con").value;
    
    if(TL == "") {
       alert("제목을 입력하세요.");
       return false;
    }
    
    if(CON == "") {
       alert("내용을 입력하세요.");
       return false;
    }
    
    return true;   
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
<body class="hold-transition skin-blue sidebar-mini">
<!-- title Start -->
	<div class="container-fluid bg-primary py-5 bg-header" >
		   <div class="col-2 pt-lg-2 mt-lg-2 text-center">       
          </div>
	</div>
    <div class="container-fluid py-5 wow fadeInUp" data-wow-delay="0.1s" >
            <div class="section-title text-center position-relative pb-3 mb-5 mx-auto" style="max-width:500px;text-align:left;" >
                <h1 class="mb-0">글 수 정</h1>
            </div>
   </div>
<!-- title end-->

<div class="wrapper">
	<div id="update_wrap">
	<div id="update_box1"></div>
	<div id="update_box2">
    <!-- Main content -->
    <section class="content container-fluid">

   
      <form role="form" name="f" method="post" onsubmit="return validate();">
      	<div class="box-body">
         	
			<div class="form-group">
				<br><input type="text" id="bd_tl" name='bd_tl' class="form-control"  value="${board.bd_tl}">
			</div><br>
			
			<div class="form-group">
				<textarea class="form-control" id="bd_con" name="bd_con" rows="12">${board.bd_con}</textarea>
			</div><br>

			<!-- 수정에 사용할 글번호 -->
			<input type="hidden" id="bd_num" name="bd_num" value="${board.bd_num}" />
			
			<div class="form-group">
                <label>첨부파일</label>
                <input type = "file" accept ="image/jpeg,.txt" name = 'file' class = "form-control" style = "width : 400px">         
            </div><br>
			
		</div>

		<div class="box-footer">
			<center>
				<button type="submit" class="btn btn-primary">수정</button>
				<button type="button" class="btn btn-primary" onclick="location.href='${contextPath}/board/detail?bd_num=${board.bd_num}'">취소</button>
			</center>
		</div>
	</form>
		
    </section>
    <!-- /.content -->
  </div>

</body>
</html>