import 'package:dev_quiz/shared/models/quiz_model.dart';
import 'package:flutter/material.dart';

import '../../../core/core.dart';
import '../../../shared/widgets/progress_indicator/progress_indicator_widget.dart';

class QuizCardWidget extends StatelessWidget {
  final String title;
  final String imageName;
  final Level level;
  final String progress;
  final double progressRate;
  final VoidCallback onTap;

  QuizCardWidget({
    Key? key,
    required this.title,
    required this.progress,
    required this.progressRate,
    required this.onTap,
    required this.imageName,
    required this.level,
  }) : super(key: key);

  final levelColor = {
    Level.facil: {
      "color": AppColors.levelButtonBorderFacil,
      "borderColor": AppColors.levelButtonTextFacil,
    },
    Level.medio: {
      "color": AppColors.levelButtonBorderMedio,
      "borderColor": AppColors.levelButtonTextMedio,
    },
    Level.dificil: {
      "color": AppColors.levelButtonBorderDificil,
      "borderColor": AppColors.levelButtonTextDificil,
    },
    Level.perito: {
      "color": AppColors.levelButtonBorderPerito,
      "borderColor": AppColors.levelButtonTextPerito,
    },
  };

  Color? get color => levelColor[level]!['color'];
  Color? get borderColor => levelColor[level]!['borderColor'];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border.fromBorderSide(
            BorderSide(color: AppColors.border),
          ),
          color: AppColors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 40,
                  width: 40,
                  child: Image.asset(AppImages.getImageByName(imageName)),
                ),
                Container(
                  height: 15,
                  width: 15,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: color,
                    border: Border.fromBorderSide(BorderSide(
                      color: borderColor!,
                    )),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              title,
              style: AppTextStyles.heading15,
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Text(
                    progress,
                    style: AppTextStyles.body11,
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: ProgressIndicatorWidget(value: progressRate),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}