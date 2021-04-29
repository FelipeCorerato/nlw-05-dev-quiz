import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

import '../core/core.dart';
import '../challenge/widgets/next_button/next_button_widget.dart';

class ResultPageArguments {
  final String title;
  final int quizLength;
  final int correctAnswersCount;

  ResultPageArguments({
    required this.title,
    required this.quizLength,
    required this.correctAnswersCount,
  });
}

class ResultPage extends StatelessWidget {
  static const routeName = '/result';

  const ResultPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ResultPageArguments pageArguments =
        ModalRoute.of(context)!.settings.arguments as ResultPageArguments;

    return Scaffold(
      body: Container(
        width: double.maxFinite,
        padding: EdgeInsets.only(top: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                Image.asset(AppImages.trophy),
                Text(
                  "Parabéns!",
                  style: AppTextStyles.heading40,
                ),
                SizedBox(
                  height: 16,
                ),
                Text.rich(
                  TextSpan(
                    text: "Você concluiu o quiz",
                    style: AppTextStyles.body,
                    children: [
                      TextSpan(
                          text: "\n${pageArguments.title}",
                          style: AppTextStyles.bodyBold),
                      TextSpan(
                        text:
                            "\ncom ${pageArguments.correctAnswersCount} de ${pageArguments.quizLength} acertos.",
                        style: AppTextStyles.body,
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
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
                          label: 'Compartilhar',
                          onTap: () {
                            Share.share(
                              "Resultado do Quiz ${pageArguments.title} \nObtive ${(pageArguments.correctAnswersCount / pageArguments.quizLength) * 100}% de aproveitamento!",
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 24,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 68),
                        child: NextButtonWidget.white(
                          label: 'Voltar ao início',
                          onTap: () {
                            Navigator.pop(context);
                          },
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
