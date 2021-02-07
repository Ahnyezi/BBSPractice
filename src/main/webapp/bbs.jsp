<%--
  Created by IntelliJ IDEA.
  User: anyej
  Date: 2021-02-06
  Time: 오후 3:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8"
         language="java" pageEncoding="UTF-8" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.yez.BBS.bbs.BbsDAO" %>
<%@ page import="com.yez.BBS.bbs.Bbs" %>

<html>
<head>
    <meta name="viewport" content="width-device-width" ,
          initial-scale="1">
    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="css/custom.css">
    <title>JSP 웹사이트 연습</title>
    <style type="text/css">
        a, a:hover{
            color: #000000;
            text-decoration: none;
        }
    </style>
</head>
<body>
<%
    String userID = null;
    if (session.getAttribute("userID") != null) {
        userID = (String) session.getAttribute("userID");
    }
    int pageNumber = 1; // 페이지
    if (request.getParameter("pageNumber") != null) {
        pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
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

        <%
            if (userID == null) {
        %>
        <!-- 오른쪽 토글 메뉴 -->
        <ul class="nav navbar-nav navbar-right">
            <li class="dropdown">
                <a href="#" class="dropdown-toggle"
                   data-toggle="dropdown" role="button" aria-haspopup="true"
                   aria-expanded="false">접속하기
                    <span class="caret"></span>
                </a>
                <ul class="dropdown-menu">
                    <li>
                        <a href="login.jsp">로그인</a>
                    </li>
                    <li>
                        <a href="join.jsp">회원가입</a>
                    </li>
                </ul>
            </li>
        </ul>
        <%
        } else {
        %>
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
        <%
            }
        %>
    </div>
</nav>
<!-- 네비게이션 바 끝 -->

<div class="container">
    <div class="row">

        <!-- 글 목록 -->
        <table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
            <thead>
            <tr>
                <th style="background-color: #eeeeee; text-align: center;">번호</th>
                <th style="background-color: #eeeeee; text-align: center;">제목</th>
                <th style="background-color: #eeeeee; text-align: center;">작성자</th>
                <th style="background-color: #eeeeee; text-align: center;">작성일</th>
            </tr>
            </thead>
            <tbody>
            <%
                BbsDAO bbsDAO = new BbsDAO();
                ArrayList<Bbs> list = bbsDAO.getList(pageNumber);
                for (Bbs bbs : list) {
            %>
            <tr>
                <td><%=bbs.getBbsID()%>
                </td>
                <td><a href="view.jsp?bbsID=<%=bbs.getBbsID()%>">
                    <%=bbs.getBbsTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>")%>
                </a></td>
                <td><%=bbs.getUserID()%>
                </td>
                <td><%=bbs.getBbsDate().substring(0, 11)
                        + bbs.getBbsDate().substring(11, 13)
                        + "시" + bbs.getBbsDate().substring(14, 16) + "분"%>
                </td>
                <%
                    }
                %>
            </tr>
            </tbody>
        </table>

        <!-- 페이지 이동 -->
        <%
            if (pageNumber != 1) {
        %>
        <a href="bbs.jsp?pageNumber=<%=pageNumber - 1%>" class="btn btn-success btn-arrow-left">이전</a>
        <%
            }
            if (bbsDAO.nextPage(pageNumber + 1)) {
        %>
        <a href="bbs.jsp?pageNumber=<%=pageNumber + 1%>" class="btn btn-success btn-arrow-right">다음</a>
        <%
            }
        %>

        <!-- 새 글쓰기 버튼 -->
        <a href="write.jsp" class="btn btn-primary pull-right">글쓰기</a>
    </div>
</div>


<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="js/bootstrap.js"></script>
</body>
</html>
