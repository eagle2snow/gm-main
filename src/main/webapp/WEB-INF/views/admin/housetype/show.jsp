<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<title>户型修改</title>

<%@ include file="/common/admin/head.jsp"%>
<style>
.form-control[disabled], .form-control[readonly], fieldset[disabled] .form-control
	{
	background-color: #fff;
	border: 0px solid;
}

.pt {
	padding-top: 7px;
}
.b0{
 border: 0; 

}
</style>
</head>

<body>
	<section class="content">
		<form class="form-horizontal" method="post" id="form-admin-add">
			<input disabled="disabled"type="hidden" name="id" value="${model.id}" />
			<div class="row">
				<div class="col-md-12">

					<div class="box box-info">
						<div class="box-header with-border">
							<h3 class="box-title"></h3>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label"><i class="red">*</i>名称:</label>
							<div class="col-sm-8">
								<input disabled="disabled"type="text" class="form-control" value="${model.name}" placeholder="名称" id="name"
									name="name" datatype="*" errormsg="请输入名称" />
							</div>
						</div>



						<div class="form-group">
							<label class="col-sm-2 control-label">楼盘:</label>
							<div class="col-sm-8 pt">
								 ${model.premise.name}
							</div>
						</div>

						<div class="form-group">
							<label class="col-sm-2 control-label">室:</label>
							<div class="col-sm-8">
								<input disabled="disabled"type="text" class="form-control" value="${model.shi}" placeholder="室" id="shi"
									name="shi" />
							</div>
						</div>


						<div class="form-group">
							<label class="col-sm-2 control-label">厅:</label>
							<div class="col-sm-8">
								<input disabled="disabled"type="text" class="form-control" value="${model.ting}" placeholder="厅" id="ting"
									name="ting" />
							</div>
						</div>

						<div class="form-group">
							<label class="col-sm-2 control-label">卫:</label>
							<div class="col-sm-8">
								<input disabled="disabled"type="text" class="form-control" value="${model.wei}" placeholder="卫" id="wei"
									name="wei" />
							</div>
						</div>
						
						<div class="form-group">
							<label class="col-sm-2 control-label">阳台:</label>
							<div class="col-sm-8">
								<input disabled="disabled" type="text" class="form-control" value="${model.yang}"
									placeholder="阳台" id="yang" name="yang" />
							</div>
						</div>

						<div class="form-group">
							<label class="col-sm-2 control-label">面积（m<sup>2</sup>）:
							</label>
							<div class="col-sm-8">
								<input disabled="disabled"type="text" class="form-control" value="${model.area}" placeholder="请填整数" id="area"
									datatype="n" name="area" />
							</div>
						</div>


						<div class="form-group">
							<label class="col-sm-2 control-label">朝向:</label>
							<div class="col-sm-8 pt" >
								<c:choose>
									<c:when test="${(model.face==1)}">  
									         朝东
									   </c:when>
									<c:when test="${(model.face==2)}">  
									           朝南
									   </c:when>
									<c:when test="${(model.face==3)}">  
									            朝西
									   </c:when>
									<c:when test="${(model.face==4)}">  
									            朝北
									   </c:when>
									<c:when test="${(model.face==5)}">  
									            东南
									   </c:when>
									<c:when test="${(model.face==6)}">  
									            东北
									   </c:when>
									<c:when test="${(model.face==7)}">  
									          西南
									   </c:when>
									<c:when test="${(model.face==8)}">  
									          西北
									   </c:when>
									<c:when test="${(model.face==9)}">  
									          南北通透
									   </c:when>
								
								</c:choose>

							</div>
						</div>

						<div class="form-group">
							<label class="col-sm-2 control-label">层高:</label>
							<div class="col-sm-8">
								<input disabled="disabled"type="text" class="form-control" value="${model.height}" placeholder="层高" id="height"
									name="height" />
							</div>
						</div>

						<div class="box-body">
							<div class="form-group">
								<label class="col-sm-2 control-label">户型图:</label>
								<div class="col-sm-8">
 
									<div style="overflow: hidden;" class="pic">

										<div class="showimg-box pull-left">
											<div class="showimg">
												<img src="${model.pic}" width="80" height="60" onclick="adminShowPic(this)">
											</div>
											 
										</div>


									</div>
								</div>
							</div>
						</div>

						<div class="box-body">
							<div class="form-group">
								<label class="col-sm-2 control-label">样板图:</label>
								<div class="col-sm-8">
									 
									<div style="overflow: hidden;" class="pics">

										<c:forEach items='${fn:split(model.pics,"|")}' var='p'>
											<div class="showimg-box pull-left">
												<div class="showimg">
													<img src='${p}' width="80" height="60" onclick="adminShowPic(this)">
												</div>
												 
											</div>
										</c:forEach>


									</div>
								</div>
							</div>
						</div>

						<div class="form-group">
							<label class="col-sm-2 control-label">户型介绍:</label>
							<div class="col-sm-8 pt">${model.content}</div>
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
				//在表单提交执行验证之前执行的函数，curform参数是当前表单对象。
				//这里明确return false的话将不会继续执行验证操作;	
			},
			beforeSubmit : function(curform) {
				//在验证成功后，表单提交前执行的函数，curform参数是当前表单对象。
				//这里明确return false的话表单将不会提交;
				var time = $('.auto-kal');
			},
			callback : updateResult
		});

		var ue = UE.getEditor('content');
	</script>
</body>
</html>

