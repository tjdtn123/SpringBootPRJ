<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>The Big Picture - Start Bootstrap Template</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="static/assets/wallpaper.jpg" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="static/css/styles.css" rel="stylesheet" />
        <style>
            body {
                background-image : url("static/assets/wallpaper.jpg");
            }
        </style>
        <script type="text/javascript">
            function doSubmit(f) {
                if (f.user_id.value == "") {
                    alert("아이디를 입력하시기 바랍니다.");
                    f.user_id.focus();
                    return false;
                }
                if (f.password.value == "") {
                    alert("비밀번호를 입력하시기 바랍니다.");
                    f.password.focus();
                    return false;
                }
            }
        </script>

        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
        <script type="text/javascript">

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
    <!-- Page Content-->
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
                                        <form name="l" action="/Login" method="post" onsubmit="return doSubmit(this);">
                                            <div class="form-floating mb-3">
                                                <input class="form-control" id="user_id" name="user_id" type="text" placeholder="user_id" />
                                                <label for="user_id">아이디</label>
                                            </div>
                                            <div class="form-floating mb-3">
                                                <input class="form-control" id="password" name="password" type="password" placeholder="Password" />
                                                <label for="password">비밀번호</label>
                                            </div>
                                            <div class="d-flex align-items-center justify-content-between mt-4 mb-0">
                                                <a class="small" href="/FindPwd">Forgot Password?</a>
                                                <input type="submit" value="로그인">
                                            </div>
                                        </form>
                                    </div>
                                    <div class="card-footer text-center py-3">
                                        <div class="small"><a href="/register">회원가입</a></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </main>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="static/js/scripts.js"></script>
    </body>
</html>
