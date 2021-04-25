import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../core/core.dart';

class QuizCardShimmerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
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
          Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: AppColors.white,
            child: Container(
              height: 40,
              width: 40,
              child: Image.asset(AppImages.getImageByName('data')),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: AppColors.white,
            child: Container(
              height: 15,
              color: AppColors.grey,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: AppColors.white,
            child: Container(
              height: 15,
              color: AppColors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
