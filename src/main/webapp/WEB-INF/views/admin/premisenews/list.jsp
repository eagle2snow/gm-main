<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>
<title>楼盘动态列表</title>

<%@ include file="/common/admin/head.jsp"%>


</head>
<body class="hold-transition skin-blue sidebar-mini">
	<div>

		
		<div style="float: left;padding-left:20px;padding-top:20px;line-height:24px;">
			<p><span style="font-weight: bold;">房源名称：</span>${model.name}</p>
			<p><span style="font-weight: bold;">房源编号：</span>${model.code}</p>
			<p><span style="font-weight: bold;">销售状态：</span>

			<c:choose>
				<c:when test="${model.sellState eq 1}">未开盘</c:when>
				<c:when test="${model.sellState eq 2}">销售中</c:when>
				<c:when test="${model.sellState eq 3}">已售罄</c:when>
			</c:choose>
			</p>
			<p><span style="font-weight: bold;">房源门店：</span>${model.user.store.name}</p>
			<p><span style="font-weight: bold;">门店店长：</span>${model.user.store.adminName}</p>
			<p><span style="font-weight: bold;">店长电话：</span>${model.user.store.adminMobile}</p>
			<p><span style="font-weight: bold;">开发商：</span>${model.buildCom}</p>
			<p><span style="font-weight: bold;">销售电话：</span>
				${fn:substring(model.sellTel,0,16)}...
			</p>
			<p><span style="font-weight: bold;">楼盘地址：</span>${fn:substring(model.address,0,7)}...</p>			
			<p>
			<!--百度地图容器-->
									<div
										style="width: 200px; height: 200px; border: #ccc solid 1px;"
										id="ditu"></div>
			</p>
			
			
		</div>
		
		<div class="content-wrapper">
			<!-- Main content -->
			<section class="content">
				<div class="row">
					<!-- left column -->
					<div class="col-md-12">
						<!-- Horizontal Form -->
						<div class="box box-info">
							<div class="box-header with-border">
								<h3 class="box-title">楼盘动态列表</h3>
							</div>
							<!-- /.box-header -->
							<div class="box">

								<!-- /.box-header -->
								<div class="box-body">
									<!--搜索框-->
									<div class="row">
										<div class="col-sm-6">
											<div class="cl pd-5 bg-1 bk-gray mt-20">
												<span class="l"><a href="javascript:;" onclick="delByIds('${adp}')"
													class="btn btn-danger radius"><i class="glyphicon glyphicon-trash"></i> 批量删除</a>
													<button onclick="opens('添加',900,900,'${adp}add.htm')" class="btn btn-primary radius">
														<i class="glyphicon glyphicon-plus"></i> 添加
													</button></span> <span class="r">共有数据：<strong id="count">${page.count}</strong> 条
												</span>
											</div>
										</div>
										<div class="col-sm-6">
											<div id="example1_filter" class="dataTables_filter">
												<div class="text-c">
													<input type="text" name="" id="key" placeholder="名称、介绍等"
														onkeypress="if(event.keyCode==13) {btn.click();return false;}" value='${key}'
														style="width: 250px; height: 33px" class="input-text">
													<button name="" id="btn" class="btn btn-success" type="submit" onclick="getData(1)">
														<i class="glyphicon glyphicon-search"></i> 搜索
													</button>
												</div>
											</div>
										</div>
									</div>
									<!--表单数据-->
									<table class="table table-bordered table-striped">
										<thead>

											<tr>
												<th width="25"><input name="checkAll" class="minimal" type="checkbox"></th>
												<th width="40">ID</th>
												<th>标题</th>
												<th>所属楼盘</th>
												<th width="180">创建人</th>
												<th width="180">创建时间</th>
												<th width="100">状态</th>
												<th width="100">操作</th>
											</tr>
										</thead>
										<tbody>

											<c:forEach items="${page.list}" var="model">
												<tr>
													<td><input type="checkbox" class="minimal" name="ids" value="${model.id}"></td>
													<td>${model.id}</td>

													<th>${model.name}</th>


													<th>${model.premise.name}</th>
													<th>${model.user.name}</th>

													<td><javatime:format value="${model.createTime}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
													<td class="td-status">
														<div class="switch switchevent" data-on="primary" lang="${model.id}"
															title="${model.enable}" data-on-label="开" data-off-label="关" data-off="info">
															<input type="checkbox" ${(model.enable==1)?'checked':'' } class="swbtn" />
														</div>
													</td>
													<td>
														<button onclick="edit(${model.id})" class="btn btn-sm btn-primary">
															<i class="glyphicon glyphicon-cog" title="修改"></i>
														</button>
														<button onclick="del(${model.id})" class="btn btn-sm btn-danger">
															<i class="glyphicon glyphicon-trash" title="删除"></i>
														</button>
													</td>
												</tr>
											</c:forEach>

										</tbody>
									</table>
									<!--分页-->
									<div class="row">
										<div id="page" class="text-c mt-10"></div>
									</div>

								</div>
								<!-- /.box-body -->
							</div>
							<!-- /.box -->

						</div>
						<!-- /.box -->
					</div>
				</div>
			</section>
		</div>
		<%@ include file="/common/admin/footer.jsp"%>
		<%@ include file="/common/admin/right.jsp"%>
		<%@ include file="/common/admin/my_js.jsp"%>

		<div class="control-sidebar-bg"></div>
	</div>

	<script>
			$(function() {
				$("#example1").DataTable();
				$("#key").focus();
			});
			
		laypage({
		  cont: 'page',
		  skin: 'yahei',
		  groups: 10,
		  first: '首页', 
		  last: '尾页',
		  prev: '<', //若不显示，设置false即可
		  next: '>', //若不显示，设置false即可
		  pages: ${page.countPage}, 
		  curr: function(){
		    var page = ${page.indexPage};
		    return page;
		  }(), 
		  jump: function(e, first){ //触发分页后的回调
		    if(!first){ //一定要加此判断，否则初始时会无限刷新
		    	getData(e.curr);
		    }
		  }
		});
		
		
		function getData(indexPage){
			  var k = $("#key").val();
		      location.href = '${adp}list/'+indexPage+'/${page.sizePage}.htm?pid=${pid}&k='+k;
		}
		
		
		function edit(id){
		
				openPerRe("编辑楼盘动态", 90,90,'${adp}update/'+id+'.htm');
		
			
		}
		
		function del(id){
			delById(id, '${adp}'); 
		}
		
		//开关回调
		/* var enableFun = function(){
		} */
		
		

		</script>
		
		
			<script type="text/javascript"
		src="https://api.map.baidu.com/api?v=2.0&ak=uLzSerD8EdIVdpIsmnlrhpe2"></script>
	<script type="text/javascript">
		var Budate = new Array();
	
		// 百度地图API功能
		function G(id) {
			return document.getElementById(id);
		}

		var map = new BMap.Map("ditu");
		var p = new BMap.Point(${model.lng}, ${model.lat}); // 创建点坐标     
		map.centerAndZoom(p, 15); // 初始化地图，设置中心点坐标和地图级别   
		map.enableScrollWheelZoom(true); //开启鼠标滚轮缩放
		map.addOverlay(new BMap.Marker(p)); //添加标注		
		var geoc = new BMap.Geocoder();
		var ac = new BMap.Autocomplete( //建立一个自动完成的对象
		{
			"input" : "mapseach",
			"location" : map
		});
		
		ac.setInputValue("${model.address}");

		ac.addEventListener("onhighlight", function(e) { //鼠标放在下拉列表上的事件

		});

		var myValue;
		ac.addEventListener("onconfirm", function(e) { //鼠标点击下拉列表后的事件
			var _value = e.item.value;
			myValue = _value.province + _value.city + _value.district + _value.street + _value.business;
			setPlace();
		});

		//自动定位
		var ad;
		function setPlace() {
			map.clearOverlays(); //清除地图上所有覆盖物
			function myFun() {
				var pp = local.getResults().getPoi(0).point; //获取第一个智能搜索的结果
				map.centerAndZoom(pp, 18);
				map.addOverlay(new BMap.Marker(pp)); //添加标注

				G('lng').value = pp.lng;
				G('lat').value = pp.lat;

				geoc.getLocation(pp, function(rs) {
					var addComp = rs.addressComponents;
					ad = addComp.city + addComp.district + addComp.street + addComp.streetNumber;
					G("address").value = ad;
				});

			}
			var local = new BMap.LocalSearch(map, { //智能搜索
				onSearchComplete : myFun
			});
			local.search(myValue);
		}
		
	</script>
		
</body>

</html>