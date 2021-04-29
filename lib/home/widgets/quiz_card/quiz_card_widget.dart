import 'package:flutter/material.dart';

import '../../../core/core.dart';
import '../../../shared/widgets/progress_indicator/progress_indicator_widget.dart';
import '../../../shared/models/quiz_model.dart';

class QuizCardWidget extends StatefulWidget {
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

  @override
  _QuizCardWidgetState createState() => _QuizCardWidgetState();
}

class _QuizCardWidgetState extends State<QuizCardWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  void _initAnimation() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    _animation = Tween<double>(begin: 0.0, end: widget.progressRate)
        .animate(_animationController);

    _animationController.forward();
  }

  @override
  void initState() {
    super.initState();
    _initAnimation();
  }

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

  Color? get color => levelColor[widget.level]!['color'];
  Color? get borderColor => levelColor[widget.level]!['borderColor'];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
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
                  child:
                      Image.asset(AppImages.getImageByName(widget.imageName)),
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
              widget.title,
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
                    widget.progress,
                    style: AppTextStyles.body11,
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: AnimatedBuilder(
                    animation: _animation,
                    builder: (context, _) =>
                        ProgressIndicatorWidget(value: _animation.value),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
