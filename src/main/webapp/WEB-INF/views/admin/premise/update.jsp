<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<title>修改楼盘</title>
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
							<h3 class="box-title">编辑楼盘信息</h3>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label"><i class="red">*</i>名称:</label>
							<div class="col-sm-8">
								<input type="text" class="form-control" value="${model.name}" placeholder="名称" id="name"
									name="name" datatype="*" errormsg="请输入名称" />
							</div>
						</div>


						<div class="form-group">
							<label class="col-sm-2 control-label">所属员工:</label>
							<div class="col-sm-8">
								<select name="user.id" style="width: 100% !important;" class="form-control select2"
									id="user">
									<c:forEach items="${userList}" var="m">
										<option ${model.user.id==m.id?'selected':'' } value="${m.id}">${m.name}</option>
									</c:forEach>
								</select>
							</div>
						</div>


						<div class="box-body">
							<div class="form-group">
								<label class="col-sm-2 control-label">区域:</label>
								<div class="col-sm-8">
									<select name="zone" style="width: auto !important;" class="form-control select2" id="zone">
										<option value="1" ${(model.zone==1)?'selected':''}>海城</option>
										<option value="2" ${(model.zone==2)?'selected':''}>银海</option>
										<option value="3" ${(model.zone==3)?'selected':''}>铁山港</option>
										<option value="4" ${(model.zone==4)?'selected':''}>合浦</option>
									</select>
								</div>
							</div>
						</div>


						<div class="box-body">
							<div class="form-group">
								<label for="dianhua" class="col-sm-2 control-label">楼盘地址：</label>
								<div class="col-sm-4">
									<input type="text" class="form-control" name="address" id="mapseach" placeholder="请输入楼盘地址"
										value="${model.address}">
								</div>
							</div>

						</div>

						<div class="box-body">


							<!--地位地址-->
							<div class="form-group">
								<label class="col-sm-2 control-label no-padding-right label-normal" for="form-field-1"></label>
								<div class="col-sm-8">
									<!--百度地图容器-->
									<div style="width: 600px; height: 400px; border: #ccc solid 1px;" id="ditu"></div>
								</div>
							</div>
						</div>
						<div class="box-body">

							<div class="form-group">
								<label for="dianhua" class="col-sm-2 control-label">经纬度：</label>
								<div class="col-sm-4">
									<input type="text" class="form-control pull-left col-sm-4" name="lng" id="lng"
										value="${model.lng }" readonly="readonly" /> <input type="text"
										class="form-control pull-left col-sm-4" value="${model.lat }" id="lat" name="lat"
										readonly="readonly" />

								</div>
							</div>
						</div>





						<div class="form-group">
							<label class="col-sm-2 control-label">编号:</label>
							<div class="col-sm-8">
								<input type="text" class="form-control" value="${model.code}" placeholder="编号" id="code"
									name="code" />
							</div>
						</div>


						<%-- 	<div class="form-group">
							<label class="col-sm-2 control-label">位置:</label>
							<div class="col-sm-8">
								<input type="text" class="form-control" value="${model.position}" placeholder="位置"
									id="position" name="position" />
							</div>
						</div> --%>

						<div class="form-group">
							<label class="col-sm-2 control-label">占地面积（亩）:</label>
							<div class="col-sm-8">
								<input type="text" class="form-control" value="${model.allArea}" placeholder="请填写数字"
									id="allArea" name="allArea" />
							</div>
						</div>


						<div class="form-group">
							<label class="col-sm-2 control-label">建筑面积（m<sup>2</sup>）:
							</label>
							<div class="col-sm-8">
								<input type="text" class="form-control" value="${model.buildArea}" placeholder="请填写数字"
									datatype="n" id="buildArea" name="buildArea" />
							</div>
						</div>

						<%-- <div class="form-group">
							<label class="col-sm-2 control-label">绿化面积:</label>
							<div class="col-sm-8">
								<input type="text" class="form-control" value="${model.greenArea}" placeholder="绿化面积"
									id="greenArea" name="greenArea" />
							</div>
						</div> --%>

						<div class="form-group">
							<label class="col-sm-2 control-label">开盘日期:</label>
							<div class="col-sm-8">
								<input type="text" class="form-control" value="${model.openDate}" placeholder="开盘日期"
									id="openDate" name="openDate" />
							</div>
						</div>


						<div class="form-group">
							<label class="col-sm-2 control-label">楼栋数量:</label>
							<div class="col-sm-8">
								<input type="text" class="form-control" value="${model.buildingCount}" placeholder="楼栋数量"
									id="buildingCount" name="buildingCount" />
							</div>
						</div>


						<div class="form-group">
							<label class="col-sm-2 control-label">规划住户:</label>
							<div class="col-sm-8">
								<input type="text" class="form-control" value="${model.roomCount}" placeholder="规划住户"
									id="roomCount" name="roomCount" />
							</div>
						</div>

						<div class="form-group">
							<label class="col-sm-2 control-label">停车位数量:</label>
							<div class="col-sm-8">
								<input type="text" class="form-control" value="${model.parkCount}" placeholder="停车位数量"
									id="parkCount" name="parkCount" />
							</div>
						</div>


						<div class="form-group">
							<label class="col-sm-2 control-label">组图:</label>
							<div class="col-sm-8 col-lg-5 col-xs-5">
								<input class="imgs_input" type="file" id='pics'> <input name="pics" id="pics_input"
									type="hidden" />
								<ul class="img_list draglist col-sm-12 pics">
									<c:forEach items='${fn:split(model.pics,"|")}' var='p'>
										<li class="col-sm-4"><img class="show" src="${p}" /> <img class="close"
											onclick="deletePic(this)" src="/static/plugins/dragsort/close.png" /></li>
									</c:forEach>
								</ul>
							</div>
						</div>


						<div class="form-group">
							<label class="col-sm-2 control-label">状态:</label>
							<div class="col-sm-8">
								<label><input value="1" ${model.sellState==1?'checked':'' } type="radio"
									class="minimal" name="sellState">未开盘</label>
									
									<label><input value="4" ${model.sellState==4?'checked':'' } type="radio"
									class="minimal" name="sellState">认筹</label>
									<label><input value="5" ${model.sellState==5?'checked':'' } type="radio"
									class="minimal" name="sellState">认购</label>
									
									 <label><input value="2"
									${model.sellState==2?'checked':'' } type="radio" class="minimal" name="sellState">在售期房</label>
								   
								   <label><input value="6" ${model.sellState==6?'checked':'' } type="radio"
									class="minimal" name="sellState">在售现房</label>
									
								   <label><input value="3" ${model.sellState==3?'checked':'' } type="radio"
									class="minimal" name="sellState">已售罄</label>
									
									
									
									
									
							</div>
						</div>


						<div class="form-group">
							<label class="col-sm-2 control-label">销售地址:</label>
							<div class="col-sm-8">
								<input type="text" class="form-control" value="${model.sellAddress}" placeholder="销售地址"
									id="sellAddress" name="sellAddress" />
							</div>
						</div>


						<div class="form-group">
							<label class="col-sm-2 control-label">销售电话:</label>
							<div class="col-sm-8">
								<input type="text" class="form-control" value="${model.sellTel}" placeholder="销售电话"
									id="sellTel" name="sellTel" />
							</div>
						</div>


						<div class="form-group">
							<label class="col-sm-2 control-label">均价:</label>
							<div class="col-sm-8">
								<input type="text" class="form-control" value="${model.avgPrice}" placeholder="请填写数字"
									id="avgPrice" name="avgPrice" />
							</div>
						</div>

						<div class="form-group">
							<label class="col-sm-2 control-label">开发商:</label>
							<div class="col-sm-8">
								<input type="text" class="form-control" value="${model.buildCom}" placeholder="开发商"
									id="buildCom" name="buildCom" />
							</div>
						</div>




						<div class="form-group">
							<label class="col-sm-2 control-label">物业公司:</label>
							<div class="col-sm-8">
								<input type="text" class="form-control" value="${model.proManCom}" placeholder="物业公司"
									id="proManCom" name="proManCom" />
							</div>
						</div>



						<div class="form-group">
							<label class="col-sm-2 control-label">物业费:</label>
							<div class="col-sm-8">
								<input type="text" class="form-control" value="${model.proManFee}" placeholder="物业费"
									id="proManFee" name="proManFee" />
							</div>
						</div>



						<div class="form-group">
							<label class="col-sm-2 control-label">物业类型:</label>
							<div class="col-sm-8">
								<select name="type" style="width: 100% !important;" class="form-control select2" id="type">
									<option value="1" ${(model.type==1)?'selected':''}>住宅</option>
									<option value="2" ${(model.type==2)?'selected':''}>别墅</option>
									<option value="3" ${(model.type==3)?'selected':''}>商住</option>
									<option value="4" ${(model.type==4)?'selected':''}>商铺</option>
									<option value="5" ${(model.type==5)?'selected':''}>酒店</option>
									<option value="5" ${(model.type==6)?'selected':''}>私宅</option>
									<option value="5" ${(model.type==7)?'selected':''}>写字楼</option>
									<option value="5" ${(model.type==8)?'selected':''}>工业</option>
									<option value="5" ${(model.type==9)?'selected':''}>其他</option>
								</select>
							</div>
						</div>

						<div class="form-group">
							<label class="col-sm-2 control-label">容积率:</label>
							<div class="col-sm-8">
								<input type="text" class="form-control" value="${model.far}" placeholder="容积率" id="far"
									name="far" />
							</div>
						</div>


						<div class="form-group">
							<label class="col-sm-2 control-label">绿化率:</label>
							<div class="col-sm-8">
								<input type="text" class="form-control" value="${model.green}" placeholder="绿化率" id="green"
									name="green" />
							</div>
						</div>


						<div class="box-body">
							<div class="form-group">
								<label class="col-sm-2 control-label">特色:</label>
								<div class="col-sm-8">
									<input type="text" value="${model.special}" class="form-control"
										placeholder="用“，”隔开。如：学区房，地铁" id="special" name="special" />
								</div>
							</div>
						</div>


						<div class="box-body">
							<div class="form-group">
								<label class="col-sm-2 control-label">公告:</label>
								<div class="col-sm-8">
									<textarea id="notice" name="notice" class="form-control" rows="3" placeholder="请输入房源公告">${model.notice }</textarea>
								</div>
							</div>
						</div>


						<div class="form-group">
							<label class="col-sm-2 control-label">楼盘介绍:</label>
							<div class="col-sm-8">
								<script id="content" name="content" type="text/plain" class="ue-editor"
									style="width: 100%; height: 400px;"> ${model.content} </script>
							</div>
						</div>

						<div class="box-body">
							<div class="form-group">
								<label class="col-sm-2 control-label">首页轮播:</label>
								<div class="col-sm-8">
									<label><input value="1" type="radio" class="minimal" name="slider"
										${(model.slider==1)?'checked':'' }>是</label> <label><input value="2" type="radio"
										class="minimal" name="slider" ${(model.slider==2)?'checked':'' }>否</label>
								</div>
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



						<div class="form-group">
							<label class="col-sm-2 control-label"><i class="red">*</i>特价房:</label>
							<div class="col-sm-8">
								<label><input value="1" ${model.onSale==1?'checked':'' } type="radio" class="minimal"
									name="onSale">有</label> <label><input value="2" ${model.onSale==2?'checked':'' }
									type="radio" class="minimal" name="onSale">无</label>
							</div>
						</div>



						<div class="box-body">
							<div class="form-group">
								<label class="col-sm-2 control-label">附件:</label>
								<div class="col-sm-8">
									<input class="docs" type="file" id='docs'> <input name="docs" id="docs_input"
										type="hidden" />
									<div style="overflow: hidden;" class="docs">

										<c:if test="${!empty model.docs and model.docs ne '' and model.docs ne null}">
											<c:forEach items='${fn:split(model.docs,"|")}' var='p'>
												<c:set var="index" value='${fn:indexOf(p,"@")}' />
												<c:set var="len" value='${fn:length(p)}' />
												<div class="showimg-box pull-left">
													<div class="showimg">
														<a href="javascript:void(0)"
															onclick="downloadFile('${p}','${fn:substring(p,index+1,len)}')"> <img
															src='/static/admin/img/file.png' width="80" height="60">
														</a>
													</div>
													<div style="clear: both; text-align: center;">${fn:substring(p,index+1,len)}</div>
													<span onclick="delDocs(this,'${fn:substring(p,0,index)}')" class="fa fa-close delete"></span>
												</div>

											</c:forEach>
										</c:if>

									</div>
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
				
				var arr = [];
				$.each(docs.elements, function(k, v) {
					arr.push(v.key + "@" + v.value);
				});
				$("#docs_input").val(arr.join('|'));
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
		
		var docsStr ='${model.docs}';
		var arrdocs = docsStr.split("|");
		
		$.each(arrdocs,function(k,v){
			var d = v.substring(0,v.indexOf('@'));
			var o = v.substring(v.indexOf('@')+1);
			if(d!=""){
				docs.put(d,o);
			}
		});
				
				
		
		
		
	</script>

</body>
</html>

