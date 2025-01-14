import 'dart:core';

void main (){
  // create some objects for books
  Book book1 = Book(id: "1", title: "Hamlet");
  Book book2 = Book(id: "2", title: "The Great Gatsby");
  Book book3 = Book(id: "3", title: "Dubliners");
  Book book4 = Book(id: "4", title: "Pride and Prejudice");
  // create some users
  User user1 = User(id:"10", name: "Ahmed");
  User user2 = User(id:"15", name: "Mona");
  User user3 = User(id:"20", name: "Omar");
  // create my library
  Library myLibrary = Library(books: [], users: []);
  myLibrary.addUser(user1);
  myLibrary.addUser(user2);
  myLibrary.addUser(user3);
  myLibrary.addBook(book1);
  myLibrary.addBook(book2);
  myLibrary.addBook(book3);
  myLibrary.addBook(book4);
  myLibrary.borrowBook(book3);
  myLibrary.returnBook(book2);
  myLibrary.returnBook(book3);
}
class Book{
  String id;
  String title;
  bool borrowed;
  Book({ this.borrowed=false,required this.id, required this.title});
  displayInfo(){
    print("ID: $id");
    print("Title: $title");
    print("Borrowed: $borrowed");
  }
}
class User {
  String id;
  String name;
  User({required this.id,required this.name});
  displayInfo(){
    print("Name: $name");
    print("ID: $id");
  }
}
class Library {
  List<Book> books;
  List <User>users;
  Library({required this.books,required this.users});
  addUser(User user){
    if(!users.contains(user)){
      users.add(user);
      print("User is added successfully");
    }
    else{
      print("This user is already found");
    }
  }
  addBook(Book book){
    if(!books.contains(book)){
      books.add(book);
      print("Your book is added successfully");
    }else{
      print("This book is already added");
    }
  }
  returnBook(Book book){
    if(books.contains(book)){
      print("The book is already returned");
    }else{
      books.add(book);
      print("Thanks for returning the book back");
    }
  }
  borrowBook(Book book){
    if(books.contains(book)){
      books.remove(book);
      book.borrowed=true;
      print("You can borrow your book now");
    }else{
      print("Unfortunately this book is borrowed now");
    }
  }
  displayInfo(){
    print("My books: $books");
    print("My users: $users");
  }
}