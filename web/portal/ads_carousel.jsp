<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
    String path = request.getContextPath();
%>
<div class="row">
    <div class="col-md-5 pd-lf0 fus-rt">
        <div id="focus_news_data" class="bgf zx-min-h carousel-fnws-bg">
            <div class="loading-pt"><img alt="加载中" src="<%=path %>/portal/images/loading-pt.gif"></div>
        </div>
    </div><!-- col-md-8 left -->
    <div class="col-md-7 bgf pd-tb15 zx-min-h">
        <div class="page-header mg-top0 bd-btm mg-bm15">
            <a href="#" class="pull-right ft-7f">More</a>
            <h1 class="ft-sz16">销售排行榜</h1>
        </div>
        <div id="dynamic_data" class="zx-dy-min-h" style="overflow:hidden">
            <div class="loading-pt"><img alt="加载中" src="<%=path %>/common/images/loading-pt.gif"></div>
        </div>
    </div><!-- col-md-4 right -->
</div>
<script type="text/javascript">
    var path = '<%=path %>';
    function loadFocusNewData(){
        var data = {};
        var url = path + "/portal/util/focus_new_util.jsp";
        $("#focus_news_data").load(url,data,function(res){
            $('.carousel').carousel();
        });
    }
    loadFocusNewData();
    function loadAdsRankData(){
        var data = {};
        var url = path + "/portal/loadAdsRank.do";
        $("#dynamic_data").load(url,data,function(res){

        });
    }
    loadAdsRankData();
</script>
