<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<%@ page session="true" %>
<%@ include file="include/head.jsp" %>
<%@ include file="include/header.jsp" %>



<!DOCTYPE html>
<html lang="en">

<script>

/*
function attend_click() {
   
   var pt = document.getElementById("m_pt").value;
   $('input[name=m_pt]').attr('value', m_pt + "5"); 
   
   alert("출석확인 5p 적립되었습니다.");
}
*/

</script>

<body>
   <div class="container-fluid bg-primary py-5 bg-header" >
         <div class="col-2 pt-lg-2 mt-lg-2 text-center">       
          </div>
   </div>

    <!-- Full Screen Search Start -->
    <div class="modal fade" id="searchModal" tabindex="-1">
        <div class="modal-dialog modal-fullscreen">
            <div class="modal-content" style="background: rgba(9, 30, 100, .7);">
                <div class="modal-header border-0">
                    <button type="button" class="btn bg-white btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body d-flex align-items-center justify-content-center">
                    <div class="input-group" style="max-width: 600px;">
                        <input type="text" class="form-control bg-transparent border-primary p-3" placeholder="Type search keyword">
                        <button class="btn btn-primary px-4"><i class="bi bi-search"></i></button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Full Screen Search End -->
     
    <!-- Service Start -->
    <div class="container-fluid py-10">
        <div class="container py-5"> 
            <div class="section-title text-left position-relative pb-2 mb-3" style="max-width: 1000px;">             
             <h5 class="fw-bold text-primary text-uppercase">             
            <img src="${contextPath}/resources/bootstrap/img/Profile.png?v=1">
               　[관리자]${user.m_ename}님, 환영합니다.
               <div class="container" id="badge">
            </div>           
               </h5>                               
               </div>
                 <button class="button button--wapasha button--round-s" style="color: #fff; background:#008CBA; font-size:1.3em; border-radius:0.5em; padding:5px 20px;" onclick="location.href='personal_information'">관리자정보변경</button>                         
    <!-- Service end -->


   <!-- Team Start -->
    <div class="container-fluid" >
        <div class="container py-1" style="margin-left:160px;margin-top:20px;">            
            <div class="row g-3">
                <div class="col-lg-3">
                    <div class="team-item bg-light rounded overflow-hidden">
                        <div class="team-img position-relative overflow-hidden">
                            <i class="bi-card-list fa-2x position-relative pb-2 mb-5" style="font-size:8em; border-radius:10em; padding:40px 30px;margin-left: 55px;"></i>                         
                            <div class="team-social">
                                  <a class="btn btn-lg btn-primary btn-lg-square rounded" href="${contextPath}/board/Management"><i class="bi bi-check"></i></a>   
                                <a class="product pag" href=""></a>
                            </div>                        
                        <div class="text-center py-4">
                            <h4 class="text-primary">회원관리</h4>
                            <p class="text-uppercase m-0"></p>          
                        </div>
                     </div>
                    </div>
                </div>
                <div class="col-lg-3">
                    <div class="team-item bg-light rounded overflow-hidden">
                        <div class="team-img position-relative overflow-hidden">
                            <i class="bi bi-question fa-2x position-relative pb-2 mb-5" style="font-size:8em; border-radius:10em; padding:40px 30px;margin-left: 50px;"></i>                         
                            <div class="team-social">
                                  <a class="btn btn-lg btn-primary btn-lg-square rounded" href="${contextPath}/board/question"><i class="bi bi-check"></i></a>   
                                <a class="product pag" href=""></a>
                            </div>                        
                        <div class="text-center py-4">
                            <h4 class="text-primary">문의 처리</h4>
                            <p class="text-uppercase m-0"></p>          
                        </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3">
                    <div class="team-item bg-light rounded overflow-hidden">
                        <div class="team-img position-relative overflow-hidden">
                            <i class="bi bi-wallet fa-2x position-relative pb-2 mb-5" style="font-size:8em; border-radius:10em; padding:40px 30px;margin-left: 60px;"></i>                         
                            <div class="team-social">
                                  <a class="btn btn-lg btn-primary btn-lg-square rounded" href="${contextPath}/board/point_list"><i class="bi bi-check"></i></a>   
                                <a class="product pag" href=""></a>
                            </div>
                        <div class="text-center py-4">
                            <h4 class="text-primary">포인트 처리</h4>
                            <p class="text-uppercase m-0"></p>          
                        </div>
                       </div>
                    </div>
                </div>            
            </div>
        </div>
    </div>
    <!-- Team End -->


 

    <!-- Back to Top -->
    <a href="#" class="btn btn-lg btn-primary btn-lg-square rounded back-to-top"><i class="bi bi-arrow-up"></i></a>


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
<%@ include file="include/footer.jsp"%>