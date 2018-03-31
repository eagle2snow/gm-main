<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<header class="main-header">
	<a href="/admin/index.html" class="logo"> <span class="logo-mini">爱家</span>
		<span class="logo-lg">爱家房产</span>
	</a>

	<nav class="navbar navbar-static-top" role="navigation">
		<a href="#" class="sidebar-toggle" data-toggle="offcanvas"
			role="button"> <span class="sr-only">Toggle navigation</span>
		</a>
		<div class="navbar-custom-menu">
			<ul class="nav navbar-nav">


					
			<!-- 	
				<li class="dropdown messages-menu site-demo-layim" data-type="chat"><a
					href="#" class="dropdown-toggle" data-toggle="dropdown"> <i
						class="fa fa-envelope-o"></i> <span class="label label-success">4</span>
				</a>
					<ul class="dropdown-menu">
						<li class="header">您有4条消息</li>
						<li>
							<ul class="menu">
								<li><a href="#">
										<div class="pull-left">
											<img src="/static/admin/img/user2-160x160.jpg"
												class="img-circle" alt="User Image">
										</div>
										<h4>
											Support Team <small><i class="fa fa-clock-o"></i> 5
												mins</small>
										</h4>
										<p>Why not buy a new awesome theme?</p>
								</a></li>
							</ul>
						</li>
						<li class="footer"><a href="#">See All Messages</a></li>
					</ul></li> 



				<li class="dropdown notifications-menu"><a href="#"
					class="dropdown-toggle" data-toggle="dropdown"> <i
						class="fa fa-bell-o"></i> <span class="label label-warning">10</span>
				</a>
					<ul class="dropdown-menu">
						<li class="header">You have 10 notifications</li>
						<li>
							<ul class="menu">
								<li><a href="#"> <i class="fa fa-users text-aqua"></i>
										5 new members joined today
								</a></li>
							</ul>
						</li>
						<li class="footer"><a href="#">测试</a></li>
					</ul></li>
					
					
					
				<li class="dropdown tasks-menu"><a href="#"
					class="dropdown-toggle" data-toggle="dropdown"> <i
						class="fa fa-flag-o"></i> <span class="label label-danger">9</span>
				</a>
					<ul class="dropdown-menu">
						<li class="header">You have 9 tasks</li>
						<li>
							<ul class="menu">
								<li><a href="#">
										<h3>
											Design some buttons <small class="pull-right">20%</small>
										</h3>
										<div class="progress xs">
											<div class="progress-bar progress-bar-aqua"
												style="width: 20%" role="progressbar" aria-valuenow="20"
												aria-valuemin="0" aria-valuemax="100">
												<span class="sr-only">20% Complete</span>
											</div>
										</div>
								</a></li>
							</ul>
						</li>
						<li class="footer"><a href="#">View all tasks</a></li>
					</ul></li>
					-->
					
				<li class="dropdown user user-menu"><a href="#"
					class="dropdown-toggle" data-toggle="dropdown"> <img
						src="${curUser.avatar }" class="user-image" alt="User Image">
						<span class="hidden-xs">${curUser.name }</span>
				</a>
					<ul class="dropdown-menu">
						<li class="user-header"><img src="${curUser.avatar }"
							class="img-circle" alt="User Image">

							<p></small>
							</p></li>
					<!-- 	<li class="user-body">
							<div class="row">
								<div class="col-xs-4 text-center">
									<a href="#">Followers</a>
								</div>
								<div class="col-xs-4 text-center">
									<a href="#">Sales</a>
								</div>
								<div class="col-xs-4 text-center">
									<a href="#">Friends</a>
								</div>
							</div>
						</li> -->
						<li class="user-footer">
							<!-- <div class="pull-left">
								<a href="#" class="btn btn-default btn-flat">个人资料</a>
							</div> -->
							<div class="pull-right">
								<a href="/admin/logout" class="btn btn-default btn-flat">退出登录</a>
							</div>
						</li>
					</ul></li>
					
			<!-- 	<li><a href="#" data-toggle="control-sidebar"><i
						class="fa fa-gears"></i></a></li> -->
			</ul>
		</div>
	</nav>

	<script type="text/javascript">
		
		//收到消息
		var showMsg = function(msg) {
			var data = {
					  username: msg.fromName //消息来源用户名
						  ,avatar: msg.fromAvatar //消息来源用户头像
						  ,id: msg.fromId //消息的来源ID（如果是私聊，则是用户id，如果是群聊，则是群组id）
						  ,type: "friend" //聊天窗口来源类型，从发送消息传递的to里面获取
						  ,content:msg.content  //消息内容
						  ,cid: 0 //消息id，可不传。除非你要对消息进行一些操作（如撤回）
						  ,mine: false //是否我发送的消息，如果为true，则会显示在右方
						  ,fromid:msg.fromId //消息的发送者id（比如群组中的某个消息发送者），可用于自动解决浏览器多窗口时的一些问题
						  ,timestamp: 1467475443306 //服务端动态时间戳
						};
			layim.getMessage(data);
		}
		
		
		function chat(toId) {
			open('聊天', '805', '564', '/admin/msg/chat/many.htm?toId='+toId);
		}
		
		
	</script>

<%-- 	<%@ include file="/common/admin/chat.jsp"%> --%>


</header>



