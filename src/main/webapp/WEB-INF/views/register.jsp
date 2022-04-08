<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
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

        <script type="text/javascript">

            function emailSend() {
                let clientEmail = document.getElementById('email').value;
                let emailYN = isEmail(clientEmail);

                console.log('입력 이메일' + clientEmail);

                if(emailYN == true){
                    alert('이메일 형식입니다');

                    $.ajax({
                        type:"POST",
                        url:"/register",
                        data:{userEmail:clientEmail},
                        success : function (data) {
                        },error : function (e){
                            alert('오류입니다. 잠시 후 다시 시도해주세요.');
                        }
                    });

                }else{
                    alert('이메일 형식에 알맞게 입력해주세요 xxx@xxxx.com');
                }


            }

            function isEmail(asValue) {
                var regExp = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
                return regExp.test(asValue);
            }



        </script>
    </head>

    <body class="bg-primary" >
    <!-- ajax -->
    <script src="https://code.jquery.com/jquery-latest.js"></script>
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
            <div class="collapse navbar-collapse" id="navbarResponsive1" align="right">
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item"><a class="nav-link" href="#!">로그인</a></li>
                    <li class="nav-item"><a class="nav-link" href="#!">마이페이지</a></li>
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
    <div id="layoutAuthentication">
            <div id="layoutAuthentication_content">
                <main>
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-lg-7">
                                <div class="card shadow-lg border-0 rounded-lg mt-5">
                                    <div class="card-header"><h3 class="text-center font-weight-light my-4">Create Account</h3></div>
                                    <div class="card-body">
                                        <form name="u" method="post" action="Userinfoinsert" target="ifrPrc" >
                                            <div class="row mb-3">
                                                <div class="col-md-6">
                                                    <div class="form-floating mb-3 mb-md-0">
                                                        <input class="form-control" id="user_id" name="user_id" type="text"  />
                                                        <label for="user_id">아이디</label>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-floating">
                                                        <input class="form-control" id="password" name="password" type="text"  />
                                                        <label for="password">비밀번호</label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row-cols-md-6">
                                                <div class = "col-md-10">
                                                    <div class="form-floating mb-3">
                                                        <input class="form-control" id="email" name="email" type="email"  />
                                                        <label for="Email">이메일</label>
                                                    </div>
                                                </div>
                                                <div class = "col-md-10">
                                                    <div class="form-floating mb-3">
                                                        <button type="button" name="emailCheck" onclick="emailSend()">인증메일 전송</button>

                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row-cols-md-6">
                                                <div class = "col-md-10">
                                                    <div class="form-floating mb-3">
                                                           <input class="form-control" id="certificationNumber" name="certificationNumber" type="text"  />
                                                            <label for="Email">인증번호</label>
                                                    </div>
                                                </div>
                                                <div class = "col-md-10">
                                                    <div class="form-floating mb-3">
                                                        <button type="button" name="certificationBtn" onclick="emailCertification()">인증 하기</button>
                                                        <input type="hidden" name="certificationYN" value="false"/>
                                                     </div>
                                                </div>
                                            </div>
                                            <div class="row mb-3">
                                                <div class="col-md-6">
                                                    <div class="form-floating mb-3 mb-md-0">
                                                        <input class="form-control" id="inputPassword" type="password"  />
                                                        <label for="inputPassword">Password</label>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-floating mb-3 mb-md-0">
                                                        <input class="form-control" id="inputPasswordConfirm" type="password"  />
                                                        <label for="inputPasswordConfirm">Confirm Password</label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="mt-4 mb-0">
                                                <div class="d-grid"><a class="btn btn-primary btn-block" href="login.jsp">Create Account</a></div>
                                            </div>

                                        </form>
                                    </div>
                                    <div class="card-footer text-center py-3">
                                        <div class="small"><a href="login.jsp">Have an account? Go to login</a></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </main>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>

    </body>
</html>
