<%--
  Created by IntelliJ IDEA.
  User: LiuFangGuo
  Date: 11/5/15
  Time: 2:59 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>root address 分表展示</title>
    <link rel="stylesheet" href="css/index.css" type="text/css">

</head>
<body>
<br>

<form action="DingBi" method="post">
    <input type="submit" value="定向执行计划执行占比"/>

</form>
<br>

<form action="DateChange" method="post">
    <input type="submit" value="定向执行计划库日变更"/>
</form>
<br>

<form action="DateChangeBrowser" method="post">
    <input type="submit" value="定向执行计划日分析概览"/>
</form>
<br>

<form action="AnalysizeDetails" method="post">
    <input type="submit" value="定向执行计划日分析详情"/>
</form>
<br>

</body>
</html>
