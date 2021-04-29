import 'package:cloud_firestore/cloud_firestore.dart';

import '../shared/models/quiz_model.dart';
import '../shared/models/user_model.dart';

class HomeRepository {
  Future<UserModel> getUser() async {
    final response = await FirebaseFirestore.instance.collection('users').get();

    final user = UserModel.fromMap(response.docs.first.data());

    return user;
  }

  Future<List<QuizModel>> getQuizzes(List<Level> filters) async {
    final response =
        await FirebaseFirestore.instance.collection('quiz_list').get();

    final quizzes =
        response.docs.map((quiz) => QuizModel.fromMap(quiz.data())).toList();

    List<QuizModel> filteredQuizzes = [];

    filteredQuizzes =
        quizzes.where((quiz) => !filters.contains(quiz.level)).toList();

    return filteredQuizzes;
  }
}
