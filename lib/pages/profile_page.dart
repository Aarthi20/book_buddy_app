import 'package:flutter/material.dart';
import 'package:book_app/pages/signin_page.dart';

class ProfilePage extends StatefulWidget {
  final String username;
  String language;

  ProfilePage({required this.username, required this.language});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  List<String> languages = ['English', 'Spanish', 'French', 'German'];
  late String selectedLanguage;

  @override
  void initState() {
    super.initState();
    selectedLanguage = widget.language;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        actions: [
          TextButton(
            onPressed: () {
              // Perform sign-out actions
              // For demonstration, navigate back to the login page
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => SigninPage()));
            },
            child: const Text(
              'Sign Out',
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome, ${widget.username}!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Language Preference:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            DropdownButton<String>(
              value: selectedLanguage,
              onChanged: (newValue) {
                setState(() {
                  selectedLanguage = newValue!;
                  widget.language = newValue; // Update language preference
                });
              },
              items: languages.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
