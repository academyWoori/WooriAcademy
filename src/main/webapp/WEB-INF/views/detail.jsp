<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<%@ page session="true" %>
<%@ include file="include/head.jsp" %>
<%@ include file="include/header.jsp" %>
<%@ include file="include/plug_in.jsp" %>

<!DOCTYPE html>

<html>

<style>
#detail_wrap0{
   width:15%;
   margin:auto; /*가운데 정렬*/
}


#detail_wrap1{
   width:70%;
   margin:auto; /*가운데 정렬*/
}

#detail_wrap2{
   width:15%;
   margin:auto; /*가운데 정렬*/
}

#detail_box2{
   width:100%;
   height:450px;
   float:left;

}
#detail_box3{
   width:15%;
   height:180px;
   float:left;
}

#detail_box4{
   width:70%;
   height:180px;
   float:left;

}


</style>


<script>


$(function(){
   
})

   //ajax를 통한 댓글 기능 작성하기
   $(document).ready(function(){
      console.log('ajax text ready~~');
      //댓글 목록 불러오는 ajax
      replylist();
      
//      세개다 같은거!!!
//      $('#btnReplySave').click(function()){
//      $('#btnReplySave').on('click',function()){ 
      $(document).on('click','#btnReplySave',function(){
         var comm_con = $("#comm_con").val();
         var m_id = $("#m_id").val();
         var m_ename = document.getElementById("m_ename").value;
         
         var url = "${pageContext.request.contextPath}/board/reply2";   //ajax 사용
         var paramData = {
               "comm_con"    : comm_con,
               "m_ename"   : m_ename,
               "m_id" : m_id,
               "bd_num" : '${board.bd_num}'
            }
         
         $.ajax({
            url: url,
            data: paramData,
            dataType: 'json',
            type: 'POST',
            success:function(result){
               replylist();
               $("#comm_con").val('');
               $("#m_ename").val('');
               $("#m_id").val('');
            },
            error:function(result){
               alert('에러가 발생했습니다.');
            }
         });
      });
      
   });
   
   //ajax : 댓글 목록 불러오기 -> board/replylist,bno
   function replylist(){
      const url = "${pageContext.request.contextPath}/board/replylist";
      var paramData = {
            "bd_num" : "${board.bd_num}"
      };
      
      $.ajax({
         url:url,
         data:paramData,
         dataType:'json',
         type:'POST',
         success: function(result){

            var htmls = "";   //문서꾸미기
            if(result.length < 1) {
               htmls += '<h3>댓글이 없습니다</h3>';
            } else {
               $(result).each(function(){
                  htmls = htmls + '<div class="" id="comm_num' + this.comm_num + '">';   
                  //ajax에서는 div별로 개별 아이디가 부여되어야함.!!!!!!!!!!!!!!!!!!! 
                        //<div id="reno12"> <div id="reno13">
                   htmls += '<span class="d-block">';
                   htmls += this.comm_num + ' - ';
                   htmls += '<strong class="text-gray-dark">' + this.m_ename + '</strong>';
                   htmls += '<span style="padding-left: 7px; font-size: 9pt">';
                   htmls += '<a href="javascript:void(0)" onclick="fn_editReply(' + this.comm_num + ', \'' + this.m_ename + '\', \'' + this.comm_con + '\' )" style="padding-right:5px">수정</a>';
                   htmls += '<a href="javascript:void(0)" onclick="fn_deleteReply(' + this.comm_num + ')" >삭제</a>';
                   htmls += '</span>';
                   htmls += '</span><br>';
                   htmls += this.comm_con;
                   htmls += '</p>';
                   htmls += '</div>';   
               });
            }
            $("#replylist").html(htmls);   //댓글위치에 html로 보여주기
         },
         error:function(result){
            //alert("실패");
         }
         
      });
      
   }

   //댓글 수정하기(form)
   function fn_editReply(comm_num, m_ename, comm_con) {
      
      var htmls = "";
      htmls = htmls + '<div class="" id="comm_num' + comm_num + '">';   
      htmls += '<span class="d-block">';
      htmls += comm_num + ' - ';
      htmls += '<strong class="text-gray-dark">' + m_ename + '</strong>';
      htmls += '<span style="padding-left: 7px; font-size: 9pt">';
      htmls += '<a href="javascript:void(0)" onclick="fn_updateReply(' + comm_num + ', \'' + m_ename + '\')" style="padding-right:5px">저장</a>';
      htmls += '<a href="javascript:void(0)" onclick="replylist()" >취소</a>';
      htmls += '</span>';
      htmls += '</span><br>';
      htmls += '<textarea id="editmemo" name="editmemo" rows="3">';
      htmls += comm_con;
      htmls += '</textarea>';
      htmls += '</p>';
      htmls += '</div>';
      //선택한 요소를 다른것으로 바꿉니다.(변경)
      $('#comm_num'+comm_num).replaceWith(htmls);
      $('#comm_num'+comm_num+'#editmemo').focus();
   }
   
   //댓글 수정하기(처리)
   function fn_updateReply(comm_num,m_ename){
      var editmemo = $('#editmemo').val();
      var m_id = $("#m_id").val();
      var m_ename = document.getElementById("m_ename").value;
      const url = "${pageContext.request.contextPath}/board/replyupdate2";
      var paramData = {
            "comm_num" : comm_num,
            "m_ename" : m_ename,
            "m_id" : m_id,
            "comm_con" : editmemo        
      };
      
      $.ajax({
         url:url,
         data:paramData,
         dataType: 'json',
         type: 'POST',
         success:function(result){
            console.log(result);
            replylist();
         },
         error:function(result){
            console.log(result);
            alert("에러가 발생했습니다");
         }
      });
   }
   
   //댓글 삭제하기(처리)
   function fn_deleteReply(comm_num){
      const url = "${pageContext.request.contextPath}/board/replydelete2";
      var paramData = {
            "comm_num" : comm_num
      };
      
      $.ajax({
         url:url,
         data:paramData,
         dataType: 'json',
         type: 'POST',
         success:function(result){
            console.log(result);
            replylist();
         },
         error:function(result){
            console.log(result);
            alert("에러가 발생했습니다");
         }
      });
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
<body>

<!-- title Start -->
   <div class="container-fluid bg-primary py-5 bg-header" >
         <div class="col-2 pt-lg-2 mt-lg-2 text-center">       
          </div>
   </div>
    <div class="container-fluid py-5 wow fadeInUp" data-wow-delay="0.1s" >
            <div class="section-title text-center position-relative pb-3 mb-5 mx-auto" style="max-width:500px;text-align:left;" >
                <h1 class="mb-0">${board.bd_tl}</h1>
            </div>
   </div>
<!-- title end-->
   <div id="detail_wrap0" class="box" ></div>
   <div id="detail_wrap1" class="box" >
         <div id="detail_box2" class="box-body">  
            <div class="form-group" style="text-align:right">
           	   <label><h6>글 번호 : ${board.bd_num}　　　</h6></label>
               <label><h6>작성자 : ${board.m_ename}　　</h6></label>
               <label><h6>추천 : ${board.bd_recomm}　　</h6></label>
               <label><h6>조회수 : ${board.bd_ref}　　</h6></label>
               <label><h6>${board.bd_dt}</h6></label>
            </div>
          <div class="form-group">
             <textarea name="bd_con" id="bd_con" rows="16" readonly="readonly" class="form-control">${board.bd_con}</textarea>
          </div>   
       </div>  
           <div class="box-footer">
              
              <button class="btn btn-list">목록</button>
              <button class="btn btn-up" id="rec_update">추천하기</button>
 
              <div style="float:right">
               <button class="btn btn-warning">수정</button>
               <button class="btn btn-danger">삭제</button>
               </div>
          </div>
         <br><br>
            <div class="box-body"style="height:10%">
               <table>
                  <tr>
                     <td rowspan="3" width="800px">
                     <textarea class="form-control" name="comm_con" id="comm_con" placeholder="댓글을 입력하세요"></textarea>

                     </td>
                  </tr>
                  <tr>
                     <td><button type="button" id="btnReplySave" style="width:90px; height:60px;">등록</button></td>
                     <td><input type="hidden" name="m_id" id="m_id" value="${user.m_id}"></td>
                     <td><input type="hidden" name="m_ename" id="m_ename" value="${user.m_ename}"></td>
                     <td><input type="hidden" name="bd_group" id="bd_group" value="${board.bd_group}"></td>
                     <td><input type="hidden" name="bd_recomm" id="bd_recomm" value="${board.bd_recomm}"></td>
                  </tr>
               </table>  
            </div>
            <hr><p></p>
            <div id="replylist"></div>
   </div>

            
       

<script>



   $(function(){
      
	  //목록 버튼을 눌렀을 때 처리
	  $(".btn-list").click(function(){
		  location.href="pageList?bd_group=" + ${board.bd_group};
      });

      //삭제 버튼을 눌렀을 때 처리
      $(".btn-danger").click(function(){
         location.href="delete?bd_num=" + ${board.bd_num};
      });
      //수정 버튼을 눌렀을 때 처리
      $(".btn-warning").click(function(){
         location.href="update?bd_num=" + ${board.bd_num};
      });
      //댓글작성 버튼을 눌렀을 때 처리
      $(".btn-info").click(function() {
         location.href = "reply?bd_num=" + ${board.bd_num};
      });
   })
</script>

</body>
</html>