import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../core/core.dart';

class ScoreCardShimmerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: AppColors.white,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 1,
            child: Container(
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                color: AppColors.grey,
                shape: BoxShape.circle,
              ),
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
                  Container(
                    height: 18,
                    color: AppColors.grey,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 26,
                    color: AppColors.grey,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
