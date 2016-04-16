<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<div class="well">
	<form method="post" class="form-horizontal" action="ggp/saveGgpType.do"
		id="ggpTypeAddForm">
		<div class="modal-body">
			<div class="row form-group">
				<div class="col-md-2 control-label">
					<label>类型名：</label>
				</div>
				<div class="col-md-4 controls">
					<input type="text" class="form-control" id="mc" name="mc"
						value="" placeholder="名称"> <label id="mcInfo"
						class="errorInfo">*名称不能为空</label>
				</div>
			</div>

			<div class="form-group">
				<label class="col-sm-2 control-label">类型描述：</label>
				<div class="col-md-4">
					<input type="text" class="form-control" id="ms" name="ms"
						value="" placeholder="描述"> <label id="msInfo"
						class="errorInfo">*类型描述不能为空</label>
				</div>
			</div>
		</div>
		<div class="modal-footer">
			<button id="subnitBtn" class="btn btn-primary pull-left"
				type="button" onclick="submitGgpTypeAdd('ggpTypeAddForm',true)">提交</button>
		</div>
	</form>
</div>