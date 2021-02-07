<%--
  Created by IntelliJ IDEA.
  User: anyej
  Date: 2021-02-06
  Time: 오후 3:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8"
         language="java" pageEncoding="UTF-8" %>
<%@ page import="com.yez.BBS.user.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8");%>
<jsp:useBean id="user" class="com.yez.BBS.user.User" scope="page"/>
<jsp:setProperty name="user" property="userID"/>
<jsp:setProperty name="user" property="userPassword"/>

<html>
<head>
    <title>JSP 웹사이트 연습</title>
</head>
<body>
    <%
        String userID = null;
        if (session.getAttribute("userID") != null)
            userID = (String) session.getAttribute("userID");

        if (userID != null){
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('이미 로그인이 되어있습니다.');");
            script.println("location.href = 'main.jsp';");
            script.println("</script>");
            return;
        }

        UserDAO userDAO = new UserDAO();
        int result = userDAO.login(user.getUserID(), user.getUserPassword());
        if (result == 1){ // 로그인 성공
            session.setAttribute("userID", user.getUserID());
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("location.href = 'main.jsp';");
            script.println("</script>");
        }
        else if (result == 0){
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('비밀번호가 틀립니다');");
        script.println("history.back();");
        script.println("</script>");
        }
        else if (result == -1){
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('존재하지 않는 아이디입니다.');");
            script.println("history.back();");
            script.println("</script>");
        }
        else if (result == -2){
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('데이터베이스 오류가 발생했습니다.');");
            script.println("history.back();");
            script.println("</script>");
        }
    %>
</body>
</html>
