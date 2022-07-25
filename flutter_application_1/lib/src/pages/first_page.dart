import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/blocs/blocs.dart';
import 'package:flutter_application_1/src/pages/favourites_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FirstPage extends StatelessWidget {
  FirstPage({Key? key}) : super(key: key);
  static const routeName = "/list_page";
  final _wordList = <WordPair>[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      body: ListView.builder(
          padding: const EdgeInsets.all(16),
          itemBuilder: (context, i) {
            if (i >= _wordList.length) {
              _wordList.addAll(generateWordPairs().take(10).toList());
            }
            return BlocBuilder<WordPairBloc, WordPairState>(
              builder: (context, state) => _createTile(i, context, state),
            );
          }),
    );
  }

  Widget _createTile(int i, BuildContext context, WordPairState state) {
    final str = _wordList[i];
    final saved = state.contain(str);
    return ListTile(
        title: Text(_wordList[i].asPascalCase),
        trailing: saved
            ? const Icon(
                Icons.favorite,
                color: Colors.red,
              )
            : const Icon(Icons.favorite_border),
        onTap: () => context.read<WordPairBloc>().add(WordPairEvent(
            action: (!saved) ? EventType.add : EventType.remove, wp: str)));
  }

  AppBar _appBar(BuildContext context) => AppBar(
        title: const Center(
            child: Text(
          "Nomi",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        )),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, SecondPage.routeName);
              },
              icon: const Icon(Icons.menu))
        ],
      );
}
