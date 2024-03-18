// create a Data class to save the book data
// like the book cover , book name, author, copies

class BookData {
  String bookCover;
  String bookName;
  String author;
  String description;
  int pageNum;
  int available;
  double rating;

  BookData(
    this.bookCover,
    this.bookName,
    this.author,
    this.pageNum,
    this.rating,
    this.description,
    this.available,
  );
}
