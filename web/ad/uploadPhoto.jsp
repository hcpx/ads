<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html>
<head>
<script src="${pageContext.request.contextPath }/js/jquery/jquery-1.11.1.min.js"></script>
<link href="${pageContext.request.contextPath }/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath }/css/bootstrap-datetimepicker.min.css"
	rel="stylesheet">
<link href="<%=path%>/common/css/global.css" rel="stylesheet" />
<link href="<%=path%>/common/css/public.css" rel="stylesheet" />
<script src="js/bootstrap/bootstrap.min.js"></script>
<script src="<%=basePath%>js/bootstrap/bootstrap-paginator.min.js"></script>
<script src="<%=basePath%>js/bootstrap/b3paginator.js"></script>
<script type="text/javascript"> 
    j = 1;  
    $(document).ready(function(){
        $("#btn_add2").click(function(){  
            document.getElementById("newUpload2").innerHTML+='<div id="div_'+j+'"><input  name="file_'+j+'" type="file"  /><input type="button" value="删除"  onclick="del('+j+')"/></div>';  
              j = j + 1;  
        });  
    });  
  
    function del(o){  
         document.getElementById("newUpload2").removeChild(document.getElementById("div_"+o));  
    } 
</script>
</head>
<body class="index">
	<div class="container admin-container">
		<!-- 顶部内容 -->
		<header class="navbar navbar-inverse navbar-fixed-top docs-nav"
			role="banner">
			<jsp:include page="/common/include/header_mge.jsp">
				<jsp:param name="target" value="user" />
			</jsp:include>
		</header>

		<!-- 左侧菜单 -->
		<jsp:include page="/user/common_nav.jsp">
			<jsp:param name="target" value="user" />
		</jsp:include>

		<!-- 右侧内容 -->
		<div id="well" class="col-md-10">
			<h1>springMVC包装类上传文件</h1>
			<form name="imgForm2" action="<%=path%>/file/uploadImg.do"
				enctype="multipart/form-data" method="post"">
				<div id="newUpload2">
					<input type="file" name="file">
				</div>
				<input type="button" id="btn_add2" value="增加一行"> <input
					type="submit" value="上传">
			</form>
		</div>
	</div>
</body>
</html>