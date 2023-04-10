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

<div class="wrapper" >

    <!-- Main content -->
    
    <div class="container-fluid py-5 wow fadeInUp" data-wow-delay="0.1s" >
            <div class="section-title text-center position-relative pb-3 mb-5 mx-auto" style="max-width:500px;text-align:left;" >
                <h1 class="mb-0">회원정보 상세보기</h1>
            </div>
  
   <section class="content container-fluid" style="width:1300px; height:200px;">
  
         <div class="box" >
            <div class="box-body">
           
               <div class="form-group"style="height:50%">
                  <label><h5> 아이디 </h5></label>  <input type="text" name="m_id" id = "m_id"
                     class="form-control" value= "${Management.m_id}" readonly="readonly" />
                    
               </div>
                <div class="form-group"style="height:50%">
                  <label><h5> 비밀번호 </h5></label>  <input type="text" name="m_pw" id="m_pw"
                     class="form-control" value="${Management.m_pw}" readonly="readonly" />
               </div>
                   <div class="form-group"style="height:50%">
                  <label><h5> 이름 </h5></label>  <input type="text" name="m_name" id="m_name"
                     class="form-control" value="${Management.m_name}" readonly="readonly" />
               </div>
                <div class="form-group"style="height:50%">
                  <label><h5> 닉네임 </h5></label>  <input type="text" name="m_ename" id="m_ename"
                     class="form-control" value="${Management.m_ename}" readonly="readonly" />
               </div>
                   <div class="form-group"style="height:50%">
                  <label><h5> 이메일 </h5></label>  <input type="text" name="m_email" id="m_email"
                     class="form-control" value="${Management.m_email}" readonly="readonly" />
               </div>
                   <div class="form-group"style="height:50%">
                  <label><h5> 전화번호 </h5></label>  <input type="text" name="m_tel" id="m_tel"
                     class="form-control" value="${Management.m_tel}" readonly="readonly" />
               </div>
                  <div class="form-group"style="height:50%">
                  <label><h5> 포인트 </h5></label>  <input type="text" name="m_pt" id="m_pt"
                     class="form-control" value="${Management.m_pt}" readonly="readonly" />
               </div>
            </div>
         </div>
         
         <div class="box-footer" style="height:30%">
           <button class="btn btn-primary">목록</button>
            <button class="btn btn-warning">수정</button>
            <button class="btn btn-danger">삭제</button>
            
         </div>
    
            
       </section>
      
<script>

   
$(function(){
    //목록 버튼을 눌렀을 때 처리
    $(".btn-primary").click(function(){
       var id = document.getElementById("m_id").value;
       location.href="Management?m_id="+id;
    });
    //삭제 버튼을 눌렀을 때 처리
    /*
    $(".btn-danger").click(function(){
       var id = document.getElementById("m_id").value;
       location.href="userdelete?m_id="+ id;
    });
   
    //수정 버튼을 눌렀을 때 처리
      $(".btn-warning").click(function(){
         alert("수정!!");
         if($("#userupdatebtn").val()=="수정완료"){
            document.getElementById("userupdatebtn").style.display="block";
            document.getElementById("m_id").readOnly=false;
            document.getElementById("m_pw").readOnly=false;
            document.getElementById("m_name").readOnly=false;
            document.getElementById("m_ename").readOnly=false;
            document.getElementById("m_email").readOnly=false;
            document.getElementById("m_tel").readOnly=false;
            document.getElementById("m_point").readOnly=false;
         
            return false;
         } else{
            document.getElementById("userupdatebtn").style.display="none";
            return false;
         }

      });
    */
    
    $(".btn-warning").click(function(){
       
        var id = document.getElementById("m_id").value;
       location.href="userupdate?m_id=" + id;
    });
    
   $(".btn-danger").click(function(){
      alert("회원정보가 삭제되었습니다");
      var id = document.getElementById("m_id").value;
      location.href="userdelete?m_id="+id;
   });
              //ajax를 통한 댓글 기능 작성하기
})





</script> 



</div>
</div>
</body>
</body>
</html>