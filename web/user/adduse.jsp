<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
   <div class="well">
				<form method="post" class="form-horizontal">
					<div class="modal-body">
						<div class="row form-group">
							<div class="col-md-2 control-label">
								<label>姓名：</label>
							</div>
							<div class="col-md-4 controls">
								<input type="text" class="form-control" id="name" name="exam.name" value="" placeholder="名称">
							</div>
							
							<div class="col-md-2 control-label">
								<label>人员类型</label>
							</div>
							<div class="col-md-4 controls">
								<div class="input-group">								
									<select class="form-control" id="userType">
								     <option value="">人员类型</option>
								     <option value="1">管理员</option>
								    <option value="2">销售人员</option>
							       </select>
								</div>	
							</div>
						</div>
						
						<div class="form-group">
							<label class="col-sm-2 control-label">用户名：</label>
							<div class="col-md-4">
									<input type="text" class="form-control" id="username" name="" value="" placeholder="用户名"> 							
							</div>
								
							<label class="col-sm-2 control-label">密码：</label>
							<div class="col-md-4">
								<input type="text" class="form-control" id="password" name="" value="" placeholder="密码"> 															
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<button class="btn btn-primary pull-left" type="button" onclick="addUser()" >提交</button>
					</div>
				</form>
			</div>	
