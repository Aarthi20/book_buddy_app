import 'package:book_app/theme/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'pages/signin_page.dart';

void main() => runApp(ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: MyApp(),
    ));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Book Management App',
            theme: themeProvider.getTheme(),
            home: SigninPage(),
          );
        },
      ),
    );
  }
}
