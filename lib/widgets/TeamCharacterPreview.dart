import 'package:flutter/material.dart';
import 'package:the_battle/models/Character.dart';

class TeamCharacterPreview extends StatefulWidget {
  const TeamCharacterPreview({Key key, this.character, this.removeFromTeam, this.validated}) : super(key: key);
  final Character character;
  final Function removeFromTeam;
  final bool validated;

  @override
  _TeamCharacterPreviewState createState() => _TeamCharacterPreviewState();
}

class _TeamCharacterPreviewState extends State<TeamCharacterPreview> {
  _TeamCharacterPreviewState();

  void _onPressed(){
    if(!widget.validated){
      widget.removeFromTeam(widget.character);
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('You can\'t remove a character anymore.'),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text('You\'ve already validated your team'),
                ],
              ),
            ),
          );
        },
      );
    }

  }

  Color _getBackgroundColor(){
    return (widget.character.autoSelected) ? Colors.red[800] : Colors.redAccent;
  }

  IconData _getIcon(){
    return (widget.character.autoSelected || widget.validated) ? Icons.lock : Icons.remove_circle_outline;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 15.0,
        vertical: 10.0,
      ),
      decoration: BoxDecoration(
        color: _getBackgroundColor(),
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
                child: Image.asset(widget.character.imagePath())
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              child: Center(
                child: Text(
                  widget.character.name,
                  style: TextStyle(
                    fontFamily: 'Knewave',
                    fontSize: 24.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: InkWell(
              onTap: _onPressed,
              child: Container(
                child: Icon(
                  _getIcon(),
                  size: 35.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


