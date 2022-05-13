<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="kopo.poly.dto.BoardDTO" %>
<%@ page import="kopo.poly.util.CmmUtil" %>
<%@ page import="kopo.poly.dto.PageMakeDTO" %>
<%
    session.getAttribute("user_id");
    List<BoardDTO> rList = (List<BoardDTO>) request.getAttribute("rList");
    //게시판 조회 결과 보여주기
    if (rList == null) {
        rList = new ArrayList<BoardDTO>();

    }

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width text/html, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content=""/>
    <meta name="author" content=""/>
    <script src="https://code.jquery.com/jquery-latest.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <title>공지 리스트</title>

    <link rel="icon" type="image/x-icon" href="/static/assets/wallpaper.jpg" />
    <!-- Core theme CSS (includes Bootstrap)-->
    <link href="/static/css/styles.css" rel="stylesheet" />
    <style>
        body {
            background-image : url("/static/assets/wallpaper.jpg");
        }
        .pageInfo{
            list-style : none;
            display: inline-block;
            margin: 50px 0 0 100px;
        }
        .pageInfo li{
            float: left;
            font-size: 20px;
            margin-left: 18px;
            padding: 7px;
            font-weight: 500;
        }
        a:link {color:black; text-decoration: none;}
        a:visited {color:black; text-decoration: none;}
        a:hover {color:black; text-decoration: underline;}
         .active{
             background-color: #cdd5ec;
         }
    </style>

    <script type="text/javascript">

        //상세보기 이동
        function doDetail(seq) {
            location.href = "/board/BoardInfo?nSeq=" + seq;
        }

    </script>

</head>
<body class="bg-primary">
<script src="https://code.jquery.com/jquery-latest.js"></script>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
    <div class="container px-4 px-lg-5" >
        <a class="navbar-brand" href="/index">Start Bootstrap</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item"><a class="nav-link" href="/Star000">별자리</a></li>
                <li class="nav-item"><a class="nav-link" href="/History000">우주 현상 </a></li>
                <li class="nav-item"><a class="nav-link" href="Obs000">국내 천문대</a></li>
                <li class="nav-item"><a class="nav-link" href="/NoticeList">게시판</a></li>
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
<!-- Page Content-->
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
<h2>공지사항</h2>
<hr/>
<br/>
<div>
    <table class="table table-hover" border="1" width="600px">
        <thead>
            <tr>
                <td width="100" align="center">순번</td>
                <td width="200" align="center">제목</td>
                <td width="100" align="center">조회수</td>
                <td width="100" align="center">등록자</td>
                <td width="100" align="center">등록일</td>
            </tr>
            <%
                for (int i = 0; i < rList.size(); i++) {
                    BoardDTO rDTO = rList.get(i);

                    if (rDTO == null) {
                        rDTO = new BoardDTO();
                    }

            %>
            <tr>
                <td align="center">
                    <%
                        //공지글이라면, [공지]표시
                        if (CmmUtil.nvl(rDTO.getNotice_yn()).equals("1")) {
                            out.print("<b>[공지]</b>");

                            //공지글이 아니라면, 글번호 보여주기
                        } else {
                            out.print(CmmUtil.nvl(rDTO.getBoard_seq()));

                        }

                    %></td>
                <td align="center">
                    <a href="javascript:doDetail('<%=CmmUtil.nvl(rDTO.getBoard_seq())%>');">
                        <%=CmmUtil.nvl(rDTO.getTitle()) %>
                    </a>
                </td>
                <td align="center"><%=CmmUtil.nvl(rDTO.getRead_cnt()) %>
                </td>
                <td align="center"><%=CmmUtil.nvl(rDTO.getUser_id()) %>
                </td>
                <td align="center"><%=CmmUtil.nvl(rDTO.getReg_dt()) %>
                </td>
            </tr>
            <%
                }
            %>
        </thead>

    </table>

    <div class="pageInfo_wrap" >
        <div class="pageInfo_area">
            <ul id="pageInfo" class="pageInfo">
                <!-- 이전페이지 버튼 -->
                <c:if test="${pageMaker.prev}">
                    <li class="pageInfo_btn previous"><a href="${pageMaker.startPage-1}">Previous</a></li>
                </c:if>
                <!-- 각 번호 페이지 버튼 -->
                <c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
                    <li class="pageInfo_btn ${pageMaker.cri.pageNum == num ? "active":"" }"><a href="${num}">${num}</a></li>
                </c:forEach>

                <!-- 다음페이지 버튼 -->
                <c:if test="${pageMaker.next}">
                    <li class="pageInfo_btn next"><a href="${pageMaker.endPage + 1 }">Next</a></li>
                </c:if>
            </ul>
        </div>
    </div>
    <form id="moveForm" method="get">
        <input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
        <input type="hidden" name="amount" value="${pageMaker.cri.amount }">
    </form>
</div>
<a href="/board/BoardReg">[글쓰기]</a>

<script type="text/javascript">

    let moveForm = $("#moveForm");

    $(".move").on("click", function (e){
        e.preventDefault();

        moveForm.append("<input type='hidden' name ='board_seq' value='"+ $(this).attr("href")+ "'>");
        moveForm.attr("action", "board/BoardInfo");
        moveForm.submit();
    });


    $(".pageInfo a").on("click", function(e){

        e.preventDefault();
        moveForm.find("input[name='pageNum']").val($(this).attr("href"));
        moveForm.attr("action", "/board/BoardList");
        moveForm.submit();

    });

</script>

<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>

</body>
</html>