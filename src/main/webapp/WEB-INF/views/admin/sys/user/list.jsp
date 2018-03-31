<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>
<title>员工列表</title>

<%@ include file="/common/admin/head.jsp"%>

</head>


<body class="hold-transition skin-blue sidebar-mini">
	<div class="wrapper">

		<%@ include file="/common/admin/header.jsp"%>
		<%@ include file="/common/admin/left.jsp"%>

		<div class="content-wrapper">

			<!-- Main content -->
			<section class="content">
				<div class="row">
					<!-- left column -->
					<div class="col-md-12">
						<!-- Horizontal Form -->
						<div class="box box-info">
							<div class="box-header with-border">
								<h3 class="box-title">员工列表</h3>
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
													class="btn btn-danger radius"><i class="glyphicon glyphicon-trash"></i> 批量删除</a> <a
													href="${adp}add.htm" class="btn btn-primary radius"><i
														class="glyphicon glyphicon-plus"></i> 添加</a></span> <span class="r">共有数据：<strong
													id="count">${page.count}</strong> 条
												</span>
											</div>
										</div>
										<div class="col-sm-6">
											<div id="example1_filter" class="dataTables_filter">
												<div class="text-c">
													<input type="text" class="" name="" id="key" placeholder="名称、介绍等"
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
									<table  class="table table-bordered table-striped">
										<thead>

											<tr>
												<th width="25"><input type="checkbox" name="checkAll" class="minimal"></th>
												<th width="40">ID</th>
												<th>头像</th>
												<th>姓名</th>
												<th>性别</th>
												<th>用户名</th>
												<th>手机号</th>
												<th width="130">注册时间</th>												
												<th width="100">审核</th>
												<th width="80">使用状态</th>
												<c:if test="${curUser.username eq'admin' }">
													<th width="100">可登录</th>
												</c:if>
												<th width="100">操作</th>
											</tr>
										</thead>
										<tbody>

											<c:forEach items="${page.list}" var="model">
												<tr>
													<td><c:if test="${model.username ne 'admin' }">
															<input type="checkbox" name="ids" class="minimal" value="${model.id}">
														</c:if></td>
													<td>${model.id}</td>
													<th><img src='${model.avatar}' height="50" width="50" /></th>
													<th>${model.name}</th>
													<th><c:choose>
															<c:when test="${model.sex==1 }">男</c:when>
															<c:when test="${model.sex==2 }">女</c:when>
															<c:otherwise>未知</c:otherwise>
														</c:choose></th>
													<th>${model.username}</th>
													<th>${model.mobile}</th>
													<td><javatime:format value="${model.createTime}" pattern="yyyy-MM-dd HH:mm:ss" /></td>

													<th><c:choose>
															<c:when test="${model.enable==3}">
																<button class="btn btn-danger radius" onclick="audit(${model.id})">通过</button>
															</c:when>
															<c:otherwise>
																<span style="color: #00a65a">已通过</span>
															</c:otherwise>
														</c:choose></th>

													<td>
														<c:choose>
															<c:when test="${model.enable==1}">
																<span style="color: #00a65a">正常</span>
															</c:when>
															<c:otherwise>
																<span>关闭</span>
															</c:otherwise>
														</c:choose>
													</td>					
													<c:if test="${curUser.username eq'admin' }">
														<td class="td-status"><c:choose>
																<c:when test="${model.enable ==3 }">
																 --
																</c:when>
																<c:otherwise>
																	<div class="switch switchevent" data-on="primary" lang="${model.id}"
																		title="${model.enable}" data-on-label="开" data-off-label="关" data-off="info">
																		<input type="checkbox" ${(model.enable==1)?'checked':'' } class="swbtn" />
																	</div>
																</c:otherwise>
															</c:choose></td>
													</c:if>

													<td><c:if
															test="${(model.username ne 'admin') or (model.username eq 'admin' and curUser.username eq'admin' ) }">
															<button onclick="edit(${model.id})" class="btn btn-sm btn-primary">
																<i class="glyphicon glyphicon-cog" title="修改"></i>
															</button>
														</c:if> <c:if test="${model.username ne 'admin' }">
															<button onclick="del(${model.id})" class="btn btn-sm btn-danger">
																<i class="glyphicon glyphicon-trash" title="删除"></i>
															</button>
														</c:if></td>
												</tr>
											</c:forEach>

										</tbody>
									</table>
									<!--分页-->
									<div class="row text-center">
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
		      location.href = '${adp}list/'+indexPage+'/${page.sizePage}.htm?k='+k;
		}
		
		
		function edit(id){
			openPerRe("编辑用户", 90,90,'${adp}update/'+id+'.htm');
		}
		
		function del(id){
			delById(id, '${adp}'); 
		}
		
		//开关回调
		/* var enableFun = function(){
		} */
		function audit(id){
			layer.confirm('确定核审通过吗？', {
				btn : [ '确定', '取消' ]
			// 按钮
			}, function() {
				$.getJSON("${adp}updatePVById/enable/1/"+id+".json",function(res){
					if(res.status=='ok'){
						layer.msg("审核成功，该账号可正常登录");
						setTimeout(function(){
							re();
						},3000);
					}else{
						layer.msg("操作失败");
					}
				});
			}, function() {
				//layer.msg('不删除！');
			});
		}
	
		
		</script>
</body>

</html>