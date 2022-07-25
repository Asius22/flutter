import 'package:fetch_todos_bloc/blocs/bloc/todos_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodosList extends StatelessWidget {
  const TodosList({Key? key}) : super(key: key);
  static const String nameRoute = "/todosList";
  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(title: const Text("TODO")),
      body: BlocBuilder<TodosBloc, TodosState>(
        builder: (context, state) => _setPage(context, state),
      ));

  Widget _setPage(BuildContext context, TodosState state) {
    if (state.status == Status.init) {
      context.read<TodosBloc>().add(TodosLoadEvent());
      return const Center(child: CircularProgressIndicator());
    }
    return _creaLista(context, state);
  }

  Widget _creaLista(BuildContext context, TodosState state) => ListView.builder(
        itemCount: state.todos.length,
        itemBuilder: (context, index) {
          final item = state.todos[index];

          return ListTile(
            onTap: () {
              BlocProvider.of<TodosBloc>(context)
                  .add(TodosChangedEvent(todo: item));
            },
            title: Text(item.title),
            leading: Text("${item.id}"),
            trailing: (item.completed)
                ? const Icon(
                    Icons.check,
                    color: Colors.green,
                  )
                : const Icon(
                    Icons.square_outlined,
                    color: Colors.red,
                  ),
          );
        },
      );
}
