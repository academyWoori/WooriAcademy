
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

<script type="text/javascript">


$(function(){
	   	   	   
	   // 닉네임 중복 확인버튼
	   $(".btn-enamecheck").click(function(){
	      enamecheck1.type="hidden";
	      enamecheck2.type="hidden";
	      enamecheck3.type="hidden";   
	      var ename = document.getElementById("m_ename").value;
	      
	      if(ename.length > 1 && ename.length < 16){
	         $('input[name=enamecheckNum]').attr('value','3');
	         enamecheck2.type="text";
	      } else {
	         enamecheck3.type="text";
	      }
	   });
	      
	   // 비밀번호 키업
	   $('#m_pw').keyup(function(){
	      $('font[name=passcheck]').text('');
	      if($('#m_pw').val() != $('#password2').val()){
	         $('font[name=passcheck]').text('');
	         $('font[name=passcheck]').html('비밀번호 틀림');
	         $('font[name=passcheck]').attr('color', 'red');
	      } else {
	         $('font[name=passcheck]').text('');
	         $('font[name=passcheck]').html('비밀번호 확인');
	         $('font[name=passcheck]').attr('color', 'green');
	      }
	   });   
	   $('#password2').keyup(function(){
	      if($('#m_pw').val() != $('#password2').val()){
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


	//유효성 검사
	function validate(){
	   var exptextTel = /^01[016789]+/;
	   var exptextEmail = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;   

	   var ename = document.getElementById("enamecheckNum").value;
	   
	   var password1 = document.getElementById("m_pw").value;
	   var password2 = document.getElementById("password2").value;
	   
	   var tel = document.getElementById("m_tel").value;
	   var email = document.getElementById("m_email").value;
		   
	   if(ename != 3){
	      alert("닉네임 오류");
	      enamecheck1.type="text";
	      document.getElementById("m_ename").focus();
	      return false;
	   }
	   if(password1 != password2){
	      alert("비밀번호 오류");
	      passcheck.type="text";
	      document.getElementById("m_pw").focus();
	      return false;
	   }
	   if(password1 == ""){
	      alert("비밀번호 오류");
	      document.getElementById("m_pw").focus();
	      return false;
	   }
	   
	   if(tel.length < 14 && tel.length >11){
	      if(exptextTel.test(tel)==false){
	         alert("전화번호 오류");
	         document.getElementById("tel2").focus();
	         return false;
	      }     
	   
	   // 2-7 이메일 형식 체크
	   if(exptextEmail.test(email)==false){
	      alert("이메일 오류");
	      document.getElementById("email").focus();
	      return false;
	   }

	    alert("회원정보 수정이 완료되었습니다.");
	    return true;
	   
		}
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

<div class="wrapper" >

    <!-- Main content -->
    
    <div class="container-fluid py-5" >
            <div class="section-title text-center position-relative pb-3 mb-5 mx-auto" style="max-width:500px;text-align:left;" >
                <h1 class="mb-0">회원정보변경</h1>
            </div>
  <form role="form" method="post" action="${contextPath}/board/perupdate" onsubmit="return validate();">
    <section class="content container-fluid" style="width:800px; height:1000px;">
         <div class="box" >
            <div>
           		<div class="service-item bg-light rounded d-flex flex-column align-items-left justify-content-center" style="width:700;height:750;padding-top:30px;padding-left:100px;padding-bottom:70px;">
                        
               <div class="form-group"style="height:30%">
                  <label><h5> 아 이 디 </h5></label>  <input type="text" name="m_id" id = "m_id"
                   value= "${user.m_id}" style="width:30%;height:35px;color:black;background-color:#E6E6E6;margin-left:100px;text-align:center;border:none;" readonly="readonly" />   
               </div>
                <div class="form-group"style="height:30%">
                  <label><h5> 비밀번호 </h5></label>  <input type="password" name="m_pw" id="m_pw"
                   value="${user.m_pw}" onclick="pass_click();" style="width:30%;height:35px;background-color:#FFFFFF;margin-left:90px;text-align:center;border:none;"/>
               </div>
               <div class="form-group"style="height:30%">
                  <label><h5> 비밀번호 확인 </h5></label>  <input type="password" name="password2" id="password2"
                     value="${user.m_pw}" onclick="pass_click();" style="width:30%;height:35px;background-color:#FFFFFF;margin-left:45px;text-align:center;border:none;"/>
                     <font name="passcheck" size="2"></font>
               </div>
                   <div class="form-group"style="height:30%">
                  <label><h5> 이   름 </h5></label>  <input type="text" name="m_name" id="m_name"
                    value="${user.m_name}" onclick="name_click();" style="width:30%;height:35px;background-color:#FFFFFF;margin-left:125px;text-align:center;border:none;" readonly="readonly"/>
               </div>
                <div class="form-group"style="height:30%">
                  <label><h5> 닉 네 임 </h5></label>  <input type="text" name="m_ename" id="m_ename" onclick="ename_click();"
                    value="${user.m_ename}" style="width:30%;height:35px;color:black;background-color:#FFFFFF;margin-left:100px;text-align:center;border:none;"/>
                    <input type='hidden' id='enamecheckNum' name='enamecheckNum' value='1'>
                    <button type="button" class="btn btn-enamecheck" style="background-color:#99c2ff;color:White;height:28px;font-size:0.9em;padding-top:3.5px;">중복확인</button>
               <input type='hidden' id='enamecheck1' name='enamecheck1' class="form-control" value="중복확인을 하십시오." style="color:red; width:200px;height:28px;border:none;font-size:0.8em;text-align:center">
               <input type='hidden' id='enamecheck2' name='enamecheck2' class="form-control" value="중복확인이 완료되었습니다." style="color:green; width:200px;height:28px;border:none;font-size:0.8em;text-align:center" >
               <input type='hidden' id='enamecheck3' name='enamecheck3' class="form-control" value="잘못된 아이디 형식입니다." style="color:red; width:200px;height:28px;border:none;font-size:0.8em;text-align:center">      
               </div>
                   <div class="form-group"style="height:30%">
                  <label><h5> 이 메 일 </h5></label>  <input type="text" name="m_email" id="m_email"
                    value="${user.m_email}" style="width:30%;height:35px;color:black;background-color:#FFFFFF;margin-left:100px;text-align:center;border:none;"/>
               </div>
                   <div class="form-group"style="height:30%">
                  <label><h5> 전화번호 </h5></label>  <input type="text" name="m_tel" id="m_tel"
                    value="${user.m_tel}" style="width:30%;height:35px;color:black;background-color:#FFFFFF;margin-left:90px;text-align:center;border:none;"/>
               </div>
                  <div class="form-group"style="height:30%">
                  <br><label><h5>광고수신 약관 동의(선택)</h5></label><br>
               <textarea id="adv" name="adv" rows="5" style="width:500px;border:none;font-size:0.8em;" readonly>
* 홍보 및 마케팅에 관한 동의 *
- 해당 사이트에 "개인정보 보호법"에 따라 동의를 얻어 아래와 같이 서비스의 홍보및 마케팅을 위한 개인정보를 수집,이용합니다.
- 수집 목적 : 웹 매거진 발송(월 1회)/SMS를 통한 이벤트 참여 기회 제공
- 수집 항목(보유기간) : 이메일(수집일로부터 1년)/ 휴대전화번호(수집일로부터 6개월)
*귀하의 개인정보 수집,이용에 동의하지 않을 권리가 있으며, 동의를 거부할 경우에는 내용 관련 서비스를 받을 수 없습니다.</textarea>			
               <br><input type="radio" id="m_adv_yn1" name="m_adv_yn" value="1">동의　
               <input type="radio" id="m_adv_yn" name="m_adv_yn" value="2" checked="checked">거부
               </div>
            </div>
         </div>
         
         	<div class="box-footer" style="height:30%">
           		<button type="submit" class="btn btn-primary" style="margin-top:10px;margin-left:300px;">수정완료</button>         
         	</div>
            </div>            
       	</section>
	</form>
	</div>
</div>
</body>
</body>
</html>