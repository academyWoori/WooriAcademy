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

<script>
$(function(){
	
	// 비밀번호 키업
	$('#m_pw').keyup(function(){
	   $('font[name=passcheck]').text('');
	   if($('#m_pw').val() != $('#m_pw2').val()){
	      $('font[name=passcheck]').text('');
	      $('font[name=passcheck]').html('비밀번호 틀림');
	      $('font[name=passcheck]').attr('color', 'red');
	   } else {
	      $('font[name=passcheck]').text('');
	      $('font[name=passcheck]').html('비밀번호 확인');
	      $('font[name=passcheck]').attr('color', 'green');
	   }
	});   
	$('#m_pw2').keyup(function(){
	   if($('#m_pw').val() != $('#m_pw2').val()){
	      $('font[name=passcheck]').text('');
	      $('font[name=passcheck]').html('비밀번호 틀림');
	      $('font[name=passcheck]').attr('color', 'red');
	   } else {
	      $('font[name=passcheck]').text('');
	      $('font[name=passcheck]').html('비밀번호 확인');
	      $('font[name=passcheck]').attr('color', 'green');
	      
	   }   
	});

	
})

function validate(){
	var password1 = document.getElementById("m_pw").value;
	var password2 = document.getElementById("m_pw2").value;
	var id = document.getElementById("m_id").value;
	
	if(password1 != password2){
		alert("비밀번호 오류");
		passcheck.type="text";
		document.getElementById("m_pw").focus();
		return false;
		}
	
	
	alert(비밀번호 변경이 완료되었습니다.);
	return true;
}
</script>

<body >

<!-- title Start -->
   <div class="container-fluid bg-primary py-5 bg-header" >
         <div class="col-2 pt-lg-2 mt-lg-2 text-center">       
          </div>
   </div>
    <div class="container-fluid py-5 wow fadeInUp" data-wow-delay="0.1s" >
            <div class="section-title text-center position-relative pb-3 mb-5 mx-auto" style="max-width:500px;text-align:left;" >
                <h1 class="mb-0">비밀번호 변경</h1>
            </div>
   </div>
<!-- title end-->

<div id="box10"></div>
<div id="box20">
 <div>
   <!-- Main content -->
    <section class="content container-fluid">
      <form role="form" name="f" method="post" action="${contextPath}/board/changePw" onsubmit="return validate();">
         <div class="box-body">
        <div class="col-lg-4 col-md-6 wow zoomIn" data-wow-delay="0.6s" style="visibility: visible; animation-delay: 0.6s; animation-name: zoomIn;">
                    <div class="service-item bg-light rounded d-flex flex-column align-items-left justify-content-center" style="width:560;height:350;">
            <center>           
            <input type="hidden" id="m_id" name="m_id" value="${changPw}">
            <!-- 비밀번호 --><br>
            <div class="box-group">
               <label>　　비밀번호</label>
               <input type='password' id='m_pw' name='m_pw' style="width:28%;margin-left:80px;border:none;">
            </div>
            </center><br>
            
            <center>           
            <!-- 비밀번호 확인 --><br>
            <div class="box-group">
               <label>비밀번호 확인</label>
               <input type='password' id='m_pw2' name='m_pw2' style="width:28%;margin-left:80px;border:none;">
            </div><br><br>
            <font name="passcheck" size="2"></font>
            </center><br><br>
            
         	<center>
            <div class="box-footer">           
                <button class="submit" >확인</button>
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
