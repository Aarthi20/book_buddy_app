class Book {
  final String title;
  final String author;
  final bool available;

  Book({required this.title, required this.author, required this.available});

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      title: json['title'],
      author: json['author'],
      available: json['available'],
    );
  }
}
