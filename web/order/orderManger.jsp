<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
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

<title></title>

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

<script type="text/javascript">
$(function(){
    loadOrderList(1);
});
   var path='<%=basePath%>';
	function loadOrderAddPage() {
		var url = path + "order/loadOrderAdd.do";
		$("#well").load(url);
	}
	function loadOrderList(page) {
		var url = path + "order/listOrder.do";
		var data = getParam(page);
		$("#content").load(url, data, function(re) {
			initB3paginator();
		});
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
					loadOrderList(goPage);
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

	function getParam(currentPage) {
		var curp = 1;
		var pageSize = 5;
		var xsrymc = $("#xsrymc").val();
		var userType = $("#khmc").val();
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
			syrymc : xsrymc,
			lxmc : userType,
			currentPage : curp,
			pageSize : pageSize,
			totPage : totPage
		};
		return data;
	}

	function loadGgp() {
		var remote_url = path + "order/loadOrderGgpList.do";
		$("#modal").modal({
			backdrop : 'static',
			keyboard : false,
			show : true,
			remote : remote_url
		});
		setTimeout(function() {
			loadPage(1);
		}, 500);
		$("#modal").modal("show");
		$(".modal-content").css("width", "800px");
	}

	function addOrder(formId) {
		var khlxr = $("#khlxr").val();
		if (khlxr == "" || khlxr == null) {
			$("#khlxrInfo").show();
			return;
		} else {
			$("#khlxrInfo").hide();
		}
		var khlxrdh = $("#khlxrdh").val();
		if (khlxrdh == null || khlxrdh == "") {
			$("#khlxrdhInfo").show();
			return;
		} else {
			$("#khlxrdhInfo").hide();
		}
		var kssj = $("#kssj").val();
		if (!IsDate(kssj)) {
	       $("#kssjInfo").show();
	       return;
		}else{
		   $("#kssjInfo").hide();
		}
       var jssj = $("#jssj").val();
       
       if(!IsDate(jssj)){
           $("#jssjInfo").show();
           return;
       }else{
           $("#jssjInfo").hide();
       }
       var ggpid = $("#ggpid").val();
       if (ggpid == null || ggpid == "") {
			$("#ggpidInfo").show();
			return;
		} else {
			$("#ggpidInfo").hide();
		}
		
		$("#"+formId).submit();
	}

	function IsDate(mystring) {
	    if(mystring==null||mystring==""){
	       return false;
	    }
		var reg = /^(\d{4})-(\d{2})-(\d{2})$/;
		if (!reg.test(mystring)) {
			return false;
		}
		return true;
	}
</script>

</head>

<body>
	<div class="container admin-container"">
		<!-- 顶部内容 -->
		<header class="navbar navbar-inverse navbar-fixed-top docs-nav"
			role="banner">
			<jsp:include page="/common/include/header_mge.jsp">
				<jsp:param name="target" value="order" />
			</jsp:include>
		</header>
		<!-- 左侧菜单 -->
		<jsp:include page="/order/common_nav.jsp">
			<jsp:param name="target" value="order" />
		</jsp:include>

		<!-- 右侧内容 -->
		<div id="well" class="col-md-10">
			<div class="">
				<div id="data_header" class="page-header clearfix"
					style="margin: 0px 0 20px">
					<h1 class="pull-left">订单管理</h1>
				</div>
				<div class="form-inline well well-sm">
					<div class="form-group">
						<input id="xsrymc" type="text" class="form-control"
							placeholder="销售人员名称">
					</div>
					<div class="form-group">
						<input id="khmc" type="text" class="form-control"
							placeholder="客户联系人">
					</div>
					<div class="form-group"></div>
					<span class="btn btn-primary" onclick="loadOrderList(1)">查询</span>
					<span class="btn btn-primary" onclick="loadOrderAddPage()">添加</span>
				</div>
			</div>
			<div id="content"></div>
		</div>
	</div>


	<!-- modal -->
	<div class="modal fade" id="modal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true"
		style="width:1200px;">
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
