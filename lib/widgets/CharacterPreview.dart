import 'package:flutter/material.dart';
import 'package:the_battle/models/Character.dart';

class CharacterPreview extends StatelessWidget {
  CharacterPreview({Key key, this.character}) : super(key: key);
  final Character character;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: Colors.redAccent,
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            spreadRadius: 4,
            blurRadius: 10,
            offset: Offset(3, 3), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            flex:1,
            child: Container(
                padding: EdgeInsets.all(20.0),
                child: Image.asset('assets/images/characters/character-' + character.uuid + '.png')
            ),
          ),
          Expanded(
            flex:3,
            child: Container(
              child: Center(
                child: Text(
                  character.name,
                  style: TextStyle(
                    fontFamily: 'Knewave',
                    fontSize: 20.0,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


