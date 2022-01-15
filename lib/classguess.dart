import 'dart:math';

class Game {
  static const maxRandom = 100;
  int? _answer;
  int _count = 0;

  Game() {
    var r = Random();
    _answer = r.nextInt(maxRandom) + 1;
  }

  int get doCount {
    return _count++ ;
  }


  int doGuess(int num) {
    if (num > _answer!) {
      return 1;
    } else if (num < _answer!) {
      return -1;
    } else {
      return 0;
    }
  }
}