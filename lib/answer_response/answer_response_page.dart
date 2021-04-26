import 'package:dev_quiz/challenge/widgets/answer/answer_widget.dart';
import 'package:dev_quiz/challenge/widgets/next_button/next_button_widget.dart';
import 'package:dev_quiz/core/app_images.dart';
import 'package:dev_quiz/core/core.dart';
import 'package:dev_quiz/shared/models/answer_model.dart';
import 'package:flutter/material.dart';

class AnswerResponsePage extends StatelessWidget {
  final String questionTitle;
  final AnswerModel answerGiven;
  final AnswerModel correctAnswer;

  const AnswerResponsePage({
    Key? key,
    required this.questionTitle,
    required this.answerGiven,
    required this.correctAnswer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isCorrect = answerGiven.isRight;

    return Scaffold(
      body: Container(
        width: double.maxFinite,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                Image.asset(isCorrect ? AppImages.check : AppImages.error),
                Text(
                  isCorrect ? "Resposta certa 🎉" : "Resposta errada",
                  style: AppTextStyles.heading40,
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 60,
                ),
                Text(
                  questionTitle,
                  style: AppTextStyles.heading,
                ),
                SizedBox(
                  height: 24,
                ),
                AnswerWidget(
                  answer: answerGiven,
                  onTap: (value) {},
                  isSelected: true,
                ),
                Visibility(
                  visible: !isCorrect,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      AnswerWidget(
                        answer: correctAnswer,
                        onTap: (value) {},
                        isSelected: true,
                      ),
                    ],
                  ),
                )
              ],
            ),
            Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 68),
                        child: NextButtonWidget.purple(
                          label: "Avançar",
                          onTap: () {},
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
