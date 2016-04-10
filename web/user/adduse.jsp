<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
   <div class="well">
				<form method="post" class="form-horizontal" action="user/saveUser.do" id="userAddForm">
					<div class="modal-body">
						<div class="row form-group">
							<div class="col-md-2 control-label">
								<label>姓名：</label>
							</div>
							<div class="col-md-4 controls">
								<input type="text" class="form-control" id="name" name="name" value="" placeholder="名称">
							    <label id="nameInfo" class="errorInfo">*名称不能为空</label>
							</div>
							
							<div class="col-md-2 control-label">
								<label>人员类型</label>
							</div>
							<div class="col-md-4 controls">
								<div class="input-group">								
									<select class="form-control" id="userType" name="type">
								     <option value="1">管理员</option>
								    <option value="2">销售人员</option>
							       </select>
							       <label id="typeInfo" class="errorInfo">*用戶类型不能为空</label>
								</div>	
							</div>
						</div>
						
						<div class="form-group">
							<label class="col-sm-2 control-label">用户名：</label>
							<div class="col-md-4">
									<input type="text" class="form-control" id="username" name="userName" value="" placeholder="用户名" onblur="checkUserNameExist()"> 	
									<label id="usernameInfo" class="errorInfo">*用户名已存在</label>						
							</div>
								
							<label class="col-sm-2 control-label">密码：</label>
							<div class="col-md-4">
								<input type="password" class="form-control" id="password" name="password" value="" placeholder="密码"> 															
							    <label id="passwordInfo" class="errorInfo">*用户名已存在</label>
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<button id="subnitBtn" class="btn btn-primary pull-left" type="button" onclick="submitUserAdd()"  >提交</button>
					</div>
				</form>
			</div>	
