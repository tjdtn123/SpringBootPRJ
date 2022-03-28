<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
        <div class="collapse navbar-collapse" id="navbarResponsive" align="right">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item"><a class="nav-link" href="#!">로그인</a></li>
                <li class="nav-item"><a class="nav-link" href="#!">마이페이지</a></li>
            </ul>
        </div>
    </div>
</nav>
<!-- Page Content-->
<section>
    <div class="container px-4 px-lg-5">
        <div class="row gx-4 gx-lg-5">
            <div class="col-lg-6">
                <h1 class="mt-5">The Big Picture</h1>
                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Deserunt voluptates rerum eveniet sapiente repellat esse, doloremque quod recusandae deleniti nostrum assumenda vel beatae sed aut modi nesciunt porro quisquam voluptatem.</p>
            </div>
        </div>
    </div>
</section>

<%--Hello World
<input type="button" class="butten" value="천문현상" onclick="location.href='test/happen'">
<br>
<input type="button" class="butten" value="공지사항" onclick="location.href='Notice'">

<script
        src="https://code.jquery.com/jquery-3.6.0.js"
        integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
        crossorigin="anonymous">
</script>
<script>
    var url = "https://api.odcloud.kr/api/15067819/v1/uddi:bab0fa12-d7d7-4e47-975c-e35d424ae165";
    $.ajax({
        method: "GET",
        url: url,
        data: {serviceKey : 'oThJMbfU/WNX0OaMTfVfg7iP/ysoIW9p/tfgGFtccPJjgvoMlTXF+EKwsesm+neiugst4PREez3oA2MOkIcCgQ==',
            page:'1',
            perPage:'10'
        },

    })
        .done(function( msg ) {
            console.log(msg);
        });
</script>
--%>
<!-- Bootstrap core JS-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" type=""></script>
<!-- Core theme JS-->
<script src="static/js/scripts.js"></script>
</body>
</html>
