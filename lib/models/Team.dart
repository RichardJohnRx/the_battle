import 'package:the_battle/models/Character.dart';
import 'package:the_battle/models/Player.dart';

class Team {
  final String uuid;
  final Player player;
  List<Character> characters;

  Team(this.uuid, this.player);
}
