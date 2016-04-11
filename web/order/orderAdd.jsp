<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<div class="well">
	<form method="post" class="form-horizontal" action="user/saveUser.do"
		id="orderAddForm">
		<div class="modal-body">
			<div class="row form-group">
				<div class="col-md-2 control-label">
					<label>客户联系人：</label>
				</div>
				<div class="col-md-4 controls">
					<input type="text" class="form-control" id="customerName" name="customerName"
						value="" placeholder="名称"> 
						<label id="nameInfo"
						class="errorInfo">*联系人不能空</label>
				</div>

				<div class="col-md-2 control-label">
					<label>联系人电话：</label>
				</div>
				<div class="col-md-4 controls">
					<input type="text" class="form-control" id="customerPhone" name="customerPhone"
						value="" placeholder="名称"> 
						<label id="nameInfo"
						class="errorInfo">*电话不能空</label>
				</div>
			</div>

			<div class="form-group">
				<label class="col-sm-2 control-label">用户名：</label>
				<div class="col-md-4">
					<input type="text" class="form-control" id="username"
						name="userName" value="" placeholder="用户名"
						onblur="checkUserNameExist()"> <label id="usernameInfo"
						class="errorInfo">*用户名已存在</label>
				</div>

				<label class="col-sm-2 control-label">密码：</label>
				<div class="col-md-4">
					<input type="password" class="form-control" id="password"
						name="password" value="" placeholder="密码"> <label
						id="passwordInfo" class="errorInfo">*用户名已存在</label>
				</div>
			</div>
		</div>
		<div class="modal-footer">
			<button id="subnitBtn" class="btn btn-primary pull-left"
				type="button" onclick="submitUserAdd('userAddForm',true)">提交</button>
		</div>
	</form>
</div>

