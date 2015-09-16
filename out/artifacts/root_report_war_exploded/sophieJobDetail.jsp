<%@page import="java.util.*"%>
<%@page import="com.tj.beans.Sophie"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Sophie 工作过程详情</title>
</head>
<body>
	<table border="1">
	<tr><td colspan="21" align="center">Sophie 工作过程详情</td></tr>
		<tr>
			<th>日期</th>
			<th>日志</th>
			<th>总行数</th>
			<th>无效数</th>
			<th>成功数</th>
			<th>过滤数</th>
			<th>错误数</th>
			<th>csv数</th>
			<th>json数</th>
			<th>记录散开数</th>
			<th>无效中可疑错误数</th>
			<th>无效可疑详情</th>
			<th>过滤中可疑错误数</th>
			<th>过滤可疑详情</th>
			<th>错误中可疑错误数</th>
			<th>错误可疑详情</th>
			<th>清洗入库过程详情</th>
			<th>入库错误原因</th>
			<th>入库错误数据</th>
			<th>入库处理数量</th>
			<th>最终插入数量</th>
		</tr>
		<%
		List<Sophie> sophieList = (List)session.getAttribute("sophieDetails");
		for(Sophie sophie : sophieList ) {
			%>


		<tr>
			<td><%=sophie.getRecord_time()%></td>
			<td><%=sophie.getWhich_log()%></td>
			<td><%=sophie.getCnt_lns()%></td>
			<td><%=sophie.getCnt_vld()%></td>
			<td><%=sophie.getCnt_scs()%></td>
			<td><%=sophie.getCnt_flt()%></td>
			<td><%=sophie.getCnt_err()%></td>
			<td><%=sophie.getCnt_csv()%></td>
			<td><%=sophie.getCnt_jsn()%></td>
			<td><%=sophie.getCnt_dstrbt()%></td>
			<td><%=sophie.getVld_spc_cnt()%></td>
			<td><%=sophie.getVld_info()%></td>
			<td><%=sophie.getFlt_spc_cnt()%></td>
			<td><%=sophie.getFlt_info()%></td>
			<td><%=sophie.getErr_spc_cnt()%></td>
			<td><%=sophie.getErr_info()%></td>
			<td><%=sophie.getDb_log()%></td>
			<td><%=sophie.getDb_err()%></td>
			<td><%=sophie.getDb_bad()%></td>
			<td><%=sophie.getCnt_db_prc()%></td>
			<td><%=sophie.getCnt_db_insrt()%></td>
		</tr>


		<%
			
		}
		%>
	</table>
</body>
</html>