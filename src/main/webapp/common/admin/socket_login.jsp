<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script src="/static/plugins/socket/sockjs.js"></script>
<script src="/static/plugins/socket/stomp.js"></script>
<script type="text/javascript">
	var stompClient = null;

	$(document).ready(function() {
		connect();
	});

	function connect() {
		var socket = new SockJS("${baseUrl}/wskjs");
		stompClient = Stomp.over(socket);
		stompClient.connect('abc', '123', function(frame) {

			console.log("ws已连接");

			stompClient.subscribe('/msg/sendToPc/${uuid}', function(data) {
				getMsg(data);
			});

			stompClient.subscribe('/msg/sendToPc/ScanQrEvt/${uuid}', function(
					data) {
				$("#tip").html('<span style="color: #31b968;">请在手机上确认登录</span>');
			});
		});
	}

	function getMsg(msg) {
		var message = JSON.parse(msg.body);
		console.log(message);
		var uuid = "${uuid}";
		if (message.enable == 1) {
			$.getJSON("/admin/qrLogin?uuid=" + uuid, function(res) {
				if (res.s == 'ok') {
					$("#tip").html('<span style="color: #31b968;">认证成功，正在登录...</span>');
					setTimeout(function(){
						location.href = "/admin/index.htm";
					},1000);
				} else if (res.s == "noUser") {
					$("#tip").html('<span style="color:red;">用户不存在</span>');
					setTimeout(function(){
						location.reload();		
					},3000);
				} else if (res.s == "notAllow") {
					$("#tip").html('<span style="color:red;">用户不同意登录</span>');
					setTimeout(function(){
						location.reload();		
					},3000);
				} else if (res.s == "disable") {
					$("#tip").html('<span style="color:red;">账户已禁用，请联系管理员</span>');
					setTimeout(function(){
						location.reload();		
					},5000);
				} else if (res.s == "timeout") {
					$("#tip").html('<span style="color:red;">二维码已过期</span>');
					setTimeout(function(){
						location.reload();		
					},2000);
				}
			});
		} else {
			$("#tip").html('<span style="color:red;">用户不同意登录</span>');
			setTimeout(function(){
				location.reload();		
			},1000);
		}
	}
</script>


