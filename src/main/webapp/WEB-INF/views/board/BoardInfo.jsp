<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ page import="kopo.poly.dto.BoardDTO" %>
<%@ page import="kopo.poly.util.CmmUtil" %>
<%
    BoardDTO rDTO = (BoardDTO) request.getAttribute("pageInfo");

//공지글 정보를 못불러왔다면, 객체 생성
    if (rDTO == null) {
        rDTO = new BoardDTO();

    }

    String id_session = CmmUtil.nvl((String) session.getAttribute("user_id"));

//본인이 작성한 글만 수정 가능하도록 하기(1:작성자 아님 / 2: 본인이 작성한 글 / 3: 로그인안함)
    int edit = 1;

//로그인 안했다면....
    if (id_session.equals("")) {
        edit = 3;

//본인이 작성한 글이면 2가 되도록 변경
    } else if (id_session.equals(CmmUtil.nvl(rDTO.getUser_id()))) {
        edit = 2;

    }

    System.out.println("user_id : " + CmmUtil.nvl(rDTO.getUser_id()));
    System.out.println("ss_user_id : " + id_session);

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width text/html, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content=""/>
    <meta name="author" content=""/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="icon" type="image/x-icon" href="static/assets/wallpaper.jpg" />
    <title>게시판 글보기</title>
    <style>
        body {
            background-image : url("/static/assets/wallpaper.jpg");
        }
    </style>
    <script type="text/javascript">

        //수정하기
        function doEdit() {
            if ("<%=edit%>" == 2) {
                location.href = "/board/BoardEditInfo?nSeq=<%=CmmUtil.nvl(rDTO.getBoard_seq())%>";

            } else if ("<%=edit%>" == 3) {
                alert("로그인 하시길 바랍니다.");

            } else {
                alert("본인이 작성한 글만 수정 가능합니다.");

            }
        }


        //삭제하기
        function doDelete() {
            if ("<%=edit%>" == 2) {
                if (confirm("작성한 글을 삭제하시겠습니까?")) {
                    location.href = "/board/BoardDelete?nSeq=<%=CmmUtil.nvl(rDTO.getBoard_seq())%>";

                }

            } else if ("<%=edit%>" == 3) {
                alert("로그인 하시길 바랍니다.");

            } else {
                alert("본인이 작성한 글만 삭제 가능합니다.");

            }
        }

        //목록으로 이동
        function doList() {
            location.href = "/board/BoardList?pageNum=${cri.pageNum}&amount=${cri.amount}";

        }

    </script>
</head>
<body>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
    <div class="container px-4 px-lg-5" >
        <a class="navbar-brand" href="/index">Start Bootstrap</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item active"><a class="nav-link" href="/Star000">별자리</a></li>
                <li class="nav-item"><a class="nav-link" href="/History000">우주 현상 </a></li>
                <li class="nav-item"><a class="nav-link" href="Obs000">국내 천문대</a></li>
                <li class="nav-item"><a class="nav-link" href="notice/NoticeList">게시판</a></li>
            </ul>
        </div>
        <div class="collapse navbar-collapse"  align="right">
            <ul class="navbar-nav ml-auto">
                <% if(session.getAttribute("user_id") == null){%>
                <li class="nav-item"><a class="nav-link" href="/LoginPage">로그인</a></li>
                <%}%>
                <!--<form  required oninput="Show()">-->
                <% if(session.getAttribute("user_id") != null){%>
                <li class="nav-item"><a class="nav-link" href="#!">마이페이지</a></li>
                <li class="nav-item"><a class="nav-link" href="/Logout">로그아웃</a></li>
                <%}%>
                <!--</form>-->
            </ul>
        </div>
    </div>
</nav>
<section>
    <div class="container px-4 px-lg-5">
        <div class="row gx-4 gx-lg-5">
            <div class="col-lg-6">
                <br>
                <br>
                <br>
            </div>
        </div>
    </div>
</section>
<table border="1">
    <col width="100px"/>
    <col width="200px"/>
    <col width="100px"/>
    <col width="200px"/>
    <tr>
        <td align="center">제목</td>
        <td colspan="3"><%=CmmUtil.nvl(rDTO.getTitle())%>
        </td>
    </tr>
    <tr>
        <td align="center">공지글 여부</td>
        <td colspan="3">예<input type="radio" name="noticeYn" value="1"
                <%=CmmUtil.checked(CmmUtil.nvl(rDTO.getNotice_yn()), "1") %>/>
            아니오<input type="radio" name="noticeYn" value="2"
                    <%=CmmUtil.checked(CmmUtil.nvl(rDTO.getNotice_yn()), "2") %>/>
        </td>
    </tr>
    <tr>
        <td align="center">작성일</td>
        <td><%=CmmUtil.nvl(rDTO.getReg_dt())%>
        </td>
        <td align="center">조회수</td>
        <td><%=CmmUtil.nvl(rDTO.getRead_cnt())%>
        </td>
    </tr>
    <tr>
        <td colspan="4" height="300px" valign="top">
            <%=CmmUtil.nvl(rDTO.getContents()).replaceAll("\r\n", "<br/>") %>
        </td>
    </tr>
    <tr>
        <td align="center" colspan="4">
            <a href="javascript:doEdit();">[수정]</a>
            <a href="javascript:doDelete();">[삭제]</a>
            <a href="javascript:doList();">[목록]</a>
        </td>
    </tr>
</table>

<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>

</body>
</html>