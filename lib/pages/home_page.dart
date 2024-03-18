import 'package:book_app/components/mybook.dart';
import 'package:book_app/components/newbook.dart';
import 'package:book_app/pages/profile_page.dart';
import 'package:book_app/theme/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:book_app/data/bookdata.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<BookData> books = [
    new BookData(
      "https://res.cloudinary.com/dhczdaczx/image/upload/v1710494655/bubcec0wfjmg6bitooyz.jpg",
      "The Water Cure",
      "Sophiw Mackintosh",
      132,
      4.0,
      "The Water Cure, is the story of three sisters living an occult existence on an island off “the mainland” one fateful summer when they have their first experience with men other than their father. ",
      10,
    ),
    new BookData(
      "https://res.cloudinary.com/dhczdaczx/image/upload/v1710494674/pb5dhflycfwcy6shmiay.jpg",
      "The Age of Light",
      "Whitney Scharep",
      140,
      4.1,
      "The Age of Light is a bold, intimate and gorgeous novel-at once a vivid romp through the salons and parties of the Paris art world in the 1930s.",
      20,
    ),
    new BookData(
      "https://res.cloudinary.com/dhczdaczx/image/upload/v1710494691/n3vhrjwg4nmd6vjr4zl9.jpg",
      "The Night Tiger",
      "Yangsze Choo",
      120,
      3.9,
      "Eleven-year-old houseboy Ren is also on a mission, racing to fulfill his former master's dying wish.",
      30,
    ),
    new BookData(
        "https://res.cloudinary.com/dhczdaczx/image/upload/v1710494750/f1ioiaaaojfnnhegpe2g.jpg",
        "The Lost Night",
        "Andrea Bartz",
        150,
        4.2,
        "When Edie's body was found near a suicide note at the end of a long, drunken night, no one could believe it.",
        25),
    new BookData(
        "https://res.cloudinary.com/dhczdaczx/image/upload/v1710731515/fdjzgl3ci5zk2v7u8y25.webp",
        "The Hunt",
        "Steli Simeonova",
        200,
        4.6,
        "Keep the truth a secret. It's the only way to stay alive in a world of night",
        10),
    new BookData(
        "https://res.cloudinary.com/dhczdaczx/image/upload/v1710730872/y3yau2e5gbaaqa38tisz.jpg",
        "The Age of Adaline",
        "Richard Harmon",
        100,
        5,
        "Adaline Bowman has lived a solitary existence, never allowing herself to get close to anyone who might reveal her secret.",
        8),
    new BookData(
        "https://res.cloudinary.com/dhczdaczx/image/upload/v1710730911/ybtpu96ukrdx5qze4ff0.jpg",
        "An Anonymous Girl",
        "Green Hendricks & Sarah Pekkanen",
        90,
        4.4,
        "In An Anonymous Girl, by Greer Hendricks, we meet Jessica Farris, a struggling makeup artist living in New York City.",
        5),
  ];

  List<BookData> filteredBooks = [];

  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    filteredBooks = books;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Book Store",
          // style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {},
          // color: Colors.white,
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProfilePage(
                      username: "Aarthi",
                      language: "English",
                    ),
                  ),
                );
              },
              icon: const Icon(
                Icons.person,
                // color: Colors.white,
              )),
          IconButton(
            onPressed: () {
              Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
            },
            icon: Icon(
              Icons.brightness_2,
              // color: Colors.white,
            ),
          ),
        ],
      ),

      //Craete the Search book feild
      //wrap all the app body inside a singleScrollChildView

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 18.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: searchController,
                onChanged: (value) {
                  setState(() {
                    filteredBooks = books
                        .where((book) => book.bookName
                            .toLowerCase()
                            .contains(value.toLowerCase()))
                        .toList();
                  });
                },
                decoration: InputDecoration(
                    filled: true,
                    // fillColor: Color.fromARGB(255, 223, 221, 221),
                    suffixIcon: Icon(Icons.search),
                    contentPadding: EdgeInsets.all(8.0),
                    hintText: "Search your favorite book...",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide.none,
                    )),
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                "My Books",
                style: TextStyle(fontSize: 20.0),
              ),
              SizedBox(
                height: 12.0,
              ),
              //create some class and Widget in seperate file
              //create a listview
              Container(
                width: double.infinity,
                height: 280.0,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: filteredBooks.length,
                  itemBuilder: (BuildContext context, int index) {
                    return myBook(filteredBooks[index]);
                  },
                ),
              ),
              Text(
                "See Also",
                style: TextStyle(fontSize: 16.0),
              ),
              SizedBox(
                height: 12.0,
              ),
              Container(
                width: double.infinity,
                height: 600.0,
                child: ListView.builder(
                  itemCount: filteredBooks.length,
                  itemBuilder: (BuildContext context, int index) {
                    return newBook(filteredBooks[index]);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
