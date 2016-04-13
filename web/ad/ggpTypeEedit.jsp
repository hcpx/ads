<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<div class="">
	<div class="modal-header">
		<button aria-hidden="true" data-dismiss="modal" class="close"
			type="button">
			<span aria-hidden="true">&times;</span>
		</button>
		<h4 class="modal-title">广告类型信息</h4>
	</div>
	<form method="post" class="form-horizontal" id="updateGgpForm" action="<%=path%>/ggp/updateGgpType.do">
		<div class="modal-body">
			<div class="row form-group">
				<div class="col-md-3 control-label">
					<label>广告类型名称：</label>
				</div>
				<div class="col-md-7 controls">
					<input type="text" class="form-control" id="mc" name="mc"
						value="${ggpType.mc }"> <label id="mcInfo"
						class="errorInfo">*名称不能为空</label> <input type="hidden" name="id"
						value="${ggpType.id }">
				</div>
			</div>
			<div class="row form-group">
				<div class="col-md-3 control-label">
					<label>类型描述：</label>
				</div>
				<div class="col-md-7 controls">
					<input type="text" class="form-control" id="ms"
						name="ms" value="${ggpType.ms }"> <label
						id="passwordInfo" class="errorInfo">*描述不能为空</label>
				</div>
			</div>
		</div>
	</form>
	<div class="modal-footer">
		<button id="updatesubnitBtn" class="btn btn-primary pull-right"
			type="button" onclick="submitGgpUpdate('updateGgpForm',false)">提交</button>
		<button data-dismiss="modal" class="btn btn-link pull-right"
			type="button">取消</button>
	</div>
</div>
