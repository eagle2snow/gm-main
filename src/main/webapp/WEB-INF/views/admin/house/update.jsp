<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<title>二手房修改</title>

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
							<h3 class="box-title">编辑</h3>
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
										<option ${model.user.id==m.id?'selected':'' } value="${m.id}">
														${m.name}
													</option>
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



						<div class="form-group">
							<label class="col-sm-2 control-label">编号:</label>
							<div class="col-sm-8">
								<input type="text" class="form-control" value="${model.code}" placeholder="编号" id="code"
									name="code" />
							</div>
						</div>


						<div class="form-group">
							<label class="col-sm-2 control-label">小区:</label>
							<div class="col-sm-8">
								<select name="premise.id" style="width: 100% !important;" class="form-control select2"
									id="premise">
									<c:forEach items="${premiseList}" var="m">
										<option ${model.premise.id==m.id?'selected':'' } value="${m.id}">
														${m.name}
													</option>
									</c:forEach>
								</select>
							</div>
						</div>


						<div class="form-group">
							<label class="col-sm-2 control-label">门牌:</label>
							<div class="col-sm-8">
								<input type="text" class="form-control" placeholder="如：几栋几单几号" id="doorplate"
									value="${model.doorplate}" name="doorplate" />
							</div>
						</div>




						<div class="form-group">
							<label class="col-sm-2 control-label">室:</label>
							<div class="col-sm-8">
								<input type="text" class="form-control" value="${model.shi}" placeholder="室" id="shi"
									name="shi" />
							</div>
						</div>


						<div class="form-group">
							<label class="col-sm-2 control-label">厅:</label>
							<div class="col-sm-8">
								<input type="text" class="form-control" value="${model.ting}" placeholder="厅" id="ting"
									name="ting" />
							</div>
						</div>



						<div class="form-group">
							<label class="col-sm-2 control-label">卫:</label>
							<div class="col-sm-8">
								<input type="text" class="form-control" value="${model.wei}" placeholder="卫" id="wei"
									name="wei" />
							</div>
						</div>

						<div class="form-group">
							<label class="col-sm-2 control-label">阳台:</label>
							<div class="col-sm-8">
								<input type="text" class="form-control" value="${model.yang}" placeholder="阳台" id="yang"
									name="yang" />
							</div>
						</div>

						<div class="form-group">
							<label class="col-sm-2 control-label">装修程度:</label>
							<div class="col-sm-8">
								<select name="fix" style="width: 100% !important;" class="form-control select2" id="fix">
									<option value="1" ${(model.fix==1)?'selected':''}>毛坯</option>
									<option value="2" ${(model.fix==2)?'selected':''}>简装</option>
									<option value="3" ${(model.fix==3)?'selected':''}>精装</option>
									<option value="4" ${(model.fix==4)?'selected':''}>豪华装</option>
								</select>
							</div>
						</div>


						<div class="form-group">
							<label class="col-sm-2 control-label">地址:</label>
							<div class="col-sm-8">
								<input type="text" class="form-control" value="${model.address}" placeholder="地址"
									id="address" name="address" />
							</div>
						</div>


						<div class="form-group">
							<label class="col-sm-2 control-label">房屋面积（m<sup>2</sup>）:
							</label>
							<div class="col-sm-8">
								<input type="text" class="form-control" value="${model.area}" placeholder="房屋面积，请输入整数"
									datatype="n" id="area" name="area" />
							</div>
						</div>



						<div class="form-group">
							<label class="col-sm-2 control-label">总价（万）:</label>
							<div class="col-sm-8">
								<input type="text" class="form-control" value="${model.price}" placeholder="请填写数字"
									id="price" name="price" />
							</div>
						</div>


						<div class="form-group">
							<label class="col-sm-2 control-label">建造年份:</label>
							<div class="col-sm-8">
								<input type="text" class="form-control" value="${model.year}" placeholder="建造年份" id="year"
									name="year" />
							</div>
						</div>


						<div class="form-group">
							<label class="col-sm-2 control-label">朝向:</label>
							<div class="col-sm-8">
								<select name="face" style="width: 100% !important;" class="form-control select2" id="face">
									<option value="1" ${(model.face==1)?'selected':''}>朝东</option>
									<option value="2" ${(model.face==2)?'selected':''}>朝南</option>
									<option value="3" ${(model.face==3)?'selected':''}>朝西</option>
									<option value="4" ${(model.face==4)?'selected':''}>朝北</option>
									<option value="5" ${(model.face==5)?'selected':''}>东南</option>
									<option value="6" ${(model.face==6)?'selected':''}>东北</option>
									<option value="7" ${(model.face==7)?'selected':''}>西南</option>
									<option value="8" ${(model.face==8)?'selected':''}>西北</option>
									<option value="9" ${(model.face==9)?'selected':''}>南北通透</option>
								</select>
							</div>
						</div>



						<div class="box-body">
							<div class="form-group">
								<label class="col-sm-2 control-label">物业费:</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" placeholder="物业费" id="proManFee"
										value="${model.proManFee}" name="proManFee" />
								</div>
							</div>
						</div>


						<div class="form-group">
							<label class="col-sm-2 control-label">参考首付（万）:</label>
							<div class="col-sm-8">
								<input type="text" class="form-control" value="${model.downPayment}" placeholder="请填写数字"
									id="downPayment" name="downPayment" />
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
							<label class="col-sm-2 control-label">总楼层:</label>
							<div class="col-sm-8">
								<input type="text" class="form-control" value="${model.floors}" placeholder="总楼层"
									id="floors" name="floors" />
							</div>
						</div>


						<div class="form-group">
							<label class="col-sm-2 control-label">所在楼层:</label>
							<div class="col-sm-8">
								<input type="text" class="form-control" value="${model.floor}" placeholder="所在楼层" id="floor"
									name="floor" />
							</div>
						</div>


						<div class="box-body">
							<div class="form-group">
								<label class="col-sm-2 control-label">几梯几户:</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" placeholder="几梯几户" id="lifts" name="lifts"
										value="${model.lifts}" />
								</div>
							</div>
						</div>



						<div class="form-group">
							<label class="col-sm-2 control-label">月供（元）:</label>
							<div class="col-sm-8">
								<input type="text" class="form-control" value="${model.monthPayment}" placeholder="请填写数字"
									id="monthPayment" name="monthPayment" />
							</div>
						</div>


						<div class="form-group">
							<label class="col-sm-2 control-label">交通:</label>
							<div class="col-sm-8">
								<input type="text" class="form-control" value="${model.traffic}" placeholder="交通"
									id="traffic" name="traffic" />
							</div>
						</div>


						<div class="form-group">
							<label class="col-sm-2 control-label">银行:</label>
							<div class="col-sm-8">
								<input type="text" class="form-control" value="${model.bank}" placeholder="银行" id="bank"
									name="bank" />
							</div>
						</div>



						<div class="form-group">
							<label class="col-sm-2 control-label">学校:</label>
							<div class="col-sm-8">
								<input type="text" class="form-control" value="${model.school}" placeholder="学校" id="school"
									name="school" />
							</div>
						</div>

						<div class="form-group">
							<label class="col-sm-2 control-label">医院:</label>
							<div class="col-sm-8">
								<input type="text" class="form-control" value="${model.hospital}" placeholder="医院"
									id="hospital" name="hospital" />
							</div>
						</div>


						<div class="form-group">
							<label class="col-sm-2 control-label">停车位:</label>
							<div class="col-sm-8">
								<input type="text" class="form-control" value="${model.park}" placeholder="停车位" id="park"
									name="park" />
							</div>
						</div>

						<div class="box-body">
							<div class="form-group">
								<label class="col-sm-2 control-label">户型图:</label>
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
						</div>

						<div class="form-group">
							<label class="col-sm-2 control-label">室内图:</label>
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
							<label class="col-sm-2 control-label">特色:</label>
							<div class="col-sm-8">
								<input type="text" class="form-control" value="${model.special}"
									placeholder="有多个用“，”隔开，如：地铁，海景，双阳台" id="special" name="special" />
							</div>
						</div>

						<div class="form-group">
							<label class="col-sm-2 control-label">业主姓名:</label>
							<div class="col-sm-8">
								<input type="text" class="form-control" value="${model.owner}" placeholder="业主姓名" id="owner"
									name="owner" />
							</div>
						</div>

						<div class="form-group">
							<label class="col-sm-2 control-label">业主电话:</label>
							<div class="col-sm-8">
								<input type="text" class="form-control" value="${model.ownerTel}" placeholder="业主电话"
									id="ownerTel" name="ownerTel" />
							</div>
						</div>


						<div class="box-body">
							<div class="form-group">
								<label class="col-sm-2 control-label">产权状况:</label>
								<div class="col-sm-8">
									<select name="equity" style="width: auto !important;" class="form-control select2"
										id="type">
										<option value="1" ${model.equity==1?'selected':'' }>满五唯一</option>
										<option value="2" ${model.equity==2?'selected':'' }>满五不唯一</option>
										<option value="3" ${model.equity==3?'selected':'' }>满二唯一</option>
										<option value="4" ${model.equity==4?'selected':'' }>满二不唯一</option>
										<option value="5" ${model.equity==5?'selected':'' }>购房合同书</option>
									</select>
								</div>
							</div>
						</div>


						<div class="box-body">
							<div class="form-group">
								<label class="col-sm-2 control-label"><i class="red">*</i>产证情况：</label>
								<div class="col-sm-8">
									<label><input value="1" checked="checked" type="radio" class="minimal"
										${(model.certStatus==1)?'checked':'' } name="certStatus">现证</label> <label><input
										value="2" type="radio" class="minimal" ${(model.certStatus==2)?'checked':'' }
										name="certStatus">有抵押</label>
								</div>
							</div>
						</div>




						<div class="box-body">
							<div class="form-group">
								<label class="col-sm-2 control-label"><i class="red">*</i>付款方式：</label>
								<div class="col-sm-8">
									<label><input value="1" checked="checked" type="radio" class="minimal"
										${(model.payType==1)?'checked':'' } name="payType">一次性</label> <label><input
										value="2" type="radio" class="minimal" ${(model.payType==2)?'checked':'' } name="payType">可货款</label>
								</div>
							</div>
						</div>



						<div class="box-body">
							<div class="form-group">
								<label class="col-sm-2 control-label"><i class="red">*</i>看房时间：</label>
								<div class="col-sm-8">
									<label><input value="1" checked="checked" type="radio" class="minimal"
										${(model.lookTime==1)?'checked':'' } name="lookTime">随时看房</label> <label><input
										value="2" type="radio" class="minimal" ${(model.lookTime==2)?'checked':'' }
										name="lookTime">预约看房</label> <label><input value="3" type="radio" class="minimal"
										${(model.lookTime==3)?'checked':'' } name="lookTime">视频看房</label>
								</div>
							</div>
						</div>



						<div class="box-body">
							<div class="form-group">
								<label class="col-sm-2 control-label"><i class="red">*</i>房屋状态：</label>
								<div class="col-sm-8">
									<label><input value="1" checked="checked" type="radio" class="minimal"
										${(model.houseStatus==1)?'checked':'' } name="houseStatus">业主住</label> <label><input
										value="2" type="radio" ${(model.houseStatus==2)?'checked':'' } class="minimal"
										name="houseStatus">租客住</label> <label><input value="3"
										${(model.houseStatus==3)?'checked':'' } type="radio" class="minimal" name="houseStatus">空房</label>
								</div>
							</div>
						</div>



						<div class="box-body">
							<div class="form-group">
								<label class="col-sm-2 control-label"><i class="red">*</i>过户费用：</label>
								<div class="col-sm-8">
									<label><input value="1" checked="checked" type="radio" class="minimal"
										${(model.tranFee==1)?'checked':'' } name="tranFee">业主净收</label> <label><input
										value="2" type="radio" class="minimal" ${(model.tranFee==2)?'checked':'' } name="tranFee">业主承担</label>
									<label><input value="3" type="radio" class="minimal"
										${(model.tranFee==3)?'checked':'' } name="tranFee">一家一半</label>
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
							<label class="col-sm-2 control-label">房源介绍:</label>
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
								<label><input value="1" ${model.isTop==1?'checked':'' } type="radio" class="minimal"
									name="onSale">是</label> <label><input value="2" ${model.isTop==2?'checked':'' }
									type="radio" class="minimal" name="onSale">否</label>
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

		var docsStr = '${model.docs}';
		var arrdocs = docsStr.split("|");

		$.each(arrdocs, function(k, v) {
			var d = v.substring(0, v.indexOf('@'));
			var o = v.substring(v.indexOf('@') + 1);
			if (d != "") {
				docs.put(d, o);
			}
		});
	</script>
</body>
</html>

