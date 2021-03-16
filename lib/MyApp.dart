import 'package:flutter/material.dart';
import 'package:the_battle/pages/AllCharactersPage.dart';
import 'package:the_battle/pages/HomePage.dart';

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: AllCharactersPage(),
    );
  }
}