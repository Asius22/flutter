import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/blocs/blocs.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);
  static const String routeName = "/favourites";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
            child: Text(
          "Preferiti",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        )),
      ),
      body: BlocBuilder<WordPairBloc, WordPairState>(
        builder: (context, state) => _buildList(context, state),
      ),
    );
  }

  Widget _buildList(BuildContext context, WordPairState state) =>
      ListView.builder(
        itemCount: state.lenght, //il numero di oggetti present nello stato
        itemBuilder: (context, index) => ListTile(
          title: Text(state.getElement(index).asPascalCase),
          trailing: IconButton(
              onPressed: () => context.read<WordPairBloc>().add(WordPairEvent(
                  action: EventType.remove, wp: state.getElement(index))),
              icon: const Icon(Icons.remove)),
        ),
      );
}
