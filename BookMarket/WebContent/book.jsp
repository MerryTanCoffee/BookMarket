<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="dto.Book"%>
<%@ page import="dao.BookRepository"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<title>도서 상세 정보</title>
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
					<%=book.getUnitsInStock()%>
				<p>
					<b>총 페이지 수</b> :
					<%=book.getTotalPages() %>
				<p>
					<b>출판일</b> :
					<%=book.getReleaseDate() %>
				<h4><%=book.getUnitPrice() %>원
				</h4>
				<p>
					<a href="#" class="btn btn-info">도서 주문 &raquo;</a> <a
						href="./books.jsp" class="btn btn-secondary">도서 목록 &raquo;</a>
			</div>
		</div>

	</div>
	<hr>
</body>
</html>
