import 'package:flutter/foundation.dart';

class ChallengeControler {
  var currentPageNotifier = ValueNotifier(1);
  int get currentPage => currentPageNotifier.value;
  set currentPage(int value) => currentPageNotifier.value = value;

  int qtqAwnserRight = 0;
}
