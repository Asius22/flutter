import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:instagram/components/main_page_body.dart';

class MainPage extends StatelessWidget {
  const MainPage(this.title, {Key? key}) : super(key: key);
  static const String routeName = "/main";
  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
          title,
          style: Theme.of(context).textTheme.headline1,
        ),
        actions: [
          IconButton(
              splashRadius: 12,
              iconSize: 32,
              onPressed: () {},
              icon: const Icon(Icons.add_to_photos_outlined)),
          IconButton(
              splashRadius: 12,
              onPressed: () {},
              icon: const Icon(
                Icons.favorite_border,
                size: 32,
              )),
          IconButton(
              splashRadius: 12,
              onPressed: () {},
              icon: const Icon(
                FontAwesomeIcons.paperPlane,
              )),
        ],
      ),
      body: const MainPageBody(),
    );
  }
}
