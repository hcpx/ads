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
	<form  method="post" class="form-horizontal" id="userUpdateForm" action="user/updateUser.do">
		<div class="modal-body">
			<div class="row form-group">
				<div class="col-md-3 control-label">
					<label>姓名：</label>
				</div>
				<div class="col-md-7 controls">
					<input type="text" class="form-control" id="mc" name="name"
						   value="${user.name }"> <label id="nameInfo"
														 class="errorInfo">*名称不能为空</label>
					<input type="hidden" name="id"  value="${user.id }">
				</div>
			</div>
			<div class="row form-group">
				<div class="col-md-3 control-label">
					<label>人员类型：</label>
				</div>
				<div class="col-md-7 controls">
					<select class="form-control" id="userlx" name="type">
						<option value="1"
								<c:if test="${user.type==1}">
									selected='selected'
								</c:if>>管理员</option>
						<option value="2"
								<c:if test="${user.type==2}">selected='selected'</c:if>>销售人员</option>
					</select> <label id="typeInfo" class="errorInfo">*用戶类型不能为空</label>
				</div>
			</div>
			<div class="row form-group">
				<div class="col-md-3 control-label">
					<label>用户名：</label>
				</div>
				<div class="col-md-7 controls">
					<input type="text" class="form-control" id="username"
						   name="userName" value="${user.userName }" readonly="readonly">
					<label id="usernameInfo" class="errorInfo">*用户名已存在</label>
				</div>
			</div>
			<div class="row form-group">
				<div class="col-md-3 control-label">
					<label>密码：</label>
				</div>
				<div class="col-md-7 controls">
					<input type="password" class="form-control" id="password"
						   name="password"  value="${user.password }"> <label
						id="passwordInfo" class="errorInfo">*用户名已存在</label>
				</div>
			</div>
		</div>
	</form>
	<div class="modal-footer">
		<button id="updatesubnitBtn" class="btn btn-primary pull-right"
				type="button" onclick="submitUserAdd('userUpdateForm',false)">提交</button>
		<button data-dismiss="modal" class="btn btn-link pull-right" type="button">取消</button>
	</div>
</div>
<%--<div class="well">
	<form method="post" class="form-horizontal" action="user/updateUser.do"
		id="userUpdateForm">
		<div class="modal-body">
			<div class="row form-group">
				<div class="col-md-2 control-label">
					<label>姓名：</label>
				</div>
				<div class="col-md-4 controls">
					<input type="text" class="form-control" id="name" name="name"
						value="${user.name }"> <label id="nameInfo"
						class="errorInfo">*名称不能为空</label> <input type="hidden" name="id"
						value="${user.id }">
				</div>

				<div class="col-md-2 control-label">
					<label>人员类型</label>
				</div>
				<div class="col-md-4 controls">
					<div class="input-group">
						<select class="form-control" id="userType" name="type">
							<option value="1"
								<c:if test="${user.type==1}">
								selected='selected'
								</c:if>>管理员</option>
							<option value="2"
								<c:if test="${user.type==2}">selected='selected'</c:if>>销售人员</option>
						</select> <label id="typeInfo" class="errorInfo">*用戶类型不能为空</label>
					</div>
				</div>
			</div>

			<div class="form-group">
				<label class="col-sm-2 control-label">用户名：</label>
				<div class="col-md-4">
					<input type="text" class="form-control" id="username"
						name="userName" value="${user.userName }" readonly="readonly">
					<label id="usernameInfo" class="errorInfo">*用户名已存在</label>
				</div>

				<label class="col-sm-2 control-label">密码：</label>
				<div class="col-md-4">
					<input type="password" class="form-control" id="password"
						name="password"  value="${user.password }"> <label
						id="passwordInfo" class="errorInfo">*用户名已存在</label>
				</div>
			</div>
		</div>
		<div class="modal-footer">
			<button id="updatesubnitBtn" class="btn btn-primary pull-left"
				type="button" onclick="submitUserAdd('userUpdateForm',false)">提交</button>
		</div>
	</form>
</div>--%>
