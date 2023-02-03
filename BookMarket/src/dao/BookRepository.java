package dao;
import java.util.ArrayList;
import dto.Book;
 
 
public class BookRepository {
    private ArrayList<Book> listOfBooks=new ArrayList<Book>();
    private static BookRepository instance=new BookRepository();
    
    public static BookRepository getInstance() {
        return instance;
    }
    
    public BookRepository() {
        Book b1=new Book("a001", "[Hello Coding] HTML5+CSS3", 15000);
        b1.setDescription("문서 작성만큼, 아니 그보다 더 쉬운 웹페이지 만들기, 초보자를 위한 맞춤형 입문서. 지금 당장 컴퓨터가 없어도 괜찮다. 코드와 실행 화면이 바로 보여서 눈으로만 읽어도 어떻게 작동하는지 쉽게 파악할 수 있는 것은 기본이고, 중간중간 퀴즈를 추가하여 재미있게 게임하듯 복습할 수 있다.");
        b1.setAuthor("황재호");
        b1.setPublisher("한빛미디어");
        b1.setUnitsInStock(1000);
        b1.setTotalPages(288);
        b1.setReleaseDate("2018/03/02");
        b1.setFilename("P1234.png");
        
        Book b2=new Book("a002", "[IT 모바일] 쉽게 배우는 자바 프로그래밍", 27000);
        b2.setDescription("객체 지향의 핵심과 자바의 현대적 기능을 충실히 다루면서도 초보자가 쉽게 학습할 수 있게 구성한 교재이다. 시각화 도구를 활용한 개념 설명과 군더더기 없는 핵심 코드를 통해 개념과 구현을 한 흐름으로 학습할 수 있다.");
        b2.setAuthor("우종중");
        b2.setPublisher("한빛미디어");
        b2.setUnitsInStock(1000);
        b2.setTotalPages(692);
        b2.setReleaseDate("2017/08/02");
        b2.setFilename("P1235.png");
        
        Book b3=new Book("a003", "[IT 모바일] 스프링4 입문", 27000);
        b3.setDescription("그림과 표로 쉽게 배우는 스프링 4 입문서. 스프링은 단순히 사용 방법만 익히는 것보다 아키텍처를 어떻게 이해하고 설계하는지가 더 중요하다.");
        b3.setAuthor("하세가와 유이치, 오오노 와타루, 토키 코헤이(권은철, 전민수)");
        b3.setPublisher("한빛미디어");
        b3.setUnitsInStock(1000);
        b3.setTotalPages(520);
        b3.setReleaseDate("2017/11/01");
        b3.setFilename("P1236.png");
        
        listOfBooks.add(b1);
        listOfBooks.add(b2);
        listOfBooks.add(b3);
    }
    
    
    public ArrayList<Book> getAllBooks(){
        return listOfBooks;
    }
    
    public Book getBookById(String bookId) {
        Book bookById=null;
        for(int i=0;i<listOfBooks.size();i++) {
            Book bk=listOfBooks.get(i);
            if(bk!=null && bk.getBookId()!=null && bk.getBookId().equals(bookId)){
                bookById=bk;
                break;
            }
        }
        
        return bookById;
    }
    public void addBook(Book book) {
        listOfBooks.add(book);
    }
}