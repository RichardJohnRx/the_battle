import 'package:the_battle/models/Skill.dart';

class Character {
  final String uuid, name;
  String image = "";
  Skill strength, speed, cleverness, intelligence;

  Character(this.uuid, this.name, this.strength, this.speed, this.cleverness,
      this.intelligence);

  String imagePath() {
    return 'assets/images/characters/character-' + this.uuid + '.png';
  }
}
