import 'package:flutter/material.dart';
import 'package:web_site_prototype/responsive/constants.dart';
import 'package:web_site_prototype/responsive/desktop_layout.dart';
import 'package:web_site_prototype/responsive/responsive_layout.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      desktopLayout: const DesktopLayout(),
      smartPhoneLayout: Scaffold(
        appBar: AppBar(),
        drawer: Drawer(child: drawerColumn),
        body: Container(
          color: Colors.green,
        ),
      ),
      tabletLayout: Scaffold(
        appBar: AppBar(),
        drawer: Drawer(child: drawerColumn),
        body: Container(
          color: Colors.deepOrange,
        ),
      ),
    );
  }
}
