<%@ page contentType="text/html;charset=UTF-8"
         language="java" pageEncoding="UTF-8" %>
<%@ page import="com.yez.BBS.bbs.BbsDAO" %>
<%@ page import="com.yez.BBS.bbs.Bbs" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8");%>

<html>
<head>
    <title>JSP 웹사이트 연습</title>
</head>
<body>
<%

    String userID = null;
    if (session.getAttribute("userID") != null)
        userID = (String) session.getAttribute("userID");
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

    if (request.getParameter("bbsTitle") == null || request.getParameter("bbsContent") == null
            || request.getParameter("bbsTitle").equals("") || request.getParameter("bbsContent").equals("")) {
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('입력이 안된 사항이 있습니다.');");
        script.println("history.back();");
        script.println("</script>");
        return;
    }

    BbsDAO bbsDAO = new BbsDAO();
    int result = bbsDAO.update(bbsID, request.getParameter("bbsTitle"), request.getParameter("bbsContent"));
    if (result == -1) { // 동일한 아이디를 입력한 경우
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('글 수정에 실패했습니다.');");
        script.println("history.back();");
        script.println("</script>");
    } else {
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('글 수정이 완료되었습니다.');");
        script.println("location.href = 'bbs.jsp';");
        script.println("</script>");
    }
%>
</body>
</html>
