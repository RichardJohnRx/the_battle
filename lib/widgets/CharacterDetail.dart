import 'package:flutter/material.dart';
import 'package:the_battle/models/Character.dart';

class CharacterDetail extends StatelessWidget {
  CharacterDetail({Key key, this.character}) : super(key: key);
  final Character character;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: Colors.red[200],
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
            flex: 4,
            child: Column(children: [
              Container(
                padding: EdgeInsets.only(
                  left: 0.0,
                  right: 0.0,
                  top: 15.5,
                  bottom: 15,
                ),
                child: Text(
                  character.name,
                  style: TextStyle(
                    fontFamily: 'Knewave',
                    fontSize: 20,
                  ),
                ),
              ),
              Container(
                  padding: EdgeInsets.only(
                    left: 32.5,
                    right: 32.5,
                    top: 0.0,
                    bottom: 32.5,
                  ),
                  child: Image.asset(character.imagePath())),
            ]),
          ),
          Expanded(
            flex: 5,
            child: Container(
              child: Center(
                child: Column(
                  children: [
                    Text(
                      'Strenght : ' + character.strength.value.toString(),
                      style: TextStyle(
                        fontFamily: 'Knewave',
                        fontSize: 22.0,
                      ),
                    ),
                    Text(
                      'Speed : ' + character.speed.value.toString(),
                      style: TextStyle(
                        fontFamily: 'Knewave',
                        fontSize: 22.0,
                      ),
                    ),
                    Text(
                      'Cleverness : ' + character.cleverness.value.toString(),
                      style: TextStyle(
                        fontFamily: 'Knewave',
                        fontSize: 22.0,
                      ),
                    ),
                    Text(
                      'Intelligence : ' +
                          character.intelligence.value.toString(),
                      style: TextStyle(
                        fontFamily: 'Knewave',
                        fontSize: 22.0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
