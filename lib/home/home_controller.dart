import 'package:flutter/foundation.dart';

import './home_repository.dart';
import './home_state.dart';
import '../shared/models/quiz_model.dart';
import '../shared/models/user_model.dart';

class HomeController {
  final stateNotifier = ValueNotifier<HomeState>(HomeState.empty);
  set state(HomeState state) => stateNotifier.value = state;
  HomeState get state => stateNotifier.value;

  final userRequestStateNotifier =
      ValueNotifier<UserRequestState>(UserRequestState.empty);
  set userRequestState(UserRequestState state) =>
      userRequestStateNotifier.value = state;
  UserRequestState get userRequestState => userRequestStateNotifier.value;

  final quizzesRequestStateNotifier =
      ValueNotifier<QuizzesResquestState>(QuizzesResquestState.empty);
  set quizzesRequestState(QuizzesResquestState state) =>
      quizzesRequestStateNotifier.value = state;
  QuizzesResquestState get quizzesRequestState =>
      quizzesRequestStateNotifier.value;

  UserModel? user;
  List<QuizModel>? quizzes;
  List<Level> filters = [];

  final repository = HomeRepository();

  void getUser() async {
    state = HomeState.loading;
    userRequestState = UserRequestState.loading;
    await Future.delayed(Duration(seconds: 2));

    user = await repository.getUser();

    state = HomeState.success;
    userRequestState = UserRequestState.success;
  }

  void getQuizzes() async {
    state = HomeState.loading;
    quizzesRequestState = QuizzesResquestState.loading;
    await Future.delayed(Duration(seconds: 2));

    quizzes = await repository.getQuizzes(filters);
    state = HomeState.success;
    quizzesRequestState = QuizzesResquestState.success;
  }
}
