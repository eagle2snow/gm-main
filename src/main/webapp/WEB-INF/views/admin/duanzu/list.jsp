<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>
<title>短租房列表</title>

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
								<h3 class="box-title">短租房列表</h3>
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
													<input type="text" name="" id="key" placeholder="房源名称、小区名称等"
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
												<th width="100">名称</th>
												<th>编号</th>
												<th>小区</th>
												<th>室</th>
												<th>厅</th>
												<th>卫</th>
												<th>装修程度</th>
												<th>地址</th>
												<th>房屋面积</th>
												<th>日租</th>
												<th>押金</th>
												<th>床位数</th>
												<th>起租天数</th>
												<th>朝向</th>
												<th>物业类型</th>
												<th>所在楼层</th>
												<th>房东姓名</th>
												<th>房东电话</th>
												<th>轮播</th>
												<th width="100">状态</th>
												<th width="130">创建时间</th>
												<th width="70">显示</th>
												<th width="130">操作</th>
												<th width="30">评论</th>
											</tr>
										</thead>
										<tbody>

											<c:forEach items="${page.list}" var="model">
												<tr>
													<td><input type="checkbox" class="minimal" name="ids" value="${model.id}"></td>

													<th>${model.name}</th>

													<th>${model.code}</th>

													<th>${model.premise.name}</th>

													<th>${model.shi}</th>

													<th>${model.ting}</th>

													<th>${model.wei}</th>

													<th><c:choose>
															<c:when test="${model.fix==1}">毛坯</c:when>
															<c:when test="${model.fix==2}">简装</c:when>
															<c:when test="${model.fix==3}">精装</c:when>
															<c:when test="${model.fix==4}">豪华装</c:when>
														</c:choose></th>

													<th>${model.address}</th>

													<th>${model.area}</th>

													<th>${model.price}</th>

													<th>${model.ya}</th>

													<th>${model.bed}</th>

													<th>${model.mixDay}</th>


													<th><c:choose>
															<c:when test="${model.face==1}">朝东</c:when>
															<c:when test="${model.face==2}">朝南</c:when>
															<c:when test="${model.face==3}">朝西</c:when>
															<c:when test="${model.face==4}">朝北</c:when>
															<c:when test="${model.face==5}">东南</c:when>
															<c:when test="${model.face==6}">东北</c:when>
															<c:when test="${model.face==7}">西南</c:when>
															<c:when test="${model.face==8}">西北</c:when>
															<c:when test="${model.face==9}">南北通透</c:when>
														</c:choose></th>

													<th><c:choose>
															<c:when test="${model.type==1}">住宅</c:when>
															<c:when test="${model.type==2}">别墅</c:when>
															<c:when test="${model.type==3}">商住</c:when>
															<c:when test="${model.type==4}">商铺</c:when>
															<c:when test="${model.type==5}">酒店</c:when>
															<c:when test="${model.type==6}">私宅</c:when>
															<c:when test="${model.type==7}">写字楼</c:when>
															<c:when test="${model.type==8}">工业</c:when>
															<c:when test="${model.type==9}">其他</c:when>
														</c:choose></th>

													<th>${model.floor}</th>

													<%-- <th>${model.traffic}</th> --%>

													<%-- 	<th width="120"><c:forEach items='${fn:split(model.pics,"|")}' var='p'>

															<img src='${p}' style="width: 50pxp; height: 50px; float: left; margin-left: 5px;" />
														</c:forEach></th> --%>


													<th>${model.owner}</th>

													<th>${model.ownerTel}</th>

													<th><c:choose>
															<c:when test="${model.slider==1}">
																<button class="btn btn-danger radius" onclick="setSlider(2,${model.id})">是</button>
															</c:when>
															<c:when test="${model.slider==2}">
																<button class="btn btn-primary radius" onclick="setSlider(1,${model.id})">否</button>
															</c:when>
														</c:choose></th>

													<td><c:choose>
															<c:when test="${model.status==1}">待出租</c:when>
															<c:when test="${model.status==2}">已出租</c:when>
														</c:choose></td>

													<td><javatime:format value="${model.createTime}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
													<td class="td-status">
														<div class="switch switchevent" data-on="primary" lang="${model.id}"
															title="${model.enable}" data-on-label="开" data-off-label="关" data-off="info">
															<input type="checkbox" ${(model.enable==1)?'checked':'' } class="swbtn" />
														</div>
													</td>




													<td>
														<button onclick="goxq(${model.id})" class="btn btn-sm btn-primary">
															<i class="glyphicon glyphicon-blackboard" title="查看"></i>
														</button>
														<button onclick="edit(${model.id})" class="btn btn-sm btn-primary">
															<i class="glyphicon glyphicon-cog" title="修改"></i>
														</button>
														<button onclick="del(${model.id})" class="btn btn-sm btn-danger">
															<i class="glyphicon glyphicon-trash" title="删除"></i>
														</button>
													</td>
													<td>
														<button onclick="gocomment(${model.id})" class="btn btn-sm btn-primary">
															<i class="glyphicon glyphicon-user" title="查看"></i>
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
		      location.href = '${adp}list/'+indexPage+'/${page.sizePage}.htm?k='+k;
		}
		
		function goxq(id){
			openPerRe("短租详情", 90,90,'${adp}show/'+id+'.htm');
		}
		
		function edit(id){
		
				openPerRe("编辑租房", 90,90,'${adp}update/'+id+'.htm');
		
			
		}
		
		function del(id){
			delById(id, '${adp}'); 
		}
		
		//开关回调
		/* var enableFun = function(){
		} */
		
		function setSlider(s,id){
			update(adp + 'updatePVById/slider/' + s + '/' + id
					+ '.json', updateResult);
		}
		
		function gocomment(id){
			openPerRe("民宿  / 点评列表", 90,90,'${adp}showComment/'+id+'.htm');
		}
		
		

		</script>
</body>

</html>