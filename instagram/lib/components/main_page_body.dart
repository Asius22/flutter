import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:instagram/components/post.dart';
import 'package:instagram/components/story_widget.dart';

class MainPageBody extends StatelessWidget {
  const MainPageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) =>
            (index == 0) ? _storyRow() : _postBody(),
      );

  Widget _storyRow() => SizedBox(
        height: 110,
        child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          clipBehavior: Clip.hardEdge,
          itemCount: 10,
          itemBuilder: (context, index) =>
              (index > 0) ? const StoryWidget() : const MyStoryWidget(),
        ),
      );

  Widget _postBody() => const PostWidget();
}
