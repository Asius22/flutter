import 'package:flutter/material.dart';

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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[700],
        title: Text(widget.title),
      ),
      body: Row(
        children: [
          Drawer(
            width: 300,
            backgroundColor: Colors.grey[300],
            child: Column(
              children: [
                const DrawerHeader(child: Icon(Icons.local_pizza_outlined)),
                Expanded(
                  child: ListView.separated(
                      itemBuilder: (context, index) =>
                          ListTile(title: Text("prova $index")),
                      separatorBuilder: (context, index) => const Padding(
                            padding: EdgeInsets.only(left: 16, right: 16),
                            child: Divider(color: Colors.grey),
                          ),
                      itemCount: 7),
                ),
              ],
            ),
          ),
          const Expanded(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Scaffold(
                backgroundColor: Colors.blue,
              ),
            ),
          ),
          const Expanded(
              child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Scaffold(
              backgroundColor: Colors.amber,
            ),
          ))
        ],
      ),
    );
  }
}
