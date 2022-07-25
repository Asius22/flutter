import 'package:ecommerce/Blocs/bloc/cart_bloc.dart';
import 'pages/pages.dart';
import 'package:ecommerce/Blocs/observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  BlocOverrides.runZoned(() => runApp(const MyApp()), blocObserver: Observer());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartBloc(),
      lazy: false,
      child: MaterialApp(
        title: 'E-Commerce',
        debugShowCheckedModeBanner: false,
        routes: {
          ListItemPage.routeName: (context) => const ListItemPage(),
          CheckoutPage.routeName: (context) => const CheckoutPage()
        },
        initialRoute: ListItemPage.routeName,
        theme: ThemeData(
            primarySwatch: Colors.indigo,
            appBarTheme: const AppBarTheme(
                backgroundColor: Colors.white, foregroundColor: Colors.black)),
        // home: const MyHomePage(title: 'E-Commerce'),
      ),
    );
  }
}
