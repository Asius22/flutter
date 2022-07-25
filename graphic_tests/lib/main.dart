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
        title: Text(widget.title),
      ),
      body: _cards(),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _cards() {
    List<Widget> cards = <Widget>[];
    for (var i = 0; i < 10; i++) {
      cards.add(Card(
        shape: const RoundedRectangleBorder(borderRadius: _radius),
        elevation: 10.0,
        child: Container(
          decoration: const BoxDecoration(
            borderRadius: _radius,
            gradient: LinearGradient(colors: [
              Colors.orangeAccent,
              Colors.orange,
              Colors.deepOrangeAccent,
              Colors.deepOrange,
            ], begin: Alignment.bottomLeft, end: Alignment.topRight),
          ),
          child: Image.network(
            "https://static.wikia.nocookie.net/dragonball/images/6/66/SonGoku-DBSSuperHero.png/revision/latest/top-crop/width/360/height/360?cb=20220302071810&path-prefix=it",
            width: 100,
            height: 100,
          ),
        ),
      ));
    }

    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: cards.length,
        itemBuilder: (context, index) => cards[index],
      ),
    );
  }

  static const _radius = BorderRadius.only(
    bottomLeft: Radius.circular(15),
    bottomRight: Radius.circular(15),
    topLeft: Radius.circular(15),
    topRight: Radius.elliptical(225, 265),
  );
}
