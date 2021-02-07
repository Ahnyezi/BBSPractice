<%--
  Created by IntelliJ IDEA.
  User: anyej
  Date: 2021-02-06
  Time: 오후 3:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8"
         language="java" pageEncoding="UTF-8" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="com.yez.BBS.bbs.BbsDAO" %>
<%@ page import="com.yez.BBS.bbs.Bbs" %>

<html>
<head>
    <meta name="viewport" content="width-device-width" ,
          initial-scale="1">
    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="css/custom.css">
    <title>JSP 웹사이트 연습</title>
</head>
<body>
<%
    String userID = null;
    if (session.getAttribute("userID") != null) {
        userID = (String) session.getAttribute("userID");
    }
    if (userID == null) {
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('로그인이 필요합니다.');");
        script.println("location.href = 'login.jsp';");
        script.println("</script>");
        return;
    }

    int bbsID = 0;
    if (request.getParameter("bbsID") != null) {
        bbsID = Integer.parseInt(request.getParameter("bbsID"));
    }
    if (bbsID == 0) {
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('유효하지 않은 글 입니다.');");
        script.println("location.href = 'bbs.jsp';");
        script.println("</script>");
        return;
    }

    Bbs bbs = new BbsDAO().getBbs(bbsID);
    if (!userID.equals(bbs.getUserID())) {
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('권한이 없는 글 입니다.');");
        script.println("location.href = 'bbs.jsp';");
        script.println("</script>");
        return;
    }


%>

<!-- 네비게이션 바 -->
<nav class="navbar navbar-default">
    <!-- 로고 영역 -->
    <div class="navbar-header">
        <button type="button" class="navbar-toggle collapsed"
                data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
                aria-expanded="false">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </button>
        <a href="main.jsp" class="navbar-brand">JSP 웹사이트 연습</a>
    </div>

    <!-- 메뉴 영역 -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
        <!-- 메인 메뉴 -->
        <ul class="nav navbar-nav">
            <li><a href="main.jsp">메인</a></li>
            <li class="active"><a href="bbs.jsp">게시판</a></li>
        </ul>

        <!-- 로그인이 된 경우만 접근 가능하기 때문-->
        <ul class="nav navbar-nav navbar-right">
            <li class="dropdown">
                <a href="#" class="dropdown-toggle"
                   data-toggle="dropdown" role="button" aria-haspopup="true"
                   aria-expanded="false">회원관리
                    <span class="caret"></span>
                </a>
                <ul class="dropdown-menu">
                    <li>
                        <a href="logoutAction.jsp">로그아웃</a>
                    </li>
                </ul>
            </li>
        </ul>

    </div>
</nav>
<!-- 네비게이션 바 끝 -->

<div class="container">
    <div class="row">
        <form method="post" action="updateAction.jsp?bbsID=<%=bbsID%>">
            <table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
                <thead>
                <tr>
                    <th colspan="2" style="background-color: #eeeeee; text-align: center;">게시판 글수정 양식</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td><input type="text" class="form-control" placeholder="글 제목" name="bbsTitle"
                               maxlength="50" value="<%=bbs.getBbsTitle()%>"></td>
                </tr>
                <tr>
                    <td><textarea class="form-control" placeholder="글 내용" name="bbsContent"
                                  maxlength="2048" style="height: 350px"><%=bbs.getBbsContent()%></textarea></td>
                </tr>
                </tbody>
            </table>
            <input type="submit" class="btn btn-primary pull-right" value="글수정">
        </form>
    </div>
</div>


<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="js/bootstrap.js"></script>
</body>
</html>
