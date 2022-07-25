import 'dart:developer';

import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyStoryWidget extends StatelessWidget {
  const MyStoryWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => InkWell(
        overlayColor: MaterialStateProperty.all(Colors.black),
        onTap: () {
          log("message");
        },
        child: Padding(
          padding: const EdgeInsets.only(top: 12, bottom: 8, left: 8, right: 8),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Badge(
                position: BadgePosition.bottomEnd(end: -4, bottom: -4),
                badgeContent: const Icon(
                  Icons.add,
                  color: Colors.white,
                  shadows: [Shadow(color: Colors.black)],
                  size: 10,
                ),
                badgeColor: Colors.blue,
                child: const CircleAvatar(
                  backgroundColor: Colors.grey,
                  minRadius: 32,
                  foregroundImage: NetworkImage(
                    "https://static.wikia.nocookie.net/dragonball/images/6/66/SonGoku-DBSSuperHero.png/revision/latest/top-crop/width/360/height/360?cb=20220302071810&path-prefix=it",
                  ),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              const Expanded(
                child: Text(
                  "La mia storia",
                ),
              ),
            ],
          ),
        ),
      );
}

class StoryWidget extends StatelessWidget {
  const StoryWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => InkWell(
        overlayColor: MaterialStateProperty.all(Colors.black),
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
              CircleAvatar(
                minRadius: 36,
                backgroundColor: Colors.pink,
                child: CircleAvatar(
                  minRadius: 34,
                  backgroundColor: Colors.black,
                  child: CircleAvatar(
                    minRadius: 32,
                    backgroundColor: Colors.grey,
                  ),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Expanded(child: Text("Tizio"))
            ],
          ),
        ),
      );
}
