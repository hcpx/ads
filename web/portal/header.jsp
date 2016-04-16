<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
    String path = request.getContextPath();
    String mnav = request.getParameter("mnav");
%>
<nav class="navbar navbar-default navbar-static-top mg-bm15 bd0 bgf">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="/kindee/portal/index.action"><nobr><img class="site_logo" src="<%=path %>/images/logo.png"></nobr></a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
            <ul class="nav navbar-nav">
                <li class="mnav active"><a href="#">销售统计</a></li>

            </ul>
            <ul class="nav navbar-nav navbar-right my-sty-dpd">
                <li class="box-minw300">
                    <div class="idx-search-box mg-tp19 box-radius0 bd0">
                       <%-- <input placeholder="搜索" type="search" id="title" name="title">
                        <button class="btn btn-link search-btn" >
                            <i class="glyphicon glyphicon-search"></i>
                        </button>--%>
                    </div>
                </li>
                <li class="mnav_u dropdown"><a class="mnav pd-rt0 dropdown-toggle" href="#" data-toggle="dropdown">
                    <div class="img-d40 mg-r10 pull-left mg-tp5" style="background-image: url('<%=path %>/images/user.png');"><img src="<%=path %>/images/user.png" title="管理员" class="img40"></div>

                    管理员<span id="msg_alert" class="ft-sz12 msg_alert gb_hide"><i class="glyphicon glyphicon-comment"></i></span> <b class="caret"></b></a>
                    <ul class="dropdown-menu box-minw100">
                        <li class="dpdown"><a href="<%=path %>/user/loadUserManger.do"><i class="glyphicon glyphicon-cog"></i> &nbsp;管理</a></li>
                        <li class="dpdown"><a href="<%=path %>/login/login.do"><i class="glyphicon glyphicon-off"></i> &nbsp;退出</a></li>
                    </ul>
                </li>
            </ul>
        </div>
        <!--/.nav-collapse -->
    </div>
</nav>