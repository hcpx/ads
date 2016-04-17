<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<form method="post" class="form-horizontal" action="order/orderAdd.do"
	id="orderAddForm">
	<div class="modal-body">
		<div class="row form-group">
			<div class="col-md-4 control-label">
				<label>客户联系人：</label>
			</div>
			<div class="col-md-6 controls">
				<input type="text" class="form-control" id="khlxr" name="khlxr"
					value="" placeholder="客户联系人"> <label id="khlxrInfo"
					class="errorInfo">*联系人不能空</label>
			</div>

		</div>

        <div class="row form-group">
			<div class="col-md-4 control-label">
				<label>联系人电话：</label>
			</div>
			<div class="col-md-6 controls">
				<input type="text" class="form-control" id="khlxrdh" name="khlxrdh"
					value="" placeholder="客户联系人电话"> <label id="khlxrdhInfo"
					class="errorInfo">*电话不能空</label>
			</div>
        </div>
		<div class="form-group">
			<label class="col-sm-4 control-label">开始时间：</label>
			<div class="col-md-6">
				<input type="text" class="form-control" id="kssj" name="kssj"
					placeholder="开始时间" > <label
					id="kssjInfo" class="errorInfo">*开始时间不能为空</label>
			</div>
		</div>
		<div class="form-group">
		    <label class="col-sm-4 control-label">结束时间：</label>
			<div class="col-md-6">
				<input type="text" class="form-control" id="jssj" name="jssj"
				 placeholder="结束时间"> <label id="jssjInfo"
					class="errorInfo">*结束时间不能为空</label>
			</div>
		</div>
		<div class="form-group">
		    <label class="col-sm-4 control-label">广告牌：</label>
			<div class="col-md-6">
				<input type=""text"" class="form-control" id="ggpmc" name="ggpid"
					value="" placeholder="广告牌" onclick="loadGgp()"> <label id="ggpidInfo"
					class="errorInfo">*请选择广告牌</label>
					<input type="hidden" name="ggpdj" id="ggpdj">
					<input type="hidden" name="ggpid" id="ggpid">
			</div>
		</div>
	</div>
	<div class="modal-footer">
		<button id="subnitBtn" class="btn btn-primary pull-center" type="button"
			onclick="addOrder('orderAddForm')">提交</button>
	</div>
</form>

