package dto;
 
public class Book {
    private String bookId;
    private String name;
    private int price;
    private String description;
    private String author;
    private String publisher;
    private long unitsInStock;
    private String condition;
    private String filename;
    private int quantity; 	

    public Book() {
    	super();
    	// TODO Auto-generated constructor stub
    }
    public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

    
    public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

    
    public Book(String bookId, String name, int price) {
        this.bookId = bookId;
        this.name = name;
        this.price = price;
    }
 
    public String getAuthor() {
        return author;
    }
 
    public void setAuthor(String author) {
        this.author = author;
    }
 
    public String getBookId() {
        return bookId;
    }
 
    public void setBookId(String bookId) {
        this.bookId = bookId;
    }
 
    public String getName() {
        return name;
    }
 
    public void setName(String name) {
        this.name = name;
    }
 
    public int getPrice() {
        return price;
    }
 
    public void setPrice(int price) {
    	this.price = price;
    }
 
    public String getDescription() {
        return description;
    }
 
    public void setDescription(String desciption) {
        this.description = desciption;
    }
 
    public String getPublisher() {
        return publisher;
    }
 
    public void setPublisher(String publisher) {
        this.publisher = publisher;
    }
 
 
    public long getUnitsInStock() {
        return unitsInStock;
    }
 
    public void setUnitsInStock(long unitsInStock) {
        this.unitsInStock = unitsInStock;
    }

 
    public String getCondition() {
        return condition;
    }
 
    public void setCondition(String condition) {
        this.condition = condition;
    }
    
    
}
