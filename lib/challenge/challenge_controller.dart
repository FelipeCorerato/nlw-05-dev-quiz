import 'package:flutter/foundation.dart';

class ChallengeController {
  final currentPageNotifier = ValueNotifier<int>(1);

  int get currentPage => currentPageNotifier.value;
  set currentPage(int value) => currentPageNotifier.value = value;

  int correctAnswersCount = 0;
  int answeredQuestionsCount = 0;
  int questionsCount = 0;
}
