
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <script type="text/javascript">
        //ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ이메일 인증ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ

        function emailSend() {
            let clientEmail = $('#emailText').val();
            let emailYN = isEmail(clientEmail);

            console.log('입력 이메일' + clientEmail);

            if(emailYN == true){
                alert('이메일 형식입니다');

                $.ajax({
                    type:"POST",
                    url:"/register/email",
                    data:{userEmail:clientEmail},
                    success : function (data) {
                    },error : function (e){
                        alert('오류입니다. 잠시 후 다시 시도해주세요.');
                    }
                });

            }else if($('#emailText').val() == null){
                alert('이메일을 입력해주세요');
            }else
                alert('이메일 형식에 알맞게 입력해주세요 xxx@xxxx.com');


        }


        function isEmail(asValue) {
            var regExp = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
            return regExp.test(asValue);
        }

        function emailCertification() {
            let clientEmail = document.getElementById('emailText').value;
            let inputCode = document.getElementById('certificationNumber').value;

            console.log('이메일' + clientEmail);
            console.log('인증코드' + inputCode);

            $.ajax({
                type:"POST",
                url:"/register/certification",
                data:{userEmail: clientEmail , inputCode:inputCode},
                success : function (result){
                    console.log(result);
                    if(result==true){
                        alert('인증완료');
                        document.getElementById('certificationYN').value = "true";
                        clientEmail.onchange = function (){
                            document.getElementById('certificationYN').value = "false";
                        }
                    }else{
                        alert('재시도');
                    }
                }

            })
        }
        function doSubmit(f){
            if(document.getElementById('certificationYN').value == false){
                alert('이메일 인증을 해주세요');
                return false;
            }
        }
    </script>

    <script src="https://kit.fontawesome.com/2dc1583151.js" crossorigin="anonymous"></script>
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
<div id="layoutAuthentication">
    <div id="layoutAuthentication_content">
        <main>
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-lg-7">
                        <div class="card shadow-lg border-0 rounded-lg mt-5">
                            <div class="card-header"><h3 class="text-center font-weight-light my-4">비밀번호 찾기</h3></div>
                            <div class="card-body">
                                <form name="f" method="get" action="/PwdChange" target= "ifrPrc" onsubmit="return doSubmit(this);" >
                                    <div class="row mb-3">
                                        <div class="col-md-6">
                                            <div class="form-floating mb-3 mb-md-0">
                                                <input class="form-control" id="user_id" name="user_id" type="text" />
                                                <label for="user_id">아이디</label>
                                            </div>
                                        </div>
                                        <div class = "col-md-10">
                                            <div class="form-floating mb-3">
                                                <input class="form-control" id="emailText" name="emailText" type="email"  />
                                                <label for="emailText">이메일</label>
                                            </div>
                                        </div>
                                        <div class = "col-md-10">
                                            <div class="form-floating mb-3">
                                                <button type="button" name="emailCheck" id="emailCheck" onclick="emailSend()">인증메일 전송</button>

                                            </div>
                                        </div>
                                        <div class = "col-md-10">
                                            <div class="form-floating mb-3">
                                                <input class="form-control" id="certificationNumber" name="certificationNumber" type="text"  />
                                            </div>
                                        </div>
                                        <div class = "col-md-10">
                                            <div class="form-floating mb-3">
                                                <button type="button" name="certificationBtn" id="certificationBtn" onclick="emailCertification()">인증 하기</button>
                                                <input type="hidden" name="certificationYN" id="certificationYN" value="false"/>
                                            </div>
                                        </div>
                                    <div class="mt-4 mb-0">
                                            <div class="d-grid">
                                                <input type="submit" value="확인"/>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </div>
                            <div class="card-footer text-center py-3">
                                <div class="small"><a href="LoginPage.jsp">Have an account? Go to login</a></div>
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
