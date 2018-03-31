<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<title>户型新增</title>

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
								<label class="col-sm-2 control-label">楼盘:</label>
								<div class="col-sm-8">
									<select name="premise.id" style="width: 100% !important;" class="form-control select2"
										id="premise">
										<c:forEach items="${premiseList}" var="m">

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
								<label class="col-sm-2 control-label">室:</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" placeholder="室" id="shi" name="shi" />
								</div>
							</div>
						</div>


						<div class="box-body">
							<div class="form-group">
								<label class="col-sm-2 control-label">厅:</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" placeholder="厅" id="ting" name="ting" />
								</div>
							</div>
						</div>


						<div class="box-body">
							<div class="form-group">
								<label class="col-sm-2 control-label">卫:</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" placeholder="卫" id="wei" name="wei" />
								</div>
							</div>
						</div>
						
						
						<div class="box-body">
							<div class="form-group">
								<label class="col-sm-2 control-label">阳台:</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" placeholder="阳台" id="yang" name="yang" />
								</div>
							</div>
						</div>


						<div class="box-body">
							<div class="form-group">
								<label class="col-sm-2 control-label">面积（m<sup>2</sup>）:
								</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" placeholder="请填整数" id="area" datatype="n"
										name="area" />
								</div>
							</div>
						</div>

						<div class="box-body">
							<div class="form-group">
								<label class="col-sm-2 control-label">朝向:</label>
								<div class="col-sm-8">
									<select name="face" style="width: auto !important;" class="form-control select2" id="face">
										<option value="1">朝东</option>
										<option value="2">朝南</option>
										<option value="3">朝西</option>
										<option value="4">朝北</option>
										<option value="5">东南</option>
										<option value="6">东北</option>
										<option value="7">西南</option>
										<option value="8">西北</option>
										<option value="9">南北通透</option>
									</select>
								</div>
							</div>
						</div>


						<div class="box-body">
							<div class="form-group">
								<label class="col-sm-2 control-label">层高:</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" placeholder="层高" id="height" name="height" />
								</div>
							</div>
						</div>

						<div class="box-body">
							<div class="form-group">
								<label class="col-sm-2 control-label">户型图:</label>
								<div class="col-sm-8">


									<input class="file" type="file" id='pic'> <input name="pic" id="pic_input"
										type="hidden" />
									<div style="overflow: hidden;" class="pic"></div>
								</div>
							</div>
						</div>

						<div class="box-body">
							<div class="form-group">
								<label class="col-sm-2 control-label">样板图:</label>
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
								<label class="col-sm-2 control-label">户型介绍:</label>
								<div class="col-sm-8">
									<script id="content" name="content" type="text/plain" class="ue-editor"
										style="width: 100%; height: 400px;"></script>
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

