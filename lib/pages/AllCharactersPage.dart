import 'package:flutter/material.dart';
import 'package:the_battle/models/Character.dart';
import 'package:the_battle/widgets/CharacterDetail.dart';
import 'package:the_battle/widgets/CharacterMaster.dart';
import 'package:the_battle/data/characters.dart' as staticData;

class AllCharactersPage extends StatefulWidget {
  AllCharactersPage({Key key}) : super(key: key);

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

  Widget _getCharacterDetails(){
    if(this._selectedCharacter != null){
      return CharacterDetail(character: this._selectedCharacter,);
    } else {
      return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    /*return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        title: Image(
          image: AssetImage('assets/images/the-battle-logo.png'),
          height: 40.0,
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              _getCharacterDetails(),
              CharacterMaster(
                characters: characters,
                onSelected: this._onCharacterSelect,
              ),
            ]
          ),
        ),
      ),
    );*/
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage('assets/images/the-battle-logo.png'),
              width: 100,
            ),
          ],
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
    );
  }
}
