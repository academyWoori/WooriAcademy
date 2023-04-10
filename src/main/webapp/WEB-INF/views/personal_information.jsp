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

   <section class="content container-fluid" style="width:800px; height:1000px;padding-left:65px;">
         <div class="box" >
            <div>
           		<div class="service-item bg-light rounded d-flex flex-column align-items-left justify-content-center" style="width:700;height:750;padding-top:30px;padding-left:110px;padding-bottom:70px;">
                        
               <div class="form-group"style="height:30%">
                  <label><h5> 아 이 디 </h5></label>  <input type="text" name="m_id" id = "m_id"
                   value= "${user.m_id}" style="width:30%;height:35px;color:black;background-color:#E6E6E6;margin-left:100px;text-align:center;border:none;" readonly="readonly" />
                    
               </div>
                <div class="form-group"style="height:30%">
                  <label><h5> 비밀번호 </h5></label>  <input type="password" name="m_pw" id="m_pw"
                   value="${user.m_pw}" style="width:30%;height:35px;background-color:#E6E6E6;margin-left:90px;text-align:center;border:none;" readonly="readonly" />
               </div>
               <div class="form-group" style="height:30%">
                  <label><h5> 비밀번호 확인 </h5></label>  <input type="password" name="password2" id="password2"
                     value="${user.m_pw}" style="width:30%;height:35px;background-color:#E6E6E6;margin-left:45px;text-align:center;border:none;" readonly="readonly" />
               </div>
                   <div class="form-group"style="height:30%">
                  <label><h5> 이   름 </h5></label>  <input type="text" name="m_name" id="m_name"
                    value="${user.m_name}" style="width:30%;height:35px;background-color:#E6E6E6;margin-left:125px;text-align:center;border:none;" minlength="2"/>
               </div>
                <div class="form-group"style="height:30%">
                  <label><h5> 닉 네 임 </h5></label>  <input type="text" name="m_ename" id="m_ename"
                    value="${user.m_ename}" value="${user.m_ename}" style="width:30%;height:35px;color:black;background-color:#E6E6E6;margin-left:100px;text-align:center;border:none;" minlength="2" readonly="readonly" />
               </div>
                   <div class="form-group"style="height:30%">
                  <label><h5> 이 메 일 </h5></label>  <input type="text" name="m_email" id="m_email"
                    value="${user.m_email}" style="width:30%;height:35px;color:black;background-color:#E6E6E6;margin-left:100px;text-align:center;border:none;" readonly="readonly" />
               </div>
                   <div class="form-group"style="height:30%">
                  <label><h5> 전화번호 </h5></label>  <input type="text" name="m_tel" id="m_tel"
                    value="${user.m_tel}" style="width:30%;height:35px;color:black;background-color:#E6E6E6;margin-left:90px;text-align:center;border:none;" readonly="readonly" />
               </div>
                  <div class="form-group"style="height:30%">
                  <br><label><h5>광고수신 약관 동의(선택)</h5></label><br>
               <textarea id="adv" name="adv" rows="5" style="width:500px;border:none;font-size:0.8em;" readonly>
* 홍보 및 마케팅에 관한 동의 *
- 해당 사이트에 "개인정보 보호법"에 따라 동의를 얻어 아래와 같이 서비스의 홍보및 마케팅을 위한 개인정보를 수집,이용합니다.
- 수집 목적 : 웹 매거진 발송(월 1회)/SMS를 통한 이벤트 참여 기회 제공
- 수집 항목(보유기간) : 이메일(수집일로부터 1년)/ 휴대전화번호(수집일로부터 6개월)
*귀하의 개인정보 수집,이용에 동의하지 않을 권리가 있으며, 동의를 거부할 경우에는 내용 관련 서비스를 받을 수 없습니다.</textarea>
<br><input type=text value="현재동의현황(1:동의, 2:거부): ${user.m_adv_yn}" style="width:30%;height:30px;color:green;background-color:#FFFFFF;text-align:center;border:none;margin-top:10px;margin-bottom:10px;font-size:0.7em;"/>
               </div>
            </div>
         </div>
         
         <div class="box-footer" style="margin-top:10px;margin-left:300px;">
           <button class="btn btn-primary" onclick="location.href='mngpage'">취소</button>
            <button class="btn btn-warning">수정</button>
			</div>
            </div>            
       </section>
      
<script>

	
$(function(){
    //수정 버튼을 눌렀을 때 처리 
    $(".btn-warning").click(function(){    		
    	var id = document.getElementById("m_id").value;
    	location.href="perupdate?m_id=" + id;
    });
})   
</script> 



</div>
</div>
</body>
</body>
</html>