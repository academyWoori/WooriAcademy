<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<style type="text/css">

#wrap{
   width:100%;
   margin:auto; /*가운데 정렬*/
}
#box0{
   width:1%;
   height:104px;
   float:left;
}

#box1{
   width:22%;
   height:104px;
   float:left;
}
#box2{
   width:54%;
   height:104px;
   float:left;

}
#box3{
   width:22%;
   height:52px;
   float:left;
}
#box4{
   width:22%;
   height:52px;
   float:left;
}
#box5{
   width:1%;
   height:104px;
   float:left;
}

</style>
</head>

<header>
<div id="wrap">
   <div id="box0"></div>

   <div id="box1">
      <div style="margin:12px">
      <a href="${contextPath}/" class="navbar-brand p-0">
           <img src="${contextPath}/resources/bootstrap/img/susulogow.png" width="230x" height="100px" alt="Image">
        </a>
        </div>
   </div>
   
   <div id="box2">
   <div class="container-fluid position-relative p-0">   
   <nav class="navbar navbar-expand-lg navbar-dark px-5 py-3 py-lg-0">
      <div class="navbar-nav ms-auto py-0" style="text-align:center; margin:auto;">
          <a href="${contextPath}/" class="nav-item nav-link active" style="font-size:1.5em;">홈</a>
           <a href="${contextPath}/board/T_List" class="nav-item nav-link" style="font-size:1.5em;">선택여행지</a>
           <a href="${contextPath}/board/T_ListAll" class="nav-item nav-link" style="font-size:1.5em;">전체여행지</a>
           <a href="${contextPath}/board/point" class="nav-item nav-link" style="font-size:1.5em;">포인트전환</a>
           <a href="${contextPath}/board/list" class="nav-item nav-link" style="font-size:1.5em;">게시판</a>
          </div>
    </nav>
    </div>
   </div>
   <div id="box3">
      <div style="text-align:right; margin:20px;">
         <h4>
         <c:if test="${user==null }">
              <a href="${contextPath}/board/login" style="font-size:0.7em;">로그인</a></li>
              <a > | </a>
              <a href="${contextPath}/board/join"style="font-size:0.7em;">회원가입</a>
           </c:if>
           
         <c:if test="${user!=null }">
            <label><h6 style="color:#2EFEF7;">${user.m_ename}님, 환영합니다.</h6></label>
            <c:if test="${user.m_ste ==9}">
            <label><h5 style="color:#6E6E6E;"> | </h5></label>              
               <a href="${contextPath}/board/mngpage" style="font-size:0.7em;">관리자 마이페이지</a>          
            </c:if>          
            <c:if test="${user.m_ste !=9}"> 
            <label><h5 style="color:#6E6E6E;"> | </h5></label>            
            <a href="${contextPath}/board/mypage" style="font-size:0.7em;">마이페이지</a>
            </c:if>           
         </c:if>

      </div>
   </div>
   
   <div id="box4" style="text-align:right;">
   
      <div style="text-align:right; margin:20px;">
         <c:if test="${user==null }">
           </c:if>
           
         <c:if test="${user!=null }">           
            <a href="${contextPath}/board/logOut" style="font-size:1.0em;">로그아웃</a>   
         </c:if>

      </div>
   
      
      <!--
      <div style="text-align:right; margin:19px;">
         <h6><a href="${contextPath}/board/join"><i class="fa fa-link"></i> <span>회원가입</span></a></h6>
      </div> 
      <div style="text-align:left; margin:19px;">
         <h6><a href="${contextPath}/board/Management"><i class="fa fa-link"></i> <span>회원관리</span></a></h6>
      </div>
      
       -->   
   </div>
</div>

</header>
</html>