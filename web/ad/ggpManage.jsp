<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath%>">
<script src="js/jquery/jquery-1.11.1.min.js"></script>
<link href="${pageContext.request.contextPath }/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath }/css/bootstrap-datetimepicker.min.css"
	rel="stylesheet">
<link href="<%=path%>/common/css/global.css" rel="stylesheet" />
<link href="<%=path%>/common/css/public.css" rel="stylesheet" />
<script src="js/bootstrap/bootstrap.min.js"></script>
<script src="<%=basePath%>js/bootstrap/bootstrap-paginator.min.js"></script>
<script src="<%=basePath%>js/bootstrap/b3paginator.js"></script>
<style type="text/css">
.errorInfo {
	color: red;
	display: none;
}
</style>
<script type="text/javascript">
    var path='<%=basePath%>';
	$(document).ready(function() {
		loadPage(1);

		$("#modal").on("hidden.bs.modal hide.bs.modal", function(e) {
			$(this).removeData("bs.modal");
		});
	});

	function loadPage(page) {
		var data = getParam(page);
		var url = path + "ggp/getGgpList.do";
		$("#content").load(url, data, function(data) {
			initB3paginator();
		});
	}

	function getParam(currentPage) {
		var curp = 1;
		var pageSize = 5;
		var mc = $("#mc").val();
		var userType = $("#userType").val();
		if (userType == null || userType == "") {
			userType = 1;
		}
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
			mc : mc,
			currentPage : curp,
			pageSize : pageSize,
			totPage : totPage
		};
		return data;
	}
	//初始化分页
	function initB3paginator() {
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
					loadPage(goPage);
				}, function(type, page, current) {
					return null;
				});
		$(".page-list").b3paginatorext({
			onPageSizeChange : function() {
				loadPage(1);
			},
			pagesizeinput : "#pageSize",
			pagesize : data['pageSize']
		});
	}

	function loadGgpAddPage() {
		if ("1" == checkGgpLxCount()) {
			alert("请先添加广告牌类型");
			return;
		}
		var userid = $("#userid").val();
		if (userid == null || userid == "") {
			alert("登陆超时,请重新进行登陆");
			return;
		}
		var url = path + "ggp/loadGgpAdd.do";
		$("#well").load(url);
	}

	function checkGgpLxCount() {
		var url = path + "ggp/checkGgpLxCount.do";
		var flag = "1";
		$.ajax({
			type : 'POST',
			async : false,
			url : url,
			success : function(res) {
				flag = res;
			}
		});
		return flag;
	}

	function submitGgpAdd(eleid, ischeck) {
		var ggpType = $("#lx").val();
		if (ggpType == null || ggpType == "-1") {
			$("#ggpTypeInfo").show();
			return;
		} else {
			$("#ggpTypeInfo").hide();
		}
		var ms = $("#ms").val();
		if (ms == null || ms == "") {
			$("#msInfo").show();
			return;
		} else {
			$("#msInfo").hide();
		}
		var price = $("#jg").val();
		if (price == null || price == "" || !validate(price)) {
			$("#priceInfo").show();
			return;
		} else {
			$("#priceInfo").hide();
		}
		$("#" + eleid).submit();

	}

	function submitGgpUpdate(eleid, ischeck) {
		var ggpType = $("#ggpType ").val();
		if (ggpType == null || ggpType == "" || ggpType=="-1") {
			$("#ggpTypeInfo").show();
			return;
		} else {
			$("#ggpTypeInfo").hide();
		}
		var ms = $("#ms").val();
		if (ms == null || ms == "") {
			$("#msInfo").show();
			return;
		} else {
			$("#msInfo").hide();
		}
		var price = $("#price").val();
		if (price == null || price == "") {
			$("#priceInfo").show();
			return;
		} else {
			$("#priceInfo").hide();
		}
		$("#" + eleid).submit();
	}

	function validate(num) {
		var reg = /^\d+(?=\.{0,1}\d+$|$)/
		if (reg.test(num))
			return true;
		return false;
	}

	function showGgpType(id) {
		var remote_url = path + "ggp/showGgpType.do?id=" + id;
		$("#modal").modal({
			backdrop : 'static',
			keyboard : false,
			show : true,
			remote : remote_url
		});
		$("#modal").modal("show");
	}

	function reback() {
		$("#loadManger").click();
	}

	function updateGgpType(id) {
		var remote_url = path + "ggp/updateGgpType.do?id=" + id;
		$("#modal").modal({
			backdrop : 'static',
			keyboard : false,
			show : true,
			remote : remote_url
		});
		$("#modal").modal("show");
	}
</script>
</head>

<body class="index">
	<div class="container admin-container">
		<!-- 顶部内容 -->
		<header class="navbar navbar-inverse navbar-fixed-top docs-nav"
			role="banner">
			<jsp:include page="/common/include/header_mge.jsp">
				<jsp:param name="target" value="user" />
			</jsp:include>
		</header>

		<!-- 左侧菜单 -->
		<jsp:include page="/ad/common_nav.jsp">
			<jsp:param name="target" value="ggplx" />
		</jsp:include>

		<!-- 右侧内容 -->
		<div id="well" class="col-md-10">
			<div class="">
				<div id="data_header" class="page-header clearfix"
					style="margin: 0px 0 20px">
					<h1 class="pull-left">广告牌管理</h1>
				</div>
				<input type="hidden" name="userid" id="userid" value="${sessionScope.user.id}" />
				<div class="form-inline well well-sm">
					<div class="form-group">
						<input id="ms" type="text" class="form-control"
							placeholder="请输入广告牌描述">
					</div>
					<div class="form-group">
						<select class="form-control" id="useInfo">
							<option value="">使用状况</option>
							<option value="1">空闲</option>
							<option value="2">使用中</option>
						</select>
					</div>

					<div class="form-group">
						<select class="form-control" id="ggpType">
							<option value="">广告类型</option>
							<c:forEach items="${ggpTypeList}" var="gglx">
								<option value="${gglx.id}">${gglx.mc}</option>
							</c:forEach>
						</select>
					</div>

					<span class="btn btn-primary" onclick="loadPage(1)">查询</span> <span
						class="btn btn-primary" onclick="loadGgpAddPage()">添加</span>
				</div>
			</div>
			<div id="content"></div>
		</div>
	</div>
	</div>

	<!-- modal -->
	<div class="modal fade" id="modal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content" id="modalcontent">
				<div class="modal-header">
					<button aria-hidden="true" data-dismiss="modal" class="close"
						type="button">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title"></h4>
				</div>
				<div class="modal-body">
					<div class="loading">
						<img src="<%=path%>/common/images/loading.gif" /> &nbsp;
						正在努力地加载数据中，请稍候……
					</div>
				</div>
				<div class="modal-footer"></div>
			</div>
		</div>
	</div>
</body>
</html>