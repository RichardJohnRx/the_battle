import 'package:flutter/material.dart';
import 'package:the_battle/models/Character.dart';
import 'package:the_battle/models/Player.dart';
import 'package:the_battle/widgets/TeamCharacterPreview.dart';

class TeamPage extends StatefulWidget {
  TeamPage({Key key, this.player}) : super(key: key);
  final Player player;

  @override
  _TeamPageState createState() => _TeamPageState();
}

class _TeamPageState extends State<TeamPage> {

  void _removeCharacterFromTeam(Character character){
    setState(() {
      if(!character.autoSelected){
        character.selected = false;
        this.widget.player.team.characters.remove(character);
      } else {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: null,
              content: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    Text('You can\'t remove this character'),
                  ],
                ),
              ),
            );
          },
        );
      }
    });
  }

  void _validateTeam(){
    setState(() {
      this.widget.player.team.validated = true;
    });
  }

  Widget _getTitle(){
    if(!widget.player.team.validated) {
      int length = 5 - widget.player.team.characters.length;
      if (length != 0) {
        return Text(
          'Still $length characters to add',
          style: TextStyle(
            color: Colors.yellow[400],
            fontFamily: 'Knewave',
            fontSize: 28.0,
          ),
          textAlign: TextAlign.center,
        );
      } else {
        return ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.resolveWith<Color>(
                    (Set<MaterialState> states) {
                  return Colors.green;
                }
            ),
          ),
          child: Text(
            'Validate My Team',
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Knewave',
              fontSize: 28.0,
            ),
          ),
          onPressed: _validateTeam,
        );
      }
    } else {
      return Text(
        'Your team has already been validated',
        style: TextStyle(
          color: Colors.lightGreen[400],
          fontFamily: 'Knewave',
          fontSize: 26.0,
        ),
        textAlign: TextAlign.center,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: Colors.white,
        title: Center(
          child:Text(
            'My Team',
            style: TextStyle(
              color: Colors.red,
              fontFamily: 'Knewave',
              fontSize: 35.0,
            ),
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 5,
            ),
            Container(
              child: Center(
                child: _getTitle(),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: widget.player.team.characters.length,
                itemBuilder: (BuildContext context, int index){
                  if(index != null){
                    final Character character = widget.player.team.characters[index];
                    return TeamCharacterPreview(
                      character: character,
                      removeFromTeam: _removeCharacterFromTeam,
                      validated: widget.player.team.validated,
                    );
                  } else {
                    return Container();
                  }
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.format_list_bulleted),
            label: 'Characters',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.group),
            label: 'Team',
          ),
        ],
        currentIndex: 1,
        selectedItemColor: Colors.red,
        onTap: (index){
          if(index == 0){
            Navigator.of(context).pop();
          }
        },
      ),
    );
  }
}
