<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<title>修改楼盘</title>

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
		<form class="form-horizontal" method="post" id="form-admin-add"
			action="${adp}update.json">

			<div class="row">
				<div class="col-md-12">

					<div class="box box-info">
						<div class="box-header with-border">
							<h3 class="box-title">楼盘信息</h3>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label"><i class="red">*</i>名称:</label>
							<div class="col-sm-8">
								<input disabled="disabled" type="text" class="form-control"
									value="${model.name}" placeholder="名称" id="name" name="name"
									datatype="*" errormsg="请输入名称" />
							</div>
						</div>


						<div class="form-group">
							<label class="col-sm-2 control-label">所属员工:</label>
							<div class="col-sm-8 pt">${model.user.name}</div>
						</div>


						<div class="box-body">
							<div class="form-group">
								<label class="col-sm-2 control-label">区域:</label>
								<div class="col-sm-8" style="padding-top: 7px;">
									<c:choose>
										<c:when test="${(model.zone==1)}">  
									          海城
									   </c:when>
										<c:when test="${(model.zone==2)}">  
									            银海
									   </c:when>
										<c:when test="${(model.zone==3)}">  
									            铁山港
									   </c:when>
										<c:otherwise> 
									     合浦
									   </c:otherwise>
									</c:choose>
								</div>
							</div>
						</div>


						<div class="box-body">
							<div class="form-group">
								<label for="dianhua" class="col-sm-2 control-label">楼盘地址：</label>
								<div class="col-sm-4">
									<input disabled="disabled" type="text" class="form-control"
										name="address" id="mapseach" placeholder="请输入楼盘地址"
										value="${model.address}">
								</div>
							</div>

						</div>

						<div class="box-body">


							<!--地位地址-->
							<div class="form-group">
								<label
									class="col-sm-2 control-label no-padding-right label-normal"
									for="form-field-1"></label>
								<div class="col-sm-8">
									<!--百度地图容器-->
									<div
										style="width: 600px; height: 400px; border: #ccc solid 1px;"
										id="ditu"></div>
								</div>
							</div>
						</div>
						<div class="box-body">

							<div class="form-group">
								<label for="dianhua" class="col-sm-2 control-label">经纬度：</label>
								<div class="col-sm-4">
									<input disabled="disabled" type="text"
										class="form-control pull-left col-sm-4" name="lng" id="lng"
										value="${model.lng }" readonly="readonly" /> <input
										disabled="disabled" type="text"
										class="form-control pull-left col-sm-4" value="${model.lat }"
										id="lat" name="lat" readonly="readonly" />

								</div>
							</div>
						</div>





						<div class="form-group">
							<label class="col-sm-2 control-label">编号:</label>
							<div class="col-sm-8">
								<input disabled="disabled" type="text" class="form-control"
									value="${model.code}" placeholder="编号" id="code" name="code" />
							</div>
						</div>
						
						<div class="form-group">
							<label class="col-sm-2 control-label">置顶:</label>
							<div class="col-sm-8">
							
								<c:choose>
									<c:when test="${(model.isTop==1)}">  
									        是
									   </c:when>
									<c:when test="${(model.isTop==2)}">  
									           否
									   </c:when>
									
								</c:choose>
							
							</div>
						</div>
						
						<div class="form-group">
							<label class="col-sm-2 control-label">特价:</label>
							<div class="col-sm-8">
								<c:choose>
									<c:when test="${(model.onSale==1)}">  
									        是
									   </c:when>
									<c:when test="${(model.onSale==2)}">  
									           否
									   </c:when>
									
								</c:choose>
							
							</div>
						</div>
						


						<%-- 	<div class="form-group">
							<label class="col-sm-2 control-label">位置:</label>
							<div class="col-sm-8">
								<input disabled="disabled" type="text" class="form-control" value="${model.position}" placeholder="位置"
									id="position" name="position" />
							</div>
						</div> --%>

						<div class="form-group">
							<label class="col-sm-2 control-label">占地面积（亩）:</label>
							<div class="col-sm-8">
								<input disabled="disabled" type="text" class="form-control"
									value="${model.allArea}" placeholder="占地面积" id="allArea"
									name="allArea" />
							</div>
						</div>


						<div class="form-group">
							<label class="col-sm-2 control-label">建筑面积（m<sup>2</sup>）:</label>
							<div class="col-sm-8">
								<input disabled="disabled" type="text" class="form-control"
									value="${model.buildArea}" placeholder="建筑面积" id="buildArea"
									name="buildArea" />
							</div>
						</div>

					<%-- 	<div class="form-group">
							<label class="col-sm-2 control-label">绿化面积:</label>
							<div class="col-sm-8">
								<input disabled="disabled" type="text" class="form-control"
									value="${model.greenArea}" placeholder="绿化面积" id="greenArea"
									name="greenArea" />
							</div>
						</div> --%>

						<div class="form-group">
							<label class="col-sm-2 control-label">开盘日期:</label>
							<div class="col-sm-8">
								<input disabled="disabled" type="text" class="form-control"
									value="${model.openDate}" placeholder="开盘日期" id="openDate"
									name="openDate" />
							</div>
						</div>


						<div class="form-group">
							<label class="col-sm-2 control-label">楼栋数量:</label>
							<div class="col-sm-8">
								<input disabled="disabled" type="text" class="form-control"
									value="${model.buildingCount}" placeholder="楼栋数量"
									id="buildingCount" name="buildingCount" />
							</div>
						</div>


						<div class="form-group">
							<label class="col-sm-2 control-label">规划住户:</label>
							<div class="col-sm-8">
								<input disabled="disabled" type="text" class="form-control"
									value="${model.roomCount}" placeholder="规划住户" id="roomCount"
									name="roomCount" />
							</div>
						</div>

						<div class="form-group">
							<label class="col-sm-2 control-label">停车位数量:</label>
							<div class="col-sm-8">
								<input disabled="disabled" type="text" class="form-control"
									value="${model.parkCount}" placeholder="停车位数量" id="parkCount"
									name="parkCount" />
							</div>
						</div>


						<div class="box-body">
							<div class="form-group">
								<label class="col-sm-2 control-label">组图:</label>
								<div class="col-sm-8">

									<div style="overflow: hidden;" class="pics">

										<c:forEach items='${fn:split(model.pics,"|")}' var='p'>
											<div class="showimg-box pull-left">
												<div class="showimg">
													<img src='${p}' width="80" height="60"
														onclick="adminShowPic(this)">
												</div>

											</div>
										</c:forEach>


									</div>
								</div>
							</div>
						</div>


						<div class="form-group">
							<label class="col-sm-2 control-label">状态:</label>
							<div class="col-sm-8" style="padding-top: 7px;">
								<c:choose>
									<c:when test="${(model.sellState==1)}">  
									        未开盘
									   </c:when>
									<c:when test="${(model.sellState==4)}">  
									          认筹
									   </c:when>
									   <c:when test="${(model.sellState==5)}">  
									        认购
									   </c:when>
									<c:when test="${(model.sellState==2)}">  
									           在售期房
									   </c:when>
									   <c:when test="${(model.sellState==6)}">  
									        在售现房
									   </c:when>
									
									<c:otherwise> 
									  已售罄
									   </c:otherwise>
								</c:choose>
							</div>
						</div>


						<div class="form-group">
							<label class="col-sm-2 control-label">销售地址:</label>
							<div class="col-sm-8">
								<input disabled="disabled" type="text" class="form-control"
									value="${model.sellAddress}" placeholder="销售地址"
									id="sellAddress" name="sellAddress" />
							</div>
						</div>


						<div class="form-group">
							<label class="col-sm-2 control-label">销售电话:</label>
							<div class="col-sm-8">
								<input disabled="disabled" type="text" class="form-control"
									value="${model.sellTel}" placeholder="销售电话" id="sellTel"
									name="sellTel" />
							</div>
						</div>


						<div class="form-group">
							<label class="col-sm-2 control-label">均价:</label>
							<div class="col-sm-8">
								<input disabled="disabled" type="text" class="form-control"
									value="${model.avgPrice}" placeholder="均价" id="avgPrice"
									name="avgPrice" />
							</div>
						</div>

						<div class="form-group">
							<label class="col-sm-2 control-label">开发商:</label>
							<div class="col-sm-8">
								<input disabled="disabled" type="text" class="form-control"
									value="${model.buildCom}" placeholder="开发商" id="buildCom"
									name="buildCom" />
							</div>
						</div>




						<div class="form-group">
							<label class="col-sm-2 control-label">物业公司:</label>
							<div class="col-sm-8">
								<input disabled="disabled" type="text" class="form-control"
									value="${model.proManCom}" placeholder="物业公司" id="proManCom"
									name="proManCom" />
							</div>
						</div>



						<div class="form-group">
							<label class="col-sm-2 control-label">物业费:</label>
							<div class="col-sm-8">
								<input disabled="disabled" type="text" class="form-control"
									value="${model.proManFee}" placeholder="物业费" id="proManFee"
									name="proManFee" />
							</div>
						</div>



						<div class="form-group">
							<label class="col-sm-2 control-label">物业类型:</label>
							<div class="col-sm-8 pt">
								<c:choose>
									<c:when test="${(model.type==1)}">  
									         住宅
									   </c:when>
									<c:when test="${(model.type==2)}">  
									           别墅
									   </c:when>
									<c:when test="${(model.type==3)}">  
									           商住
									   </c:when>
									<c:when test="${(model.type==4)}">  
									            商铺
									   </c:when>
									<c:when test="${(model.type==5)}">  
									            酒店
									   </c:when>
									<c:when test="${(model.type==6)}">  
									            私宅
									   </c:when>
									<c:when test="${(model.type==7)}">  
									            写字楼
									   </c:when>
									<c:when test="${(model.type==8)}">  
									            工业
									   </c:when>
									<c:otherwise> 
									   其他
									   </c:otherwise>
								</c:choose>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">容积率:</label>
							<div class="col-sm-8">
								<input disabled="disabled" type="text" class="form-control"
									value="${model.far}" placeholder="容积率" id="far" name="far" />
							</div>
						</div>


						<div class="form-group">
							<label class="col-sm-2 control-label">绿化率:</label>
							<div class="col-sm-8">
								<input disabled="disabled" type="text" class="form-control"
									value="${model.green}" placeholder="绿化率" id="green"
									name="green" />
							</div>
						</div>


						<div class="box-body">
							<div class="form-group">
								<label class="col-sm-2 control-label">特色:</label>
								<div class="col-sm-8">
									<input disabled="disabled" type="text" value="${model.special}"
										class="form-control" placeholder="用“，”隔开。如：学区房，地铁"
										id="special" name="special" />
								</div>
							</div>
						</div>


						<div class="box-body">
							<div class="form-group">
								<label class="col-sm-2 control-label">公告:</label>
								<div class="col-sm-8">
									<div id="notice" name="notice" class="form-control b0"
										rows="3" placeholder="请输入房源公告">${model.notice }</div>
								</div>
							</div>
						</div>


						<div class="form-group">
							<label class="col-sm-2 control-label">楼盘介绍:</label>
							<div class="col-sm-8">
								<div class="col-sm-8 pt">${model.content}</div>
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

		//手动定位
		map.addEventListener("click", function(e) {
			map.clearOverlays(); //清除地图上所有覆盖物
			var pp = e.point;
			//map.centerAndZoom(pp, 18);
			map.addOverlay(new BMap.Marker(pp)); //添加标注

			//设置经纬度
			G('lng').value = pp.lng;
			G('lat').value = pp.lat;

			//设定地址
			geoc.getLocation(pp, function(rs) {
				var addComp = rs.addressComponents;
				var ad = addComp.city + addComp.district + addComp.street + addComp.streetNumber;
				G("address").value = ad;
			});
		});
		
		
		
	</script>

</body>
</html>

