import 'package:flutter/material.dart';
import 'package:task1/src/view/authentication_view.dart';
import 'package:task1/src/view/home_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (BuildContext context) {
          return AuthenticationView();
        },
        '/home': (BuildContext context) {
          return HomeView();
        },
      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color.fromRGBO(23, 101, 203, 1.0)),
        useMaterial3: true,
      ),
    );
  }
}
