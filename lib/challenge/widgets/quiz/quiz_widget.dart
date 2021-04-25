import 'package:flutter/material.dart';

import '../answer/answer_widget.dart';
import '../../../core/core.dart';
import '../../../shared/models/answer_model.dart';
import '../../../shared/models/question_model.dart';

class QuizWidget extends StatefulWidget {
  final QuestionModel question;
  final ValueChanged<bool> onSelected;

  const QuizWidget({
    Key? key,
    required this.question,
    required this.onSelected,
  }) : super(key: key);

  @override
  _QuizWidgetState createState() => _QuizWidgetState();
}

class _QuizWidgetState extends State<QuizWidget> {
  int selectedIndex = -1;

  AnswerModel getAnswer(int index) => widget.question.answers[index];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(
            height: 64,
          ),
          Text(
            widget.question.title,
            style: AppTextStyles.heading,
          ),
          SizedBox(
            height: 24,
          ),
          ...widget.question.answers
              .asMap()
              .entries
              .map(
                (entry) => AnswerWidget(
                  answer: getAnswer(entry.key),
                  isSelected: selectedIndex == entry.key,
                  disabled: selectedIndex != -1,
                  onTap: (value) {
                    selectedIndex = entry.key;
                    setState(() {});

                    widget.onSelected(value);
                  },
                ),
              )
              .toList(),
        ],
      ),
    );
  }
}
