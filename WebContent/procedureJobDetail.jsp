<%@page import="java.util.*" %>
<%@page import="com.tj.beans.Procedure" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="com.tj.extra.ProcedureExtra" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>RootAddressGenerateProcedure 工作过程详情</title>
</head>
<body>

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

<table border="1">
    <tr>
        <th bgcolor="#ff7f50"><span style="color: chartreuse"><%=procedure.getRecordTime()%></span>工作过程详情
        </th>
    </tr>
    <tr>
        <th>生产运行指标</th>
        <td>总成功的LinuxVersion:<span style="color: chartreuse"><%=totalSuccessInLogLin%></span></td>
        <td>总成功的LinuxVersion对应的开始执行数:<span style="color: chartreuse"><%=totalSuccessInLogIng%></span></td>
        <td>总成功的LinuxVersion对应的执行成功数:<span style="color: chartreuse"><%=totalSuccessInLogExe%></span></td>
        <td>入库的LinuxVersion:<span style="color: chartreuse"><%=totalSuccessInDataBaseLin%></span></td>
        <td>入库的LinuxVersion对应的开始执行数:<span style="color: chartreuse"><%=totalSuccessInDataBaseIng%></span></td>
        <td>入库的LinuxVersion对应的执行成功数:<span style="color: chartreuse"><%=totalSuccessInDataBaseExe%></span></td>
        <td>入库的开始执行数占总的成功的开始执行数的比率:<span style="color: chartreuse"><%=startExeCoverRate%></span></td>
        <td>入库的执行成功数占总的成功的执行成功数的比率:<span style="color: chartreuse"><%=successCoverRate%></span></td>
        <td>库中LinuxVersion的平均日率:<span style="color: chartreuse"><%=dataBaseRootRate%></span></td>
    </tr>

    <tr>
        <th bgcolor="#ff7f50">白名单详情</th>
        <td>当日新增的LinuxVersion：<span style="color: chartreuse"><%=procedureExtra.getCurrentNewIncrementLin()%></span>
        </td>
        <td>当日新增的LinuxVersion对应的did：<span
                style="color: chartreuse"><%=procedureExtra.getCurrentNewIncrementDid()%></span>
        </td>
        <td>当日删除的LinuxVersion：<span style="color: chartreuse"><%=procedureExtra.getCurrentNewDeleteLin()%></span>
        </td>
        <td>当日删除的LinuxVersion对应的did：<span style="color: chartreuse"><%=procedureExtra.getCurrentNewDeleteDid()%></span>
        </td>
        <td>当日完成删除和插入后白名单的LinuxVersion：<span
                style="color: chartreuse"><%=procedureExtra.getCurrentWhiteSizeLin()%></span>
        </td>
        <td>当日完成删除和插入后白名单的的LinuxVersion对应的did：<span
                style="color: chartreuse"><%=procedureExtra.getCurrentWhiteSizeDid()%></span>
        </td>
        <td>当日完成删除和插入后黑名单的LinuxVersion：<span
                style="color: chartreuse"><%=procedureExtra.getCurrentBlackSizeLin()%></span>
        </td>
        <td>当日完成删除和插入后黑名单的的LinuxVersion对应的did：<span
                style="color: chartreuse"><%=procedureExtra.getCurrentBlackSizeDid()%></span>
        </td>
    </tr>
    <tr>
        <th>当日出库的情况</th>
        <td>定向非定向开始执行数均大于22，定减非的日率差大于0或定减非日率差小于0但差值在10%以内，定向日率大于50%的LinuxVersion：<span
                style="color: chartreuse"><%=procedure.getOutAddMorMorLin()%></span>
        </td>
        <td>定向非定向开始执行数均大于22，定减非的日率差大于0或定减非日率差小于0但差值在10%以内，定向日率大于50%的LinuxVersion对应的did：<span
                style="color: chartreuse"><%=procedure.getOutAddMorMorDid()%></span>
        </td>
        <td>所有的定向开始执行数小于22，处于培育期的LinuxVersion：<span style="color: chartreuse"><%=procedure.getOutAddLessLin()%></span>
        </td>
        <td>所有的定向开始执行数小于22，处于培育期的LinuxVersion对应的did：<span
                style="color: chartreuse"><%=procedure.getOutAddLessDid()%></span>
        </td>
        <td>定减非的日率差小于0并且差值在10%以上的LinuxVersion：<span
                style="color: chartreuse"><%=procedure.getOutAddMorLesZeroLin()%></span>
        </td>
        <td>定减非的日率差小于0并且差值在10%以上的LinuxVersion对应的did：<span
                style="color: chartreuse"><%=procedure.getOutAddMorLesZeroDid()%></span>
        </td>
        <td>定向的日率小于50%的LinuxVersion：<span style="color: chartreuse"><%=procedure.getOutAddMorLesHalfLin()%></span>
        </td>
        <td>定向的日率小于50%的LinuxVersion对应的did：<span style="color: chartreuse"><%=procedure.getOutAddMorLesHalfDid()%></span>
        </td>
    </tr>
    <tr>
        <th bgcolor="#ff7f50">总的LinuxVersion和总的Did情况</th>
        <td>所有的LinuxVersion：<span style="color: chartreuse"><%=procedure.getTotalAllLin()%></span>
        </td>
        <td>所有的LinuxVersion对应的did：<span style="color: chartreuse"><%=procedure.getTotalAllDid()%></span>
        </td>
    </tr>
    <tr>
        <th>成功的总的情况和失败的总的情况</th>
        <td>成功的LinuxVersion：<span style="color: chartreuse"><%=procedure.getTotalSuccessLin()%></span>
        </td>
        <td>成功的LinuxVersion对应的did：<span style="color: chartreuse"><%=procedure.getTotalSuccessDid()%></span>
        </td>
        <td>失败的LinuxVersion：<span style="color: chartreuse"><%=procedure.getTotalFailureLin()%></span>
        </td>
        <td>失败的LinuxVersion对应的did：<span style="color: chartreuse"><%=procedure.getTotalFailureDid()%></span>
        </td>
    </tr>
    <tr>
        <th bgcolor="#ff7f50">成功的方案详情</th>
        <td>成功中方案100-103的LinuxVersion：<span style="color: chartreuse"><%=procedure.getSuccessHundredSeriesLin()%></span>
        </td>
        <td>成功中方案100-103的LinuxVersion对应的did：<span
                style="color: chartreuse"><%=procedure.getSuccessHundredSeriesDid()%></span></td>
        <td>成功中其他方案的LinuxVersion：<span style="color: chartreuse"><%=procedure.getSuccessOtherCategoryLin()%></span></td>
        <td>成功中其他方案的LinuxVersion对应的did：<span
                style="color: chartreuse"><%=procedure.getSuccessOtherCategoryDid()%></span></td>
    </tr>
    <tr>
        <th>100-103中shell_code的详情</th>
        <td>shell_code为0的LinuxVersion：<span
                style="color: chartreuse"><%=procedure.getHundredSeriesShellCodeZeroLin()%></span></td>
        <td>shell_code为0的LinuxVersion对应的did：<span
                style="color: chartreuse"><%=procedure.getHundredSeriesShellCodeZeroDid()%></span></td>
        <td>shell_code不为0的LinuxVersion：<span
                style="color: chartreuse"><%=procedure.getHundredSeriesShellCodeNoZeroLin()%></span></td>
        <td>shell_code不为0的LinuxVersion对应的did：<span
                style="color: chartreuse"><%=procedure.getHundredSeriesShellCodeNoZeroDid()%></span></td>
    </tr>
    <tr>
        <th bgcolor="#ff7f50">shell_code为0的详情</th>
        <td>二义性的LinuxVersion：<span style="color: chartreuse"><%=procedure.getShellCodeZeroTwoMeaningsLin()%></span></td>
        <td>二义性的LinuxVersion对应的did：<span
                style="color: chartreuse"><%=procedure.getShellCodeZeroTwoMeaningsDid()%></span></td>
        <td>地址唯一的LinuxVersion：<span style="color: chartreuse"><%=procedure.getShellCodeZeroUniqueAddressLin()%></span>
        </td>
        <td>地址唯一的LinuxVersion对应的did：<span
                style="color: chartreuse"><%=procedure.getShellCodeZeroUniqueAddressDid()%></span></td>
        <td>地址唯一数据异常的LinuxVersion：<span style="color: chartreuse"><%=procedure.getUniAddrExceptionLin()%></span>
        </td>
        <td>地址唯一数据异常的LinuxVersion对应的did：<span
                style="color: chartreuse"><%=procedure.getUniAddrExceptionDid()%></span></td>
        <td>地址为空的LinuxVersion：<span style="color: chartreuse"><%=procedure.getShellCodeZeroAddressEmptyLin()%></span>
        </td>
        <td>地址为空的LinuxVersion对应的did：<span
                style="color: chartreuse"><%=procedure.getShellCodeZeroAddressEmptyDid()%></span></td>
        <td>地址为空数据异常的LinuxVersion：<span style="color: chartreuse"><%=procedure.getEmpAddrExceptionLin()%></span>
        </td>
        <td>地址为空数据异常的LinuxVersion对应的did：<span
                style="color: chartreuse"><%=procedure.getEmpAddrExceptionDid()%></span></td>
    </tr>
    <tr>
        <th>地址唯一的详情</th>
        <td>在白名单的LinuxVersion：<span style="color: chartreuse"><%=procedure.getUniqueAddressInWhiteLin()%></span></td>
        <td>在白名单的LinuxVersion对应的did：<span style="color: chartreuse"><%=procedure.getUniqueAddressInWhiteDid()%></span>
        </td>
        <td>在黑名单的LinuxVersion：<span style="color: chartreuse"><%=procedure.getUniqueAddressInBlackLin()%></span></td>
        <td>在黑名单的LinuxVersion对应的did：<span style="color: chartreuse"><%=procedure.getUniqueAddressInBlackDid()%></span>
        </td>
        <td>小于阈值小于日率的LinuxVersion：<span style="color: chartreuse"><%=procedure.getUniqueAddressLessLessLin()%></span>
        </td>
        <td>小于阈值小于日率的LinuxVersion对应的did：<span
                style="color: chartreuse"><%=procedure.getUniqueAddressLessLessDid()%></span></td>
        <td>小于阈值大于日率的LinuxVersion：<span style="color: chartreuse"><%=procedure.getUniqueAddressLessMoreLin()%></span>
        </td>
        <td>小于阈值大于日率的LinuxVersion对应的did：<span
                style="color: chartreuse"><%=procedure.getUniqueAddressLessMoreDid()%></span></td>
        <td>大于阈值小于日率的LinuxVersion：<span style="color: chartreuse"><%=procedure.getUniqueAddressMoreLessLin()%></span>
        </td>
        <td>大于阈值小于日率的LinuxVersion对应的did：<span
                style="color: chartreuse"><%=procedure.getUniqueAddressMoreLessDid()%></span></td>
        <td>新增的LinuxVersion：<span style="color: chartreuse"><%=procedure.getUniqueAddressNewIncrementLin()%></span></td>
        <td>新增的LinuxVersion对应的did：<span
                style="color: chartreuse"><%=procedure.getUniqueAddressNewIncrementDid()%></span></td>
    </tr>
    <tr>
        <th bgcolor="#ff7f50">唯一地址中小于阈值大于日率的定向分析详情</th>
        <td>定向的LinuxVersion：<span style="color: chartreuse"><%=procedure.getUniAddLesMorDirectedLin()%></span></td>
        <td>定向的LinuxVersion对应的did：<span style="color: chartreuse"><%=procedure.getUniAddLesMorDirectedDid()%></span>
        </td>
        <td>非定向的LinuxVersion：<span style="color: chartreuse"><%=procedure.getUniAddLesMorUndirectedLin()%></span></td>
        <td>非定向的LinuxVersion对应的did：<span style="color: chartreuse"><%=procedure.getUniAddLesMorUndirectedDid()%></span>
        </td>
        <td>小于阈值小于日率的LinuxVersion：<span style="color: chartreuse"><%=procedure.getUniAddLesMorDirLessLessLin()%></span>
        </td>
        <td>小于阈值小于日率的LinuxVersion对应的did：<span
                style="color: chartreuse"><%=procedure.getUniAddLesMorDirLessLessDid()%></span></td>
        <td>小于阈值大于日率的LinuxVersion：<span style="color: chartreuse"><%=procedure.getUniAddLesMorDirLessMoreLin()%></span>
        </td>
        <td>小于阈值大于日率的LinuxVersion对应的did：<span
                style="color: chartreuse"><%=procedure.getUniAddLesMorDirLessMoreDid()%></span></td>
        <td>大于阈值小于日率的LinuxVersion：<span style="color: chartreuse"><%=procedure.getUniAddLesMorDirMoreLessLin()%></span>
        </td>
        <td>大于阈值小于日率的LinuxVersion对应的did：<span
                style="color: chartreuse"><%=procedure.getUniAddLesMorDirMoreLessDid()%></span></td>
        <td>新增的LinuxVersion：<span style="color: chartreuse"><%=procedure.getUniAddLesMorDirNewIncrementLin()%></span>
        </td>
        <td>新增的LinuxVersion对应的did：<span
                style="color: chartreuse"><%=procedure.getUniAddLesMorDirNewIncrementDid()%></span></td>
    </tr>
    <tr>
        <th>唯一地址中大于阈值小于日率的定向分析详情</th>
        <td>定向的LinuxVersion：<span style="color: chartreuse"><%=procedure.getUniAddMorLesDirectedLin()%></span></td>
        <td>定向的LinuxVersion对应的did：<span style="color: chartreuse"><%=procedure.getUniAddMorLesDirectedDid()%></span>
        </td>
        <td>非定向的LinuxVersion：<span style="color: chartreuse"><%=procedure.getUniAddMorLesUndirectedLin()%></span></td>
        <td>非定向的LinuxVersion对应的did：<span style="color: chartreuse"><%=procedure.getUniAddMorLesUndirectedDid()%></span>
        </td>
        <td>小于阈值小于日率的LinuxVersion：<span style="color: chartreuse"><%=procedure.getUniAddMorLesDirLessLessLin()%></span>
        </td>
        <td>小于阈值小于日率的LinuxVersion对应的did：<span
                style="color: chartreuse"><%=procedure.getUniAddMorLesDirLessLessDid()%></span></td>
        <td>小于阈值大于日率的LinuxVersion：<span style="color: chartreuse"><%=procedure.getUniAddMorLesDirLessMoreLin()%></span>
        </td>
        <td>小于阈值大于日率的LinuxVersion对应的did：<span
                style="color: chartreuse"><%=procedure.getUniAddMorLesDirLessMoreDid()%></span></td>
        <td>大于阈值小于日率的LinuxVersion：<span style="color: chartreuse"><%=procedure.getUniAddMorLesDirMoreLessLin()%></span>
        </td>
        <td>大于阈值小于日率的LinuxVersion对应的did：<span
                style="color: chartreuse"><%=procedure.getUniAddMorLesDirMoreLessDid()%></span></td>
        <td>新增的LinuxVersion：<span style="color: chartreuse"><%=procedure.getUniAddMorLesDirNewIncrementLin()%></span>
        </td>
        <td>新增的LinuxVersion对应的did：<span
                style="color: chartreuse"><%=procedure.getUniAddMorLesDirNewIncrementDid()%></span></td>
    </tr>
    <tr>
        <th bgcolor="#ff7f50">地址为空的定向分析详情</th>
        <td>在白名单的LinuxVersion：<span style="color: chartreuse"><%=procedure.getAddEmpDirInWhiteLin()%></span></td>
        <td>在白名单的LinuxVersion对应的did：<span style="color: chartreuse"><%=procedure.getAddEmpDirInWhiteDid()%></span></td>
        <td>在黑名单的LinuxVersion：<span style="color: chartreuse"><%=procedure.getAddEmpDirInBlackLin()%></span></td>
        <td>在黑名单的LinuxVersion对应的did：<span style="color: chartreuse"><%=procedure.getAddEmpDirInBlackDid()%></span></td>
        <td>定向的LinuxVersion：<span style="color: chartreuse"><%=procedure.getAddEmpDirectedLin()%></span></td>
        <td>定向的LinuxVersion对应的did：<span style="color: chartreuse"><%=procedure.getAddEmpDirectedDid()%></span></td>
        <td>非定向的LinuxVersion：<span style="color: chartreuse"><%=procedure.getAddEmpUndirectedLin()%></span></td>
        <td>非定向的LinuxVersion对应的did：<span style="color: chartreuse"><%=procedure.getAddEmpUndirectedDid()%></span></td>
        <td>小于阈值小于日率的LinuxVersion：<span style="color: chartreuse"><%=procedure.getAddEmpDirLessLessLin()%></span></td>
        <td>小于阈值小于日率的LinuxVersion对应的did：<span style="color: chartreuse"><%=procedure.getAddEmpDirLessLessDid()%></span>
        </td>
        <td>小于阈值大于日率的LinuxVersion：<span style="color: chartreuse"><%=procedure.getAddEmpDirLessMoreLin()%></span></td>
        <td>小于阈值大于日率的LinuxVersion对应的did：<span style="color: chartreuse"><%=procedure.getAddEmpDirLessMoreDid()%></span>
        </td>
        <td>大于阈值小于日率的LinuxVersion：<span style="color: chartreuse"><%=procedure.getAddEmpDirMoreLessLin()%></span></td>
        <td>大于阈值小于日率的LinuxVersion对应的did：<span style="color: chartreuse"><%=procedure.getAddEmpDirMoreLessDid()%></span>
        </td>
        <td>新增的LinuxVersion：<span style="color: chartreuse"><%=procedure.getAddEmpDirNewIncrementLin()%></span></td>
        <td>新增的LinuxVersion对应的did：<span style="color: chartreuse"><%=procedure.getAddEmpDirNewIncrementDid()%></span>
        </td>
    </tr>

</table>
<hr style="color: chartreuse"/>
<%

    }
%>
</body>
</html>