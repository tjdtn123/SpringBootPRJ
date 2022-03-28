<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>메인 페이지</title>



</head>
<body>
Hello World

<script
        src="https://code.jquery.com/jquery-3.6.0.js"
        integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
        crossorigin="anonymous">
</script>

<script>
    var url = "http://apis.data.go.kr/B090041/openapi/service/AstroEventInfoService/getAstroEventInfo?ServiceKey=oThJMbfU/WNX0OaMTfVfg7iP/ysoIW9p/tfgGFtccPJjgvoMlTXF+EKwsesm+neiugst4PREez3oA2MOkIcCgQ==";
    $.ajax({
        method: "GET",
        url: url,
        data: {solYear:'2016',solMonth:'01'}
    })
        .done(function( msg ) {
            console.log(msg);
        });
</script>
</body>
</html>