<%@ page import="kopo.poly.util.CmmUtil" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%
//전달받은 메시지
String msg = "로그아웃 되었습니다";
session.invalidate();
%>     
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>처리페이지</title>
<script type="text/javascript">

	alert("<%=msg%>");
	top.location.href="/index";
		
</script>
</head>
<body>

</body>
</html>