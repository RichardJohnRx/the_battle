import 'dart:math';
import 'package:the_battle/data/characters.dart' as staticData;
import 'package:the_battle/models/Character.dart';
import 'package:the_battle/models/Player.dart';

class Team {
  final String uuid;
  final Player player;
  String name = "My Team";
  List<Character> characters;
  bool validated = false;

  Team(this.uuid, this.player, [this.name]){
    this.characters = List<Character>();
    _randomSelectCharacters();
  }

  _randomSelectCharacters(){
    var rand = new Random();
    List<Character> listCharacters = staticData.characters;
    do{
      Character aux = listCharacters[rand.nextInt(listCharacters.length)];
      if(characters.isEmpty || characters.last.uuid != aux.uuid){
        aux.autoSelected = true;
        aux.selected = true;
        characters.add(aux);
      }
    } while(characters.length < 2);
  }
}
