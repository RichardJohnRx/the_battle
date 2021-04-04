
import 'package:flutter/material.dart';
import 'package:the_battle/models/Character.dart';
import 'package:the_battle/models/Player.dart';
import 'package:the_battle/widgets/CharacterDetail.dart';
import 'package:the_battle/widgets/CharacterMaster.dart';
import 'package:the_battle/data/characters.dart' as staticData;

class AllCharactersPage extends StatefulWidget {
  AllCharactersPage({Key key, this.player}) : super(key: key);
  final Player player;

  @override
  _AllCharactersPageState createState() => _AllCharactersPageState();
}

class _AllCharactersPageState extends State<AllCharactersPage> {
  List<Character> _characters;
  Character _selectedCharacter;

  _AllCharactersPageState(){
    _characters = staticData.characters;
  }

  void _onCharacterSelect(Character character){
    setState(() {
      this._selectedCharacter = character;
    });
  }

  void _addCharacterToTeam(Character character){
    setState(() {
      if(!character.selected){
        if (this.widget.player.team.characters.length < 5) {
          character.selected = true;
          this.widget.player.team.characters.add(character);
        } else {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: null,
                content: SingleChildScrollView(
                  child: ListBody(
                    children: <Widget>[
                      Text('You can\'t have more than 5 characters'),
                    ],
                  ),
                ),
              );
            },
          );
        }
      } else {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: null,
              content: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    Text('You already selected this character'),
                  ],
                ),
              ),
            );
          },
        );
      }
    });
  }

  Widget _getCharacterDetails(){
    if(this._selectedCharacter != null){
      return CharacterDetail(character: this._selectedCharacter, addToTeam: _addCharacterToTeam);
    } else {
      return Container();
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
          child: Image(
            image: AssetImage('assets/images/the-battle-logo.png'),
            width: 120,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: double.infinity,
              child: _getCharacterDetails(),
            ),
            Expanded(
              child: CharacterMaster(
                characters: _characters,
                onSelected: this._onCharacterSelect,
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
        currentIndex: 0,
        selectedItemColor: Colors.red,
        onTap: (index){
          if(index == 1) {
            Navigator.of(context).pushNamed('/team');
          }
        },
      ),
    );
  }
}

/*
class MyButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // The GestureDetector wraps the button.
    return GestureDetector(
      // When the child is tapped, show a snackbar.
      onTap: () {
        final snackBar = SnackBar(content: Text("Tap"));

        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      },
      // The custom button
      child: Container(
        padding: EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: Theme.of(context).buttonColor,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Text('My Button'),
      ),
    );
  }
}*/