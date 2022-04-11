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

            .id_ok {
                color: #fff; display: none;
            }
            .id_already{
                color: #6A82FB; display: none;
            }
            right {
                float: right;
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
//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ아이디 중복 체크ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
            function idCheck(){
                var user_id = $('#user_id').val(); //id값이 "id"인 입력란의 값을 저장
                $.ajax({
                    url:'/register/idCheck', //Controller에서 인식할 주소
                    type:'post', //POST 방식으로 전달
                    data:{user_id:user_id},
                    success:function(cnt){ //컨트롤러에서 넘어온 cnt값을 받는다
                        if(cnt >= 1){ //cnt가 1이 아니면(=0일 경우) -> 사용 가능한 아이디
                            $('.id_ok').css("display","inline-block");
                            $('.id_already').css("display", "none");
                        } else { // cnt가 1일 경우 -> 이미 존재하는 아이디
                            $('.id_already').css("display","inline-block");
                            $('.id_ok').css("display", "none");
                        }
                    },
                    error:function(){
                        alert("에러입니다");
                    }
                });
            };
           //ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ우편번호ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
                function sample6_execDaumPostcode() {
                new daum.Postcode({
                    oncomplete: function(data) {
                        // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                        // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                        // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                        var addr = ''; // 주소 변수
                        var extraAddr = ''; // 참고항목 변수

                        //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                        if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                            addr = data.roadAddress;
                        } else { // 사용자가 지번 주소를 선택했을 경우(J)
                            addr = data.jibunAddress;
                        }

                        // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                        if(data.userSelectedType === 'R'){
                            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                                extraAddr += data.bname;
                            }
                            // 건물명이 있고, 공동주택일 경우 추가한다.
                            if(data.buildingName !== '' && data.apartment === 'Y'){
                                extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                            }
                            // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                            if(extraAddr !== ''){
                                extraAddr = ' (' + extraAddr + ')';
                            }
                            // 조합된 참고항목을 해당 필드에 넣는다.
                            document.getElementById("addr2").value = extraAddr;

                        } else {
                            document.getElementById("addr2").value = '';
                        }

                        // 우편번호와 주소 정보를 해당 필드에 넣는다.
                        document.getElementById('sample6_postcode').value = data.zonecode;
                        document.getElementById("addr1").value = addr;
                        // 커서를 상세주소 필드로 이동한다.
                        document.getElementById("sample6_detailAddress").focus();
                    }
                }).open();
            }




        </script>
    </head>

    <body class="bg-primary" name="f" method="post" action="/Userinfoinsert" target= "ifrPrc" onsubmit="return doSubmit(this);">
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
                                        <form name="f" method="post" action="/Userinfoinsert" target= "ifrPrc" onsubmit="return doSubmit(this);" >
                                            <div class="row mb-3">
                                                <div class="col-md-6">
                                                    <div class="form-floating mb-3 mb-md-0">
                                                        <input class="form-control" id="user_id" name="user_id" type="text" required oninput="idCheck()" />
                                                        <span class="id_ok">사용 가능한 아이디입니다.</span>
                                                        <span class="id_already">누군가 이 아이디를 사용하고 있어요.</span>
                                                        <label for="user_id">아이디</label>

                                                    </div>
                                                </div>

                                                <div class="col-md-6">
                                                    <div class="form-floating mb-3 mb-md-0">
                                                        <input class="form-control" id="password" name="password" type="password"  />
                                                        <label for="password">비밀번호</label>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-floating mb-3 mb-md-0">
                                                        <input class="form-control" id="user_name" name="user_name" type="text"  />
                                                        <label for="password">닉네임</label>
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


                                                <div class="col-md-6">
                                                    <div class="form-floating mb-3 mb-md-0">
                                                        <input type="text" id="sample6_postcode" placeholder="우편번호">
                                                        <input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
                                                        <input type="text" id="addr1" placeholder="주소"><br>
                                                        <input type="text" id="sample6_detailAddress" placeholder="상세주소">
                                                        <input type="text" id="addr2" placeholder="참고항목">
                                                    </div>
                                                </div>
                                            <div class="mt-4 mb-0">
                                                <div class="d-grid">
                                                    <input type="submit" value="회원가입"/>
                                                </div>
                                            </div>
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
    <iframe name="ifrPrc" style="display:none"></iframe>
        <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>

    </body>
</html>
