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
    <base href="<%=basePath%>">
    <title>首页</title>
    <link href="<%=path %>/css/bootstrap.min.css"
          rel="stylesheet">
    <link
            href="<%=path %>/css/bootstrap-datetimepicker.min.css"
            rel="stylesheet">
    <link href="<%=path %>/common/css/global.css" rel="stylesheet" />
    <link href="<%=path %>/common/css/public.css" rel="stylesheet" />
    <link href="<%=path %>/common/css/portal.css" rel="stylesheet" />
    <script src="<%=path %>/js/jquery/jquery-1.11.1.min.js"></script>
</head>
<body>
    <!-- 主导航 -->
    <jsp:include page="/portal/header.jsp">
        <jsp:param value="idx" name="mnav"/>
    </jsp:include>

    <!-- 轮播宣传图片 -->
    <div class="container mg-bm15">
        <jsp:include page="/portal/ads_carousel.jsp"></jsp:include>
    </div>

    <!-- 本周销售统计 -->
    <div class="container mg-bm15">
        <jsp:include page="/portal/week_rank.jsp"></jsp:include>
    </div>

    <!-- 页脚 -->
    <jsp:include page="/portal/footer.jsp"></jsp:include>

    <script src="js/bootstrap/bootstrap.min.js"></script>
    <script src="<%=path %>js/bootstrap/bootstrap-paginator.min.js"></script>
    <script src="<%=basePath%>js/bootstrap/b3paginator.js"></script>
    <script type="javascript">
        var path='<%=path %>';

    </script>
</body>
</html>
