import 'package:fetch_todos_bloc/blocs/cubit/todos_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

final _getIt = GetIt.instance;

class CubitList extends StatelessWidget {
  const CubitList({Key? key}) : super(key: key);
  static const String nameRoute = "/cubitList";
  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(title: const Text("TODO")),
      body: BlocBuilder<TodosCubit, TodosState>(
        builder: (context, state) => _setPage(context, state),
      ));

  Widget _setPage(BuildContext context, TodosState state) {
    if (state.status == Status.init) {
      context.read<TodosCubit>().init();

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
              _getIt.get<TodosCubit>().change(item);
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
