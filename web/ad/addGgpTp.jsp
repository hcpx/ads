<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<script type="text/javascript">
	$(document).ready(function() {
		initFileInput("moreFile", "/User/EditPortrait");
	});
</script>
<div  class="well" style="height:auto">
	<form method="post" class="form-horizontal" action="/ggp/saveGgpTp"
		id="ggpTpAddForm" enctype="multipart/form-data" method="post">
		<div class="modal-body" style="height:100%">
			<div class="row form-group">
				<div class="col-md-2 control-label">
					<label>广告牌类型：</label>
				</div>
				<div class="input-group">
					<select class="form-control" id="lx" name="lx">
						<option value="-1">请选择</option>
						<c:forEach items="${ggpList}" var="ggp">
							<option value="${ggp.id}">${ggp.ms}</option>
						</c:forEach>
					</select> <label id="ggpTypeInfo" class="errorInfo">*必须选择一个广告牌</label>
				</div>
			</div>

			<div class="row form-group">
				<div class="col-md-2 control-label">
					<label>广告牌图片上传：</label>
				</div>
			</div>
			<div class="row" style="position:static;float:none;clear:both;">
				<input id="moreFile" type="file" multiple class="file"
					data-overwrite-initial="false" data-min-file-count="1">
			</div>
			<div class="modal-footer" style="position:static;float:nono;clear:both;margin-top:20px;">
				<button id="subnitBtn" class="btn btn-primary pull-left"
					type="button" onclick="submitGgpTpAdd('ggpTpAddForm',true)">提交</button>
			</div>
		</div>
	</form>
</div>