<%--
  Created by IntelliJ IDEA.
  User: anyej
  Date: 2021-02-06
  Time: 오후 3:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8"
         language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <meta name="viewport" content="width-device-width" ,
          initial-scale="1">
    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="css/custom.css">
    <title>JSP 웹사이트 연습</title>
</head>
<body>

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
            <li><a href="bbs.jsp">게시판</a></li>
        </ul>
        <!-- 오른쪽 토글 메뉴 -->
        <ul class="nav navbar-nav navbar-right">
            <li class="dropdown">
                <a href="#" class="dropdown-toggle"
                   data-toggle="dropdown" role="button" aria-haspopup="true"
                   aria-expanded="false">접속하기
                    <span class="caret"></span>
                </a>
                <ul class="dropdown-menu">
                    <li class="active">
                        <a href="login.jsp">로그인</a>
                    </li>
                    <li>
                        <a href="join.jsp">회원가입</a>
                    </li>
                </ul>
            </li>
        </ul>
    </div>
</nav>

<!-- 로그인 양식 -->
<div class="container">
    <div class="col-lg-4"></div>
    <div class="col-lg-4">
        <div class="jumbotron" style="padding-top: 20px">
            <form method="post" action="loginAction.jsp">
                <h3 style="text-align: center">로그인 화면</h3>
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="아이디"
                    name="userID" maxlength="20">
                </div>
                <div class="form-group">
                    <input type="password" class="form-control" placeholder="비밀번호"
                           name="userPassword" maxlength="20">
                </div>
                <input type="submit" class="btn btn-primary form-control" value="로그인">
            </form>
        </div>
    </div>
</div>


<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="js/bootstrap.js"></script>
</body>
</html>
