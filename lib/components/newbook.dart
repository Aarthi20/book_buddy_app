import 'package:book_app/data/bookdata.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

Widget newBook(BookData book) {
  return Container(
    width: double.infinity,
    height: 150.0,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(right: 8.0),
          height: 128.0,
          width: 83.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            image: DecorationImage(
              image: NetworkImage(book.bookCover),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                book.bookName,
                style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 8.0,
              ),
              Text(
                book.author,
                style: TextStyle(fontSize: 18.0),
              ),
              SizedBox(height: 12.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.content_copy),
                  Text(book.pageNum.toString()),
                  SizedBox(width: 20.0),
                  Icon(
                    Icons.star,
                    color: Colors.yellow,
                  ),
                  Text(book.rating.toString()),
                  SizedBox(width: 20.0),
                  Text("Available: "),
                  Text(book.available.toString()),
                ],
              ),
            ],
          ),
        ),
        Icon(Icons.bookmark_border),
      ],
    ),
  );
}
