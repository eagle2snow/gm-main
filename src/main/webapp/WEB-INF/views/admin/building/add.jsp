<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<title>楼栋新增</title>

<%@ include file="/common/admin/head.jsp"%>
<style type="text/css">
.ht {
	margin-top: 5px;
	margin-left: 5px;
	margin-right: 5px;
	border: 1px solid #e5e5e5;
}

.ht img {
	width: 100px;
	height: 100px;
	margin: 10px;
}

.hht {
	border: 1px solid red;
}
</style>
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
								<label class="col-sm-2 control-label">编号:</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" placeholder="编号" id="code" name="code" />
								</div>
							</div>
						</div>

						<div class="box-body">
							<div class="form-group">
								<label class="col-sm-2 control-label">所在楼盘:</label>
								<div class="col-sm-8">
									<select name="premise.id" style="width: 100% !important;" onchange="selectVal(this.value)"
										class="form-control select2" id="premise">
										<option value="">--请选择--</option>
										<c:forEach items="${premiseList}" var="m">
											<option value="${m.id}">${m.name}</option>
										</c:forEach>
									</select>
								</div>
							</div>
						</div>



						<div class="box-body">
							<div class="form-group">
								<label class="col-sm-2 control-label">包含户型:</label>
								<div class="col-sm-8">
									<ul id="hts">

									</ul>
								</div>
							</div>
							<input type="hidden" name="houseTypeIds" id="houseTypeIds" />
						</div>



						<div class="box-body">
							<div class="form-group">
								<label class="col-sm-2 control-label">楼层数:</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" placeholder="楼层数" id="floorCount" name="floorCount" />
								</div>
							</div>
						</div>

						<div class="box-body">
							<div class="form-group">
								<label class="col-sm-2 control-label">房屋数量:</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" placeholder="房屋数量" id="houseCount"
										name="houseCount" />
								</div>
							</div>
						</div>

						<div class="box-body">
							<div class="form-group">
								<label class="col-sm-2 control-label">单元数量:</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" placeholder="单元数量" id="apartCount"
										name="apartCount" />
								</div>
							</div>
						</div>

						<div class="box-body">
							<div class="form-group">
								<label class="col-sm-2 control-label">物业类型:</label>
								<div class="col-sm-8">
									<select name="useType" style="width: auto !important;" class="form-control select2"
										id="useType">
										<option value="1">住宅</option>
										<option value="2">别墅</option>
										<option value="3">商住</option>
										<option value="4">商铺</option>
										<option value="5">其他</option>
									</select>
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
									</select>
								</div>
							</div>
						</div>

						<div class="box-body">
							<div class="form-group">
								<label class="col-sm-2 control-label">高度:</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" placeholder="高度" id="height" name="height" />
								</div>
							</div>
						</div>

						<div class="box-body">
							<div class="form-group">
								<label class="col-sm-2 control-label">建成时间:</label>
								<div class="col-sm-8">

									<input type="text" class="form-control" placeholder="建成日期" id="builtDate" name="builtDate" />

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

				//在表单提交执行验证之前执行的函数，curform参数是当前表单对象。
				//这里明确return false的话将不会继续执行验证操作;	
			},
			beforeSubmit : function(curform) {
				var imgids = [];
				$.each($("#hts .hht"), function(index, item) {
					imgids.push($(item).attr("rel"))
				});
				$("#houseTypeIds").val(imgids.join(","));
			},
			callback : addResult
		});

		var ue = UE.getEditor('content');

		function selectVal(id) {
			$
					.getJSON(
							'${adp}getHouseType/' + id,
							function(res) {
								var ht = '<div style="color:red;">此楼盘没有添加户型</div>';
								if (res.length > 0) {
									ht = "";
									$
											.each(
													res,
													function(i, t) {
														ht += '<li class="col-sm-3 text-center ht" lang = "0" rel="'+t.id+'"><img src="'+t.pic+'"> <p>'
																+ t.name
																+ '</p> </li>';
													});
								}
								$("#hts").html(ht);
								init();
							});
		}

		function init() {
			$("#hts li").bind("click", function() {
				if (this.lang == 1) {
					$(this).removeClass("hht");
					$(this).attr("lang", 0);
				} else {
					$(this).addClass("hht");
					$(this).attr("lang", 1);
				}
			});
		}
	</script>
</body>
</html>

