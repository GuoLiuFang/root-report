<%@page import="java.util.*" %>
<%@page import="com.tj.beans.ErrorAddress" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>清洗地址正确性校验</title>
</head>
<body>

<table border="1">
    <tr bgcolor="#ff7f50">
        <th>did</th>
        <th>纪录时间</th>
        <th>错误信息</th>
    </tr>
    <%
        List<ErrorAddress> ErrorAddressList = (List) session.getAttribute("errorAddressDetails");
        for (ErrorAddress errorAddress : ErrorAddressList) {
            String did = errorAddress.getDid();
            String record_time = errorAddress.getRecord_time();
            String error_info = errorAddress.getError_info();
    %>
    <tr>
        <td><%=did%>
        </td>
        <td><%=record_time%>
        </td>
        <td><a href="ErrorAddressHandler?did=<%=did%>&record_time=<%=record_time%>&error_info=<%=error_info%>"><%=error_info%></a>
        </td>
    </tr>
    <%

        }
    %>

</table>
</body>
</html>