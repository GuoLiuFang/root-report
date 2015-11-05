<%@ page import="com.tj.extra.ProcedureExtra" %>
<%@ page import="com.tj.beans.Procedure" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.List" %>
<%--
  Created by IntelliJ IDEA.
  User: LiuFangGuo
  Date: 11/5/15
  Time: 3:11 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>定向执行计划执行占比</title>
</head>
<body>
<table border="1" align="center">
    <tr>
        <th colspan="10" align="center">定向执行计划执行占比</th>
    </tr>
    <tr>
        <th colspan="4"></th>
        <th colspan="2">历史执行成功计划覆盖did</th>
        <th colspan="2">定向执行计划覆盖did</th>
        <th colspan="2">定向执行计划在历史执行成功计划中占比</th>
    </tr>
    <tr>
        <th>日期</th>
        <th>历史执行成功计划</th>
        <th>定向执行计划</th>
        <th>定向执行计划平均日率</th>
        <th>开始执行</th>
        <th>执行成功</th>
        <th>开始执行</th>
        <th>执行成功</th>
        <th>开始执行</th>
        <th>执行成功</th>
    </tr>
    <%
        List<Procedure> ProcedureList = (List) session.getAttribute("procedureDetails");
        Map<String, ProcedureExtra> procedureExtraMap = (Map) session.getAttribute("procedureExtraMap");
        NumberFormat numberFormat = NumberFormat.getInstance();
        numberFormat.setMaximumFractionDigits(3);
        for (Procedure procedure : ProcedureList) {
            ProcedureExtra procedureExtra = procedureExtraMap.get(procedure.getRecordTime());
            int totalSuccessInLogLin = Integer.valueOf(procedure.getTotalSuccessInLogLin());
            int totalSuccessInLogIng = Integer.valueOf(procedure.getTotalSuccessInLogIng());
            int totalSuccessInLogExe = Integer.valueOf(procedure.getTotalSuccessInLogExe());
            int totalSuccessInDataBaseLin = Integer.valueOf(procedure.getTotalSuccessInDataBaseLin());
            int totalSuccessInDataBaseIng = Integer.valueOf(procedure.getTotalSuccessInDataBaseIng());
            int totalSuccessInDataBaseExe = Integer.valueOf(procedure.getTotalSuccessInDataBaseExe());
            String startExeCoverRate = "" + numberFormat.format(((double) totalSuccessInDataBaseIng) / ((double) totalSuccessInLogIng) * 100) + "%";
            String successCoverRate = "" + numberFormat.format(((double) totalSuccessInDataBaseExe) / ((double) totalSuccessInLogExe) * 100) + "%";
            String dataBaseRootRate = "" + numberFormat.format(((double) totalSuccessInDataBaseExe) / ((double) totalSuccessInDataBaseIng) * 100) + "%";
    %>
    <tr>
        <td><%=procedure.getRecordTime()%>
        </td>
        <td><%=totalSuccessInLogLin%>
        </td>
        <td><%=totalSuccessInDataBaseLin%>
        </td>
        <td><%=dataBaseRootRate%>
        </td>
        <td><%=totalSuccessInLogIng%>
        </td>
        <td><%=totalSuccessInLogExe%>
        </td>
        <td><%=totalSuccessInDataBaseIng%>
        </td>
        <td><%=totalSuccessInDataBaseExe%>
        </td>
        <td><%=startExeCoverRate%>
        </td>
        <td><%=successCoverRate%>
        </td>
    </tr>
    <%

        }
    %>
</table>
</body>
</html>
