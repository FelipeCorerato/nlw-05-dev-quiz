import 'package:flutter/material.dart';

import './challenge_controller.dart';
import './widgets/next_button/next_button_widget.dart';
import './widgets/question_indicator/question_indicator_widget.dart';
import './widgets/quiz/quiz_widget.dart';
import '../result/result_page.dart';
import '../shared/models/question_model.dart';

class ChallengePage extends StatefulWidget {
  final List<QuestionModel> questions;
  final String title;

  const ChallengePage({
    Key? key,
    required this.title,
    required this.questions,
  }) : super(key: key);

  @override
  _ChallengePageState createState() => _ChallengePageState();
}

class _ChallengePageState extends State<ChallengePage> {
  final controller = ChallengeController();
  final pageController = PageController();

  @override
  void initState() {
    super.initState();

    pageController.addListener(() {
      controller.currentPage = pageController.page!.toInt() + 1;
    });
  }

  void nextPage() {
    if (controller.currentPage < widget.questions.length)
      pageController.nextPage(
        duration: Duration(milliseconds: 200),
        curve: Curves.decelerate,
      );

    setState(() {});
  }

  void onSelected(bool value) {
    if (value) {
      controller.correctAnswersCount++;
    }

    controller.answeredQuestionsCount++;
    bool shouldDelay =
        controller.answeredQuestionsCount != widget.questions.length;

    Future.delayed(
      Duration(
        seconds: shouldDelay ? 1 : 0,
      ),
    ).then((_) => nextPage());
  }

  @override
  Widget build(BuildContext context) {
    bool allQuestionsAnswered =
        controller.answeredQuestionsCount == widget.questions.length;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(96),
        child: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: SafeArea(
            top: true,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BackButton(),
                ValueListenableBuilder<int>(
                  valueListenable: controller.currentPageNotifier,
                  builder: (context, value, _) => QuestionIndicatorWidget(
                    currentPage: value,
                    quizLength: widget.questions.length,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: PageView(
        controller: pageController,
        physics: NeverScrollableScrollPhysics(),
        children: widget.questions
            .map(
              (question) => QuizWidget(
                question: question,
                onSelected: (value) {
                  onSelected(value);
                },
              ),
            )
            .toList(),
      ),
      bottomNavigationBar: SafeArea(
        bottom: true,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: ValueListenableBuilder<int>(
            valueListenable: controller.currentPageNotifier,
            builder: (context, value, _) => Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Visibility(
                  visible:
                      !allQuestionsAnswered && value <= widget.questions.length,
                  child: Expanded(
                    child: NextButtonWidget.white(
                      label: 'Pular',
                      onTap: () {
                        controller.answeredQuestionsCount++;
                        nextPage();
                      },
                    ),
                  ),
                ),
                Visibility(
                  visible:
                      allQuestionsAnswered && value == widget.questions.length,
                  child: Expanded(
                    child: NextButtonWidget.green(
                      label: 'Confirmar',
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ResultPage(
                              title: widget.title,
                              quizLength: widget.questions.length,
                              correctAnswersCount:
                                  controller.correctAnswersCount,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
