<%@ page language="java" import="java.util.*" pageEncoding="utf8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>


<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath%>">
<!-- Javascript -->
<link href="<%=basePath%>/css/bootstrap.min.css" rel="stylesheet">
<%--<link rel="stylesheet"
	href="<%=basePath%>css/login/font-awesome.min.css">
<link rel="stylesheet" href="<%=basePath%>css/login/form-elements.css">
<link rel="stylesheet" href="<%=basePath%>css/login/style.css">--%>
<link href="<%=path%>/common/css/global.css" rel="stylesheet" />
<link href="<%=path%>/common/css/public.css" rel="stylesheet" />
<link href="<%=path %>/common/css/login.css" rel="stylesheet">

<link rel="stylesheet" type="text/css" href="<%=path %>/common/animated-header/css/normalize.css" />
<link rel="stylesheet" type="text/css" href="<%=path %>/common/animated-header/css/demo.css" />
<link rel="stylesheet" type="text/css" href="<%=path %>/common/animated-header/css/component.css" />

<link rel="shortcut icon" href="<%=basePath%>images/favicon.png">
<link rel="apple-touch-icon-precomposed" sizes="144x144"
	href="<%=basePath%>images/apple-touch-icon-144-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="114x114"
	href="<%=basePath%>images/apple-touch-icon-114-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="72x72"
	href="<%=basePath%>images/apple-touch-icon-72-precomposed.png">
<link rel="apple-touch-icon-precomposed"
	href="<%=basePath%>images/apple-touch-icon-57-precomposed.png">
<style type="text/css">
   .backroundImage{
      background-image: url("images/1.jpg");
   }
   .errorMessage{color:red;}
</style>
<title>login</title>

</head>

<body>
	<div id="divbg" class="demo-2">
		<div class="content row">
			<div id="large-header" class="large-header" style="width: 100%;height: 800px;">
				<canvas id="demo-canvas"></canvas>
				<h1 class="main-title"><span>Advertising System</span></h1>
			</div>
		</div>
	</div>

	<div id="login-container" style="margin-top: 12%">
		<div id="login-header">
			<h3 class="title_s" style="color:#FFFFFF;">用户登录</h3>
		</div> <!-- /login-header -->
		<div id="login-content" class="clearfix">
			<form id="loginForm" action="login/login.do" method="post" />
			<fieldset>
				<div class="form-group" id="username_lb">
					<label class="control-label" for="username">用户ID</label>
					<div class="controls">
						<input type="text" class="form-control" id="username" name="userName" placeholder="请输入用户ID" value="" />
					</div>
				</div>
				<div class="form-group" id="password_lb">
					<label class="control-label" for="password">密码</label>
					<div class="controls">
						<input type="password" class="form-control" id="password" name="password" placeholder="请输入密码" value="" />
					</div>
				</div>
			    <label class="errorMessage" for="form-username">${errormessage }</label>
			</fieldset>
			<div id="remember-me" class="pull-left"><nobr>
				<input type="checkbox" name="remember" id="remember"/>
				<label id="remember-label" for="remember">记住用户ID及密码？</label></nobr>
			</div>

			<div class="pull-right ">
				<%--<button type="button" name="loginBtn" id="loginBtn" class="btn btn-warning btn-large">
					登录
				</button>--%>
				<button type="submit" class="btn btn-warning btn-large">登录</button>
			</div>

			<%--<div class="pull-left mg-t20">
				<p><a href="#">找回密码</a> | <span style="color: silver;">还没有注册账号？</span> <a href="#">立即注册</a></p>
			</div>--%>
			</form>
		</div> <!-- /login-content -->
		<!-- <div id="login-extra">
            <p>Don't have an account? <a href="javascript:;">Sign Up.</a></p>
            <p>找回密码？ <a href="#">找回</a></p>
        </div> /login-extra -->
	</div> <!-- /login-wrapper -->

	<%--<div class="top-content backroundImage">

		<div class="inner-bg">
			<div class="container">
				<div class="row">
					<div class="col-sm-8 col-sm-offset-2 text">
						<h1>
							<strong></strong> 
						</h1>
						<div class="description"></div>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-6 col-sm-offset-3 form-box">
						<div class="form-top">
							<div class="form-top-left">
								<h3>登录</h3>
							</div>
							<div class="form-top-right">
								<i class="fa fa-key"></i>
							</div>
						</div>
						<div class="form-bottom">
							<form role="form" action="login/login.do" method="post" class="login-form">
								<div class="form-group">
									<label class="sr-only" for="form-username">Username</label>
									 <input type="text" name="username" placeholder="Username..."
										class="form-username form-control" id="form-username">
								</div>
								<div class="form-group">
									<label class="sr-only" for="form-password">Password</label> <input
										type="password" name="password" placeholder="Password..."
										class="form-password form-control" id="form-password">
								</div>
								<button type="submit" class="btn">Sign in!</button>
							</form>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-6 col-sm-offset-3 social-login"></div>
				</div>
			</div>
		</div>
	</div>--%>


	<script src="<%=path %>/js/jquery/jquery-1.11.1.min.js"></script>
	<script src="js/bootstrap/bootstrap.min.js"></script>
	<script src="js/jquery/jquery.backstretch.min.js"></script>
	<script src="js/jquery/scripts.js"></script>
	<script src="<%=path %>/common/animated-header/js/TweenLite.min.js"></script>
	<script src="<%=path %>/common/animated-header/js/EasePack.min.js"></script>
	<script src="<%=path %>/common/animated-header/js/rAF.js"></script>
	<script src="<%=path %>/common/animated-header/js/demo-2.js"></script>

</body>
</html>
