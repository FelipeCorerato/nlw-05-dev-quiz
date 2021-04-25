import 'package:dev_quiz/home/widgets/score_card/score_card_shimmer_widget.dart';
import 'package:flutter/material.dart';

import '../chart/chart_widget.dart';
import '../../../core/core.dart';

class ScoreCardWidget extends StatelessWidget {
  final double percent;
  final bool isLoading;

  const ScoreCardWidget({
    Key? key,
    required this.percent,
    required this.isLoading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Container(
        height: 136,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: isLoading
              ? ScoreCardShimmerWidget()
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 1,
                      child: ChartWidget(
                        percent: percent,
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 24),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              percent > 0 ? "Bom resultado" : "Vamos começar",
                              style: AppTextStyles.heading,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              percent > 0
                                  ? "Seu conhecimento está sendo aprimorado 😁"
                                  : "Complete os desafios e avance em conhecimento",
                              style: AppTextStyles.body,
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
        ),
      ),
    );
  }
}
