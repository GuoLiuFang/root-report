<%@page import="java.util.*" %>
<%@page import="com.tj.beans.Procedure" %>
<%@ page import="java.text.NumberFormat" %>
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
    NumberFormat numberFormat = NumberFormat.getInstance();
    numberFormat.setMaximumFractionDigits(3);
    for (Procedure procedure : ProcedureList) {
        int totalSuccessInLogLin = procedure.getTotalSuccessInLogLin();
        int totalSuccessInLogIng = procedure.getTotalSuccessInLogIng();
        int totalSuccessInLogExe = procedure.getTotalSuccessInLogExe();
        int totalSuccessInDataBaseLin = procedure.getTotalSuccessInDataBaseLin();
        int totalSuccessInDataBaseIng = procedure.getTotalSuccessInDataBaseIng();
        int totalSuccessInDataBaseExe = procedure.getTotalSuccessInDataBaseExe();
        String startExeCoverRate = "" + numberFormat.format(((double) totalSuccessInDataBaseIng)/ ((double) totalSuccessInLogIng)*100) + "%";
        String successCoverRate = "" + numberFormat.format(((double) totalSuccessInDataBaseExe)/ ((double) totalSuccessInLogExe)*100) + "%";
        String dataBaseRootRate = "" + numberFormat.format(((double) totalSuccessInDataBaseExe)/ ((double) totalSuccessInDataBaseIng)*100) + "%";


%>

<table border="1">
    <tr>
        <th bgcolor="#ff7f50"><span style="color: blue"><%=procedure.getRecordTime()%></span>工作过程详情
        </th>
    </tr>
    <tr>
        <th>生产运行指标</th>
        <td>总成功的LinuxVersion:<span style="color: blue"><%=totalSuccessInLogLin%></span></td>
        <td>总成功的LinuxVersion对应的开始执行数:<span style="color: blue"><%=totalSuccessInLogIng%></span></td>
        <td>总成功的LinuxVersion对应的执行成功数:<span style="color: blue"><%=totalSuccessInLogExe%></span></td>
        <td>入库的LinuxVersion:<span style="color: blue"><%=totalSuccessInDataBaseLin%></span></td>
        <td>入库的LinuxVersion对应的开始执行数:<span style="color: blue"><%=totalSuccessInDataBaseIng%></span></td>
        <td>入库的LinuxVersion对应的执行成功数:<span style="color: blue"><%=totalSuccessInDataBaseExe%></span></td>
        <td>入库的开始执行数占总的成功的开始执行数的比率:<span style="color: blue"><%=startExeCoverRate%></span></td>
        <td>入库的执行成功数占总的成功的执行成功成功数的比率:<span style="color: blue"><%=successCoverRate%></span></td>
        <td>库中LinuxVersion的平均日率:<span style="color: blue"><%=dataBaseRootRate%></span></td>
    </tr>
    <tr>
        <th bgcolor="#ff7f50">总的LinuxVersion和总的Did情况</th>
        <td>所有的LinuxVersion：<span style="color: blue"><%=procedure.getTotalAllLin()%></span>
        </td>
        <td>所有的LinuxVersion对应的did：<span style="color: blue"><%=procedure.getTotalAllDid()%></span>
        </td>
    </tr>
    <tr>
        <th>成功的总的情况和失败的总的情况</th>
        <td>成功的LinuxVersion：<span style="color: blue"><%=procedure.getTotalSuccessLin()%></span>
        </td>
        <td>成功的LinuxVersion对应的did：<span style="color: blue"><%=procedure.getTotalSuccessDid()%></span>
        </td>
        <td>失败的LinuxVersion：<span style="color: blue"><%=procedure.getTotalFailureLin()%></span>
        </td>
        <td>失败的LinuxVersion对应的did：<span style="color: blue"><%=procedure.getTotalFailureDid()%></span>
        </td>
    </tr>
    <tr>
        <th bgcolor="#ff7f50">成功的方案详情</th>
        <td>成功中方案100-103的LinuxVersion：<span style="color: blue"><%=procedure.getSuccessHundredSeriesLin()%></span></td>
        <td>成功中方案100-103的LinuxVersion对应的did：<span style="color: blue"><%=procedure.getSuccessHundredSeriesDid()%></span></td>
        <td>成功中其他方案的LinuxVersion：<span style="color: blue"><%=procedure.getSuccessOtherCategoryLin()%></span></td>
        <td>成功中其他方案的LinuxVersion对应的did：<span style="color: blue"><%=procedure.getSuccessOtherCategoryDid()%></span></td>
    </tr>
    <tr>
        <th>100-103中shell_code的详情</th>
        <td>shell_code为0的LinuxVersion：<span style="color: blue"><%=procedure.getHundredSeriesShellCodeZeroLin()%></span></td>
        <td>shell_code为0的LinuxVersion对应的did：<span style="color: blue"><%=procedure.getHundredSeriesShellCodeZeroDid()%></span></td>
        <td>shell_code不为0的LinuxVersion：<span style="color: blue"><%=procedure.getHundredSeriesShellCodeNoZeroLin()%></span></td>
        <td>shell_code不为0的LinuxVersion对应的did：<span style="color: blue"><%=procedure.getHundredSeriesShellCodeNoZeroDid()%></span></td>
    </tr>
    <tr>
        <th bgcolor="#ff7f50">shell_code为0的详情</th>
        <td>二义性的LinuxVersion：<span style="color: blue"><%=procedure.getShellCodeZeroTwoMeaningsLin()%></span></td>
        <td>二义性的LinuxVersion对应的did：<span style="color: blue"><%=procedure.getShellCodeZeroTwoMeaningsDid()%></span></td>
        <td>地址唯一的LinuxVersion：<span style="color: blue"><%=procedure.getShellCodeZeroUniqueAddressLin()%></span></td>
        <td>地址唯一的LinuxVersion对应的did：<span style="color: blue"><%=procedure.getShellCodeZeroUniqueAddressDid()%></span></td>
        <td>地址为空的LinuxVersion：<span style="color: blue"><%=procedure.getShellCodeZeroAddressEmptyLin()%></span></td>
        <td>地址为空的LinuxVersion对应的did：<span style="color: blue"><%=procedure.getShellCodeZeroAddressEmptyDid()%></span></td>
    </tr>
<tr>
    <th>地址唯一的详情</th>
    <td>在白名单的LinuxVersion：<span style="color: blue"><%=procedure.getUniqueAddressInWhiteLin()%></span></td>
    <td>在白名单的LinuxVersion对应的did：<span style="color: blue"><%=procedure.getUniqueAddressInWhiteDid()%></span></td>
    <td>在黑名单的LinuxVersion：<span style="color: blue"><%=procedure.getUniqueAddressInBlackLin()%></span></td>
    <td>在黑名单的LinuxVersion对应的did：<span style="color: blue"><%=procedure.getUniqueAddressInBlackDid()%></span></td>
    <td>小于阈值小于日率的LinuxVersion：<span style="color: blue"><%=procedure.getUniqueAddressLessLessLin()%></span></td>
    <td>小于阈值小于日率的LinuxVersion对应的did：<span style="color: blue"><%=procedure.getUniqueAddressLessLessDid()%></span></td>
    <td>小于阈值大于日率的LinuxVersion：<span style="color: blue"><%=procedure.getUniqueAddressLessMoreLin()%></span></td>
    <td>小于阈值大于日率的LinuxVersion对应的did：<span style="color: blue"><%=procedure.getUniqueAddressLessMoreDid()%></span></td>
    <td>大于阈值小于日率的LinuxVersion：<span style="color: blue"><%=procedure.getUniqueAddressMoreLessLin()%></span></td>
    <td>大于阈值小于日率的LinuxVersion对应的did：<span style="color: blue"><%=procedure.getUniqueAddressMoreLessDid()%></span></td>
    <td>新增的LinuxVersion：<span style="color: blue"><%=procedure.getUniqueAddressNewIncrementLin()%></span></td>
    <td>新增的LinuxVersion对应的did：<span style="color: blue"><%=procedure.getUniqueAddressNewIncrementDid()%></span></td>
</tr>
<tr>
    <th bgcolor="#ff7f50">唯一地址中小于阈值大于日率的定向分析详情</th>
    <td>定向的LinuxVersion：<span style="color: blue"><%=procedure.getUniAddLesMorDirectedLin()%></span></td>
    <td>定向的LinuxVersion对应的did：<span style="color: blue"><%=procedure.getUniAddLesMorDirectedDid()%></span></td>
    <td>非定向的LinuxVersion：<span style="color: blue"><%=procedure.getUniAddLesMorUndirectedLin()%></span></td>
    <td>非定向的LinuxVersion对应的did：<span style="color: blue"><%=procedure.getUniAddLesMorUndirectedDid()%></span></td>
    <td>小于阈值小于日率的LinuxVersion：<span style="color: blue"><%=procedure.getUniAddLesMorDirLessLessLin()%></span></td>
    <td>小于阈值小于日率的LinuxVersion对应的did：<span style="color: blue"><%=procedure.getUniAddLesMorDirLessLessDid()%></span></td>
    <td>小于阈值大于日率的LinuxVersion：<span style="color: blue"><%=procedure.getUniAddLesMorDirLessMoreLin()%></span></td>
    <td>小于阈值大于日率的LinuxVersion对应的did：<span style="color: blue"><%=procedure.getUniAddLesMorDirLessMoreDid()%></span></td>
    <td>大于阈值小于日率的LinuxVersion：<span style="color: blue"><%=procedure.getUniAddLesMorDirMoreLessLin()%></span></td>
    <td>大于阈值小于日率的LinuxVersion对应的did：<span style="color: blue"><%=procedure.getUniAddLesMorDirMoreLessDid()%></span></td>
    <td>新增的LinuxVersion：<span style="color: blue"><%=procedure.getUniAddLesMorDirNewIncrementLin()%></span></td>
    <td>新增的LinuxVersion对应的did：<span style="color: blue"><%=procedure.getUniAddLesMorDirNewIncrementDid()%></span></td>
</tr>
    <tr>
        <th>唯一地址中大于阈值小于日率的定向分析详情</th>
        <td>定向的LinuxVersion：<span style="color: blue"><%=procedure.getUniAddMorLesDirectedLin()%></span></td>
        <td>定向的LinuxVersion对应的did：<span style="color: blue"><%=procedure.getUniAddMorLesDirectedDid()%></span></td>
        <td>非定向的LinuxVersion：<span style="color: blue"><%=procedure.getUniAddMorLesUndirectedLin()%></span></td>
        <td>非定向的LinuxVersion对应的did：<span style="color: blue"><%=procedure.getUniAddMorLesUndirectedDid()%></span></td>
        <td>小于阈值小于日率的LinuxVersion：<span style="color: blue"><%=procedure.getUniAddMorLesDirLessLessLin()%></span></td>
        <td>小于阈值小于日率的LinuxVersion对应的did：<span style="color: blue"><%=procedure.getUniAddMorLesDirLessLessDid()%></span></td>
        <td>小于阈值大于日率的LinuxVersion：<span style="color: blue"><%=procedure.getUniAddMorLesDirLessMoreLin()%></span></td>
        <td>小于阈值大于日率的LinuxVersion对应的did：<span style="color: blue"><%=procedure.getUniAddMorLesDirLessMoreDid()%></span></td>
        <td>大于阈值小于日率的LinuxVersion：<span style="color: blue"><%=procedure.getUniAddMorLesDirMoreLessLin()%></span></td>
        <td>大于阈值小于日率的LinuxVersion对应的did：<span style="color: blue"><%=procedure.getUniAddMorLesDirMoreLessDid()%></span></td>
        <td>新增的LinuxVersion：<span style="color: blue"><%=procedure.getUniAddMorLesDirNewIncrementLin()%></span></td>
        <td>新增的LinuxVersion对应的did：<span style="color: blue"><%=procedure.getUniAddMorLesDirNewIncrementDid()%></span></td>
    </tr>
    <tr>
        <th bgcolor="#ff7f50">地址为空的定向分析详情</th>
        <td>在白名单的LinuxVersion：<span style="color: blue"><%=procedure.getAddEmpDirInWhiteLin()%></span></td>
        <td>在白名单的LinuxVersion对应的did：<span style="color: blue"><%=procedure.getAddEmpDirInWhiteDid()%></span></td>
        <td>在黑名单的LinuxVersion：<span style="color: blue"><%=procedure.getAddEmpDirInBlackLin()%></span></td>
        <td>在黑名单的LinuxVersion对应的did：<span style="color: blue"><%=procedure.getAddEmpDirInBlackDid()%></span></td>
        <td>定向的LinuxVersion：<span style="color: blue"><%=procedure.getAddEmpDirectedLin()%></span></td>
        <td>定向的LinuxVersion对应的did：<span style="color: blue"><%=procedure.getAddEmpDirectedDid()%></span></td>
        <td>非定向的LinuxVersion：<span style="color: blue"><%=procedure.getAddEmpUndirectedLin()%></span></td>
        <td>非定向的LinuxVersion对应的did：<span style="color: blue"><%=procedure.getAddEmpUndirectedDid()%></span></td>
        <td>小于阈值小于日率的LinuxVersion：<span style="color: blue"><%=procedure.getAddEmpDirLessLessLin()%></span></td>
        <td>小于阈值小于日率的LinuxVersion对应的did：<span style="color: blue"><%=procedure.getAddEmpDirLessLessDid()%></span></td>
        <td>小于阈值大于日率的LinuxVersion：<span style="color: blue"><%=procedure.getAddEmpDirLessMoreLin()%></span></td>
        <td>小于阈值大于日率的LinuxVersion对应的did：<span style="color: blue"><%=procedure.getAddEmpDirLessMoreDid()%></span></td>
        <td>大于阈值小于日率的LinuxVersion：<span style="color: blue"><%=procedure.getAddEmpDirMoreLessLin()%></span></td>
        <td>大于阈值小于日率的LinuxVersion对应的did：<span style="color: blue"><%=procedure.getAddEmpDirMoreLessDid()%></span></td>
        <td>新增的LinuxVersion：<span style="color: blue"><%=procedure.getAddEmpDirNewIncrementLin()%></span></td>
        <td>新增的LinuxVersion对应的did：<span style="color: blue"><%=procedure.getAddEmpDirNewIncrementDid()%></span></td>
    </tr>

</table>
<hr style="color: chartreuse"/>
<%

    }
%>
</body>
</html>