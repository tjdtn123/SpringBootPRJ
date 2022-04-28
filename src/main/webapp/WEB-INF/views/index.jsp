<%@ page import="kopo.poly.util.CmmUtil" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%! String id_session;
    String seq_session;
%>
<%if(session.getAttribute("user_id") != null) {
    id_session = session.getAttribute("user_id").toString();
    seq_session = session.getAttribute("user_seq").toString();
}
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
        <link rel="icon" type="image/x-icon" href="static/assets/wallpaper.jpg" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="static/css/styles.css" rel="stylesheet" />

        <link rel="stylesheet" href="static/css/clock.css">


        <style>
            body {
                background-image : url("static/assets/wallpaper.jpg");

            }
        </style>

    <style>
        .weather{
            color: white;
        }
        .CurrIcon, .CurrTemp{
            display: inline-block;
            font-size: 3rem;
            text-align: center;
        }
        .CurrIcon{
            margin-right: 2px;
        }
        .City{
            font-size: 3rem;
            text-align: center;
        }
        .onecard img{
            float: left;
        }
        .right{
             float: right;
         }
        .id_ok {
            display: block;
        }
    </style>




    <script src="https://kit.fontawesome.com/2dc1583151.js" crossorigin="anonymous"></script>

</head>
<body class="bg-primary">
<!-- Navigation-->

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
<!-- Weather Content -->
<br>
<div class='weather' align="center" >
    <div class = 'CurrIcon'></div>
    <div class = 'CurrTemp'></div>
    <div class = 'City'></div>
</div>

<div>
    <h1 class = "h1-clock weather"></h1>
</div>


<
<!-- ajax -->
<script src="https://code.jquery.com/jquery-latest.js"></script>
<!-- Weather script-->

<script>
    $(document).ready(function(){
        let weatherIcon = {
            '01' : 'fas fa-sun',
            '02' : 'fas fa-cloud-sun',
            '03' : 'fas fa-cloud',
            '04' : 'fas fa-cloud-meatball',
            '09' : 'fas fa-cloud-sun-rain',
            '10' : 'fas fa-cloud-showers-heavy',
            '11' : 'fas fa-poo-storm',
            '13' : 'fas fa-snowflake',
            '50' : 'fas fa-smog'
        };

        $.ajax(
            {
                url: 'http://api.openweathermap.org/data/2.5/weather?q=Seoul&appid=578bcf4716e39500f688dda050a3491b&units=metric',
                dataType: 'json',
                type: 'GET',
                success: function(data)
                {
                    var $Icon = (data.weather[0].icon).substring(0,2);
                    var $Temp = Math.floor(data.main.temp) + '˚';
                    var $city = data.name;

                    $('.CurrIcon').append('<i class="' + weatherIcon[$Icon] + '"></i>');
                    $('.CurrTemp').prepend($Temp);
                    $('.City').append($city);
                }
             }
        )
    });
</script>


<script src = "static/js/clock.js"></script>

<!-- Bootstrap core JS-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" type=""></script>
<!-- Core theme JS-->
<script src="static/js/scripts.js"></script>
</body>
</html>
