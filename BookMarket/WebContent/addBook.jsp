<%@ page language="java" contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
 
<title>Insert title here</title>
</head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<script src="./resources/js/validation.js"></script>
<body>
    <jsp:include page="menu.jsp"/>
    <div class="jumbotron">
          <div class="container">
                  <h2 class = "display-3">도서 등록</h2>
          </div>
    </div>
    <div class="container">
        <form name="newBook" action="./processAddBook.jsp" class="form-horiontal" method="post"
         enctype="multipart/form-data">
          <div class="form-group row">
                <label class="col-sm-2">도서코드</label>
                <div class="col-sm-3">
                    <input type="text" name="bookId" class="form-control">
                </div> 
            </div> 
            <div class="form-group row">
                <label class="col-sm-2">도서명</label>
                    <div class="col-sm-3">
                        <input type="text" name="name" class="form-control">
                    </div>
            </div>
            <div class="form-group row">
                <label class="col-sm-2">가격</label>
                    <div class="col-sm-3">
                        <input type="text" name="price" class="form-control">
                    </div>
            </div>
            <div class="form-group row">
                <label class="col-sm-2">저자</label>
                    <div class="col-sm-3">
                        <input type="text" name="author" class="form-control">
                    </div>
            </div>
            <div class="form-group row">
                <label class="col-sm-2">출판사</label>
                    <div class="col-sm-3">
                        <input type="text" name="publisher" class="form-control">
                    </div>
            </div>
            <div class="form-group row">
                <label class="col-sm-2">출판일</label>
                    <div class="col-sm-3">
                        <input type="text" name="releaseDate" class="form-control">
                    </div>
            </div>
            <div class="form-group row">
                <label class="col-sm-2">총 페이지 수</label>
                    <div class="col-sm-3">
                        <input type="text" name="totalPages" class="form-control">
                    </div>
            </div>
            <div class="form-group row">
                <label class="col-sm-2">상세정보</label>
                    <div class="col-sm-5">
                        <textarea name="description" cols="50" rows="2" class="form-control"></textarea>
                    </div>
            </div>
            <div class="form-group row">
                <label class="col-sm-2">분류</label>
                    <div class="col-sm-3">
                        <input type="text" name="category" class="form-control">
                    </div>
            </div>
            <div class="form-group row">
                <label class="col-sm-2">재고 수</label>
                    <div class="col-sm-3">
                        <input type="text" name="unitsInStock" class="form-control">
                    </div>
            </div>
            <div class="form-group row">
                <label class="col-sm-2">상태</label>
                    <div class="col-sm-5">
                        <input type="radio" name="condition" value="New"> 신규 도서
                        <input type="radio" name="condition" value="Old"> 중고 도서
                        <input type="radio" name="condition" value="E-Book"> E-book
                    </div>
            </div>
            <div class="form-group row">
				<label class="col-sm-2">이미지</label>
				<div class="col-sm-5">
					<input type="file" name="bookImage" class="form-control" >
				</div>
			</div>
            <div class="form-group row">
                <div class="col-sm-offset-2 col-sm-10">
                        <input type="submit" value="등록" class="btn btn-primary">  
                        <a class = "navbar-brand" href="./logout.jsp">로그아웃</a>	
                </div>
            </div>
         
        </form>
    </div>
</body>
</html>
