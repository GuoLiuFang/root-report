<%@ page import="com.tj.beans.Procedure" %>
<%@ page import="java.util.List" %>
<%@ page import="com.tj.extra.ProcedureExtra" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.text.NumberFormat" %>
<%--
  Created by IntelliJ IDEA.
  User: LiuFangGuo
  Date: 11/5/15
  Time: 3:29 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>定向执行计划日分析详情</title>
</head>
<body>
<table border="1" align="center">
    <tr>
        <th colspan="65" align="center">定向执行计划日分析详情</th>
    </tr>
    <tr>
        <th colspan="3"></th>
        <th colspan="10">待分析计划</th>
        <th colspan="12">待分析计划中唯一地址</th>
        <th colspan="12">唯一地址中小于阈值大于日率</th>
        <th colspan="12">唯一地址中大于阈值小于日率</th>
        <th colspan="16">待分析计划中地址为空</th>
    </tr>
    <tr>
        <th colspan="1"></th>
        <th colspan="2">待分析计划</th>

        <th colspan="2">二义性</th>
        <th colspan="2">地址为空</th>
        <th colspan="2">唯一地址异常</th>
        <th colspan="2">地址为空异常</th>
        <th colspan="2">唯一地址</th>

        <th colspan="2">白名单已存在</th>
        <th colspan="2">黑名单已存在</th>
        <th colspan="2">小于阈值小于日率</th>
        <th colspan="2">小于阈值大于日率</th>
        <th colspan="2">大于阈值小于日率</th>
        <th colspan="2">新增计划</th>

        <th colspan="2">定向计划</th>
        <th colspan="2">非定向计划</th>
        <th colspan="2">小于阈值小于日率</th>
        <th colspan="2">小于阈值大于日率</th>
        <th colspan="2">大于阈值小于日率</th>
        <th colspan="2">新增计划</th>

        <th colspan="2">定向计划</th>
        <th colspan="2">非定向计划</th>
        <th colspan="2">小于阈值小于日率</th>
        <th colspan="2">小于阈值大于日率</th>
        <th colspan="2">大于阈值小于日率</th>
        <th colspan="2">新增计划</th>

        <th colspan="2">白名单已存在</th>
        <th colspan="2">黑名单已存在</th>
        <th colspan="2">定向计划</th>
        <th colspan="2">非定向计划</th>
        <th colspan="2">小于阈值小于日率</th>
        <th colspan="2">小于阈值大于日率</th>
        <th colspan="2">大于阈值小于日率</th>
        <th colspan="2">新增计划</th>
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
        <th>计划</th>
        <th>覆盖did</th>
        <th>计划</th>
        <th>覆盖did</th>
        <th>计划</th>
        <th>覆盖did</th>
        <th>计划</th>
        <th>覆盖did</th>
        <th>计划</th>
        <th>覆盖did</th>
        <th>计划</th>
        <th>覆盖did</th>
        <th>计划</th>
        <th>覆盖did</th>
        <th>计划</th>
        <th>覆盖did</th>
        <th>计划</th>
        <th>覆盖did</th>
        <th>计划</th>
        <th>覆盖did</th>
        <th>计划</th>
        <th>覆盖did</th>
        <th>计划</th>
        <th>覆盖did</th>
        <th>计划</th>
        <th>覆盖did</th>
        <th>计划</th>
        <th>覆盖did</th>
        <th>计划</th>
        <th>覆盖did</th>
        <th>计划</th>
        <th>覆盖did</th>
        <th>计划</th>
        <th>覆盖did</th>
        <th>计划</th>
        <th>覆盖did</th>
        <th>计划</th>
        <th>覆盖did</th>
        <th>计划</th>
        <th>覆盖did</th>
        <th>计划</th>
        <th>覆盖did</th>
        <th>计划</th>
        <th>覆盖did</th>
        <th>计划</th>
        <th>覆盖did</th>
        <th>计划</th>
        <th>覆盖did</th>
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
        <td><%=procedure.getHundredSeriesShellCodeZeroLin()%>
        </td>
        <td><%=procedure.getHundredSeriesShellCodeZeroDid()%>
        </td>


        <td><%=procedure.getShellCodeZeroTwoMeaningsLin()%>
        </td>
        <td><%=procedure.getShellCodeZeroTwoMeaningsDid()%>
        </td>
        <td><%=procedure.getShellCodeZeroAddressEmptyLin()%>
        </td>
        <td><%=procedure.getShellCodeZeroAddressEmptyDid()%>
        </td>
        <td><%=procedure.getUniAddrExceptionLin()%>
        </td>
        <td><%=procedure.getUniAddrExceptionDid()%>
        </td>
        <td><%=procedure.getEmpAddrExceptionLin()%>
        </td>
        <td><%=procedure.getEmpAddrExceptionDid()%>
        </td>
        <td><%=procedure.getShellCodeZeroUniqueAddressLin()%>
        </td>
        <td><%=procedure.getShellCodeZeroUniqueAddressDid()%>
        </td>


        <td><%=procedure.getUniqueAddressInWhiteLin()%>
        </td>
        <td><%=procedure.getUniqueAddressInWhiteDid()%>
        </td>
        <td><%=procedure.getUniqueAddressInBlackLin()%>
        </td>
        <td><%=procedure.getUniqueAddressInBlackDid()%>
        </td>
        <td><%=procedure.getUniqueAddressLessLessLin()%>
        </td>
        <td><%=procedure.getUniqueAddressLessLessDid()%>
        </td>
        <td><%=procedure.getUniqueAddressLessMoreLin()%>
        </td>
        <td><%=procedure.getUniqueAddressLessMoreDid()%>
        </td>
        <td><%=procedure.getUniqueAddressMoreLessLin()%>
        </td>
        <td><%=procedure.getUniqueAddressMoreLessDid()%>
        </td>
        <td><%=procedure.getUniqueAddressNewIncrementLin()%>
        </td>
        <td><%=procedure.getUniqueAddressNewIncrementDid()%>
        </td>

        <td><%=procedure.getUniAddLesMorDirectedLin()%>
        </td>
        <td><%=procedure.getUniAddLesMorDirectedDid()%>
        </td>
        <td><%=procedure.getUniAddLesMorUndirectedLin()%>
        </td>
        <td><%=procedure.getUniAddLesMorUndirectedDid()%>
        </td>
        <td><%=procedure.getUniAddLesMorDirLessLessLin()%>
        </td>
        <td><%=procedure.getUniAddLesMorDirLessLessDid()%>
        </td>
        <td><%=procedure.getUniAddLesMorDirLessMoreLin()%>
        </td>
        <td><%=procedure.getUniAddLesMorDirLessMoreDid()%>
        </td>
        <td><%=procedure.getUniAddLesMorDirMoreLessLin()%>
        </td>
        <td><%=procedure.getUniAddLesMorDirMoreLessDid()%>
        </td>
        <td><%=procedure.getUniAddLesMorDirNewIncrementLin()%>
        </td>
        <td><%=procedure.getUniAddLesMorDirNewIncrementDid()%>
        </td>

        <td><%=procedure.getUniAddMorLesDirectedLin()%>
        </td>
        <td><%=procedure.getUniAddMorLesDirectedDid()%>
        </td>
        <td><%=procedure.getUniAddMorLesUndirectedLin()%>
        </td>
        <td><%=procedure.getUniAddMorLesUndirectedDid()%>
        </td>
        <td><%=procedure.getUniAddMorLesDirLessLessLin()%>
        </td>
        <td><%=procedure.getUniAddMorLesDirLessLessDid()%>
        </td>
        <td><%=procedure.getUniAddMorLesDirLessMoreLin()%>
        </td>
        <td><%=procedure.getUniAddMorLesDirLessMoreDid()%>
        </td>
        <td><%=procedure.getUniAddMorLesDirMoreLessLin()%>
        </td>
        <td><%=procedure.getUniAddMorLesDirMoreLessDid()%>
        </td>
        <td><%=procedure.getUniAddMorLesDirNewIncrementLin()%>
        </td>
        <td><%=procedure.getUniAddMorLesDirNewIncrementDid()%>
        </td>

        <td><%=procedure.getAddEmpDirInWhiteLin()%>
        </td>
        <td><%=procedure.getAddEmpDirInWhiteDid()%>
        </td>
        <td><%=procedure.getAddEmpDirInBlackLin()%>
        </td>
        <td><%=procedure.getAddEmpDirInBlackDid()%>
        </td>
        <td><%=procedure.getAddEmpDirectedLin()%>
        </td>
        <td><%=procedure.getAddEmpDirectedDid()%>
        </td>
        <td><%=procedure.getAddEmpUndirectedLin()%>
        </td>
        <td><%=procedure.getAddEmpUndirectedDid()%>
        </td>
        <td><%=procedure.getAddEmpDirLessLessLin()%>
        </td>
        <td><%=procedure.getAddEmpDirLessLessDid()%>
        </td>
        <td><%=procedure.getAddEmpDirLessMoreLin()%>
        </td>
        <td><%=procedure.getAddEmpDirLessMoreDid()%>
        </td>
        <td><%=procedure.getAddEmpDirMoreLessLin()%>
        </td>
        <td><%=procedure.getAddEmpDirMoreLessDid()%>
        </td>
        <td><%=procedure.getAddEmpDirNewIncrementLin()%>
        </td>
        <td><%=procedure.getAddEmpDirNewIncrementDid()%>
        </td>

    </tr>
    <%
        }
    %>
</table>
</body>
</html>
