import 'dart:convert';
import 'package:flutter/services.dart';

import '../shared/models/quiz_model.dart';
import '../shared/models/user_model.dart';

class HomeRepository {
  Future<UserModel> getUser() async {
    final response = await rootBundle.loadString("assets/database/user.json");
    final user = UserModel.fromJson(response);

    return user;
  }

  Future<List<QuizModel>> getQuizzes(List<Level> filters) async {
    final response =
        await rootBundle.loadString("assets/database/quizzes.json");
    final list = jsonDecode(response) as List;
    final quizzes = list.map((quiz) => QuizModel.fromMap(quiz)).toList();

    List<QuizModel> filteredQuizzes = [];

    filteredQuizzes =
        quizzes.where((quiz) => !filters.contains(quiz.level)).toList();

    return filteredQuizzes;
  }
}
