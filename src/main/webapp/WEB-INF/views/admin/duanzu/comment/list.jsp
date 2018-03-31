<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>
<title>点评列表</title>

<%@ include file="/common/admin/head.jsp"%>


</head>
<body class="hold-transition skin-blue sidebar-mini">
	<div>
		<div style="float: left;padding-left:20px;padding-top:20px;line-height:24px;">
			<p><span style="font-weight: bold;">房源名称：</span>${fn:substring(model.name,0,7)}...</p>
			<p><span style="font-weight: bold;">房源编号：</span>${model.code}</p>			
			<p><span style="font-weight: bold;">出租状态：</span>
			<c:choose>
				<c:when test="${model.status eq 1}">待出租</c:when>
				<c:when test="${model.status eq 2}">已出租</c:when>
			</c:choose>
			</p>
			<p><span style="font-weight: bold;">房源门店：</span>${model.user.store.name}</p>
			<p><span style="font-weight: bold;">门店店长：</span>${model.user.store.adminName}</p>
			<p><span style="font-weight: bold;">店长电话：</span>${model.user.store.adminMobile}</p>
			<p><span style="font-weight: bold;">小区名：</span>${model.premise.name}</p>
			<%-- <p><span style="font-weight: bold;">门牌：</span>${model.doorplate}</p> --%>
			<p><span style="font-weight: bold;">业主姓名：</span>
				${model.owner }
			</p>
			<p><span style="font-weight: bold;">业主电话：</span>
				${model.ownerTel }
			</p>
			<p><span style="font-weight: bold;">房源地址：</span>${fn:substring(model.address,0,7)}...</p>			
			
			
			
		</div>
<%-- 		<%@ include file="/common/admin/header.jsp"%>
		<%@ include file="/common/admin/left.jsp"%> --%>
		<div class="content-wrapper">
		<!-- Main content -->
		<section class="content">

			
			<div class="row">
						
				<!-- left column -->
				<div class="col-md-12">
					<!-- Horizontal Form -->
					<div class="box box-info">
						<div class="box-header with-border">
							<h3 class="box-title">点评列表</h3>
						</div>
						<!-- /.box-header -->
						<div class="box">
							
							<!-- /.box-header -->
							<div class="box-body">
								<!--搜索框-->
								<div class="row">
									<div class="col-sm-6">
										<div class="cl pd-5 bg-1 bk-gray mt-20">
											<span class="l"><a href="javascript:;"
												onclick="delByIds('${adp}comment/')" class="btn btn-danger radius"><i
													class="glyphicon glyphicon-trash"></i> 批量删除</a>
													
													<%--  <button
													onclick="opens('添加',900,900,'${adp}add.htm')"
												class="btn btn-primary radius"><i class="glyphicon glyphicon-plus"></i>
													添加</button> --%>
													
													
													</span> <span class="r">共有数据：<strong id="count">${page.count}</strong> 条
											</span>
										</div>
									</div>
									<div class="col-sm-6">
										<div id="example1_filter" class="dataTables_filter">
											<div class="text-c">
												<input type="text" name="" id="key" placeholder="名称、介绍等"
													onkeypress="if(event.keyCode==13) {btn.click();return false;}"
													value='${key}' style="width: 250px;height:33px" class="input-text">
												<button name="" id="btn" class="btn btn-success" type="submit"
													onclick="getData(1)">
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
											<th width="25"><input  name="checkAll" class="minimal" type="checkbox"></th>
											<th width="40">ID</th>
											<th>内容</th>
											<!-- <th>组图</th> -->
											<th>评论人</th>
											<th>模块</th>
											<!-- <th>数据id</th> -->
											<th width="130">创建时间</th>
											<th width="100">状态</th>
											<th width="100">操作</th>
										</tr>
									</thead>
									<tbody>
									
										<c:forEach items="${page.list}" var="model">
										<tr>
											<td><input type="checkbox" class="minimal" name="ids" value="${model.id}"></td>
											<td>
												${model.id}
											</td>
											
											 <th>${model.content}</th>
											
											
											 <%-- <th>${model.pics}</th> --%>
											
											 <th>${model.user.name}</th>
											
											 <th><c:choose>
													<c:when test="${model.model eq 1}">新房</c:when>
													<c:when test="${model.model eq 2}">二手房</c:when>
													<c:when test="${model.model eq 3}">租房</c:when>
													<c:when test="${model.model eq 4}">民宿</c:when>
												</c:choose></th>
											
											 <%-- <th>${model.modelId}</th> --%>
											
											<td><javatime:format value="${model.createTime}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
											<td class="td-status">
														<div class="switch switchevent" data-on="primary"
															lang="${model.id}" title="${model.enable}"
															data-on-label="开" data-off-label="关" data-off="info">
															<input type="checkbox" ${(model.enable==1)?'checked':'' }
																class="swbtn" />
														</div>
											</td>
											<td>
												<button onclick="show(${model.id})"  class="btn btn-sm btn-primary"><i class="glyphicon glyphicon-eye-open" title="查看"></i></button>
												<button onclick="del(${model.id})" class="btn btn-sm btn-danger"><i class="glyphicon glyphicon-trash" title="删除"></i></button>
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
		<%-- <%@ include file="/common/admin/footer.jsp"%> --%>
		<%-- <%@ include file="/common/admin/right.jsp"%> --%>
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
		
		
		function show(id){
		
				openPerRe("查看点评", 90,90,'${adp}showSingleComment/'+id+'.htm');
		
			
		}
		
		function del(id){
			delById(id, '${adp}comment/'); 
		}
		
		//开关回调
		/* var enableFun = function(){
		} */
		
		

		</script>
		
	</body>

</html>