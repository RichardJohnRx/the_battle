import 'package:flutter/material.dart';
import 'package:the_battle/models/Character.dart';
import 'package:the_battle/widgets/CharacterPreview.dart';

class CharacterMaster extends StatelessWidget {
  CharacterMaster({Key key, this.characters}) : super(key: key);
  final List<Character> characters;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: SingleChildScrollView(
        child: Column(
          children: characters.map((character) => CharacterPreview(character: character)).toList(),
        ),
      ),
    );
  }
}