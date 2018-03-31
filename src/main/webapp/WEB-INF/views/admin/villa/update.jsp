<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<title>别墅修改 </title>

<%@ include file="/common/admin/head.jsp"%>


</head>

<body>
	<section class="content">
	<form class="form-horizontal" method="post" id="form-admin-add" action="${adp}update.json">
		<input type="hidden" name="id" value="${model.id}"/>	
		<div class="row">
			<div class="col-md-12">
			
			<div class="box box-info">
					<div class="box-header with-border">
						<h3 class="box-title">编辑</h3>
					</div>
							<div class="form-group">
								<label class="col-sm-2 control-label"><i class="red">*</i>名称:</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" value="${model.name}"
							        placeholder="名称" id="name" name="name" datatype="*" errormsg="请输入名称"         />
								</div>
							</div>
                        
                        
						
						
                        
			                
			                
			                
			                
							
							
							
			                
                        
                        
						
						
                        
	                               <div class="form-group">
										<label class="col-sm-2 control-label">内容:</label>
										<div class="col-sm-8">
											 <script id="content" name="content" type="text/plain" class="ue-editor" style="width:100%; height: 400px;"> ${model.content} </script>
										</div>
								</div>
			                
			                
			                
			                
							
							
							
			                
							<div class="form-group">
								<label class="col-sm-2 control-label">编号:</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" value="${model.code}"
							        placeholder="编号" id="code" name="code"           />
								</div>
							</div>
                        
                        
						
						
                        
			                
			                
			                
			                
							
							
							
			                
                        
                        
						
						
                        
			                
			                
			                
									<div class="form-group">
										<label class="col-sm-2 control-label">楼盘:</label>
										<div class="col-sm-8">
											<select name="premise.id" style="width: 100% !important;" class="form-control select2" id="premise">
												<c:forEach items="${premiseList}" var="m">
													<option    ${model.premise.id==m.id?'selected':'' }  value="${m.id}">
														${m.name}
													</option>
												</c:forEach> 
											</select>
									</div>
								</div>
			                
							
							
							
			                
							<div class="form-group">
								<label class="col-sm-2 control-label">室:</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" value="${model.shi}"
							        placeholder="室" id="shi" name="shi"           />
								</div>
							</div>
                        
                        
						
						
                        
			                
			                
			                
			                
							
							
							
			                
							<div class="form-group">
								<label class="col-sm-2 control-label">厅:</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" value="${model.ting}"
							        placeholder="厅" id="ting" name="ting"           />
								</div>
							</div>
                        
                        
						
						
                        
			                
			                
			                
			                
							
							
							
			                
							<div class="form-group">
								<label class="col-sm-2 control-label">卫:</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" value="${model.wei}"
							        placeholder="卫" id="wei" name="wei"           />
								</div>
							</div>
                        
                        
						
						
                        
			                
			                
			                
			                
							
							
							
			                
							<div class="form-group">
								<label class="col-sm-2 control-label">建筑面积:</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" value="${model.buildingArea}"
							        placeholder="建筑面积" id="buildingArea" name="buildingArea"           />
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
											</select>
									</div>
								</div>
			                
							
							
							
			                
							<div class="form-group">
								<label class="col-sm-2 control-label">楼层数:</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" value="${model.floorCount}"
							        placeholder="楼层数" id="floorCount" name="floorCount"           />
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
								<label class="col-sm-2 control-label">建成年份:</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" value="${model.year}"
							        placeholder="建成年份" id="year" name="year"           />
								</div>
							</div>
                        
                        
						
						
                        
			                
			                
			                
			                
							
							
							
			                
							<div class="form-group">
								<label class="col-sm-2 control-label">单价:</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" value="${model.unitPrice}"
							        placeholder="单价" id="unitPrice" name="unitPrice"           />
								</div>
							</div>
                        
                        
						
						
                        
			                
			                
			                
			                
							
							
							
			                
							<div class="form-group">
								<label class="col-sm-2 control-label">总价:</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" value="${model.price}"
							        placeholder="总价" id="price" name="price"           />
								</div>
							</div>
                        
                        
						
						
                        
			                
			                
			                
			                
							
							
							
			                
                        
                        
	                        <div class="box-body">
								<div class="form-group">
									<label class="col-sm-2 control-label">户型图:</label>
									<div class="col-sm-8">
									
										<input class="file" type="file" id='pic'> <input value="${model.pic}"
											name="pic" id="pic_input" type="hidden" />
										<div style="overflow: hidden;" class="pic">
										
										<div class="showimg-box pull-left">
												<div class="showimg">
													<img src="${model.pic}" width="80" height="60"
														onclick="adminShowPic(this)">
												</div>
												<span onclick="delPic(this,pic)"
													class="fa fa-close delete"></span>
											</div>
										
										
										</div>
									</div>
								</div>
							</div>
						
						
                        
			                
			                
			                
			                
							
							
							
			                
                        
                        
						
						<div class="box-body">
						    <div class="form-group">
									<label class="col-sm-2 control-label">实景图:</label>
									<div class="col-sm-8">
										<input class="files" type="file" id='pics'> <input
											name="pics" id="pics_input" type="hidden" value="${model.pics}" />
										<div style="overflow: hidden;" class="pics">
										
										<c:forEach	items='${fn:split(model.pics,"|")}' var='p'>
												<div class="showimg-box pull-left">
													<div class="showimg">
														<img src='${p}' width="80" height="60"
															onclick="adminShowPic(this)">
													</div>
													<span onclick="delPics(this,pics)"
														class="fa fa-close delete"></span>
												</div>
											</c:forEach>
										
										
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
			btnSubmit: ".btn_sub",
			btnReset: ".btn_reset",
			tiptype: 3,
			ignoreHidden: false,
			dragonfly: false,
			tipSweep: true,
			label: ".label",
			showAllError: false,
			postonce: true,
			ajaxPost: true,

			beforeCheck: function (curform) {
				//在表单提交执行验证之前执行的函数，curform参数是当前表单对象。
				//这里明确return false的话将不会继续执行验证操作;	
			},
			beforeSubmit: function (curform) {
				//在验证成功后，表单提交前执行的函数，curform参数是当前表单对象。
				//这里明确return false的话表单将不会提交;
				var time = $('.auto-kal');
			},	
			callback : updateResult
		});
		
			
				 	var ue =  UE.getEditor('content');
		
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
	</script>	
	</body>
</html>
					
