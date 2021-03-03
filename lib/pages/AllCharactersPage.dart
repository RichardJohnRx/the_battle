import 'package:flutter/material.dart';
import 'package:the_battle/models/Character.dart';
import 'package:the_battle/widgets/CharacterMaster.dart';

class AllCharactersPage extends StatefulWidget {
  AllCharactersPage({Key key, this.characters}) : super(key: key);
  final List<Character> characters;

  @override
  _AllCharactersPageState createState() => _AllCharactersPageState();
}

class _AllCharactersPageState extends State<AllCharactersPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Image(
            image: AssetImage('assets/images/the-battle-logo.png'),
            height: 40.0,
          ),
          backgroundColor: Colors.white,
          centerTitle: true,
        ),
        body: CharacterMaster(characters: widget.characters),
    );
  }
}