<%@page import="dao.BookRepository"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.util.ArrayList" %>
<%@ page import="dto.Book" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>도서 목록</title>
</head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<body>
<%@ include file="menu.jsp" %>
    <div class="jumbotron">
      <div class="container">
      <h1 class = "display-3">도서 목록</h1>
      </div>
    </div>
    
    <%	
    	BookRepository bookDAO =BookRepository.getInstance();
        ArrayList<Book> listOfBooks = bookDAO.getAllBooks();
    %>
    
    <div class="container">
        <%
            for(int i=0;i<listOfBooks.size();i++){
                Book book = listOfBooks.get(i);
        %>
      <div class="row" align="left">
        <div class="col">
        <img src = "${pageContext.request.contextPath }/resources/images/<%=book.getFilename() %>"
				style="width: 100%;"/>
            <h3><%=book.getName()%></h3>
            <p><%=book.getDescription()%></p>
            <p><%=book.getAuthor()+" | "+book.getPublisher()+" | "+book.getPrice()%>원</p>
            <p><a href = "./book.jsp?bookId=<%=book.getBookId() %>" class="btn btn-secondary"
				role="button">도서 정보&raquo;</a></p>
        </div>
      </div>
      <hr style="border:grey 1px dashed">
          <%
            }
        %>
    </div>
 
<%@ include file="footer.jsp" %>
 
</body>
</html>
