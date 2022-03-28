<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Insert title here</title>
</head>
<body>
<script type="javascript">
    var xhr = new XMLHttpRequest();
    var url = 'http://apis.data.go.kr/B090041/openapi/service/AstroEventInfoService/getAstroEventInfo'; /*URL*/
    var queryParams = '?' + encodeURIComponent('serviceKey') + '='+'oThJMbfU/WNX0OaMTfVfg7iP/ysoIW9p/tfgGFtccPJjgvoMlTXF+EKwsesm+neiugst4PREez3oA2MOkIcCgQ=='; /*Service Key*/
    queryParams += '&' + encodeURIComponent('solYear') + '=' + encodeURIComponent('2017'); /**/
    queryParams += '&' + encodeURIComponent('solMonth') + '=' + encodeURIComponent('09'); /**/
    xhr.open('GET', url + queryParams);
    xhr.onreadystatechange = function () {
        if (this.readyState == 4) {
            alert('Status: '+this.status+'nHeaders: '+JSON.stringify(this.getAllResponseHeaders())+'nBody: '+this.responseText);
        }
    };

    xhr.send('');
    console.log("qwe");

</script>


</body>
</html>



