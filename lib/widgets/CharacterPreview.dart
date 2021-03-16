import 'package:flutter/material.dart';
import 'package:the_battle/models/Character.dart';

class CharacterPreview extends StatefulWidget {
  const CharacterPreview({Key key, this.character, this.onSelected, this.visited}) : super(key: key);
  final Character character;
  final Function onSelected;
  final bool visited;

  @override
  _CharacterPreviewState createState() => _CharacterPreviewState();
}

class _CharacterPreviewState extends State<CharacterPreview> {
  _CharacterPreviewState();

  Color _getColorAccordingToSelected(){
    return (widget.visited) ? Colors.deepOrangeAccent :  Colors.redAccent;
  }

  void _onTap(){
    this.widget.onSelected(this.widget.character);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        _onTap();
      },
      child: Container(
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: _getColorAccordingToSelected(),
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
              flex:3,
              child: Container(
                child: Center(
                  child: Text(
                    widget.character.name,
                    style: TextStyle(
                      fontFamily: 'Knewave',
                      fontSize: 24.0,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


