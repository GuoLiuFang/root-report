<%@ page import="com.tj.beans.Procedure" %>
<%@ page import="java.util.List" %>
<%@ page import="com.tj.extra.ProcedureExtra" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.text.NumberFormat" %>
<%--
  Created by IntelliJ IDEA.
  User: LiuFangGuo
  Date: 11/5/15
  Time: 3:25 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>定向执行计划日分析概览</title>
</head>
<body>
<table border="1" align="center">
    <tr>
        <th colspan="9" align="center">定向执行计划日分析概览</th>
    </tr>
    <tr>
        <th colspan="1"></th>
        <th colspan="2">满足日率与阈值条件</th>
        <th colspan="2">满足日率与阈值条件</th>
        <th colspan="2">不满足阈值条件</th>
        <th colspan="2">不满足日率波动条件</th>
    </tr>
    <tr>
        <th>日期</th>
        <th>计划</th>
        <th>覆盖did</th>
        <th>计划</th>
        <th>覆盖did</th>
        <th>计划</th>
        <th>覆盖did</th>
        <th>计划</th>
        <th>覆盖did</th>
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
        <td><%=procedure.getOutAddMorMorLin()%>
        </td>
        <td><%=procedure.getOutAddMorMorDid()%>
        </td>
        <td><%=procedure.getOutAddLessLin()%>
        </td>
        <td><%=procedure.getOutAddLessDid()%>
        </td>
        <td><%=procedure.getOutAddMorLesZeroLin()%>
        </td>
        <td><%=procedure.getOutAddMorLesZeroDid()%>
        </td>
        <td><%=procedure.getOutAddMorLesHalfLin()%>
        </td>
        <td><%=procedure.getOutAddMorLesHalfDid()%>
        </td>
    </tr>
    <%

        }
    %>
</table>
</body>
</html>
