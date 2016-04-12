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
		<button aria-hidden="true" data-dismiss="modal" class="close" type="button">
			<span aria-hidden="true">&times;</span>
		</button>
		<h4 class="modal-title">人员信息</h4>
	</div>
	<form  method="post" class="form-horizontal" >
	<div class="modal-body">
		<div class="row form-group">
			<div class="col-md-3 control-label">
				<label>姓名：</label>
			</div>
			<div class="col-md-7 controls">
				${user.name }
			</div>
		</div>
		<div class="row form-group">
			<div class="col-md-3 control-label">
				<label>人员类型：</label>
			</div>
			<div class="col-md-7 controls">
				<c:if test="${user.type==1 }">
					管理员
				</c:if>
				<c:if test="${user.type==2 }">
					销售人员
				</c:if>
			</div>
		</div>
		<div class="row form-group">
			<div class="col-md-3 control-label">
				<label>用户名：</label>
			</div>
			<div class="col-md-7 controls">
				${user.userName }
			</div>
		</div>
		<div class="row form-group">
			<div class="col-md-3 control-label">
				<label>密码：</label>
			</div>
			<div class="col-md-7 controls">
				${user.password }
			</div>
		</div>
	</div>
	</form>
	<div class="modal-footer">
		<button data-dismiss="modal" class="btn btn-link pull-right" type="button">取消</button>
	</div>
</div>
<%--<div class="well">
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
</div>--%>

