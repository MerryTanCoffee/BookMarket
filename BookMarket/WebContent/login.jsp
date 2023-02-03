<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.min.css" />
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action = "j_security_check" method="post" name ="LoginForm">
	아이디 : <input type="text" name = "j_username"/><br/>
	비밀번호 : <input type="text" name = "j_password"/><br/>
	<input type="submit" value = "전송"/>
</form>
</body>
</html>