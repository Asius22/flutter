import 'package:flutter/material.dart';

final drawerColumn = Column(
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
);
