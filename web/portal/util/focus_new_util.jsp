<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
    String path = request.getContextPath();
%>
<div id="focusNewsCarousel" class="carousel slide" data-ride="carousel">
    <ol class="carousel-indicators">
        <li data-target="#focusNewsCarousel" data-slide-to="0" class="active"></li>
        <li data-target="#focusNewsCarousel" data-slide-to="1"></li>
        <li data-target="#focusNewsCarousel" data-slide-to="2"></li>
    </ol>
    <div class="carousel-inner" role="listbox">
        <div class="item active">
            <img class="bimg-max-h" src="<%=path %>/portal/images/ptxx1.jpg" title="" width="100%" style="max-height: 240px;">
            <div class="carousel-caption">
                人之所以能，是相信能
            </div>
        </div>
        <div class="item">
            <img class="bimg-max-h" src="<%=path %>/portal/images/ptxx2.jpg" title="" width="100%" style="max-height: 240px;">
            <div class="carousel-caption">
                where is spring
            </div>
        </div>
        <div class="item">
            <img class="bimg-max-h" src="<%=path %>/portal/images/ptxx3.jpg" title="" width="100%" style="max-height: 240px;">
            <div class="carousel-caption">
            </div>
        </div>
    </div>
    <a class="left carousel-control" style="filter:alpha(opacity=0)" href="#focusNewsCarousel" data-slide="prev" role="button">
        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" style="filter:alpha(opacity=0)" href="#focusNewsCarousel" data-slide="next" role="button">
        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
    </a>
</div>