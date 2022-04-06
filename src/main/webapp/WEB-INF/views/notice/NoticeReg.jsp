<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>게시판 글쓰기</title>
	<link rel="icon" type="image/x-icon" href="static/assets/wallpaper.jpg" />
	<link href="static/css/styles.css" rel="stylesheet" />


	<script type="text/javascript">

//전송시 유효성 체크
function doSubmit(f){
	if(f.title.value == ""){
		alert("제목을 입력하시기 바랍니다.");
		f.title.focus();
		return false;
	}

	if(calBytes(f.title.value) > 200){
		alert("최대 200Bytes까지 입력 가능합니다.");
		f.title.focus();
		return false;
	}

	var noticeCheck = false; //체크 여부 확인 변수
	for(var i=0;i<f.noticeYn.length;i++){
		if (f.noticeYn[i].checked){
			noticeCheck = true;
		}
	}

	if(noticeCheck==false){
		alert("공지글 여부를 선택하시기 바랍니다.");
		f.noticeYn[0].focus();
		return false;
	}

	if(f.contents.value == ""){
		alert("내용을 입력하시기 바랍니다.");
		f.contents.focus();
		return false;
	}

	if(calBytes(f.contents.value) > 4000){
		alert("최대 4000Bytes까지 입력 가능합니다.");
		f.contents.focus();
		return false;
	}


}

//글자 길이 바이트 단위로 체크하기(바이트값 전달)
function calBytes(str){

	var tcount = 0;
	var tmpStr = new String(str);
	var strCnt = tmpStr.length;

	var onechar;
	for (i=0;i<strCnt;i++){
		onechar = tmpStr.charAt(i);

		if (escape(onechar).length > 4){
			tcount += 2;
		}else{
			tcount += 1;
		}
	}

	return tcount;
}

</script>
</head>
<body onload="doOnload();">
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
<br>
<!-- Page Content-->
<section>
	<div class="container px-4 px-lg-5">
		<div class="row gx-4 gx-lg-5">
			<div class="col-lg-6">
			</div>
		</div>
	</div>
</section>

<form name="f" method="post" action="/notice/NoticeInsert" target= "ifrPrc" onsubmit="return doSubmit(this);">
	<table border="1">
		<col width="100px" />
		<col width="500px" />
		<tr>
			<td align="center">제목</td>
			<td><input type="text" name="title" maxlength="100" style="width: 450px" /></td>
		</tr>
		<tr>
			<td align="center">공지글 여부</td>
			<td>예<input type="radio" name="noticeYn" value="Y" />
			        아니오<input type="radio" name="noticeYn" value="N" />
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<textarea name="contents" style="width: 550px; height: 400px"></textarea>
			</td>
		</tr>
	<tr>
		<td align="center" colspan="2">
			<input type="submit" value="등록" />
			<input type="reset" value="다시 작성" />
		</td>
	</tr>
	</table>
</form>
<!-- 프로세스 처리용 iframe / form 태그에서 target을 iframe으로 한다. -->
<iframe name="ifrPrc" style="display:none"></iframe>
<!-- Bootstrap core JS-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<!-- Core theme JS-->
<script src="static/js/scripts.js"></script>
</body>
</html>