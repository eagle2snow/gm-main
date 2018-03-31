<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<title>二手房详情</title>

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

.b0 {
	border: 0;
}
</style>
</head>

<body>
	<section class="content">
		<form class="form-horizontal" method="post" id="form-admin-add"
			action="#">
			<div class="row">
				<div class="col-md-12">

					<div class="box box-info">
						<div class="box-header with-border">
							<h3 class="box-title"></h3>
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



						<div class="form-group">
							<label class="col-sm-2 control-label">编号:</label>
							<div class="col-sm-8">
								<input disabled="disabled" type="text" class="form-control"
									value="${model.code}" placeholder="编号" id="code" name="code" />
							</div>
						</div>


						<div class="form-group">
							<label class="col-sm-2 control-label">小区:</label>
							<div class="col-sm-8 pt">${model.premise.name}</div>
						</div>


						<div class="form-group">
							<label class="col-sm-2 control-label">门牌:</label>
							<div class="col-sm-8">
								<input type="text" class="form-control" placeholder="如：几栋几单几号"
									id="doorplate" disabled="disabled" value="${model.doorplate}"
									name="doorplate" />
							</div>
						</div>



						<div class="form-group">
							<label class="col-sm-2 control-label">室:</label>
							<div class="col-sm-8">
								<input disabled="disabled" type="text" class="form-control"
									value="${model.shi}" placeholder="室" id="shi" name="shi" />
							</div>
						</div>


						<div class="form-group">
							<label class="col-sm-2 control-label">厅:</label>
							<div class="col-sm-8">
								<input disabled="disabled" type="text" class="form-control"
									value="${model.ting}" placeholder="厅" id="ting" name="ting" />
							</div>
						</div>



						<div class="form-group">
							<label class="col-sm-2 control-label">卫:</label>
							<div class="col-sm-8">
								<input disabled="disabled" type="text" class="form-control"
									value="${model.wei}" placeholder="卫" id="wei" name="wei" />
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">阳台:</label>
							<div class="col-sm-8">
								<input disabled="disabled" type="text" class="form-control"
									value="${model.yang}" placeholder="阳台" id="yang" name="yang" />
							</div>
						</div>

						<div class="form-group">
							<label class="col-sm-2 control-label">装修程度:</label>
							<div class="col-sm-8" style="padding-top: 7px">
								<c:choose>
									<c:when test="${(model.fix==1)}">  
									          毛坯
									   </c:when>
									<c:when test="${(model.fix==2)}">  
									            简装
									   </c:when>
									<c:when test="${(model.fix==3)}">  
									            精装
									   </c:when>
									<c:otherwise> 
									     豪华装
									   </c:otherwise>
								</c:choose>
							</div>
						</div>


						<div class="form-group">
							<label class="col-sm-2 control-label">地址:</label>
							<div class="col-sm-8">
								<input disabled="disabled" type="text" class="form-control"
									value="${model.address}" placeholder="地址" id="address"
									name="address" />
							</div>
						</div>


						<div class="form-group">
							<label class="col-sm-2 control-label">房屋面积（m<sup>2</sup>）:
							</label>
							<div class="col-sm-8">
								<input disabled="disabled" type="text" class="form-control"
									value="${model.area}" placeholder="房屋面积，请输入整数" datatype="n"
									id="area" name="area" />
							</div>
						</div>



						<div class="form-group">
							<label class="col-sm-2 control-label">总价:</label>
							<div class="col-sm-8">
								<input disabled="disabled" type="text" class="form-control"
									value="${model.price}" placeholder="总价" id="price" name="price" />
							</div>
						</div>


						<div class="form-group">
							<label class="col-sm-2 control-label">建造年份:</label>
							<div class="col-sm-8">
								<input disabled="disabled" type="text" class="form-control"
									value="${model.year}" placeholder="建造年份" id="year" name="year" />
							</div>
						</div>


						<div class="form-group">
							<label class="col-sm-2 control-label">朝向:</label>

							<div class="col-sm-8" style="padding-top: 7px">
								<c:choose>
									<c:when test="${(model.face==1)}">  
									         朝东
									   </c:when>
									<c:when test="${(model.face==2)}">  
									           朝南
									   </c:when>
									<c:when test="${(model.face==3)}">  
									            朝西
									   </c:when>
									<c:when test="${(model.face==4)}">  
									            朝北
									   </c:when>
									<c:when test="${(model.face==5)}">  
									            东南
									   </c:when>
									<c:when test="${(model.face==6)}">  
									            东北
									   </c:when>
									<c:when test="${(model.face==7)}">  
									          西南
									   </c:when>
									<c:when test="${(model.face==8)}">  
									          西北
									   </c:when>
									<c:when test="${(model.face==9)}">  
									          南北通透
									   </c:when>
								</c:choose>

							</div>
						</div>





						<div class="form-group">
							<label class="col-sm-2 control-label">参考首付:</label>
							<div class="col-sm-8">
								<input disabled="disabled" type="text" class="form-control"
									value="${model.downPayment}" placeholder="参考首付"
									id="downPayment" name="downPayment" />
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


						<div class="box-body">
							<div class="form-group">
								<label class="col-sm-2 control-label">物业费:</label>
								<div class="col-sm-8">
									<input type="text" class="form-control"
										value="${model.proManFee}" disabled="disabled" />
								</div>
							</div>
						</div>


						<div class="form-group">
							<label class="col-sm-2 control-label">总楼层:</label>
							<div class="col-sm-8">
								<input disabled="disabled" type="text" class="form-control"
									value="${model.floors}" id="floors" name="floors" />
							</div>
						</div>

						<div class="form-group">
							<label class="col-sm-2 control-label">所在楼层:</label>
							<div class="col-sm-8">
								<input disabled="disabled" type="text" class="form-control"
									value="${model.floor}" placeholder="所在楼层" id="floor"
									name="floor" />
							</div>
						</div>


						<div class="form-group">
							<label class="col-sm-2 control-label">几梯几户:</label>
							<div class="col-sm-8">
								<input disabled="disabled" type="text" class="form-control"
									value="${model.lifts}" />
							</div>
						</div>



						<div class="form-group">
							<label class="col-sm-2 control-label">月供:</label>
							<div class="col-sm-8">
								<input disabled="disabled" type="text" class="form-control"
									value="${model.monthPayment}" placeholder="月供"
									id="monthPayment" name="monthPayment" />
							</div>
						</div>


						<div class="form-group">
							<label class="col-sm-2 control-label">交通:</label>
							<div class="col-sm-8">
								<input disabled="disabled" type="text" class="form-control"
									value="${model.traffic}" placeholder="交通" id="traffic"
									name="traffic" />
							</div>
						</div>


						<div class="form-group">
							<label class="col-sm-2 control-label">银行:</label>
							<div class="col-sm-8">
								<input disabled="disabled" type="text" class="form-control"
									value="${model.bank}" placeholder="银行" id="bank" name="bank" />
							</div>
						</div>



						<div class="form-group">
							<label class="col-sm-2 control-label">学校:</label>
							<div class="col-sm-8">
								<input disabled="disabled" type="text" class="form-control"
									value="${model.school}" placeholder="学校" id="school"
									name="school" />
							</div>
						</div>

						<div class="form-group">
							<label class="col-sm-2 control-label">医院:</label>
							<div class="col-sm-8">
								<input disabled="disabled" type="text" class="form-control"
									value="${model.hospital}" placeholder="医院" id="hospital"
									name="hospital" />
							</div>
						</div>


						<div class="form-group">
							<label class="col-sm-2 control-label">停车位:</label>
							<div class="col-sm-8">
								<input disabled="disabled" type="text" class="form-control"
									value="${model.park}" placeholder="停车位" id="park" name="park" />
							</div>
						</div>

						<div class="box-body">
							<div class="form-group">
								<label class="col-sm-2 control-label">户型图:</label>
								<div class="col-sm-8">

									<div class="showimg-box pull-left">
										<div class="showimg">
											<img src="${model.pic}" width="80" height="60"
												onclick="adminShowPic(this)">
										</div>
									</div>


								</div>
							</div>
						</div>
					</div>

					<div class="box-body">
						<div class="form-group">
							<label class="col-sm-2 control-label">室内图:</label>
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
						<label class="col-sm-2 control-label">特色:</label>
						<div class="col-sm-8">
							<input disabled="disabled" type="text" class="form-control"
								value="${model.special}" placeholder="有多个用“|”隔开，如：地铁|海景|双阳台"
								id="special" name="special" />
						</div>
					</div>

					<div class="form-group">
						<label class="col-sm-2 control-label">业主姓名:</label>
						<div class="col-sm-8">
							<input disabled="disabled" type="text" class="form-control"
								value="${model.owner}" placeholder="业主姓名" id="owner"
								name="owner" />
						</div>
					</div>

					<div class="form-group">
						<label class="col-sm-2 control-label">业主电话:</label>
						<div class="col-sm-8">
							<input disabled="disabled" type="text" class="form-control"
								value="${model.ownerTel}" placeholder="业主电话" id="ownerTel"
								name="ownerTel" />
						</div>
					</div>

					<div class="form-group">
						<label class="col-sm-2 control-label">产权状况:</label>
						<div class="col-sm-8" style="padding-top: 7px">
							<c:choose>
								<c:when test="${(model.equity==1)}">  
									          满五唯一
									   </c:when>
								<c:when test="${(model.equity==2)}">  
									           满五不唯一
									   </c:when>
								<c:when test="${(model.equity==3)}">  
									         满二唯一
									   </c:when>
								<c:when test="${(model.equity==4)}">  
									         满二不唯一
									   </c:when>
								<c:when test="${(model.equity==5)}">  
									        购房和同书
									   </c:when>
							</c:choose>
						</div>
					</div>

					<div class="form-group">
						<label class="col-sm-2 control-label">产证情况:</label>
						<div class="col-sm-8" style="padding-top: 7px">
							<c:choose>
								<c:when test="${(model.certStatus==1)}">  
									          现证
									   </c:when>
								<c:when test="${(model.certStatus==2)}">  
									           有抵押
									   </c:when>
							</c:choose>
						</div>
					</div>



					<div class="form-group">
						<label class="col-sm-2 control-label">付款方式:</label>
						<div class="col-sm-8" style="padding-top: 7px">
							<c:choose>
								<c:when test="${(model.payType==1)}">  
									         一次性
									   </c:when>
								<c:when test="${(model.payType==2)}">  
									         可贷款
									   </c:when>
							</c:choose>
						</div>
					</div>



					<div class="form-group">
						<label class="col-sm-2 control-label">看房时间 :</label>
						<div class="col-sm-8" style="padding-top: 7px">
							<c:choose>
								<c:when test="${(model.lookTime==1)}">  
									       随时看房
									   </c:when>
								<c:when test="${(model.lookTime==2)}">  
									         预约看房
									   </c:when>
								<c:when test="${(model.lookTime==3)}">  
									      视频看房
									   </c:when>
							</c:choose>
						</div>
					</div>


					<div class="form-group">
						<label class="col-sm-2 control-label">房屋状态 :</label>
						<div class="col-sm-8" style="padding-top: 7px">
							<c:choose>
								<c:when test="${(model.houseStatus==1)}">  
									      业主住
									   </c:when>
								<c:when test="${(model.houseStatus==2)}">  
									     租客住
									   </c:when>
								<c:when test="${(model.houseStatus==3)}">  
									    空房
									   </c:when>
							</c:choose>
						</div>
					</div>



					<div class="form-group">
						<label class="col-sm-2 control-label">过户费用 :</label>
						<div class="col-sm-8" style="padding-top: 7px">
							<c:choose>
								<c:when test="${(model.tranFee==1)}">  
									     业主净收
									   </c:when>
								<c:when test="${(model.tranFee==2)}">  
									   业主承担
									   </c:when>
								<c:when test="${(model.tranFee==3)}">  
									 一家一半
									   </c:when>
							</c:choose>
						</div>
					</div>








					<div class="box-body">
						<div class="form-group">
							<label class="col-sm-2 control-label">公告:</label>
							<div class="col-sm-8">
								<div id="notice" name="notice" class="form-control"
									style="border: 0;" rows="3">${model.notice }</div>
							</div>
						</div>
					</div>

					<div class="form-group">
						<label class="col-sm-2 control-label">房源介绍:</label>
						<div class="col-sm-8 pt">${model.content}</div>
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

