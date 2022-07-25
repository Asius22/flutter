import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:fetch_todos_bloc/models/fetcher.dart';
import 'package:fetch_todos_bloc/models/todos.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'todos_state.dart';

class TodosCubit extends Cubit<TodosState> {
  final Fetcher fetcher;
  TodosCubit(this.fetcher) : super(const TodosState(status: Status.init));

  void init() async {
    emit(state.copyWith(status: Status.loading));

    try {
      String json = await fetcher.fetchData();
      final result = await jsonDecode(json)
          .map<Todos>((json) => Todos.fromJson(json))
          .toList();

      emit(state.copyWith(status: Status.loaded, todos: [...result]));
    } catch (e) {
      emit(const TodosError("something went wrong during todos fetching"));
    }
  }

  void change(Todos todo) {
    int index = state.todos.indexOf(todo);
    emit(state.copyWith(
        todos: [...state.todos]
          ..removeAt(index)
          ..insert(
              index,
              Todos(
                  completed: !todo.completed,
                  id: todo.id,
                  title: todo.title))));
  }
}
