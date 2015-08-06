<%@page import="java.util.*"%>
<%@page import="com.tj.beans.Address"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>RootAddress 工作过程详情</title>
</head>
<body>
	<table border="1">
	<tr><td colspan="16" align="center">RootAddress 工作过程详情</td></tr>
		<tr>
			<th>日期</th>
			<th>地址不为null的总数</th>
			<th>地址不唯一的总数</th>
			<th>地址不唯一与黑名单的交集数</th>
			<th>地址不唯一与白名单的交集数</th>
			<th>地址不唯一与黑白名单均无交集数</th>
			<th>地址唯一的总数</th>
			<th>地址唯一与黑名单的交集数</th>
			<th>地址唯一与白名单的交集数</th>
			<th>地址唯一但小于阈值且小于日率数</th>
			<th>地址唯一但小于阈值且大于日率数</th>
			<th>地址唯一但大于阈值且小于日率数</th>
			<th>新入白名单数</th>
			<th>新入黑名单数</th>
			<th>当前黑名单的数量</th>
			<th>当前白名单的数量</th>
		</tr>
		<%
		List<Address> addressList = (List)session.getAttribute("addressDetails");
		for(Address address : addressList ) {
			%>


		<tr>
			<td><%=address.getRecord_time()%></td>
			<td><%=address.getTotal()%></td>
			<td><%=address.getMultiple()%></td>
			<td><%=address.getMultiple_in_black()%></td>
			<td><%=address.getMultiple_in_white()%></td>
			<td><%=address.getMultiple_in_other()%></td>
			<td><%=address.getUniq()%></td>
			<td><%=address.getUniq_in_black()%></td>
			<td><%=address.getUniq_in_white()%></td>
			<td><%=address.getUniq_lt_threshold_lt_rate()%></td>
			<td><%=address.getUniq_lt_threshold_gt_rate()%></td>
			<td><%=address.getUniq_gt_threshold_lt_rate()%></td>
			<td><%=address.getNew_num()%></td>
			<td><%=address.getDel_num()%></td>
			<td><%=address.getBlack()%></td>
			<td><%=address.getWhite()%></td>
		</tr>


		<%
			
		}
		%>
	</table>
</body>
</html>