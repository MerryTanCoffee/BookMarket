<%@ page pageEncoding="utf-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="dto.Book"%>
<%@ page import="dao.BookRepository"%>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<%
	String cartId = session.getId();
%>
<title>장바구니</title>
</head>
<body>
	<%@ include file="menu.jsp" %>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">장바구니</h1>
		</div>
	</div>
	<div class="container">
		<div class="row">
			<table width="100%">
				<tr>
					<td align="left"><a href="./deleteCart.jsp?cartId=<%=cartId%>" class="btn btn-danger">삭제하기</a></td>
					<td align="right"><a href="./shoppingInfo.jsp?cartId=<%= cartId %>" class="btn btn-success">주문하기</a></td>
				</tr>
			</table>
		</div>
		<div style="padding-top: 50px">
			<table class="table table-hover">
				<tr>
					<th>상품</th>
					<th>가격</th>
					<th>수량</th>
					<th>소계</th>
					<th>비고</th>
				</tr>
				<%				
					int sum = 0;
					ArrayList<Book> cartList = (ArrayList<Book>) session.getAttribute("cartlist");
					if (cartList == null)
						cartList = new ArrayList<Book>();

					for (int i = 0; i < cartList.size(); i++) { // 상품리스트 하나씩 출력하기
						Book Book = cartList.get(i);
						int total = Book.getPrice() * Book.getQuantity();
						sum = sum + total;
				%>
				<tr>
					<td><%=Book.getBookId()%> - <%=Book.getName()%></td>
					<td><%=Book.getPrice()%></td>
					<td><%=Book.getQuantity()%></td>
					<td><%=total%></td>
					<td><a href="./removeCart.jsp?id=<%=Book.getBookId()%>" class="badge badge-danger">삭제</a></td>
				</tr>
				<%
					}
				%>
				<tr>
					<th></th>
					<th></th>
					<th>총액</th>
					<th><%=sum%></th>
					<th></th>
				</tr>
			</table>
			<a href="./Books.jsp" class="btn btn-secondary"> &laquo; 쇼핑 계속하기</a>
		</div>
		<hr>
	</div>