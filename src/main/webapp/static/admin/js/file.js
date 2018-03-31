$('.file')
		.fileinput({
			dropZoneEnabled : false,
			showCaption : false,
			showRemove : false,
			showUpload : false,
			showPreview : false,
			showCancel : false,
			uploadUrl : '/euditor?action=uploadimage',
			allowedFileExtensions : [ 'jpeg', 'jpg', 'png', 'gif' ]
		})
		.on("filebatchselected", function(event, files) {
			$(this).fileinput("upload");// 选择完立即上传
		})
		.on(
				"fileuploaded",
				function(event, data, previewId, index) {// 上传完后
					var url = data.response.url;
					if (typeof (url) == 'undefined') {
						return false;
					}
					var inputId = this.id;
					var img = '<div class="showimg-box pull-left"><div class="showimg"><img src="'
							+ url
							+ '" width="80" height="60" /></div><span onclick="delPic(this,'
							+ this.id
							+ ')" class="fa fa-close delete"></span></div>';

					var $inp = $('#' + inputId + '_input');

					convertImgToBase64(url, function(res) {
						$("#baseThumb").val(res);
					});

					$inp.val(url);
					$('.' + inputId).html(img);
				});

$('.imgs_input')
		.fileinput({
			dropZoneEnabled : false,
			showCaption : false,
			showRemove : false,
			showUpload : false,
			showPreview : false,
			showCancel : false,
			uploadUrl : '/euditor?action=uploadimage',
			allowedFileExtensions : [ 'jpeg', 'jpg', 'png', 'gif' ]
		})
		.on("filebatchselected", function(event, files) {
			$(this).fileinput("upload");// 选择完立即上传
		})
		.on(
				"fileuploaded",
				function(event, data, previewId, index) {// 上传完后
					var url = data.response.url;
					if (typeof (url) == 'undefined') {
						return false;
					}
					var inputId = this.id;
					var img = '<li class="col-sm-4" data-groupid="gid-1">'
							+ '<img class="show" '
							+ 'src="'
							+ url
							+ '" />'
							+ '<img class="close" src="/static/plugins/dragsort/close.png" /></li>';
					$('.' + inputId).append(img);
					deletePic();
				});

function deletePic() {
	$(".close").click(function() {
		$(this).parent().remove();
	});
}

deletePic();

function delPic(tem, id) {
	var inputIds = $(id).attr("id");
	var src = $(tem).parent().find('img').attr('src');
	/*
	 * var v = $('#' + inputIds + '_input').val().replace(src, ""); $('#' +
	 * inputIds + '_input').val(v);
	 */
	$('#' + inputIds + '_input').val("");
	$("#baseThumb").val("");

	$(tem).parent().remove();
}

function delPics(tem, id) {
	var inputIds = $(id).attr("id");
	var src = $(tem).parent().find('img').attr('src');
	var oldSrc = $('#' + inputIds + '_input').val();

	var v;
	if (oldSrc.indexOf(src) == 0) {
		v = oldSrc.replace(src, "");
	} else {
		v = oldSrc.replace("|" + src, "");
	}

	if (v.indexOf("|") == 0) {
		v = v.substr(1);
	}

	$('#' + inputIds + '_input').val(v);
	$(tem).parent().remove();
}

function adminShowPic(tem) {
	var imgUrl = $(tem).attr("src");
	layer.open({
		type : 2,
		title : '图片预览',
		shadeClose : true,
		shade : 0.5,
		area : [ '90%', '90%' ],
		content : imgUrl
	});

}

function delDocs(tem, k) {
	docs.remove(k);
	$(tem).parent().remove();
}

function downloadFile(path, name) {
	var p = encodeURIComponent(encodeURIComponent(path));
	var n = encodeURIComponent(encodeURIComponent(name));
	location.href = "/file/download?filePath=" + p + "&fileName=" + n;
}

var docs = new Map();

$('.docs')
		.fileinput({
			dropZoneEnabled : false,
			showCaption : false,
			showRemove : false,
			showUpload : false,
			showPreview : false,
			showCancel : false,
			uploadUrl : '/euditor?action=uploadfile',
			allowedFileExtensions : [ 'txt', 'doc', 'docx' ]
		})
		.on("filebatchselected", function(event, files) {
			$(this).fileinput("upload");// 选择完立即上传
		})
		.on(
				"fileuploaded",
				function(event, data, previewId, index) {// 上传完后
					var res = data.response;
					var url = res.url;
					if (typeof (url) == 'undefined') {
						return false;
					}
					docs.put(url, res.original);
					var inputId = this.id;
					var img = '<div class="showimg-box pull-left"><div class="showimg"><a href="javascript:void(0)" onclick="downloadFile(\''
							+ url
							+ '\',\''
							+ res.original
							+ '\')"><img src="/static/admin/img/file.png" width="80" height="60" title="'
							+ url
							+ '" /></a></div><div style="clear:both;text-align: center;">'
							+ res.original
							+ '</div><span onclick="delDocs(this,\''
							+ url
							+ '\')" class="fa fa-close delete"></span></div>';
					$('.' + inputId).append(img);
				});
