import 'package:flutter/material.dart';
import 'package:the_battle/models/Player.dart';
import 'package:the_battle/pages/AllCharactersPage.dart';
import 'package:the_battle/pages/HomePage.dart';
import 'package:the_battle/pages/TeamPage.dart';

class TheBattleApp extends StatefulWidget {
  @override
  _TheBattleAppState createState() => _TheBattleAppState();
}

class _TheBattleAppState extends State<TheBattleApp> {
  final Player _player = Player("uuid", "John", "Doe", "john@doe.com", 1);

  final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'The Battle',
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: {
        '/': (context) => AllCharactersPage(player: _player,),
        '/team': (context) => TeamPage(player: _player,),
        '/team-custom': (context) => Container(),
      },
    );
  }
}
