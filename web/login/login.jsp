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
<script src="js/jquery/jquery-1.11.1.min.js"></script>
<link href="${pageContext.request.contextPath }/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet"
	href="<%=basePath%>css/login/font-awesome.min.css">
<link rel="stylesheet" href="<%=basePath%>css/login/form-elements.css">
<link rel="stylesheet" href="<%=basePath%>css/login/style.css">

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
</style>
<title>login</title>

</head>

<body>
	<div class="top-content backroundImage">

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
									 <input type="text" name="userName" placeholder="Username..."
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
	</div>

	</div>


	
	<script src="js/bootstrap/bootstrap.min.js"></script>
	<script src="js/jquery/jquery.backstretch.min.js"></script>
	<script src="js/jquery/scripts.js"></script>

</body>
</html>
