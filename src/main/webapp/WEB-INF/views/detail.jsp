<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<%@ page session="true" %>
<!DOCTYPE html>
<!--
This is a starter template page. Use this page to start your new project from
scratch. This page gets rid of all links and provides the needed markup only.
-->
<html>
<%@ include file="include/head.jsp" %>
<%@ include file="include/header.jsp" %>
<%@ include file="include/plug_in.jsp" %>
<script>

	//ajax를 통한 댓글 기능 작성하기
	$(document).ready(function(){
		console.log('ajax text ready~~');
		//댓글 목록 불러오는 ajax
		replylist();
		
//		세개다 같은거!!!
//		$('#btnReplySave').click(function()){
//		$('#btnReplySave').on('click',function()){ 
		$(document).on('click','#btnReplySave',function(){
			var rememo = $("#rememo").val();
			var rewriter = $("#rewriter").val();
			
			var url = "${pageContext.request.contextPath}/board/reply2";	//ajax 사용
			var paramData = {
					"rememo" 	: rememo,
					"rewriter"	: rewriter,
					"bno"		: '${board.bno}'
				}
			
			$.ajax({
				url: url,
				data: paramData,
				dataType: 'json',
				type: 'POST',
				success:function(result){
					replylist();
					$("#rememo").val('');
					$("#rewriter").val('');
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
				"BD_NUM" : "${board.BD_NUM}"
		};
		
		$.ajax({
			url:url,
			data:paramData,
			dataType:'json',
			type:'POST',
			success: function(result){

				var htmls = "";	//문서꾸미기
				if(result.length < 1) {
					htmls += '<h3>댓글이 없습니다</h3>';
				} else {
					$(result).each(function(){
						htmls = htmls + '<div class="" id="reno' +this.reno + '">';	
						//ajax에서는 div별로 개별 아이디가 부여되어야함.!!!!!!!!!!!!!!!!!!! 
                        //<div id="reno12"> <div id="reno13">
				       htmls += '<span class="d-block">';
				       htmls += this.reno + ' - ';
				       htmls += '<strong class="text-gray-dark">' + this.rewriter + '</strong>';
				       htmls += '<span style="padding-left: 7px; font-size: 9pt">';
				       htmls += '<a href="javascript:void(0)" onclick="fn_editReply(' + this.reno + ', \'' + this.rewriter + '\', \'' + this.rememo + '\' )" style="padding-right:5px">수정</a>';
				       htmls += '<a href="javascript:void(0)" onclick="fn_deleteReply(' + this.reno + ')" >삭제</a>';
				       htmls += '</span>';
				       htmls += '</span><br>';
				       htmls += this.rememo;
				       htmls += '</p>';
				       htmls += '</div>';   
					});
				}
				$("#replylist").html(htmls);	//댓글위치에 html로 보여주기
			},
			error:function(result){
				alert("실패");
			}
			
		});
		
	}

	//댓글 수정하기(form)
	function fn_editReply(reno, rewriter, rememo) {
		
		var htmls = "";
		htmls = htmls + '<div class="" id="reno' +reno + '">';	
		htmls += '<span class="d-block">';
		htmls += reno + ' - ';
		htmls += '<strong class="text-gray-dark">' + rewriter + '</strong>';
		htmls += '<span style="padding-left: 7px; font-size: 9pt">';
		htmls += '<a href="javascript:void(0)" onclick="fn_updateReply(' + reno + ', \'' + rewriter + '\')" style="padding-right:5px">저장</a>';
		htmls += '<a href="javascript:void(0)" onclick="replylist()" >취소</a>';
		htmls += '</span>';
		htmls += '</span><br>';
		htmls += '<textarea id="editmemo" name="editmemo" rows="3">';
		htmls += rememo;
		htmls += '</textarea>';
		htmls += '</p>';
		htmls += '</div>';
		//선택한 요소를 다른것으로 바꿉니다.(변경)
		$('#reno'+reno).replaceWith(htmls);
		$('#reno'+reno+'#editmemo').focus();
	}
	
	//댓글 수정하기(처리)
	function fn_updateReply(reno,rewriter){
		var editmemo = $('#editmemo').val();
		const url = "${pageContext.request.contextPath}/board/replyupdate2";
		var paramData = {
				"reno" : reno,
				"rewriter" : rewriter,
				"rememo" : editmemo
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
	function fn_deleteReply(reno){
		const url = "${pageContext.request.contextPath}/board/replydelete2";
		var paramData = {
				"reno" : reno
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
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">

  <!-- Main Header -->
  
  <%@ include file="include/main_header.jsp" %>
  
  <!-- Left side column. contains the logo and sidebar -->

  <%@ include file="include/left_column.jsp" %>
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        Page Header
        <small>Optional description</small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Level</a></li>
        <li class="active">Here</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content container-fluid">
	<div class="box-header with-border">
		<c:if test="${user==null }">
		<a href="${contextPath}/board/login"> <h3 class="box-title">로그인</h3></a>
		</c:if>
		<c:if test="${user!=null }">
		${user.name }님 환영합니다. <br />
		<a href="${contextPath}/board/logOut"> <h3 class="box-title">로그아웃</h3></a>
		</c:if>
	</div>
	<div class="box">
			<div class="box-header">
				<h3 class="box-title">상세보기</h3>
			</div>
			<div class="box-body">
				<div class="form-group">
					<label>제목</label> <input type="text" name="title"
						class="form-control" value="${board.title}" readonly="readonly" />
				</div>

				<div class="form-group">
					<label>내용</label>
					<textarea name="content" rows="5" readonly="readonly"
						class="form-control">${board.content}</textarea>
				</div>

				<div class="form-group">
					<label>작성자</label> <input type="text" name="id"
						class="form-control" value="${board.id}" readonly="readonly" />
				</div>
			</div>

		</div>
		<div class="box-footer">
			<button class="btn btn-success">메인</button>
			<button class="btn btn-warning">수정</button>
			<button class="btn btn-danger">삭제</button>
			<button class="btn btn-primary">목록</button>
			<button class="btn btn-info">댓글작성</button>
		</div>
		<div>
		         <div class="box-body">
		         <table>
		         <tr>
		         <td rowspan="2" width="70%">
		         <textarea class="form-control" name="rememo" id="rememo" placeholder="댓글을 입력하세요"></textarea>
		         </td>
		         <td><input type="text" name="rewriter" id="rewriter" placeholder="댓글작성자"></td>
		         </tr>
		         <tr>
		            <td><button type="button" id="btnReplySave">저장</button></td>
		         </tr>
		      </table>
		         
		         </div>
		      </div>
		      <hr><p></p>
		      <div id="replylist">
		      </div>
		</div>
    </section>
    <script>
	$(function(){
		//메인 버튼을 눌렀을 때 처리
		$(".btn-success").click(function(){
			location.href="../";
		});
		//목록 버튼을 눌렀을 때 처리
		$(".btn-primary").click(function(){
			location.href="list?bno=" + ${board.bno};
		});
		//삭제 버튼을 눌렀을 때 처리
		$(".btn-danger").click(function(){
			location.href="delete?bno=" + ${board.bno};
		});
		//수정 버튼을 눌렀을 때 처리
		$(".btn-warning").click(function(){
			alert("???");
			location.href="update?bno=" + ${board.bno};
		});
		//댓글작성 버튼을 눌렀을 때 처리
		$(".btn-info").click(function() {
			location.href = "reply?bno=" + ${board.bno};
		});
	})
	</script>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->

  <!-- Main Footer -->
  <%@ include file="include/main_footer.jsp" %>

  <!-- Control Sidebar -->
  <aside class="control-sidebar control-sidebar-dark">
    <!-- Create the tabs -->
    <ul class="nav nav-tabs nav-justified control-sidebar-tabs">
      <li class="active"><a href="#control-sidebar-home-tab" data-toggle="tab"><i class="fa fa-home"></i></a></li>
      <li><a href="#control-sidebar-settings-tab" data-toggle="tab"><i class="fa fa-gears"></i></a></li>
    </ul>
    <!-- Tab panes -->
    <div class="tab-content">
      <!-- Home tab content -->
      <div class="tab-pane active" id="control-sidebar-home-tab">
        <h3 class="control-sidebar-heading">Recent Activity</h3>
        <ul class="control-sidebar-menu">
          <li>
            <a href="javascript:;">
              <i class="menu-icon fa fa-birthday-cake bg-red"></i>

              <div class="menu-info">
                <h4 class="control-sidebar-subheading">Langdon's Birthday</h4>

                <p>Will be 23 on April 24th</p>
              </div>
            </a>
          </li>
        </ul>
        <!-- /.control-sidebar-menu -->

        <h3 class="control-sidebar-heading">Tasks Progress</h3>
        <ul class="control-sidebar-menu">
          <li>
            <a href="javascript:;">
              <h4 class="control-sidebar-subheading">
                Custom Template Design
                <span class="pull-right-container">
                    <span class="label label-danger pull-right">70%</span>
                  </span>
              </h4>

              <div class="progress progress-xxs">
                <div class="progress-bar progress-bar-danger" style="width: 70%"></div>
              </div>
            </a>
          </li>
        </ul>
        <!-- /.control-sidebar-menu -->

      </div>
      <!-- /.tab-pane -->
      <!-- Stats tab content -->
      <div class="tab-pane" id="control-sidebar-stats-tab">Stats Tab Content</div>
      <!-- /.tab-pane -->
      <!-- Settings tab content -->
      <div class="tab-pane" id="control-sidebar-settings-tab">
        <form method="post">
          <h3 class="control-sidebar-heading">General Settings</h3>

          <div class="form-group">
            <label class="control-sidebar-subheading">
              Report panel usage
              <input type="checkbox" class="pull-right" checked>
            </label>

            <p>
              Some information about this general settings option
            </p>
          </div>
          <!-- /.form-group -->
        </form>
      </div>
      <!-- /.tab-pane -->
    </div>
  </aside>
  <!-- /.control-sidebar -->
  <!-- Add the sidebar's background. This div must be placed
  immediately after the control sidebar -->
  <div class="control-sidebar-bg"></div>
</div>
<!-- ./wrapper -->

</body>
</html>