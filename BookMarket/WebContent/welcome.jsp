<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Welcome</title>
</head>
 
<!-- �������� �ּ�ȭ�� �ֽ� CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
 
<body>
 
<%@ include file="menu.jsp" %>
 
<%!
    String str1="���� �� ���θ�";
    String str2="Welcome to Book Market!";
%>
 
<div class="jumbotron">
  <div class="container">
  <h1 class = "display-3">
    <%= str1 %>
    </h1>
  </div>
</div>
 
<div class="container">
  <div class="text-center">
    <p>
    <%= str2 %>
    <p>
    <hr>
  </div>
</div>
 
<%@ include file="footer.jsp" %>
 
</body>
</html>
