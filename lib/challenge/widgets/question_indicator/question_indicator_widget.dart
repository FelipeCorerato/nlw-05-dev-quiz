import 'package:flutter/material.dart';

import '../../../core/core.dart';
import '../../../shared/widgets/progress_indicator/progress_indicator_widget.dart';

class QuestionIndicatorWidget extends StatefulWidget {
  final int currentPage;
  final int quizLength;

  const QuestionIndicatorWidget({
    Key? key,
    required this.currentPage,
    required this.quizLength,
  }) : super(key: key);

  @override
  _QuestionIndicatorWidgetState createState() =>
      _QuestionIndicatorWidgetState();
}

class _QuestionIndicatorWidgetState extends State<QuestionIndicatorWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  void _initAnimation() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 1))
          ..addListener(() {
            _animationController.animateTo(
              widget.currentPage / widget.quizLength,
              duration: Duration(milliseconds: 100),
            );
          });
    _animation = Tween<double>(begin: 0.0, end: widget.currentPage.toDouble())
        .animate(_animationController);

    _animationController.animateTo(
      widget.currentPage / widget.quizLength,
      duration: Duration(milliseconds: 100),
    );
  }

  @override
  void initState() {
    super.initState();
    _initAnimation();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Questão ${widget.currentPage}",
                style: AppTextStyles.body,
              ),
              Text(
                "de ${widget.quizLength}",
                style: AppTextStyles.body,
              ),
            ],
          ),
          SizedBox(
            height: 16,
          ),
          AnimatedBuilder(
            animation: _animation,
            builder: (context, _) =>
                ProgressIndicatorWidget(value: _animationController.value),
          )
        ],
      ),
    );
  }
}
