<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="dto.Book"%>
<%@ page import="dao.BookRepository"%>
<%@ page errorPage ="exceptionNoProductId.jsp" %>	
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<title>도서 상세 정보</title>
<script type="text/javascript">
function addToCart(){
	if(confirm("이 상품을 장바구니에 추가하시겠습니까?")) {
		document.addFrom.submit();
	} else {
		document.addForm.reset();
	}
}
</script>
</head>
<body>
	<jsp:include page="menu.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">도서 상세 정보</h1>
		</div>
	</div>
	<%
        String id=request.getParameter("bookId");
        BookRepository dao=BookRepository.getInstance();
        Book book=dao.getBookById(id);
    %>
	<div class="container">
		<div class="row" align="left">
			<div class="col-md-6">
			<img src = "${pageContext.request.contextPath }/resources/images/<%=book.getFilename() %>"
				style="width: 100%;"/>
				<h3><%=book.getName()%></h3>
				<p><%=book.getDescription()%></p>
				<p>
					<b>도서 코드 : </b><span class="badge badge-danger"> <%=book.getBookId()%>
					</span>
				<p>
					<b>출판사</b> :
					<%=book.getPublisher() %>
				<p>
					<b>저자</b> :
					<%=book.getAuthor() %>
				<p>
					<b>재고수</b> :
					<%=book.getUnitsInStock()%></p>
				<h4><%=book.getPrice() %>원</h4>
				<form name="addForm" action="./addCart.jsp" method="get">
					<input type="hidden" value="<%=book.getBookId() %>" name="id"/>
					<a href="#" class="btn btn-info" onclick="addToCart()"> 도서주문
						&raquo;</a> <a href="./cart.jsp" class="btn btn-warning"> 장바구니
						&raquo;</a> <a href="./books.jsp" class="btn btn-secondary">
						도서목록 &raquo;</a>
				</form>
			</div>
		</div>
	</div>
		<%@ include file="footer.jsp"%>
	<hr>
</body>
</html>
