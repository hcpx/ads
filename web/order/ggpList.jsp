<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<base href="<%=basePath%>">
<div class="col-sm-14">
	<table class="table table-striped table-hover">
		<tr>
			<th>序号</th>
			<th>广告牌类型名</th>
			<th>广告牌描述</th>
			<th>日价格</th>
			<th>使用状况</th>
			<th>添加人员</th>
			<th>操作</th>
		</tr>
		<c:forEach items="${pageResult.records}" var="ggp" varStatus="s">
			<tr>
				<td>${s.index+1 }</td>
				<td>${ggp.lx.mc }</td>
				<td>${ggp.ms }</td>
				<td>${ggp.jg }</td>
				<td><c:if test="${ggp.zt==1 }">
                                                                           空闲
                     </c:if> <c:if test="${ggp.zt==2 }">
                                                                           使用中
                     </c:if>
                </td>
				<td>${ggp.tjry}</td>
				<td>
					<div class="btn-group">
						<button type="button" class="btn btn-default btn-sm"
							onclick="choiceGgp('${ggp.id}','${ggp.jg }','${ggp.ms }')">选择</button>
					</div></td>
			</tr>
		</c:forEach>

	</table>
</div>
<!-- 分页 -->
<div class="col-sm-10">
	<input type="hidden" name="pageSize" id="pageSize"
		value="${pageResult.page.pageLength}" /> <input type="hidden"
		name="curPage" id="curPage" value="${pageResult.page.currentPage}" />
	<input type="hidden" name="totPage" id="totPage"
		value="${pageResult.totPage}" /> <input type="hidden" name="totCount"
		id="totCount" value="${pageResult.totalRecords}" />
	<div class="pagination-main">
		<ul id="pagination" class="pagination"></ul>
		<span class="page-list min-dply-none"></span>
	</div>
</div>
