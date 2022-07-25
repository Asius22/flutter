import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PostWidget extends StatelessWidget {
  const PostWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Card(
        color: Colors.black,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const ListTile(
            tileColor: Colors.black,
            leading: CircleAvatar(
              foregroundImage: NetworkImage(
                "https://static.wikia.nocookie.net/dragonball/images/6/66/SonGoku-DBSSuperHero.png/revision/latest/top-crop/width/360/height/360?cb=20220302071810&path-prefix=it",
              ),
            ),
            title: Text("Nome dell'utente"),
            trailing: Icon(Icons.more_vert_outlined),
            iconColor: Colors.white,
          ),
          Image.network(
            "https://static.wikia.nocookie.net/dragonball/images/6/66/SonGoku-DBSSuperHero.png/revision/latest/top-crop/width/360/height/360?cb=20220302071810&path-prefix=it",
            scale: 9 / 16,
          ),
          ListTile(
            tileColor: Colors.black,
            iconColor: Colors.white,
            leading: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                      splashRadius: 1,
                      iconSize: 32,
                      onPressed: () {},
                      icon: const Icon(Icons.favorite_border)),
                  IconButton(
                      splashRadius: 1,
                      iconSize: 28,
                      onPressed: () {},
                      icon: const Icon(FontAwesomeIcons.comment)),
                  IconButton(
                      splashRadius: 1,
                      onPressed: () {},
                      icon: const Icon(FontAwesomeIcons.paperPlane)),
                ]),
            trailing: const Icon(
              Icons.bookmark_border,
              size: 32,
            ),
          ),
          const Text(
            "Hi, it's me, Goku!",
            style: TextStyle(color: Colors.white, fontSize: 24),
          ),
          const Text(
            "10 Luglio",
            style: TextStyle(color: Colors.grey, fontSize: 10),
          )
        ]),
      );
}
