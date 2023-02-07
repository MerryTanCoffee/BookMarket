<%@page import="dto.Book"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.net.URLDecoder"%>
<%@ page contentType="text/html; charset=utf-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	// :::TODO
	String cartId = session.getId();
	String shopping_cartId = "";
	String shopping_name = "";
	String shopping_shoppingDate = "";
	String shopping_country = "";
	String shopping_zipCode = "";
	String shopping_addressName = "";
	
	Cookie[] cookies = request.getCookies();
	
	if(cookies != null) {
		for(int i = 0; i < cookies.length; i++){
			Cookie thisCookie = cookies[i];
			String n = thisCookie.getName();
			if(n.equals("Shopping_cartId")) {
				shopping_cartId = URLDecoder.decode(thisCookie.getValue(),"UTF-8");
			}
			if(n.equals("Shopping_name")) {
				shopping_name = URLDecoder.decode(thisCookie.getValue(),"UTF-8");
			}
			if(n.equals("Shopping_shoppingDate")) {
				shopping_shoppingDate = URLDecoder.decode(thisCookie.getValue(),"UTF-8");
			}
			if(n.equals("Shopping_country")) {
				shopping_country = URLDecoder.decode(thisCookie.getValue(),"UTF-8");
			}
			if(n.equals("Shopping_zipCode")) {
				shopping_zipCode = URLDecoder.decode(thisCookie.getValue(),"UTF-8");
			}
			if(n.equals("Shopping_addressName")) {
				shopping_addressName = URLDecoder.decode(thisCookie.getValue(),"UTF-8");
			}
		}
	}
%>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<title>주문 정보</title>
</head>
<body>
	<%@ include file="menu.jsp" %>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">주문 정보</h1>
		</div>
	</div>
	<div class="container col-8 alert alert-info">
		<div class="text-center ">
			<h1>영수증</h1>
		</div>
		<div class="row justify-content-between">
			<div class="col-4" align="left">
				<strong>배송 주소</strong> <br> 성명 : <% out.println(shopping_name); %><br> 
				우편번호 : <% out.println(shopping_zipCode);%><br> 
				주소 : <%	out.println(shopping_addressName);%>(<%	out.println(shopping_country);%>)<br>
			</div>
			<div class="col-4" align="right">
				<p>	<em>배송일: <% out.println(shopping_shoppingDate);	%></em>
			</div>
		</div>
		<div>
			<table class="table table-hover">			
			<tr>
				<th class="text-center">도서</th>
				<th class="text-center">#</th>
				<th class="text-center">가격</th>
				<th class="text-center">소계</th>
			</tr>
			<%
				// :::TODO
			int sum = 0;
			ArrayList<Book> cartlist  = (ArrayList<Book>)session.getAttribute("cartlist");	
			if(cartlist == null) {
				cartlist = new ArrayList<Book>();
			}
			for (int i = 0; i < cartlist.size(); i++) {
				Book book = cartlist.get(i);
				int total = book.getPrice()*book.getQuantity();
				sum = sum + total;
			%>
			<tr>
				<td class="text-center"><em><%=book.getName()%><!--상품명--> </em></td>
				<td class="text-center"><%=book.getQuantity()%><!--주문수--></td>
				<td class="text-center"><%=book.getPrice()%><!--가격-->원</td>
				<td class="text-center"><%=total%><!--총가격-->원</td>
			</tr>
			<%
				}
			%>
			<tr>
				<td> </td>
				<td> </td>
				<td class="text-right">	<strong>총액: </strong></td>
				<td class="text-center text-danger"><strong><!--총액--><%=sum%> </strong></td>
			</table>			
				<a href="./ShoppingInfo.jsp?cartId=<%=shopping_cartId%>"class="btn btn-secondary" role="button"> 이전 </a>
				<a href="./thankCustomer.jsp"  class="btn btn-success" role="button"> 주문 완료 </a>
				<a href="./checkOutCancelled.jsp" class="btn btn-secondary"	role="button"> 취소 </a>			
		</div>
	</div>	
</body>
</html>
