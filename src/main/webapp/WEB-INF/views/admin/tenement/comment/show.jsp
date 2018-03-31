<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<title>点评修改</title>

<%@ include file="/common/admin/head.jsp"%>


</head>

<body>
	<section class="content">
		<form class="form-horizontal" method="post" id="form-admin-add" action="${adp}update.json">
			<input type="hidden" name="id" value="${model.id}" />
			<div class="row">
				<div class="col-md-12">

					<div class="box box-info">
						<div class="box-header with-border">
							<h3 class="box-title">查看</h3>
						</div>
						<%-- <div class="form-group">
							<label class="col-sm-2 control-label"><i class="red">*</i>名称:</label>
							<div class="col-sm-8">
								${model.name}
							</div>
						</div> --%>

						<div class="form-group">
							<label class="col-sm-2 control-label">内容:</label>
							<div class="col-sm-8">
								${model.content}
								<ul class="img_list draglist col-sm-12 pics">
									<c:forEach items='${fn:split(model.pics,"|")}' var='p'>
										<li class="col-sm-4"><img class="show" src="${p}" /> </li>
									</c:forEach>
								</ul>
							</div>
						</div>

						<div class="form-group">
							<label class="col-sm-2 control-label">评论人:</label>
							<div class="col-sm-8">
								${model.user.name}
							</div>
						</div>
            			<div class="form-group">
							<label class="col-sm-2 control-label">模块:</label>
							<div class="col-sm-8">
								<c:choose>
									<c:when test="${model.model eq 1}">新房</c:when>
									<c:when test="${model.model eq 2}">二手房</c:when>
									<c:when test="${model.model eq 3}">租房</c:when>
									<c:when test="${model.model eq 4}">民宿</c:when>
								</c:choose>
							</div>
						</div>


			
					</div>
					<!--end .box .box-info -->

				</div>
				<!--end .col-md-12-->
			</div>
			<!-- end .row -->
		</form>
	</section>
	<%@ include file="/common/admin/my_js.jsp"%>


	<script>
		$(".form-horizontal").Validform({
			btnSubmit : ".btn_sub",
			btnReset : ".btn_reset",
			tiptype : 3,
			ignoreHidden : false,
			dragonfly : false,
			tipSweep : true,
			label : ".label",
			showAllError : false,
			postonce : true,
			ajaxPost : true,

			beforeCheck : function(curform) {
			},
			beforeSubmit : function(curform) {
				getImgUrlStr('pics_input');
				var time = $('.auto-kal');
			},
			callback : updateResult
		});

		var ue = UE.getEditor('content');
	</script>
</body>
</html>

