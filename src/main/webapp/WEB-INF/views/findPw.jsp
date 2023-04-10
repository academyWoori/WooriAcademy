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
   
   $(".btn-primary").click(function(){   
      var tel1 = document.getElementById("tel1").value;
      var tel2 = document.getElementById("tel2").value;
      var tel3 = document.getElementById("tel3").value;
      $('input[name=m_tel]').attr('value',tel1+"-"+tel2+"-"+tel3);     
   });
   
   
 //인증번호 받기
   $(".btn-telcheck").click(function(){  
      while(true){
         var ran = Math.floor(Math.random()*10000);
         if(ran > 999){
            $('input[name=tCheck1]').attr('value',ran);
            break;
         }
      }
       var telran = document.getElementById("tCheck1").value;
       alert(telran);
   });
   
   $(".btn-telcheck2").click(function(){
      
      tCheck3.type = "hidden";
      tCheck4.type = "hidden";
      
      var tel1 = document.getElementById("tCheck1").value;
      var tel2 = document.getElementById("tCheck2").value;
      
      if(tel1 == tel2){
         alert("확인이되었습니다.");
         tCheck3.type = "text";
         $('input[name=telChecknum').attr('value', "2");
      } else {
         alert("인증번호가 틀립니다.");
         tCheck4.type = "text";
      }
       
  });
   
   
})


//유효성 검사
function validate(){
   var exptextTel = /^01[016789]+/;
   var telcheck = document.getElementById("telChecknum").value;
   var tel = document.getElementById("m_tel").value;
   
   
   if(telcheck != 2){
      alert("인증번호 오류");
      document.getElementById("tCheck2").focus();
      tCheck4.type = "text";
      return false;
   }
   
   if(tel.length < 14 && tel.length >11){
      if(exptextTel.test(tel)==false){
         alert("핸드폰번호 오류");
         document.getElementById("tel2").focus();
         return false;
      }   
   } else{
      alert("핸드폰번호 오류");
      document.getElementById("tel2").focus();
      return false;
   }   

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
                <h1 class="mb-0">비밀번호 찾기</h1>
            </div>
   </div>
<!-- title end-->


<div id="box10"></div>
<div id="box20">
 <div>
   <!-- Main content -->

   
    <section class="content container-fluid">
      <form role="form" name="f" method="post" action="${contextPath}/board/changPw" onsubmit="return validate();">
         <div class="box-body">
            <div class="col-lg-4 col-md-6 wow zoomIn" data-wow-delay="0.6s" style="visibility: visible; animation-delay: 0.6s; animation-name: zoomIn;">
               <div class="service-item bg-light rounded d-flex flex-column align-items-left justify-content-center" style="width:560;height:390;">
         
         
            <!-- 아이디 -->
            <div class="box-group"> 
               <label>아이디　　　　</label>
               <input type='text' id='m_id' name='m_id' minlength="8" maxlength="15" style="width:130px;border:none;" >    
            </div>
                    
            <!-- 이름 --><br>
            <div class="box-group">
               <label>이름　　　　　</label>
               <input type='text' id='m_name' name='m_name' style="width:130px;border:none;">
            </div>
            
            <!-- 생년월일 --><br>
            <div class="box-group">
               <label>주민등록번호　</label>
               <input type="text" id="m_birth" name="m_birth" minlength="6" maxlength="6" style="width:150px; height:28;border:none;"> - 
               <input type="text" id="m_gender" name="m_gender" minlength="1" maxlength="1" style="width:30px; height:28;border:none;">******
            </div>
            
            <!-- 핸드폰번호 --><br>
            <div class="box-group">
               <label>핸드폰번호　　</label>
               <select id='tel1' name='tel1' style="width:70px; height:32;border:none;">
                  <option value="010">010</option>
                  <option value="011">011</option>
                  <option value="016">016</option>
                  <option value="017">017</option>
                  <option value="019">019</option>
               </select> - 
               <input type='text' id='tel2' name='tel2' minlength="3" maxlength="4" style="width:70px; height:28;border:none;"> - 
               <input type='text' id='tel3' name='tel3' minlength="4" maxlength="4" style="width:70px; height:28;border:none;">
               <input type='hidden' id='m_tel' name='m_tel'>
               <button type="button" class="btn btn-telcheck" style="background-color:#99c2ff;color:White;height:28px;font-size:0.9em;padding-top:3.5px;">인증번호 받기</button><br><br>
               <input type="hidden" id="tCheck1" name="tCheck1">
               <label>인증번호　　　</label>
               <input type="text" id="tCheck2" name="tCheck2" style="width:100px; height:28;border:none;">
               <button type="button" class="btn btn-telcheck2" style="background-color:#99c2ff;color:White;height:29px;font-size:0.9em;padding-top:3.5px;">확인</button><br><br>
               <input type='hidden' id='tCheck3' name='tCheck3'  value="확인되었습니다." style="color:green; width:150px;height:28px;border:none;font-size:0.8em;text-align:center">
               <input type='hidden' id='tCheck4' name='tCheck4'  value="인증번호가 틀립니다." style="color:red; width:150px;height:28px;border:none;font-size:0.8em;text-align:center">
               <input type="hidden" id="telChecknum" name="telChecknum" value="1">
            </div>            
            
            <div class="box-footer">
               <button type="submit" class="btn btn-primary" style="margin: 20px 10px 1px 170px;padding-top:3px;width:70px;height:28px;">확인</button>
               <button type="button" class="btn btn-primary" style="margin: 20px 10px 1px 2px;padding-top:3px;width:70px;height:28px;" onclick="location.href='${contextPath}/board/login'">취소</button>
            </div>
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