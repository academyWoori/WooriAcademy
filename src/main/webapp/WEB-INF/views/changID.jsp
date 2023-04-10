<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<%@ page session="false" %>
<%@ include file="include/head.jsp" %>
<%@ include file="include/header.jsp" %>
<%@ include file="include/plug_in.jsp" %>


<!DOCTYPE html>
<!--
This is a starter template page. Use this page to start your new project from
scratch. This page gets rid of all links and provides the needed markup only.
-->
<html>
<script>

</script>
<style type="text/css">

#wrap0{
   width:100%;
   height:104px;
   margin:auto; /*가운데 정렬*/
}
#box10{
   width:33%;
   height:800px;
   float:left;
}
#box20{
   width:50%;
   height:800px;
   float:left;

}
#box30{
   width:10%;
   height:800px;
   float:left;
}
</style>


<body >

<!-- title Start -->
   <div class="container-fluid bg-primary py-5 bg-header" >
         <div class="col-2 pt-lg-2 mt-lg-2 text-center">       
          </div>
   </div>
    <div class="container-fluid py-5 wow fadeInUp" data-wow-delay="0.1s" >
            <div class="section-title text-center position-relative pb-3 mb-5 mx-auto" style="max-width:500px;text-align:left;" >
                <h1 class="mb-0">아이디 찾기</h1>
            </div>
   </div>
<!-- title end-->

<div id="box10"></div>
<div id="box20">
 <div>
   <!-- Main content -->
    <section class="content container-fluid">
      <form role="form" name="f" >
         <div class="box-body">
        <div class="col-lg-4 col-md-6 wow zoomIn" data-wow-delay="0.6s" style="visibility: visible; animation-delay: 0.6s; animation-name: zoomIn;">
                    <div class="service-item bg-light rounded d-flex flex-column align-items-left justify-content-center" style="width:560;height:350;">
            <center>           
            <!-- 아이디 --><br>
            <div class="box-group">
               <label>아이디</label>
              <br><br><h4>${changID}</h4>
            </div>
            </center><br><br><br>
            
            
         	<center>
            <div class="box-footer">           
                <a href="${contextPath}/board/login"> 확인 </a>
            </div>
            </center>
            
            </div>
            </div>
         </div>
      </form>

    </section>
          
   </div>
</div>
<div id="box30"></div>

</body>
</html>