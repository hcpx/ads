<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title></title>
<script type="text/javascript">
	$(function() {
		loadOrderPage(1);
	})
	function loadOrderPage(page) {
		var data = getParam(page);
		var url = path + "order/loadUserList.do";
		$("#content").load(url, data, function(data) {
			initB3paginator();
		});

	}

	//初始化分页
	function initB3paginator() {
		debugger;
		var data = getParam();
		//基本分页
		b3Paginator('pagination', 5, data['currentPage'], data['pageSize'],
				data['totPage'], function(event, originalEvent, type, page) {
					var goPage = 1;
					if (type == "first")
						goPage = 1;
					else if (type == "prev")
						goPage = parseInt(data['currentPage']) - 1;
					else if (type == "next")
						goPage = parseInt(data['currentPage']) + 1;
					else if (type == "last")
						goPage = data['totPage'];
					else if (type == "page")
						goPage = page;
					//页面跳转方法自行定义
					loadOrderPage(goPage);
				}, function(type, page, current) {
					return null;
				});
		$(".page-list").b3paginatorext({
			onPageSizeChange : function() {
				loadOrderPage(1);
			},
			pagesizeinput : "#pageSize",
			pagesize : data['pageSize']
		});
	}

	function getParam(currentPage) {
		var curp = 1;
		var pageSize = 5;
		var userName = $("#name").val();
		if ($("#pageSize").val()) {
			pageSize = $("#pageSize").val();
		}
		var totPage = $("#totPage").val();
		if (currentPage != null && currentPage != '') {
			curp = currentPage;
		} else if ($("#curPage").val()) {
			curp = $("#curPage").val();
		}
		var data = {
			name : userName,
			currentPage : curp,
			pageSize : pageSize,
			totPage : totPage
		};
		return data;
	}
</script>

</head>

<body class="index">
	<div class="container admin-container ">
		<div id="well" class="col-md-8">
				<button aria-hidden="true" data-dismiss="modal" class="close"
					type="button">
					<span aria-hidden="true">&times;</span>
				</button>
			<div class="col-md-8">
				<div class="well well-sm">
					<div class="form-group">
						<input id="name" type="text" class="form-control"
							placeholder="请输入姓名">
					</div>
					<span class="btn btn-primary" onclick="loadOrderPage(1)">查询</span>
				</div>
			</div>
			<div id="content"></div>
		</div>

	</div>
</body>
</html>
