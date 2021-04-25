import 'package:dev_quiz/home/widgets/quiz_card/quiz_card_shimmer_widget.dart';
import 'package:flutter/material.dart';

import './home_controller.dart';
import './home_state.dart';
import './widgets/app_bar/app_bar_widget.dart';
import './widgets/level_button/level_button_widget.dart';
import './widgets/quiz_card/quiz_card_widget.dart';
import '../challenge/challenge_page.dart';
import '../core/core.dart';
import '../shared/models/quiz_model.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController();

  @override
  void initState() {
    super.initState();

    controller.getUser();
    controller.getQuizzes();

    controller.stateNotifier.addListener(() {
      setState(() {});
    });
  }

  void _handleFilter(Level level) {
    controller.filters.contains(level)
        ? controller.filters.remove(level)
        : controller.filters.add(level);
    controller.getQuizzes();

    setState(() {});
  }

  Future<void> _reloadQuizzes() async {
    await Future.delayed(Duration(seconds: 1), () => controller.getQuizzes());
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    bool isLoadingUser =
        controller.userRequestState == UserRequestState.loading;
    bool areQuizzesLoading =
        controller.quizzesRequestState == QuizzesResquestState.loading;

    return Scaffold(
      appBar: AppBarWidget(
        user: controller.user,
        isLoading: isLoadingUser,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(
              height: 24,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                LevelButtonWidget(
                  label: "Fácil",
                  disabled: controller.filters.contains(Level.facil),
                  onTap: () => _handleFilter(Level.facil),
                ),
                LevelButtonWidget(
                  label: "Médio",
                  disabled: controller.filters.contains(Level.medio),
                  onTap: () => _handleFilter(Level.medio),
                ),
                LevelButtonWidget(
                  label: "Difícil",
                  disabled: controller.filters.contains(Level.dificil),
                  onTap: () => _handleFilter(Level.dificil),
                ),
                LevelButtonWidget(
                  label: "Perito",
                  disabled: controller.filters.contains(Level.perito),
                  onTap: () => _handleFilter(Level.perito),
                ),
              ],
            ),
            SizedBox(
              height: 24,
            ),
            Visibility(
              visible: !areQuizzesLoading && controller.quizzes?.length == 0,
              child: Text(
                "Não há quizzes disponíveis para estes filtros",
                style: AppTextStyles.heading15,
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(
              child: RefreshIndicator(
                onRefresh: _reloadQuizzes,
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  padding: EdgeInsets.only(bottom: 16),
                  children: areQuizzesLoading
                      ? List.generate(6, (_) => QuizCardShimmerWidget())
                      : controller.quizzes!
                          .map(
                            (quiz) => QuizCardWidget(
                              title: quiz.title,
                              imageName: quiz.image,
                              level: quiz.level,
                              progress:
                                  "${quiz.answeredQuestionsCount}/${quiz.questions.length}",
                              progressRate: quiz.answeredQuestionsCount /
                                  quiz.questions.length,
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ChallengePage(
                                      title: quiz.title,
                                      questions: quiz.questions,
                                    ),
                                  ),
                                );
                              },
                            ),
                          )
                          .toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
