<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String host = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort();
String dflogo=path+"/images/logo.png";
%>
<div class="container">
   <div class="navbar-header">
     	<button class="navbar-toggle" type="button" data-toggle="collapse" data-target=".bs-navbar-collapse">
       	<span class="sr-only">Toggle navigation</span>
       	<span class="icon-bar"></span>
       	<span class="icon-bar"></span>
       	<span class="icon-bar"></span>
     	</button>
     	<a href="javascript:;" class="navbar-brand" alt="Less">
       	<img src="<%=dflogo %>">
     	</a>
   	</div>
 	<nav class="collapse navbar-collapse bs-navbar-collapse" role="navigation">
    	<ul class="nav navbar-nav" style="min-width: 750px">
			<li class="dropdown" onclick="window.location='<%=path%>/user/loadUserManger.do'" ><a id="drop1" data-target="#" class="nav_focus" href="#" data-toggle="dropdown" aria-haspopup="true" role="button" aria-expanded="false">人员管理</a></li>
    	</ul>
    	<ul class="nav navbar-nav navbar-right">
      		<li class="dropdown">
        		<a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="glyphicon glyphicon-user"></i> 管理员 <b class="caret"></b></a>
	          	<ul class="dropdown-menu">
	            	<li><a href="<%=path %>"><i class="glyphicon glyphicon-home"></i> 回首页</a></li>
	            	<li class="divider"></li>
	            	<li><a href="#"><i class="glyphicon glyphicon-off"></i> 退出</a></li>
	          	</ul>
      		</li>
    	</ul>
  	</nav>
</div>
<script type="text/javascript">
window.onload = function (){
	$('li.dropdown').mouseover(function(){
	$(this).addClass('open');}).mouseout(function(){$(this).removeClass('open');}); 
};
</script>