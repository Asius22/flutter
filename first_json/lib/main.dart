import 'package:flutter/material.dart';
import 'photo.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          backgroundColor: Colors.white,
          appBarTheme: const AppBarTheme(
              backgroundColor: Colors.white, foregroundColor: Colors.black)),
      title: "Json parse sample",
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Json parser"),
        ),
        body: FutureBuilder<List<Photo>>(
          future: fetchPhotos(http.Client()),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const Center(
                child: Text("c'è stato un errore"),
              );
            } else if (snapshot.hasData) {
              return ListPhotos(
                photos: snapshot.data!,
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}

class ListPhotos extends StatelessWidget {
  const ListPhotos({super.key, required this.photos});
  final List<Photo> photos;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: (MediaQuery.of(context).size.width ~/ 300 <= 2)
                ? 2
                : MediaQuery.of(context).size.width ~/ 300),
        itemCount: photos.length,
        itemBuilder: (context, i) {
          return Image.network(photos[i].thumbnailUrl);
        });
  }
}
