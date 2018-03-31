<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<title>新增直播视频</title>

<%@ include file="/common/admin/head.jsp"%>

</head>

<body>
	<section class="content">
		<form class="form-horizontal" method="post" id="form-admin-add" action="${adp}add.json">
			<div class="row">
				<div class="col-md-12">

					<div class="box box-info">
						<div class="box-header with-border">
							<h3 class="box-title">添加视频</h3>
						</div>

						<div class="box-body">
							<div class="form-group">
								<label class="col-sm-2 control-label"><i class="red">*</i>标题:</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" placeholder="标题" id="name" name="name" datatype="*"
										errormsg="请输入名称" />
								</div>
							</div>
						</div>


						<div class="box-body">
							<div class="form-group">
								<label class="col-sm-2 control-label">封面:</label>
								<div class="col-sm-8">


									<input class="file" type="file" id='pic'> <input name="pic" id="pic_input"
										type="hidden" />
									<div style="overflow: hidden;" class="pic"></div>
								</div>
							</div>
						</div>



						<div class="form-group">
							<label class="col-sm-2 control-label"><i class="red">*</i>视频url:</label>
							<div class="col-sm-8">
								<div id="uploader0" class="wu-example">
									<!--用来存放文件信息-->
									<div class="thelist uploader-list"></div>
									<div class="btns">
										<div class="picker0 pull-left ">选择文件</div>
										<button type="button" class="ctlBtn btn btn-default pull-left col-sm-2"
											style="height: 40px; margin-left: 10px;">开始上传</button>
									</div>
								</div>
							</div>
						</div>


						<div class="box-body">
							<div class="form-group">
								<label class="col-sm-2 control-label">来源:</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" placeholder="来源" id="src" name="src" />
								</div>
							</div>
						</div>



						<div class="box-body">
							<div class="form-group">
								<label class="col-sm-2 control-label">视频介绍:</label>
								<div class="col-sm-8">
									<script id="content" name="content" type="text/plain" class="ue-editor"
										style="width: 100%; height: 400px;"></script>
								</div>
							</div>
						</div>


						<div class="box-body">
							<div class="form-group">
								<label class="col-sm-2 control-label">置顶:</label>
								<div class="col-sm-8">
									<label><input value="1" type="radio" class="minimal" name="isTop">是</label> <label><input
										value="2" type="radio" class="minimal" name="isTop" checked="checked">否</label>
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
				//在验证成功后，表单提交前执行的函数，curform参数是当前表单对象。
				//这里明确return false的话表单将不会提交;
				var time = $('.auto-kal');
			},
			callback : addResult
		});

		var ue = UE.getEditor('content');

		var $list0 = $(".thelist").eq(0);
		var $btn0 = $(".ctlBtn").eq(0);

		var state = 'pending', uploader0;
		var uploader0 = WebUploader.create({
			// swf文件路径
			swf : '/static/plugins/webuploader/Uploader.swf',
			// 文件接收服务端。
			server : '/euditor?action=uploadfile',
			fileNumLimit : 1,
			// 选择文件的按钮。可选。
			// 内部根据当前运行是创建，可能是input元素，也可能是flash.
			pick : '.picker0',
			// 不压缩image, 默认如果是jpeg，文件上传前会压缩一把再上传！
			resize : false
		});
		// 当有文件被添加进队列的时候
		uploader0
				.on(
						'fileQueued',
						function(file) {
							$list0
									.append('<div id="' + file.id + '" class="item">'
											+ '<input name="url" id="'+file.id+'_input" type="hidden" value="" />'
											+ '<h4 class="info">'
											+ file.name
											+ '<i class="glyphicon glyphicon-remove-circle"></i></h4>'
											+ '<p class="state">等待上传...</p>'
											+ '</div>');
							$list0.find("i").bind("click", function() {
								$(this).parent().parent().remove();
							});

						});
		// 文件上传过程中创建进度条实时显示。
		uploader0
				.on(
						'uploadProgress',
						function(file, percentage) {
							var $li = $('#' + file.id), $percent = $li
									.find('.progress .progress-bar');

							// 避免重复创建
							if (!$percent.length) {
								$percent = $(
										'<div class="progress progress-striped active">'
												+ '<div class="progress-bar" role="progressbar" style="width: 0%">'
												+ '</div>' + '</div>')
										.appendTo($li).find('.progress-bar');
							}
							$li.find('p.state').text('上传中');
							$percent.css('width', percentage * 100 + '%');
						});

		uploader0.on('uploadSuccess', function(file, res) {
			$('#' + file.id + "_input").val(res.url);
			$('#' + file.id).find('p.state').text('已上传');
		});

		uploader0.on('uploadError', function(file) {
			$('#' + file.id).find('p.state').text('上传出错');
		});

		uploader0.on('uploadComplete', function(file) {
			$('#' + file.id).find('.progress').fadeOut();
		});

		uploader0.on('all', function(type) {
			if (type === 'startUpload') {
				state = 'uploading';
			} else if (type === 'stopUpload') {
				state = 'paused';
			} else if (type === 'uploadFinished') {
				state = 'done';
			}

			if (state === 'uploading') {
				$btn0.text('暂停上传');
			} else {
				$btn0.text('开始上传');
			}
		});

		$btn0.on('click', function() {
			if (state === 'uploading') {
				uploader0.stop();
			} else {
				uploader0.upload();
			}
		});
	</script>
</body>
</html>

