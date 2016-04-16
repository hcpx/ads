<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
    String path = request.getContextPath();
%>
<div class="row">
    <div class="col-md-12 bgf pd-t15">
        <div class="page-header mg-top0 bd-btm mg-bm15">
            <h1 class="ft-sz16">本周销售统计</h1>
        </div>
        <div class="row" id="week_data">
            <div class="loading-pt"><img alt="加载中" src="<%=path %>/common/images/loading-pt.gif"></div>
        </div>
    </div>
</div>
<script type="text/javascript">
    var path = "<%=path %>";
    function loadWeekRankData(){
        var data = {pageSize: "7"};
        var url = path + "/portal/util/week_rank_util.jsp?r="+Math.random();
        $("#week_data").load(url,data,function(res){
        });
    }
    loadWeekRankData();
</script>