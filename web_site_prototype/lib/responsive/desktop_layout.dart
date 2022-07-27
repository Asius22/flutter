import 'package:flutter/material.dart';
import 'package:web_site_prototype/responsive/constants.dart';

class DesktopLayout extends StatelessWidget {
  const DesktopLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Drawer(
            width: 250,
            backgroundColor: Colors.grey[300],
            child: drawerColumn,
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
