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
function id_click() {
   idcheck1.type="hidden";
   idcheck3.type="hidden";
}

function ename_click(){
   enamecheck1.type="hidden";
   enamecheck3.type="hidden";
}


function pass_click() {
   passcheck.type="hidden";
}

function email_select() {
   var select = document.getElementById("email3");
   var selectValue = select.options[select.selectedIndex].value;
   email2.value = selectValue;
   if(email2.value == ""){
      $('input[name=email2]').attr('readonly',false);
   } else {
      $('input[name=email2]').attr('readonly',true);
   }
}


$(function(){
	
	// 아이디 중복확인 버튼
	$(".btn-idcheck").click(function(){
		var m_id = document.getElementById("m_id").value;
		var paramData = {
				"m_id" : m_id
		}
		
		if(m_id.length < 7){
			alert("아이디는 8자리 이상으로 만들어주세요.");	
		} else {
			$.ajax({
				url : "${pageContext.request.contextPath}/board/checkId",
				type : "post",
				dataType : "json",
				data : paramData,
				success : function(result){
					if(result == 1){
						alert("중복된 아이디입니다.")
						idcheck1.type = "hidden";
					} else if(result == 0){
						$(".idcheckNum").attr("value","3");
						idcheck1.type = "text";
						alert("사용 가능한 아이디 입니다.");
					}
				}
			})
	
		}
		
	});
   
	// 닉네임 중복확인 버튼
	$(".btn-enamecheck").click(function(){
		var ename = document.getElementById("m_ename").value;
		var paramData = {
				"m_ename" : ename
		}
		
		if(ename.length < 2 || ename.length > 12 ){
			alert("닉네임은 3자리 이상으로 만들어주세요.")
		} else {
			$.ajax({
				url : "${pageContext.request.contextPath}/board/checkEname",
				type : "post",
				dataType : "json",
				data : paramData,
				success : function(result){
					if(result == 1){
						enamecheck1.type = "hidden";
						alert("중복된 닉네임입니다.")
					} else if(result == 0){
						$('input[name=enamecheckNum]').attr('value','3');
						enamecheck1.type = "text";
						alert("사용 가능한 닉네임입니다");
					}
				}
				
				
			});
			
		}
	});
	
	
   $(".btn-primary").click(function(){   
      var tel1 = document.getElementById("tel1").value;
      var tel2 = document.getElementById("tel2").value;
      var tel3 = document.getElementById("tel3").value;
      $('input[name=m_tel]').attr('value',tel1+"-"+tel2+"-"+tel3);   
      var email1 = document.getElementById("email1").value;
      var email2 = document.getElementById("email2").value;
      $('input[name=m_email]').attr('value',email1+"@"+email2);   
   });
   
   
   /*
   // 2-1, 닉네임 중복 확인버튼
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
     */
     
     
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
   var id = document.getElementById("idcheckNum").value;
   var ename = document.getElementById("enamecheckNum").value;
   
   var password1 = document.getElementById("m_pw").value;
   var password2 = document.getElementById("password2").value;
   
   var tel = document.getElementById("m_tel").value;
   var email2 = document.getElementById("email2").value;
   var email = document.getElementById("m_email").value;


   var infoYn = $('input[name=m_info_yn]:checked').val();
   
   if(infoYn == 2) {
      alert("동의후 진행하세요.");
      return false;
   }
   
   

   if(id != 3){
      alert("아이디 오류");
      idcheck1.type="text";
      document.getElementById("m_id").focus();
      return false;
   }
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
   } else{
      alert("전화번호 오류");
      document.getElementById("tel2").focus();
      return false;
   }   
   
   if(email2==""){
      alert("이메일 오류");
      document.getElementById("email1").focus();
      return false;
   }   
   
   // 2-7 이메일 형식 체크
   if(exptextEmail.test(email)==false){
      alert("이메일 오류");
      document.getElementById("email").focus();
      return false;
   }

    alert("회원가입이 완료되었습니다.");
    return true;
   
}
</script>


<body >

   <div class="container-fluid bg-primary py-5 bg-header" >
         <div class="col-2 pt-lg-2 mt-lg-2 text-center">       
          </div>
   </div>
    <div class="container-fluid py-5 wow fadeInUp" data-wow-delay="0.1s" >
            <div class="section-title text-center position-relative pb-3 mb-1 mx-auto" style="max-width:500px;text-align:left;" >
                <h1 class="mb-0">회 원 가 입</h1>
            </div>
   </div>
<!-- title end-->

<div id="box10"></div>
<div id="box20">
 <div>
   <!-- Main content -->
    <section class="content container-fluid">
      <form role="form" name="f" method="post" onsubmit="return validate();">
         <div class="box-body">
            <div class="col-lg-4 col-md-6 wow zoomIn" data-wow-delay="0.6s" style="visibility: visible; animation-delay: 0.6s; animation-name: zoomIn;">
               <div class="service-item bg-light rounded d-flex flex-column align-items-left justify-content-center" style="width:580;height:850;">
         
            <!-- 아이디 -->
            <div class="box-group"> 
               <label>아이디　　　　</label>
               <input type='text' id='m_id' name='m_id' onclick="id_click();" minlength="8" maxlength="15" style="width:130px;border:none;" >
               <input type='hidden' id='idcheckNum' name='idcheckNum' value='1'>
               <button type="button" class="btn btn-idcheck" style="background-color:#99c2ff;color:White;height:28px;font-size:0.9em;padding-top:3.5px;">중복확인</button>
               <input type='hidden' id='idcheck1' name='idcheck1' class="form-control" value="중복확인이 완료되었습니다." style="color:green; width:200px;height:28px;border:none;font-size:0.8em;text-align:center">    
            </div>
         
            <!-- 비밀번호 --><br>
            <div class="box-group">
               <label>비밀번호　　　</label>
               <input type='password' id='m_pw' name='m_pw' onclick="pass_click();" style="border:none;">
            </div>
            <div class="box-group">
               <br><label>비밀번호확인　</label>
               <input type='password' id='password2' name='password2' onclick="pass_click();" style="border:none;">
               <font name="passcheck" size="2"></font>
            </div>

            <!-- 닉네임 -->
            <br><div class="box-group">
               <label>닉네임　　　　</label>
               <input type='text' id='m_ename' name='m_ename' onclick="ename_click();" maxlength="15" style="width:130px;border:none;" >
               <input type='hidden' id='enamecheckNum' name='enamecheckNum' value='1'>
               <button type="button" class="btn btn-enamecheck" style="background-color:#99c2ff;color:White;height:28px;font-size:0.9em;padding-top:3.5px;">중복확인</button>
               <input type='hidden' id='enamecheck1' name='enamecheck1' class="form-control" value="중복확인이 완료되었습니다." style="color:green; width:200px;height:28px;border:none;font-size:0.8em;text-align:center" >                     
            </div>
                        
            <!-- 이름 --><br>
            <div class="box-group">
               <label>이름　　　　　</label>
               <input type='text' id='m_name' name='m_name' onclick="name_click();" style="width:130px;border:none;">
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
            </div>
            <!-- 생년월일 --><br>
            <div class="box-group">
               <label>주민등록번호　</label>
               <input type="text" id="m_birth" name="m_birth" minlength="6" maxlength="6" style="width:150px; height:28;border:none;"> - 
               <input type="text" id="m_gender" name="m_gender" minlength="1" maxlength="1" style="width:30px; height:28;border:none;">******
            </div>
            <!-- 이메일 --><br>
            <div class="box-group">
               <label>이메일　　　　</label>
               <input type="text" id="email1" name="email1" style="width:120px; height:32;border:none;"> @ 
               <input type="text" id="email2" name="email2" style="width:120px; height:32;border:none;">
               <select id='email3' name='email3' onchange="email_select();" style="width:120px; height:32;border:none;">
                  <option value="" style="border:none;">직접입력</option>
                  <option value="gmail.com">gmail.com</option>
                  <option value="naver.com">naver.com</option>
                  <option value="daum.net">daum.net</option>
               </select>
               <input type="hidden" id="m_email" name="m_email"> 
            </div>
            
            <!-- 개인정보 공유에 대한 약관 --><br>
            <div class="box-group">
               <label>개인정보 약관 동의(필수)</label><br>
               <textarea id="info" name="info" rows="3" style="width:520px;border:none;font-size:0.8em;" readonly >
* 개인정보 수집, 이용동의 *
- 해당 사이트에 서비스 회원가입, 고객상담 및 고지사항 전달 등을 위해 아래와 같이 개인정보 수집,이용합니다.
- 수집 목적 : 회원 식별 및 회원제 서비스 제공, 고객 상담 및 관리, 서비스 변경사항 및 고지사항 전달
- 수집 항목 : 아이디, 비밀번호, 전화번호, 이메일, 생년월일
- 수집 근거 : 개인정보 보호법 제 15조 제1항
* 귀하의 해당 사이트의 서비스 이용에 필요한 최소한의 개인정보 수집,이용에 동의하지 않을 수 있으나, 동의를 거부 할 경우 회원제 서비스 이용이 불가합니다.</textarea>
               <br><input type="radio" id="m_info_yn" name="m_info_yn" value="1">동의　
               <input type="radio" id="m_info_yn" name="m_info_yn" value="2" checked="checked">거부
            </div>
            <!-- 광고 수신 여부에 대한 약관(선택) --><br>
            <div class="box-group">
               <label>광고수신 약관 동의(선택)</label><br>
               <textarea id="adv" name="adv" rows="3" style="width:520px;border:none;font-size:0.8em;" readonly>
* 홍보 및 마케팅에 관한 동의 *
- 해당 사이트에 "개인정보 보호법"에 따라 동의를 얻어 아래와 같이 서비스의 홍보및 마케팅을 위한 개인정보를 수집,이용합니다.
- 수집 목적 : 웹 매거진 발송(월 1회)/SMS를 통한 이벤트 참여 기회 제공
- 수집 항목(보유기간) : 이메일(수집일로부터 1년)/ 휴대전화번호(수집일로부터 6개월)
*귀하의 개인정보 수집,이용에 동의하지 않을 권리가 있으며, 동의를 거부할 경우에는 내용 관련 서비스를 받을 수 없습니다.</textarea>
               <br><input type="radio" id="m_adv_yn" name="m_adv_yn" value="1">동의　
               <input type="radio" id="m_adv_yn" name="m_adv_yn" value="2" checked="checked">거부
            </div><br>
            <div class="box-footer">           
               <button type="submit" class="btn btn-primary" style="margin: 20px 10px 1px 173px;padding-top:3px;width:70px;height:28px;">확인</button>
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