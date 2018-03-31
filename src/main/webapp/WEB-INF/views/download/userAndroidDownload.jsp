<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<meta name="viewport" content="initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<title>下载爱家房产网app</title>
<link rel="stylesheet" href="/static/web/css/download.css" />
<link rel="icon" type="image/x-icon" href="/static/web/img/runi.ico">
</head>

<body>
	<!-- <div class="bgbox">
		<img src="/static/web/img/download/bg.jpg">
	</div> -->
	<div class="container">
		<!-- <div class="logo">
			<img src="/static/web/img/download/logo.png">
		</div> -->
		<button type="button"
			onclick="window.location.href='/file/downloadApp'"
			class="btn-download">
			<img src="/static/web/img/download/android.png">
		</button>
		<div class="phone">
			<img src="/static/web/img/download/phone-user-a.png">
		</div>
	</div>
</body>

</html>