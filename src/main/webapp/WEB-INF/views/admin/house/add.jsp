<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<title>添加二手房</title>

<%@ include file="/common/admin/head.jsp"%>

</head>

<body>
	<section class="content">
		<form class="form-horizontal" method="post" id="form-admin-add" action="${adp}add.json">
			<div class="row">
				<div class="col-md-12">

					<div class="box box-info">
						<div class="box-header with-border">
							<h3 class="box-title">添加二手房</h3>
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
								<label class="col-sm-2 control-label">区域:</label>
								<div class="col-sm-8">
									<select name="zone" style="width: auto !important;" class="form-control select2" id="zone">
										<option value="1">海城</option>
										<option value="2">银海</option>
										<option value="3">铁山港</option>
										<option value="4">合浦</option>
									</select>
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
								<label class="col-sm-2 control-label">小区:</label>
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
								<label class="col-sm-2 control-label">门牌:</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" placeholder="如：几栋几单几号" id="doorplate"
										name="doorplate" />
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
								<label class="col-sm-2 control-label">装修程度:</label>
								<div class="col-sm-8">
									<select name="fix" style="width: auto !important;" class="form-control select2" id="fix">
										<option value="1">毛坯</option>
										<option value="2">简装</option>
										<option value="3">精装</option>
										<option value="4">豪华装</option>
									</select>
								</div>
							</div>
						</div>

						<div class="box-body">
							<div class="form-group">
								<label class="col-sm-2 control-label">地址:</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" placeholder="地址" id="address" name="address" />
								</div>
							</div>
						</div>

						<div class="box-body">
							<div class="form-group">
								<label class="col-sm-2 control-label">房屋面积 （m<sup>2</sup>）：
								</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" placeholder="房屋面积，请输入整数" id="area" name="area"
										datatype="n" />
								</div>
							</div>
						</div>


						<div class="box-body">
							<div class="form-group">
								<label class="col-sm-2 control-label">总价（万）:</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" placeholder="请填写数字" id="price" name="price" />
								</div>
							</div>
						</div>

						<div class="box-body">
							<div class="form-group">
								<label class="col-sm-2 control-label">建造年份:</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" placeholder="建造年份" id="year" name="year" />
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
								<label class="col-sm-2 control-label">参考首付（万）:</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" placeholder="请填写数字" id="downPayment"
										name="downPayment" />
								</div>
							</div>
						</div>

						<div class="box-body">
							<div class="form-group">
								<label class="col-sm-2 control-label">物业类型:</label>
								<div class="col-sm-8">
									<select name="type" style="width: auto !important;" class="form-control select2" id="type">
										<option value="1">住宅</option>
										<option value="2">别墅</option>
										<option value="3">商住</option>
										<option value="4">商铺</option>
										<option value="5">酒店</option>
										<option value="6">私宅</option>
										<option value="7">写字楼</option>
										<option value="8">工业</option>
										<option value="9">其他</option>
									</select>
								</div>
							</div>
						</div>

						<div class="box-body">
							<div class="form-group">
								<label class="col-sm-2 control-label">物业费:</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" placeholder="物业费" id="proManFee" name="proManFee" />
								</div>
							</div>
						</div>



						<div class="box-body">
							<div class="form-group">
								<label class="col-sm-2 control-label">总楼层:</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" placeholder="总楼层" id="floors" name="floors" />
								</div>
							</div>
						</div>

						<div class="box-body">
							<div class="form-group">
								<label class="col-sm-2 control-label">所在楼层:</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" placeholder="所在楼层" id="floor" name="floor" />
								</div>
							</div>
						</div>

						<div class="box-body">
							<div class="form-group">
								<label class="col-sm-2 control-label">几梯几户:</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" placeholder="几梯几户" id="lifts" name="lifts" />
								</div>
							</div>
						</div>



						<div class="box-body">
							<div class="form-group">
								<label class="col-sm-2 control-label">月供（元）:</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" placeholder="请填写数字" id="monthPayment" datatype="n"
										name="monthPayment" />
								</div>
							</div>
						</div>



						<div class="box-body">
							<div class="form-group">
								<label class="col-sm-2 control-label">交通:</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" placeholder="交通" id="traffic" name="traffic" />
								</div>
							</div>
						</div>


						<div class="box-body">
							<div class="form-group">
								<label class="col-sm-2 control-label">银行:</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" placeholder="银行" id="bank" name="bank" />
								</div>
							</div>
						</div>

						<div class="box-body">
							<div class="form-group">
								<label class="col-sm-2 control-label">学校:</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" placeholder="学校" id="school" name="school" />
								</div>
							</div>
						</div>


						<div class="box-body">
							<div class="form-group">
								<label class="col-sm-2 control-label">医院:</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" placeholder="医院" id="hospital" name="hospital" />
								</div>
							</div>
						</div>


						<div class="box-body">
							<div class="form-group">
								<label class="col-sm-2 control-label">停车位:</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" placeholder="停车位" id="park" name="park" />
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
								<label class="col-sm-2 control-label">室内图:</label>
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
								<label class="col-sm-2 control-label">特色:</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" placeholder="有多个用“，”隔开，如：地铁，海景，双阳台" id="special"
										name="special" />
								</div>
							</div>
						</div>

						<div class="box-body">
							<div class="form-group">
								<label class="col-sm-2 control-label">业主姓名:</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" placeholder="业主姓名" id="owner" name="owner" />
								</div>
							</div>
						</div>

						<div class="box-body">
							<div class="form-group">
								<label class="col-sm-2 control-label">业主电话:</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" placeholder="业主电话" id="ownerTel" name="ownerTel" />
								</div>
							</div>
						</div>

						<div class="box-body">
							<div class="form-group">
								<label class="col-sm-2 control-label">产权状况:</label>
								<div class="col-sm-8">
									<select name="equity" style="width: auto !important;" class="form-control select2"
										id="type">
										<option value="1">满五唯一</option>
										<option value="2">满五不唯一</option>
										<option value="3">满二唯一</option>
										<option value="4">满二不唯一</option>
										<option value="5">购房合同书</option>
									</select>
								</div>
							</div>
						</div>

						<div class="box-body">
							<div class="form-group">
								<label class="col-sm-2 control-label"><i class="red">*</i>产证情况：</label>
								<div class="col-sm-8">
									<label><input value="1" checked="checked" type="radio" class="minimal"
										name="certStatus">现证</label> <label><input value="2" type="radio" class="minimal"
										name="certStatus">有抵押</label>
								</div>
							</div>
						</div>


						<div class="box-body">
							<div class="form-group">
								<label class="col-sm-2 control-label"><i class="red">*</i>付款方式：</label>
								<div class="col-sm-8">
									<label><input value="1" checked="checked" type="radio" class="minimal"
										name="payType">一次性</label> <label><input value="2" type="radio" class="minimal"
										name="payType">可货款</label>
								</div>
							</div>
						</div>



						<div class="box-body">
							<div class="form-group">
								<label class="col-sm-2 control-label"><i class="red">*</i>看房时间：</label>
								<div class="col-sm-8">
									<label><input value="1" checked="checked" type="radio" class="minimal"
										name="lookTime">随时看房</label> <label><input value="2" type="radio" class="minimal"
										name="lookTime">预约看房</label> <label><input value="3" type="radio" class="minimal"
										name="lookTime">视频看房</label>
								</div>
							</div>
						</div>



						<div class="box-body">
							<div class="form-group">
								<label class="col-sm-2 control-label"><i class="red">*</i>房屋状态：</label>
								<div class="col-sm-8">
									<label><input value="1" checked="checked" type="radio" class="minimal"
										name="houseStatus">业主住</label> <label><input value="2" type="radio"
										class="minimal" name="houseStatus">租客住</label> <label><input value="3"
										type="radio" class="minimal" name="houseStatus">空房</label>
								</div>
							</div>
						</div>



						<div class="box-body">
							<div class="form-group">
								<label class="col-sm-2 control-label"><i class="red">*</i>过户费用：</label>
								<div class="col-sm-8">
									<label><input value="1" checked="checked" type="radio" class="minimal"
										name="tranFee">业主净收</label> <label><input value="2" type="radio" class="minimal"
										name="tranFee">业主承担</label> <label><input value="3" type="radio" class="minimal"
										name="tranFee">一家一半</label>
								</div>
							</div>
						</div>




						<div class="box-body">
							<div class="form-group">
								<label class="col-sm-2 control-label">公告:</label>
								<div class="col-sm-8">
									<textarea id="notice" name="notice" class="form-control" rows="3" placeholder="请输入房源公告"></textarea>
								</div>
							</div>
						</div>

						<div class="box-body">
							<div class="form-group">
								<label class="col-sm-2 control-label">房源介绍:</label>
								<div class="col-sm-8">
									<script id="content" name="content" type="text/plain" class="ue-editor"
										style="width: 100%; height: 400px;"></script>
								</div>
							</div>
						</div>

						<div class="box-body">
							<div class="form-group">
								<label class="col-sm-2 control-label">首页轮播:</label>
								<div class="col-sm-8">
									<label><input value="1" type="radio" class="minimal" name="slider">是</label> <label><input
										value="2" type="radio" class="minimal" checked="checked" name="slider">否</label>
								</div>
							</div>
						</div>


						<div class="box-body">
							<div class="form-group">
								<label class="col-sm-2 control-label"><i class="red">*</i>置顶:</label>
								<div class="col-sm-8">
									<label><input value="1" type="radio" class="minimal" name="isTop">是</label> <label><input
										value="2" type="radio" checked="checked" class="minimal" name="isTop">否</label>
								</div>
							</div>
						</div>

						<div class="box-body">
							<div class="form-group">
								<label class="col-sm-2 control-label"><i class="red">*</i>特价房:</label>
								<div class="col-sm-8">
									<label><input value="1" type="radio" class="minimal" name="onSale">是</label> <label><input
										value="2" type="radio" checked="checked" class="minimal" name="onSale">否</label>
								</div>
							</div>
						</div>


						<div class="box-body">
							<div class="form-group">
								<label class="col-sm-2 control-label">附件:</label>
								<div class="col-sm-8">
									<input class="docs" type="file" id='docs' multiple> <input name="docs"
										id="docs_input" type="hidden" />
									<div style="overflow: hidden;" class="docs"></div>
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
			callback : addResult
		});

		var ue = UE.getEditor('content');
	</script>
</body>
</html>

