<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<title>租房详情</title>

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
		<form class="form-horizontal" method="post" id="form-admin-add">
			<input disabled="disabled" type="hidden" name="id" value="${model.id}" />
			<div class="row">
				<div class="col-md-12">

					<div class="box box-info">
						<div class="box-header with-border">
							<h3 class="box-title">编辑</h3>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label"><i class="red">*</i>名称:</label>
							<div class="col-sm-8">
								<input disabled="disabled" type="text" class="form-control" value="${model.name}"
									placeholder="名称" id="name" name="name" datatype="*" errormsg="请输入名称" />
							</div>
						</div>


						<div class="form-group">
							<label class="col-sm-2 control-label">所属员工:</label>
							<div class="col-sm-8 pt">${model.user.name}</div>
						</div>


						<div class="box-body">
							<div class="form-group">
								<label class="col-sm-2 control-label">区域:</label>
								<div class="col-sm-8 pt">
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
								<input disabled="disabled" type="text" class="form-control" value="${model.code}"
									placeholder="编号" id="code" name="code" />
							</div>
						</div>

						<div class="form-group">
							<label class="col-sm-2 control-label">小区:</label>
							<div class="col-sm-8 pt">${model.premise.name}</div>
						</div>


						<div class="form-group">
							<label class="col-sm-2 control-label">室:</label>
							<div class="col-sm-8">
								<input disabled="disabled" type="text" class="form-control" value="${model.shi}"
									placeholder="室" id="shi" name="shi" />
							</div>
						</div>


						<div class="form-group">
							<label class="col-sm-2 control-label">厅:</label>
							<div class="col-sm-8">
								<input disabled="disabled" type="text" class="form-control" value="${model.ting}"
									placeholder="厅" id="ting" name="ting" />
							</div>
						</div>

						<div class="form-group">
							<label class="col-sm-2 control-label">卫:</label>
							<div class="col-sm-8">
								<input disabled="disabled" type="text" class="form-control" value="${model.wei}"
									placeholder="卫" id="wei" name="wei" />
							</div>
						</div>
						
						<div class="form-group">
							<label class="col-sm-2 control-label">阳台:</label>
							<div class="col-sm-8">
								<input disabled="disabled" type="text" class="form-control" value="${model.yang}"
									placeholder="阳台" id="yang" name="yang" />
							</div>
						</div>


						<div class="form-group">
							<label class="col-sm-2 control-label">装修程度:</label>
							<div class="col-sm-8 pt">
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
								<input disabled="disabled" type="text" class="form-control" value="${model.address}"
									placeholder="地址" id="address" name="address" />
							</div>
						</div>


						<div class="form-group">
							<label class="col-sm-2 control-label">房屋面积:</label>
							<div class="col-sm-8">
								<input disabled="disabled" type="text" class="form-control" value="${model.area}"
									placeholder="房屋面积" id="area" name="area" />
							</div>
						</div>


						<div class="form-group">
							<label class="col-sm-2 control-label">日租:</label>
							<div class="col-sm-8">
								<input disabled="disabled" type="text" class="form-control" value="${model.price}"
									placeholder="日租" id="price" name="price" />
							</div>
						</div>


						<div class="form-group">
							<label class="col-sm-2 control-label">押金:</label>
							<div class="col-sm-8">
								<input disabled="disabled" type="text" class="form-control" value="${model.ya}"
									placeholder="押金" id="ya" name="ya" />
							</div>
						</div>


						<div class="form-group">
							<label class="col-sm-2 control-label">床位数:</label>
							<div class="col-sm-8">
								<input disabled="disabled" type="text" class="form-control" value="${model.bed}"
									placeholder="床位数" id="bed" name="fu" />
							</div>
						</div>



						<div class="form-group">
							<label class="col-sm-2 control-label">起租天数:</label>
							<div class="col-sm-8">
								<input disabled="disabled" type="text" class="form-control" value="${model.mixDay}"
									placeholder="起租天数" id="mixDay" name="mixDay" />
							</div>
						</div>


						<div class="form-group">
							<label class="col-sm-2 control-label">建造年份:</label>
							<div class="col-sm-8">
								<input disabled="disabled" type="text" class="form-control" value="${model.year}"
									placeholder="建造年份" id="year" name="year" />
							</div>
						</div>

						<div class="form-group">
							<label class="col-sm-2 control-label">朝向:</label>
							<div class="col-sm-8 pt">
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
									<c:otherwise> 
									   未知
									   </c:otherwise>
								</c:choose>
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
							<label class="col-sm-2 control-label">所在楼层:</label>
							<div class="col-sm-8">
								<input disabled="disabled" type="text" class="form-control" value="${model.floor}"
									placeholder="所在楼层" id="floor" name="floor" />
							</div>
						</div>


						<div class="box-body">
							<div class="form-group">
								<label class="col-sm-2 control-label">几梯几户:</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" value="${model.lifts }" disabled="disabled" />
								</div>
							</div>
						</div>


						<div class="form-group">
							<label class="col-sm-2 control-label">交通:</label>
							<div class="col-sm-8">
								<input disabled="disabled" type="text" class="form-control" value="${model.traffic}"
									placeholder="交通" id="traffic" name="traffic" />
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
													<img src='${p}' width="80" height="60" onclick="adminShowPic(this)">
												</div>

											</div>
										</c:forEach>


									</div>
								</div>
							</div>
						</div>


						<div class="form-group">
							<label class="col-sm-2 control-label">配套:</label>
							<div class="col-sm-8">${model.matStr}</div>
							<input disabled="disabled" name="mat" id="mat" type="hidden" />
						</div>



						<div class="form-group">
							<label class="col-sm-2 control-label">房东姓名:</label>
							<div class="col-sm-8">
								<input disabled="disabled" type="text" class="form-control" value="${model.owner}"
									placeholder="房东姓名" id="owner" name="owner" />
							</div>
						</div>


						<div class="form-group">
							<label class="col-sm-2 control-label">房东电话:</label>
							<div class="col-sm-8">
								<input disabled="disabled" type="text" class="form-control" value="${model.ownerTel}"
									placeholder="房东电话" id="ownerTel" name="ownerTel" />
							</div>
						</div>


						<div class="form-group">
							<label class="col-sm-2 control-label">特色:</label>
							<div class="col-sm-8">
								<input disabled="disabled" type="text" class="form-control" value="${model.special}"
									placeholder="有多个用“|”隔开，如：地铁|海景|双阳台" id="special" name="special" />
							</div>
						</div>


						<div class="box-body">
							<div class="form-group">
								<label class="col-sm-2 control-label">状态:</label>
								<div class="col-sm-8 pt">
									<c:choose>
										<c:when test="${(model.status==1)}">  
									        待出租
									   </c:when>

										<c:otherwise> 
									  已租出
									   </c:otherwise>
									</c:choose>
								</div>
							</div>
						</div>


						<div class="box-body">
							<div class="form-group">
								<label class="col-sm-2 control-label">公告:</label>
								<div class="col-sm-8">
									<div id="notice" name="notice" class="form-control b0" rows="3" placeholder="请输入房源公告">${model.notice }</div>
								</div>
							</div>
						</div>

						<div class="form-group">
							<label class="col-sm-2 control-label">房源介绍:</label>
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
				$("#mat").val(getCheckBoxValueStrByName("matcb"));
			},
			callback : updateResult
		});

		var ue = UE.getEditor('content');
	</script>
</body>
</html>

