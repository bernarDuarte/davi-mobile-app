import 'package:davi_project/screens/home.dart';
import 'package:flutter/material.dart';

import 'appToDoList/appHome.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/',
      home: const Bengala(),
      // routes: {
      //   // When navigating to the "/" route, build the FirstScreen widget.
      //   '/': (context) => const AppHome(),
      //   // When navigating to the "/second" route, build the SecondScreen widget.
      //   '/bengala': (context) => const Bengala(),
      //   '/forms': (context) => const FormScreen(),
      // },
    );
  }
}




