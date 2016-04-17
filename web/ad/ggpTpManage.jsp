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
<link href="<%=path%>/css/bootstrap.min.css" rel="stylesheet">
<link href="<%=path%>/css/bootstrap-datetimepicker.min.css"
	rel="stylesheet">
<link href="<%=path%>/common/css/global.css" rel="stylesheet" />
<link href="<%=path%>/common/css/public.css" rel="stylesheet" />
<link href="<%=path%>/css/fileinput.min.css" rel="stylesheet" />
<script src="<%=path%>/js/bootstrap/bootstrap.min.js"></script>
<script src="<%=basePath%>js/bootstrap/bootstrap-paginator.min.js"></script>
<script src="<%=basePath%>js/bootstrap/b3paginator.js"></script>
<script src="<%=basePath%>js/bootstrap-fileinput/fileinput.min.js"></script>
<script src="<%=basePath%>js/bootstrap-fileinput/fileinput_locale_zh.js"></script>
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
		var url = path + "ggp/getGgpTpList.do";
		$("#content").load(url, data, function(data) {
			initB3paginator();
		});
	}

	function getParam(currentPage) {
		var curp = 1;
		var pageSize = 5;
		var ms = $("#ms").val();
		var useInfo = $("#useInfo").val();
		var ggpType = $("#ggpType").val();
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
			ms : ms,
			useInfo : useInfo,
			ggpType : ggpType,
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

	function loadGgpTpAddPage() {
		if ("1" == checkGgpTpCount()) {
			alert("请先添加广告牌");
			return;
		}
		var userid = $("#userid").val();
		if (userid == null || userid == "") {
			alert("登陆超时,请重新进行登陆");
			return;
		}
		var url = path + "ggp/loadGgpTpAdd.do";
		$("#well").load(url);
	}

	function checkGgpTpCount() {
		var url = path + "ggp/checkGgpTpLxCount.do";
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
		var jg = $("#jg").val();
		if (jg == null || jg == "" || !validate(jg)) {
			$("#priceInfo").show();
			return;
		} else {
			$("#priceInfo").hide();
		}
		$("#" + eleid).submit();

	}

	function submitGgpUpdate(eleid, ischeck) {
		var updatems = $("#updatems ").val();
		if (updatems == null || updatems == "") {
			$("#msInfo").show();
			return;
		} else {
			$("#msInfo").hide();
		}
		var updatejg = $("#updatejg").val();
		if (updatejg == null || updatejg == "" || !validate(updatejg)) {
			$("#jgInfo").show();
			return;
		} else {
			$("#jgInfo").hide();
		}
		$("#" + eleid).submit();
	}

	function validate(num) {
		var reg = /^\d+(?=\.{0,1}\d+$|$)/
		if (reg.test(num))
			return true;
		return false;
	}

	function showGgp(id) {
		var remote_url = path + "ggp/showGgp.do?id=" + id;
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

	//初始化fileinput控件（第一次初始化）
	function initFileInput(ctrlName, uploadUrl) {
		var control = $('#' + ctrlName);
		control.fileinput({
			language : 'zh', //设置语言
			uploadUrl : uploadUrl, //上传的地址
			allowedFileExtensions : [ 'jpg', 'png', 'gif' ],//接收的文件后缀
			showUpload : true, //是否显示上传按钮
			showCaption : false,//是否显示标题
			browseClass : "btn btn-primary", //按钮样式             
			previewFileIcon : "<i class='glyphicon glyphicon-king'></i>",
		});
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
					<h1 class="pull-left">广告牌图片管理</h1>
				</div>
				<input type="hidden" name="userid" id="userid"
					value="${sessionScope.user.id}" />
				<div class="form-inline well well-sm">
					<div class="form-group">
						<select class="form-control" id="ggpType">
							<option value="">广告类型</option>
							<c:forEach items="${ggpTypeList}" var="gglx">
								<option value="${gglx.id}">${gglx.mc}</option>
							</c:forEach>
						</select>
					</div>

					<span class="btn btn-primary" onclick="loadPage(1)">查询</span> <span
						class="btn btn-primary" onclick="loadGgpTpAddPage()">添加</span>
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