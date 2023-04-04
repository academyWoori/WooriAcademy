<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<%@ page session="false" %>
<!DOCTYPE html>
<!--
This is a starter template page. Use this page to start your new project from
scratch. This page gets rid of all links and provides the needed markup only.
-->
<html>
<%@ include file="include/head.jsp" %>
<%@ include file="include/header.jsp" %>


<body>
<!-- title Start -->
   <div class="container-fluid bg-primary py-5 bg-header" >
         <div class="col-2 pt-lg-2 mt-lg-2 text-center">       
          </div>
   </div>
<style>

</style>        
  
    <!-- Service Start -->
  
       <div class="container-fluid py-9">
        <div class="container py-5">
            <div class="section-title text-center position-relative pb-4 mb-5 mx-auto" style="max-width: 1400px;">
                <h3 class="fw-bold text-primary text-uppercase">여행지 추천!!</h3>
                <h1 class="mb-0">당신이 원하는 여행 스타일은 무엇인가요?</h1>
            </div>
            <div class="row g-5">
                <div class="col-lg-6 ">
                    <div class="team-item bg-light rounded overflow-hidden">
                        <div class="team-img position-relative overflow-hidden">
                            <img class="img-fluid w-100" style="height:490px" src="${contextPath}/resources/bootstrap/img/k-img40.png" alt="img">
                            <div class="team-social">
                               <a class="btn btn-lg btn-primary btn-lg-square rounded" title = "활동적" href="${contextPath}/board/T_oneSelect1"><i class="bi bi-arrow-right"></i></a>
                              
                            </div>
                        </div>
                      
                    </div>
                </div>
                <div class="col-lg-6 ">
                    <div class="team-item bg-light rounded overflow-hidden">
                        <div class="team-img position-relative overflow-hidden">
                            <img class="img-fluid w-100"  src="${contextPath}/resources/bootstrap/img/k-img41.png" style="height:490px" alt="img">
                            <div class="team-social">
                           <a class="btn btn-lg btn-primary btn-lg-square rounded" title = "비활동적" href="${contextPath}/board/T_twoSelect1"><i class="bi bi-arrow-right"></i></a>
                            </div>
                        </div>
                       
                    </div>
                </div>
             
                    </div>
                </div>
            </div>
   
    
    <!-- Service End -->
      <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="${contextPath}/resources/bootstrap/lib/wow/wow.min.js"></script>
    <script src="${contextPath}/resources/bootstrap/lib/easing/easing.min.js"></script>
    <script src="${contextPath}/resources/bootstrap/lib/waypoints/waypoints.min.js"></script>
    <script src="${contextPath}/resources/bootstrap/lib/counterup/counterup.min.js"></script>
    <script src="${contextPath}/resources/bootstrap/lib/owlcarousel/owl.carousel.min.js"></script>

    <!-- Template Javascript -->
    <script src="${contextPath}/resources/bootstrap/js/main.js"></script>
   

</body>
</html>
<%@include file="include/footer.jsp" %>   
