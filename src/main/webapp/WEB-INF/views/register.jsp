<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
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

#register_wrap{
	width:100%;
	height:700px;
	margin:auto; /*가운데 정렬*/
}

#register_box1{
	width:20%;
	height:700px;
	float:left;
}
#register_box2{
	width:60%;
	height:700px;
	float:left;

}
#register_box3{
	width:10%;
	height:700px;
	background-color:red;
	float:left;
}

</style>


<script>


   function testajax(){   
      var url         = "${pageContext.request.contextPath }/board/test";
      var paramData   = {
            "msg" : "testMSG"
      };
      
      $.ajax({
         url:   url,
         data:   paramData,
         dataType: 'json',
         type: 'POST',
         success: function(result){
            console.log(result);
            console.log("성공");
            var htmls = '';
            htmls += '<div>성공하였습니다.<br>';
            htmls += '======';
            //선택한 요소를 다른것으로 바꿉니다.(변경)
            $('#divtest').replaceWith(htmls);
         },
         error: function(result){
            console.log(result);
            console.log("실패");
         }
      });
   }
   
   
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
<body>

<!-- title Start -->
	<div class="container-fluid bg-primary py-5 bg-header" >
		   <div class="col-2 pt-lg-2 mt-lg-2 text-center">       
          </div>
	</div>
    <div class="container-fluid py-5 wow fadeInUp" data-wow-delay="0.1s" >
            <div class="section-title text-center position-relative pb-3 mb-5 mx-auto" style="max-width:500px;text-align:left;" >
                <h1 class="mb-0">글 쓰 기</h1>
            </div>
   </div>
<!-- title end-->


<div class="wrapper">
	<div id="register_wrap">
	<div id="register_box1"></div>
	<div id="register_box2">
    <!-- Main content -->
    <section class="content container-fluid">

   
      <form role="form" name="f" method="post" onsubmit="return validate();">
         <div class="box-body">
         <select id='bd_group' name='bd_group' style="width:130px; height:30;">
                  <option value="2">메인게시판</option>
                  <option value="3">자유게시판</option>
                  <option value="4">나의 문의</option>
         </select>

         
            <div class="form-group">
               <br><input type="text" name='bd_tl' id='bd_tl' class="form-control" placeholder="제목을 입력하세요">
            </div><br>
            
            <div class="form-group">
               <textarea class="form-control" name="bd_con" id="bd_con" rows="12"
                  placeholder="내용을 입력하세요"></textarea>
            </div><br>
            
            <!--  style = "width : 20%" maxlength="10" value부터 지우고 앞 글 사용하면 입력 및 글자수 제한으로 입력가능 -->
            <input type="hidden" id="m_ename" name="m_ename" value="${user.m_ename}" readonly>
            <input type="hidden" id="m_id" name="m_id" value="${user.m_id}" readonly>
            
            <div class="form-group">
                     <label>첨부파일</label>
                     <input type = "file" accept ="image/jpeg,.txt" name = 'file' class = "form-control" style = "width : 400px">         
            </div><br>
         </div>
   		
         <div class="box-footer">
         <center>
            <button type="submit" class="btn btn-primary">완료</button>
            <button type="button" class="btn btn-primary" onclick="location.href='${contextPath}/board/list'">취소</button>
         </center>
         </div>
         
      </form>
    </section>
    </div>
    </div>
    <!-- /.content -->
  <!-- /.content-wrapper -->

 
  <!-- /.control-sidebar -->
  <!-- Add the sidebar's background. This div must be placed
  immediately after the control sidebar -->
</div>
<!-- ./wrapper -->
</body>
</html>