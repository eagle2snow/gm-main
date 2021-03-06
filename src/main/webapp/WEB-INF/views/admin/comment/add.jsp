<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<title>点评新增</title>

<%@ include file="/common/admin/head.jsp"%>

</head>

<body>
	<section class="content">
		<form class="form-horizontal" method="post" id="form-admin-add" action="${adp}add.json">
			<div class="row">
				<div class="col-md-12">

					<div class="box box-info">
						<div class="box-header with-border">
							<h3 class="box-title">添加</h3>
						</div>

						<div class="box-body">
							<div class="form-group">
								<label class="col-sm-2 control-label"><i class="red">*</i>名称:</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" placeholder="名称" id="name" name="name" datatype="*"
										errormsg="请输入名称" />
								</div>
							</div>
						</div>


















						<div class="box-body">
							<div class="form-group">
								<label class="col-sm-2 control-label">内容:</label>
								<div class="col-sm-8">
									<script id="content" name="content" type="text/plain" class="ue-editor"
										style="width: 100%; height: 400px;"></script>
								</div>
							</div>
						</div>






						<div class="box-body">
							<div class="form-group">
								<label class="col-sm-2 control-label">组图:</label>
								<div class="col-sm-8 col-lg-5 col-xs-5">
									<input class="imgs_input" type="file" id='pics' multiple> <input name="pics"
										id="pics_input" type="hidden" />
									<ul class="img_list draglist col-sm-12 pics">
									</ul>
								</div>
							</div>
						</div>



						<div class="box-body">
							<div class="form-group">
								<label class="col-sm-2 control-label">评论人:</label>
								<div class="col-sm-8">
									<select name="user.id" style="width: 100% !important;" class="form-control select2"
										id="user">
										<c:forEach items="${userList}" var="m">

											<option value="${m.id}">
														${m.name}
													</option>
										</c:forEach>
									</select>
								</div>
							</div>
						</div>





						<div class="box-body">
							<div class="form-group">
								<label class="col-sm-2 control-label">模块:</label>
								<div class="col-sm-8">
									<label><input value="1" type="radio" class="minimal" name="model">新房</label> <label><input
										value="2" type="radio" class="minimal" name="model">二手房</label> <label><input
										value="3" type="radio" class="minimal" name="model">租房</label> <label><input
										value="4" type="radio" class="minimal" name="model">民宿</label>
								</div>
							</div>
						</div>



						<div class="box-body">
							<div class="form-group">
								<label class="col-sm-2 control-label">数据id:</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" placeholder="数据id" id="modelId" name="modelId" />
								</div>
							</div>
						</div>



						<div class="box-body">
							<div class="form-group">
								<label class="col-sm-2 control-label"></label>
								<div class="col-sm-8">
									<button type="submit" class="btn_sub btn btn-success">提交</button>
									<button type="button" onClick="closeAll();" class="btn_reset btn btn-primary">关闭</button>
								</div>
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
			callback : addResult
		});

		var ue = UE.getEditor('content');
	</script>
</body>
</html>

