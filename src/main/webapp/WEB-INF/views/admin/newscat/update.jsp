<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<title>资讯分类修改 </title>

<%@ include file="/common/admin/head.jsp"%>


</head>

<body>
	<section class="content">
	<form class="form-horizontal" method="post" id="form-admin-add" action="${adp}update.json">
		<input type="hidden" name="id" value="${model.id}"/>	
		<div class="row">
			<div class="col-md-12">
			
			<div class="box box-info">
					<div class="box-header with-border">
						<h3 class="box-title">编辑</h3>
					</div>
							<div class="form-group">
								<label class="col-sm-2 control-label"><i class="red">*</i>名称:</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" value="${model.name}"
							        placeholder="名称" id="name" name="name" datatype="*" errormsg="请输入名称"         />
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
					</div> 
				</div>
	</form>
</section>	
			<%@ include file="/common/admin/my_js.jsp"%>
				 

	<script>
		 $(".form-horizontal").Validform({
			btnSubmit: ".btn_sub",
			btnReset: ".btn_reset",
			tiptype: 3,
			ignoreHidden: false,
			dragonfly: false,
			tipSweep: true,
			label: ".label",
			showAllError: false,
			postonce: true,
			ajaxPost: true,
			beforeCheck: function (curform) {
			},
			beforeSubmit: function (curform) {
			},	
			callback : updateResult
		});
				
	</script>	
	</body>
</html>
					
