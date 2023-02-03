<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.DiskFileUpload"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="dto.Book"%>
<%@page import="dao.BookRepository"%>

<%
request.setCharacterEncoding("UTF-8");

	
String filename = "";
String realFolder = request.getServletContext().getRealPath("/resources/images");
String encType = "utf-8";

int maxSize = 5 * 1024 * 1024;	// 최대 업로드될 파일의 크기(5MB)

File file = new File(realFolder);
if(!file.exists()){
	file.mkdirs();
}

DiskFileUpload upload = new DiskFileUpload();
upload.setSizeMax(10 * 1024 * 1024);
upload.setSizeThreshold(maxSize);
upload.setRepositoryPath(realFolder);

List items = upload.parseRequest(request);
Iterator params = items.iterator();

String bookId = "";
String name = "";
String unitPrice = "";
String author = "";
String description = "";
String publisher = "";
String category = "";
String unitsInStock = "";
String totalPages = "";
String releaseDate = "";
String condition = "";
String fileName = "";


while(params.hasNext()){
	FileItem item = (FileItem) params.next();
	if(item.isFormField()){	// 일반 폼 데이터
String fieldName = item.getFieldName();	// 파라미터의 이름

if(fieldName.equals("bookId")){
	bookId = item.getString(encType);
}else if(fieldName.equals("name")){
	name = item.getString(encType);
}else if(fieldName.equals("unitPrice")){
	unitPrice = item.getString(encType);
}else if(fieldName.equals("author")){
	author = item.getString(encType);
}else if(fieldName.equals("description")){
	description = item.getString(encType);
}else if(fieldName.equals("publisher")){
	publisher = item.getString(encType);
}else if(fieldName.equals("category")){
	category = item.getString(encType);
}else if(fieldName.equals("unitsInStock")){
	unitsInStock = item.getString(encType);
}else if(fieldName.equals("totalPages")){
	totalPages = item.getString(encType);
}else if(fieldName.equals("releaseDate")){
	releaseDate = item.getString(encType);
}else if(fieldName.equals("condition")){
	condition = item.getString(encType);
}
	}else{					// 파일 데이터
String fileFieldName = item.getFieldName();
fileName = item.getName();	// 저장 파일의 이름
String contentType = item.getContentType();
String originalFileName = fileName;
long fileSize = item.getSize();
File originalFile = new File(originalFileName);
File saveFile = new File(realFolder + "/" + fileName);
item.write(saveFile);
	}
}


Integer price;
if(unitPrice == null){
	price = 0;
}else
	price = Integer.valueOf(unitPrice);

long stock;
if(unitsInStock == null){
	stock = 0;
}else
	stock = Long.valueOf(unitsInStock);

long total_Pages;
if(totalPages == null){
	total_Pages = 0;
}else
	total_Pages = Long.valueOf(totalPages);

BookRepository dao = BookRepository.getInstance();

Book newBook = new Book();
newBook.setBookId(bookId);
newBook.setName(name);
newBook.setUnitPrice(price);
newBook.setAuthor(author);
newBook.setDescription(description);
newBook.setPublisher(publisher);
newBook.setCategory(category);
newBook.setUnitsInStock(stock);
newBook.setTotalPages(total_Pages);
newBook.setReleaseDate(releaseDate);
newBook.setCondition(condition);
newBook.setFilename(fileName);

dao.addBook(newBook);

response.sendRedirect("books.jsp");

%>