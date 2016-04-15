<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<div class="well">
	<form method="post" class="form-horizontal" action="ggp/saveGgp.do"
		id="ggpAddForm">
		<div class="modal-body">
			<div class="row form-group">
				<div class="col-md-2 control-label">
					<label>广告牌类型：</label>
				</div>
				<div class="input-group">
					<select class="form-control" id="lx" name="lx">
						<option value="-1">请选择</option>
						<c:forEach items="${ggpTypeList}" var="gglx">
							<option value="${gglx.id}">${gglx.mc}</option>
						</c:forEach>
					</select> <label id="ggpTypeInfo" class="errorInfo">*必须选择一个类型</label>
				</div>
			</div>

			<div class="form-group">
				<label class="col-sm-2 control-label">广告牌描述：</label>
				<div class="col-md-4">
					<input type="text" class="form-control" id="ms" name="ms" value=""
						placeholder="描述"> <label id="msInfo" class="errorInfo">*描述不能为空</label>
				</div>
			</div>
			
			<div class="form-group">
				<label class="col-sm-2 control-label">广告牌日价格：</label>
				<div class="col-md-4">
					<input type="text" class="form-control" id="jg" name="jg" value=""
						placeholder="价格"> <label id="priceInfo" class="errorInfo">*格式不满足条件</label>
				</div>
			</div>
		</div>
		<div class="modal-footer">
			<button id="subnitBtn" class="btn btn-primary pull-left"
				type="button" onclick="submitGgpAdd('ggpAddForm',true)">提交</button>
		</div>
	</form>
</div>