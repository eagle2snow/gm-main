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
			
			//stompClient.heartbeat.outgoing = 2000; 

			//订阅固定路径，适用接收广播
			stompClient.subscribe('/msg/brocast', function(data) {
				getMsg(data);
			});

			stompClient.subscribe('/msg/chat/many', function(data) {
				getMsg(data);
			});

			//订阅个性路径，用于接收 定向消息
			stompClient.subscribe('/msg/sendToUser/${curUser.id}', function(
					data) {
				getMsg(data);
			});
		});
	}

	function getMsg(msg) {
		var message = JSON.parse(msg.body);
		if(typeof(showMsg)!='undefined'){
			showMsg(message);
		}		
	}
</script>


