<%--
  Created by IntelliJ IDEA.
  User: anyej
  Date: 2021-02-06
  Time: 오후 3:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8"
         language="java" pageEncoding="UTF-8" %>
<% request.setCharacterEncoding("UTF-8");%>

<html>
<head>
    <title>JSP 웹사이트 연습</title>
</head>
<body>
<%
    session.invalidate();
%>
    <script>
        location.href = 'main.jsp';
    </script>
</body>
</html>
