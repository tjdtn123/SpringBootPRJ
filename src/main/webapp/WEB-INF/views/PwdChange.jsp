
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% String user_id = request.getParameter("user_id");
    session.setAttribute("PwdSession", user_id);%>
<html>
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />

    <title>The Big Picture - Start Bootstrap Template</title>
    <!-- Favicon-->
    <link rel="icon" type="image/x-icon" href="static/assets/wallpaper.jpg" />
    <!-- Core theme CSS (includes Bootstrap)-->
    <link href="static/css/styles.css" rel="stylesheet" />
    <script type="text/javascript">
        function doSubmit(f) {
            if (f.password.value !== f.pwd_check.value) {
                alert("비밀번호가 일치하지 않습니다");
                f.password.focus();
                return false;
            }
        }
    </script>
</head>
<body class="bg-primary">
<!-- Navigation-->
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
                <br>
                <br>
                <br>
            </div>
        </div>
    </div>
</section>
<div id="layoutAuthentication" >
    <div id="layoutAuthentication_content">
        <main>
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-lg-5">
                        <div class="card shadow-lg border-0 rounded-lg mt-5">
                            <div class="card-header"><h3 class="text-center font-weight-light my-4">Login</h3></div>
                            <div class="card-body">
                                <form name="l" action="/ChangePwd" method="post" onsubmit="return doSubmit(this);">
                                    <div class="form-floating mb-3">
                                        <input class="form-control" id="password" name="password" type="text" placeholder="password" />
                                        <label for="password">새 비밀번호</label>
                                    </div>
                                    <div class="form-floating mb-3">
                                        <input class="form-control" id="pwd_check" name="pwd_check" type="pwd_check" placeholder="pwd_check" />
                                        <label for="pwd_check">새 비밀번호 확인</label>
                                    </div>
                                    <div class="d-flex align-items-center justify-content-between mt-4 mb-0">
                                        <a class="small" href="/FindPwd">Forgot Password?</a>
                                        <input type="submit" value="확인">
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
    </div>
</div>
<!-- Bootstrap core JS-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" type=""></script>
<!-- Core theme JS-->
<script src="static/js/scripts.js"></script>
</body>
</html>
