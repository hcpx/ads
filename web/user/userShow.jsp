<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<div class="well">
	<div class="modal-body">
		<div class="row form-group">
			<div class="col-md-2 control-label">
				<label>姓名：</label>
			</div>
			<div class="col-md-4 controls">
				<input type="text" class="form-control" id="name" name="name"
					value="${user.name }" readonly="readonly">
			</div>

			<div class="col-md-2 control-label">
				<label>人员类型</label>
			</div>
			<div class="col-md-4 controls">
				<div class="input-group">
					<c:if test="${user.type==1 }">
						<input type="text" class="form-control" value="管理员"
							readonly="readonly">
					</c:if>
					<c:if test="${user.type==2 }">
						<input type="text" class="form-control" value="销售人员"
							readonly="readonly">
					</c:if>
				</div>
			</div>
		</div>
		<div class="row form-group">
			<label class="col-sm-2 control-label">用户名：</label>
			<div class="col-md-4">
				<input type="text" class="form-control" value="${user.userName }"
					readonly="readonly">
			</div>

			<label class="col-sm-2 control-label">密码：</label>
			<div class="col-md-4">
				<input type="text" class="form-control" value="${user.password }"
					readonly="readonly">
			</div>
		</div>
	</div>
	<div class="modal-footer">
		<button class="btn btn-primary pull-left" type="button"
			onclick="reback()">返回</button>
	</div>
</div>