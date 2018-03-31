<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<aside class="main-sidebar">

	<section class="sidebar">
		<div class="user-panel">
			<div class="pull-left image">
				<img src="${curUser.avatar }" class="img-circle" alt="User Image">
			</div>
			<div class="pull-left info">
				<p>${curUser.name }</p>
				<a href="#"><i class="fa fa-circle text-success"></i>在线</a>
			</div>
		</div>

		<ul class="sidebar-menu">

			<li class="treeview active"><a href=""> <i class="fa fa-folder"></i> <span>楼盘管理</span> <span
					class="pull-right-container"> <i class="fa fa-angle-left pull-right"></i>
				</span>
			</a>
				<ul class="treeview-menu">
					<li><a href="/admin/premise/list/1/15.htm"><i class="fa fa-circle-o"></i>楼盘列表</a></li>
					<li><a href="/admin/housetype/list/1/15.htm"><i class="fa fa-circle-o"></i>户型列表</a></li>
					<li><a href="/admin/building/list/1/15.htm"><i class="fa fa-circle-o"></i>楼栋列表</a></li>
				</ul></li>



			<li class="treeview active"><a href="#"> <i class="fa fa-folder"></i> <span>房源管理</span>
					<span class="pull-right-container"> <i class="fa fa-angle-left pull-right"></i>
				</span>
			</a>
				<ul class="treeview-menu">
					<li><a href="/admin/house/list/1/15.htm"><i class="fa fa-circle-o"></i>二手房管理</a></li>
					<li><a href="/admin/tenement/list/1/15.htm"><i class="fa fa-circle-o"></i>租房管理</a></li>
					<li><a href="/admin/duanzu/list/1/15.htm"><i class="fa fa-circle-o"></i>短租房管理</a></li>
				</ul></li>


			<li class="treeview active"><a href="#"> <i class="fa fa-folder"></i> <span>信息管理</span>
					<span class="pull-right-container"> <i class="fa fa-angle-left pull-right"></i>
				</span>
			</a>
				<ul class="treeview-menu">
					<li><a href="/admin/notice/list/1/15.htm"><i class="fa fa-circle-o"></i>公告管理</a></li>
					<li><a href="/admin/news/list/1/15.htm"><i class="fa fa-circle-o"></i>资讯管理</a></li>
					<li><a href="/admin/sys/user/list/1/15.htm"><i class="fa fa-circle-o"></i>员工管理</a></li>
					<li><a href="/admin/adviser/list/1/15.htm"><i class="fa fa-circle-o"></i>销售顾问管理</a></li>
				</ul></li>


			<li class="treeview active"><a href="#"> <i class="fa fa-folder"></i> <span>系统设置</span>
					<span class="pull-right-container"> <i class="fa fa-angle-left pull-right"></i>
				</span>
			</a>
				<ul class="treeview-menu">
					<li><a href="/admin/sys/res/list/1/15.htm"><i class="fa fa-circle-o"></i>权限管理</a></li>
				</ul></li>


		</ul>
	</section>
</aside>