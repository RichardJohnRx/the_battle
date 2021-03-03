import 'Team.dart';

class Player {
  final String uuid;
  final String firstname;
  final String lastname;
  final String email;
  final int gender; // 1 = male / 2 = female

  Team team;

  Player(this.uuid, this.firstname, this.lastname, this.email, this.gender) {
    if (gender != 1 && gender != 2) {
      throw new Exception('Gender must be 1 = male or 2 = female');
    }
  }
}
