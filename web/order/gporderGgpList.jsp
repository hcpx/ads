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
    
    
    $(function(){
		$("#modal").on("hidden.bs.modal hide.bs.modal", function(e) {
			$(this).removeData("bs.modal");
		});
    });

	function loadPage(page) {
		var data = getParam(page);
		var url = path + "order/getGgpList.do";
		$("#content").load(url, data, function(data) {
			initB3paginator();
		});
	}

	function getParam(currentPage) {
		var curp = 1;
		var pageSize = 5;
		var mc = $("#ms").val();
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
			ms : mc,
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
	
	function choiceGgp(ggpid,jg,ms){
	   $("#ggpid").val(ggpid);
	   $("#ggpdj").val(jg);
	   $("#ggpmc").val(ms);
	   $("#closeId").click();
	}
	
</script>
</head>

<body class="index">
	<div class="container admin-container"
		style="width:800px;>
		<!-- 右侧内容 -->
		<div id="well" class="col-md-10">
			<div class="">
			<button id="closeId" aria-hidden="true" data-dismiss="modal" class="close" type="button">
			<span aria-hidden="true">&times;</span>
		</button>
				<input type="hidden" name="userid" id="userid" value="${sessionScope.user.id}" />
				<div class="form-inline well well-sm">
					<div class="form-group">
						<input id="ms" type="text" class="form-control"
							placeholder="请输入广告牌描述">
					</div>
					<div class="form-group">
						<select class="form-control" id="ggpType">
							<option value="">广告类型</option>
							<c:forEach items="${ggpTypeList}" var="gglx">
								<option value="${gglx.id}">${gglx.mc}</option>
							</c:forEach>
						</select>
					</div>

					<span class="btn btn-primary" onclick="loadPage(1)">查询</span> 
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