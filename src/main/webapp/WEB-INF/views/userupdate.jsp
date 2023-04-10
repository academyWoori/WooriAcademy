
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
                <h1 class="mb-0">회원정보 수정</h1>
            </div>
  <form role="form" method="post" >
   <section class="content container-fluid" style="width:1300px; height:200px;">
         <div class="box" >
        
            <div class="box-body">
               <div class="form-group"style="height:50%">
                  <label><h5> 아이디 </h5></label>  <input type="text" name="m_id1" id = "m_id1"
                     class="form-control" value= "${Management.m_id}" >
               </div>
                <div class="form-group"style="height:50%">
                  <label><h5> 비밀번호 </h5></label>  <input type="text" name="m_pw" id="m_pw"
                     class="form-control" value="${Management.m_pw}"  />
               </div>
                   <div class="form-group"style="height:50%">
                  <label><h5> 이름 </h5></label>  <input type="text" name="m_name" id="m_name"
                     class="form-control" value="${Management.m_name}"  />
               </div>
                <div class="form-group"style="height:50%">
                  <label><h5> 닉네임 </h5></label>  <input type="text" name="m_ename" id="m_ename"
                     class="form-control" value="${Management.m_ename}"  />
               </div>
                   <div class="form-group"style="height:50%">
                  <label><h5> 이메일 </h5></label>  <input type="text" name="m_email" id="m_email"
                     class="form-control" value="${Management.m_email}"  />
               </div>
                   <div class="form-group"style="height:50%">
                  <label><h5> 전화번호 </h5></label>  <input type="text" name="m_tel" id="m_tel"
                     class="form-control" value="${Management.m_tel}"  />
               </div>
                  <div class="form-group"style="height:50%">
                  <label><h5> 포인트 </h5></label>  <input type="text" name="m_point" id="m_point"
                     class="form-control" value="${Management.m_pt}" />
               </div>
               
		</div>
            </div>
           
      
         <div class="box-footer" style="height:30%">
           <button type="submit" class="btn btn-primary">수정완료</button>
         
         </div>
   
       </section>
		</form>
<script>



</script>


</div>
</div>
</body>
</body>
</html>