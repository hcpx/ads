<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<form method="post" class="form-horizontal" action="user/saveUser.do"
	id="orderAddForm">
	<div class="modal-body">
		<div class="row form-group">
			<div class="col-md-4 control-label">
				<label>客户联系人：</label>
			</div>
			<div class="col-md-6 controls">
				<input type="text" class="form-control" id="khlxr" name="khlxr"
					value="" placeholder="客户联系人"> <label id="nameInfo"
					class="errorInfo">*联系人不能空</label>
			</div>

		</div>

        <div class="row form-group">
			<div class="col-md-4 control-label">
				<label>联系人电话：</label>
			</div>
			<div class="col-md-6 controls">
				<input type="text" class="form-control" id="khlxrdh" name="khlxrdh"
					value="" placeholder="名称"> <label id="nameInfo"
					class="errorInfo">*电话不能空</label>
			</div>
        </div>
		<div class="form-group">
			<label class="col-sm-4 control-label">开始时间：</label>
			<div class="col-md-6">
				<input type="text" class="form-control" id="kssj" name="kssj"
					value="" placeholder="用户名" onblur="checkUserNameExist()"> <label
					id="usernameInfo" class="errorInfo">*开始时间不能为空</label>
			</div>
		</div>
		<div class="form-group">
		    <label class="col-sm-4 control-label">结束时间：</label>
			<div class="col-md-6">
				<input type="jssj" class="form-control" id="password" name="jssj"
					value="" placeholder="密码"> <label id="passwordInfo"
					class="errorInfo">*结束时间</label>
			</div>
		</div>
		
		<div class="form-group">
			<label class="col-sm-4 control-label">订单总价：</label>
			<div class="col-md-6">
				<input type="text" class="form-control" id="count" name="count"
					value="" placeholder="用户名" onblur="checkUserNameExist()">
			</div>
		</div>
		<div class="form-group">
		    <label class="col-sm-4 control-label">销售人员：</label>
			<div class="col-md-6">
				<input type="password" class="form-control" id="xsry" name="xsry"
					value="" placeholder="销售人员"  onclick="loadOrderUserList()"> <label id="xsryInfo"
					class="errorInfo">*请选择销售人员</label>
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-4 control-label">订单总价：</label>
			<div class="col-md-6">
				<input type="text" class="form-control" id="count" name="count"
					value="" placeholder="用户名" onblur="checkUserNameExist()">
			</div>
		</div>
		<div class="form-group">
		    <label class="col-sm-4 control-label">销售人员：</label>
			<div class="col-md-6">
				<input type="password" class="form-control" id="xsry" name="xsry"
					value="" placeholder="密码"> <label id="xsryInfo"
					class="errorInfo">*请选择销售人员</label>
			</div>
		</div>
	</div>
	<div class="modal-footer">
		<button id="subnitBtn" class="btn btn-primary pull-center" type="button"
			onclick="submitUserAdd('userAddForm',true)">提交</button>
	</div>
</form>

