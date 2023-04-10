<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<%@ page session="true" %>
<%@ include file="include/head.jsp" %>
<%@ include file="include/header.jsp" %>



<!DOCTYPE html>
<html >

    
 <body>
 
<!-- title Start -->
	<div class="container-fluid bg-primary py-5 bg-header" >
		   <div class="col-2 pt-lg-2 mt-lg-2 text-center">       
          </div>
	</div>
    <div class="container-fluid py-5" >
            <div class="section-title text-center position-relative pb-3 mb-5 mx-auto" style="max-width:500px;text-align:left;" >
                <h1 class="mb-0">회원정보변경</h1>
            </div>
   </div>
<!-- title end-->
    
    <!-- Quote Start -->
   <form role="form" name="m_imformation" method="post" >
    <div class="container-fluid py-2" >
        <div class="container py-2">
            <div class="row g-2">

                <div class="col-lg-9">
                    <div class="bg-primary rounded h-100 d-flex align-items-center p-5" style="margin-left:310px;" >                    

                            <div class="row g-3">
                            <div>
                             <label style="color:black">아이디　  :　</label>
                        <input type="text" id="m_id" name="m_id" value="${user.m_id}" style="width:40%;color:black;margin-left:50px;text-align:center;border:none;" readonly>
                      </div>
                      <div>
                             <label style="color:black">비밀번호　  :　</label>
                        <input type="password" id="m_pw" name="m_pw" onclick="pass_click();" style="width:40%;color:red;margin-left:35px;text-align:center;background-color:#CEECF5;border:none;">
                      </div>
                      <div>
                              <label style="color:black">비밀번호 확인 : </label>
                        <input type="password" id="password2" name="password2" onclick="pass_click();" style="width:40%;color:black;margin-left:30px;text-align:center;border:none;">
                        <font name="passcheck" size="2"></font>
                      </div>               
                     
                                <div class="col-xl-12">
                                    <label style="color:black">닉네임            　:　</label>
                              <input type="text" id="m_ename" name="m_ename" value="${user.m_ename}" style="width:40%;color:black;margin-left:50px;text-align:center;border:none;" minlength="2" >
                                </div>
                                
                                <div class="col-xl-12">
                                    <label style="color:black">이름            　:　</label>
                              <input type="text" id="m_name" name="m_name" value="${user.m_name}" onclick="name_click();" style="width:40%;color:black;margin-left:65px;text-align:center;border:none;" minlength="2" >
                                </div>
                                
                                <div class="col-12">
                                
                      		<!-- 핸드폰번호 -->
                           <div class="box-group">
                              <label style="color:black;border:none;"> 핸드폰번호　:　</label>
                              <select id='tel1' name='tel1' style="width:70px; height:32;margin-left:20px;border:none;">
                                 <option value="010">010</option>
                                 <option value="011">011</option>
                                 <option value="016">016</option>
                                 <option value="017">017</option>
                                 <option value="019">019</option>
                              </select> - 
                              <input type='text' id='tel2' name='tel2' minlength="12" maxlength="13" style="width:70px; height:28;border:none;" value="${user.m_tel}" > - 
                              <input type='text' id='tel3' name='tel3' minlength="4" maxlength="4" style="width:70px; height:28;border:none;">
                              <input type='hidden' id='p_tel' name='p_tel'>
                           </div>
                           <!-- 생년월일 -->
				             <div class="box-group"><br>
				               <label style="color:black">주민등록번호　</label>
				               <input type="text" id="m_birth" name="m_birth" value="${user.m_birth}" minlength="6" maxlength="6" style="width:150px; height:28;border:none;margin-left:25px;"> - 
				               <input type="text" id="m_gender" name="m_gender" value="${user.m_gender}" minlength="1" maxlength="1" style="width:30px; height:28;border:none;">******
				            </div>
				            <!-- 이메일 --><br>
				            <div class="box-group">
				               <label style="color:black">이메일　　　　</label>
				               <input type="text" id="email1" name="email1" style="width:120px; height:32;border:none;margin-left:25px;"> @ 
				               <input type="text" id="email2" name="email2" style="width:120px; height:32;border:none;">
				               <select id='email3' name='email3' onchange="email_select();" style="width:120px; height:32;border:none;">
				                  <option value="" style="border:none;">직접입력</option>
				                  <option value="gmail.com">gmail.com</option>
				                  <option value="naver.com">naver.com</option>
				                  <option value="daum.net">daum.net</option>
				               </select>
				               <input type="hidden" id="m_email" name="m_email"> 
				            </div>
            
                           </div>
                                <!-- 개인정보 공유에 대한 약관 --><br>
				            <div class="box-group">
				               <label style="color:black;">개인정보 약관 동의(필수)</label><br>
				               <textarea id="info" name="info" rows="3" style="width:520px;border:none;font-size:0.8em;" readonly >
* 개인정보 수집, 이용동의 *
- 해당 사이트에 서비스 회원가입, 고객상담 및 고지사항 전달 등을 위해 아래와 같이 개인정보 수집,이용합니다.
- 수집 목적 : 회원 식별 및 회원제 서비스 제공, 고객 상담 및 관리, 서비스 변경사항 및 고지사항 전달
- 수집 항목 : 아이디, 비밀번호, 전화번호, 이메일, 생년월일
- 수집 근거 : 개인정보 보호법 제 15조 제1항
* 귀하의 해당 사이트의 서비스 이용에 필요한 최소한의 개인정보 수집,이용에 동의하지 않을 수 있으나, 동의를 거부 할 경우 회원제 서비스 이용이 불가합니다.</textarea>								
				               <br><input type="radio" id="m_info_yn" name="m_info_yn" value="1" checked="checked" style="font-size:0.5em;" >해당사항은 회원가입시 이미 동의처리 되었습니다.　
				            </div>
				            <!-- 광고 수신 여부에 대한 약관(선택) --><br>
				            <div class="box-group">
				               <label style="color:black">광고수신 약관 동의(선택)</label><br>
				               <textarea id="adv" name="adv" rows="3" style="width:520px;border:none;font-size:0.8em;" readonly>
* 홍보 및 마케팅에 관한 동의 *
- 해당 사이트에 "개인정보 보호법"에 따라 동의를 얻어 아래와 같이 서비스의 홍보및 마케팅을 위한 개인정보를 수집,이용합니다.
- 수집 목적 : 웹 매거진 발송(월 1회)/SMS를 통한 이벤트 참여 기회 제공
- 수집 항목(보유기간) : 이메일(수집일로부터 1년)/ 휴대전화번호(수집일로부터 6개월)
*귀하의 개인정보 수집,이용에 동의하지 않을 권리가 있으며, 동의를 거부할 경우에는 내용 관련 서비스를 받을 수 없습니다.</textarea>
				               <br><input type="radio" id="m_adv_yn" name="m_adv_yn" value="1" >동의
				               <input type="radio" id="m_adv_yn" name="m_adv_yn" value="2" checked="checked">거부
				            </div><br>
				            <div class="box-footer">           
				               <button type="submit" class="btn btn-primary" style="margin: 20px 10px 1px 173px;padding-top:3px;width:100px;height:28px;">수정완료</button>
				               <button type="button" class="btn btn-primary" style="margin: 20px 10px 1px 2px;padding-top:3px;width:70px;height:28px;" onclick="location.href='${contextPath}/board/login'">취소</button>				              
				            </div>
                          </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
   </form>
    <!-- Quote End -->

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
<%@ include file="include/footer.jsp" %>