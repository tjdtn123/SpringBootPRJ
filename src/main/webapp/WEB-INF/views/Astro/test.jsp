<%@ page import="kopo.poly.util.CmmUtil" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%
String astroTitle = (String) request.getAttribute("astroTitle");
String locdate = (String) request.getAttribute("locdate");
String astroEvent = (String) request.getAttribute("astroEvent");
String astroTime = (String) request.getAttribute("astroTime");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />

        <title>The Big Picture - Start Bootstrap Template</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="/assets/wallpaper.jpg" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="static/css/styles.css" rel="stylesheet" />
        <style>
            body {
                background-image : url("static/assets/wallpaper.jpg");
            }
        </style>
        <style>
            right{
                float: right;
            }
        </style>

</head>
<body>
<!-- Navigation-->

<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
        <div class="container px-4 px-lg-5" >
                <a class="navbar-brand" href="#!">Start Bootstrap</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                        <ul class="navbar-nav ml-auto">
                                <li class="nav-item active"><a class="nav-link" href="#!">Home</a></li>
                                <li class="nav-item"><a class="nav-link" href="#!">About</a></li>
                                <li class="nav-item"><a class="nav-link" href="#!">Services</a></li>
                                <li class="nav-item"><a class="nav-link" href="#!">Contact</a></li>
                        </ul>
                </div>
                <div class="collapse navbar-collapse" align="right">
                        <ul class="navbar-nav ml-auto">
                                <li class="nav-item"><a class="nav-link" href="#!">로그인</a></li>
                                <li class="nav-item"><a class="nav-link" href="#!">마이페이지</a></li>
                        </ul>
                </div>
        </div>
</nav>
<br>
<!-- Page Content-->
<section>
        <div class="container px-4 px-lg-5">
                <div class="row gx-4 gx-lg-5">
                        <div class="col-lg-6">
                                <h1 class="mt-5 weather" >The Big Picture</h1>
                                <p class="weather">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Deserunt voluptates rerum eveniet sapiente repellat esse, doloremque quod recusandae deleniti nostrum assumenda vel beatae sed aut modi nesciunt porro quisquam voluptatem.</p>
                        </div>
                </div>
        </div>
</section>
<tr>

        <td align="center" >
                <%=CmmUtil.nvl(astroTitle) %>
        </td><br>
        <td align="center" >
                <%=CmmUtil.nvl(locdate)%>
        </td><br>
        <td align="center" >
                <%=CmmUtil.nvl(astroEvent) %>
        </td>


</tr>




<script src="https://code.jquery.com/jquery-latest.js"></script>
<!-- Bootstrap core JS-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" type=""></script>
<!-- Core theme JS-->
<script src="static/js/scripts.js"></script>
</body>
</html>
