<%--
  Created by IntelliJ IDEA.
  User: R
  Date: 2016/4/9
  Time: 17:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    String target = request.getParameter("target");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>广告牌类型管理页</title>
</head>
<body>
<div class="row">
    <!-- 左侧菜单 -->
    <div class="col-md-2">
        <div class="panel-group list-group-panel">
            <div class="panel panel-default">
                <div class="panel-heading col-head">
                    <h4 class="panel-title">
                        <a class="collapse-a" data-toggle="collapse"
                           data-parent="#accordion" href="#collapseOne"> 菜单 </a>
                    </h4>
                </div>

                <div class="panel-collapse collapse in">
                    <div class="panel-body">
                        <div class="list-group">
                            <a id="loadManger" href="<%=path %>/ggp/loadGgpTypeManger.do" class="list-group-item <%="ggplx".equals(target) ? "active" : "" %>">广告牌类型</a>
                            <a id="loadManger" href="<%=path %>/user/loadUserManger.do" class="list-group-item <%="ggplx".equals(target) ? "active" : "" %>">广告牌</a>
                            <a id="loadManger" href="<%=path %>/user/loadUserManger.do" class="list-group-item <%="ggplx".equals(target) ? "active" : "" %>">广告牌图片</a>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
</body>
</html>
