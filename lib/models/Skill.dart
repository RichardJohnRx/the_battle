class Skill {
  static const String STRENGTH = "STRENGTH";
  static const String CLEVERNESS = "CLEVERNESS";
  static const String SPEED = "SPEED";
  static const String INTELLIGENCE = "INTELLIGENCE";

  static final List kinds = [STRENGTH, CLEVERNESS, SPEED, INTELLIGENCE];

  String kind;
  int value; //min 0 / max 5

  Skill(String kind, int value) {
    if (kinds.contains(kind)) {
      this.kind = kind;
    } else {
      throw new Exception('Wrong kind param');
    }

    if (value >= 0 && value <= 5) {
      this.value = value;
    } else {
      throw new Exception('value must be >= 0 and <= 5');
    }
  }
}
