import 'dart:math';

class Abilities {
  static double huntsGamble (double points) {
    return -1 * (points <= 0 ? points * 2 : points * 1);
  }

  static double savageMark (double base, int qrCount) {
    return (base - 100) * (pow(0.95, qrCount));
  }

  static moonlitWard (double points) {
    int chance = Random().nextInt(100);
    if (chance < 56) {
      return points/2;
    } else {
      return 0;
    }
  }

  static double bloodlash (double points) {
    return points - 700;
  }
}