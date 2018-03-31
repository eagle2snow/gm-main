<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/static/plugins/dragsort/dragsort.css">

<script type="text/javascript">
	$(".img_list ul:first").dragsort();
</script>

<script type="text/javascript">
	$(".draglist").dragsort({
		dragSelector : "li",
		dragBetween : true,
		dragEnd : saveOrder, //拖拽完成后回调函数
		placeHolderTemplate : "<li class='placeHolder'><div></div></li>" //拖动是阴影
	});

	function saveOrder() {
		var $this = $(this);
		var data = $this.parent().children().map(function() {
			return $this.attr("data-id");
		}).get();
		var currentid = $this.attr("data-id"); //组件id
		var groupid = $this.parent().attr("data-groupid"); //目标组id
		$this.attr("data-groupid", groupid); //改变所属组id  
	};
	
	
	function getImgUrlStr(inputId) {
		 var arr = new Array();
		$(".img_list li .show").each(function(index, item) {
			var src = $(item).attr("src");
			arr.push(src);
		});
		$("#"+inputId).val(arr.join('|'));		
	}
	
	
</script>
