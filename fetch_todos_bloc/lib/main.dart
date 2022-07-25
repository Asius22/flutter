import 'dart:async';

import 'package:fetch_todos_bloc/blocs/bloc/todos_bloc.dart';
import 'package:fetch_todos_bloc/blocs/cubit/todos_cubit.dart';
import 'package:fetch_todos_bloc/blocs/observer.dart';
import 'package:fetch_todos_bloc/models/fetcher.dart';
import 'package:fetch_todos_bloc/pages/cubit_page.dart';
import 'package:fetch_todos_bloc/pages/list_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

final GetIt _getIt = GetIt.instance;

void main() {
  setup();
  BlocOverrides.runZoned(() => runApp(const App()),
      blocObserver: MyBlocObserver());
}

void setup() {
  _getIt.registerSingleton<TodosCubit>(
      TodosCubit(Fetcher(client: http.Client())));
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TodosCubit(Fetcher(client: http.Client())),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'TODO\'S app',
        routes: {
          TodosList.nameRoute: (context) => const TodosList(),
          CubitList.nameRoute: (context) => const CubitList()
        },
        initialRoute: CubitList.nameRoute,
        theme: ThemeData(
            primarySwatch: Colors.blue,
            backgroundColor: Colors.white,
            appBarTheme: AppBarTheme(
                backgroundColor: Colors.blueGrey[50],
                foregroundColor: Colors.black)),
      ),
    );
  }
}
