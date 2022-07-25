import 'package:flutter/material.dart';
import 'package:instagram/pages/main_page.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);
  final String title = 'Instagram Copy';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      theme: Theme.of(context).copyWith(
        backgroundColor: Colors.black,
        appBarTheme: const AppBarTheme(
            backgroundColor: Colors.black, foregroundColor: Colors.white),
        textTheme: const TextTheme(
          headline1: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              fontFamily: "billabong"),
        ),
        colorScheme: const ColorScheme.dark(),
      ),
      routes: {
        MainPage.routeName: (context) => MainPage(title),
      },
      initialRoute: MainPage.routeName,
    );
  }
}
