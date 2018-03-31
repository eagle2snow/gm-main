<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<title>资讯修改</title>

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
							<h3 class="box-title">编辑资讯</h3>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label"><i class="red">*</i>标题:</label>
							<div class="col-sm-8">
								<input type="text" class="form-control" value="${model.name}" placeholder="标题" id="name"
									name="name" datatype="*" errormsg="请输入标题" />
							</div>
						</div>

						<div class="form-group">
							<label class="col-sm-2 control-label"><i class="red">*</i>分类:</label>
							<div class="col-sm-8">
								<select name="newsCat.id" style="width: 100% !important;" class="form-control select2"
									id="newsCat">
									<c:forEach items="${newsCatList}" var="m">
										<option ${model.newsCat.id==m.id?'selected':'' } value="${m.id}">
														${m.name}
													</option>
									</c:forEach>
								</select>
							</div>
						</div>

						<div class="form-group">
							<label class="col-sm-2 control-label"><i class="red">*</i>来源:</label>
							<div class="col-sm-8">
								<input type="text" class="form-control" placeholder="来源" id="src" name="src" datatype="*"
									value="${model.src}" errormsg="请输入来源" />
							</div>
						</div>


						<div class="form-group">
							<label class="col-sm-2 control-label"><i class="red">*</i>浏览量:</label>
							<div class="col-sm-8">
								<input type="text" class="form-control" placeholder="浏览量" id="hit" name="hit" datatype="n"
									value="${model.hit}" errormsg="请输入浏览量" />
							</div>
						</div>



						<div class="form-group">
							<label class="col-sm-2 control-label">封面图:</label>
							<div class="col-sm-8">

								<input class="file" type="file" id='pic'> <input value="${model.pic}" name="pic"
									id="pic_input" type="hidden" />
								<div style="overflow: hidden;" class="pic">

									<div class="showimg-box pull-left">
										<div class="showimg">
											<img src="${model.pic}" width="80" height="60">
										</div>
										<span onclick="delPic(this,pic)" class="fa fa-close delete"></span>
									</div>


								</div>
							</div>
						</div>


						<div class="form-group">
							<label class="col-sm-2 control-label"><i class="red">*</i>内容:</label>
							<div class="col-sm-8">
								<script id="content" name="content" type="text/plain" class="ue-editor"
									style="width: 100%; height: 400px;"> ${model.content} </script>
							</div>
						</div>




						<div class="form-group">
							<label class="col-sm-2 control-label"><i class="red">*</i>置顶:</label>
							<div class="col-sm-8">
								<label><input value="1" ${model.isTop==1?'checked':'' } type="radio" class="minimal"
									name="isTop">是</label> <label><input value="2" ${model.isTop==2?'checked':'' }
									type="radio" class="minimal" name="isTop">否</label>
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

