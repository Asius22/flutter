import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/blocs/blocs.dart';
import 'package:flutter_application_1/src/pages/pages.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  BlocOverrides.runZoned(() => runApp(const MyApp()),
      blocObserver: SimpleBlocObserver());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => WordPairBloc(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Names',
          routes: {
            FirstPage.routeName: (context) => FirstPage(),
            SecondPage.routeName: (context) => const SecondPage(),
          },
          initialRoute: FirstPage.routeName,
          theme: ThemeData(
              appBarTheme: const AppBarTheme(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black)),
        ));
  }
}
