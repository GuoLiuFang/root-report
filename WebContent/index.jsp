<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>


<head>


    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>data center 报表系统</title>

    <link rel="stylesheet" type="text/css" href="css/index.css">


</head>


<body>


<br>

<form action="ShowSophie" method="post">
    <input type="submit" value="查看日志清洗过程"/>

</form>
<br>

<form action="ShowProcedure" method="post">
    <input type="submit" value="查看root_address入库过程"/>
</form>
<br>

<form action="ShowErrorAddress" method="post">
    <input type="submit" value="地址清洗正确性的校验"/>
</form>
<br>

<a href="newRootDetails.jsp">root address 分表展示</a>

</body>


</html>