<%@ page import="com.tj.extra.ProcedureExtra" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ page import="com.tj.beans.Procedure" %>
<%@ page import="java.text.NumberFormat" %>
<%--
  Created by IntelliJ IDEA.
  User: LiuFangGuo
  Date: 11/5/15
  Time: 3:21 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>定向执行计划库日变更</title>
</head>
<body>
<table border="1" align="center">
    <tr>
        <th colspan="9" align="center">定向执行计划库日变更</th>
    </tr>
    <tr>
        <th colspan="1"></th>
        <th colspan="2">白名单新增</th>
        <th colspan="2">白名单移出</th>
        <th colspan="2">白名单总条目数</th>
        <th colspan="2">黑名单总条目数</th>
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
        <td><%=procedureExtra.getCurrentNewIncrementLin()%>
        </td>
        <td><%=procedureExtra.getCurrentNewIncrementDid()%>
        </td>
        <td><%=procedureExtra.getCurrentNewDeleteLin()%>
        </td>
        <td><%=procedureExtra.getCurrentNewDeleteDid()%>
        </td>
        <td><%=procedureExtra.getCurrentWhiteSizeLin()%>
        </td>
        <td><%=procedureExtra.getCurrentWhiteSizeDid()%>
        </td>
        <td><%=procedureExtra.getCurrentBlackSizeLin()%>
        </td>
        <td><%=procedureExtra.getCurrentBlackSizeDid()%>
        </td>
    </tr>
    <%

        }
    %>
</table>
</body>
</html>
