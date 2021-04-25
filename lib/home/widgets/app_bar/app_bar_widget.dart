import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../score_card/score_card_widget.dart';
import '../../../core/app_gradients.dart';
import '../../../core/core.dart';
import '../../../shared/models/user_model.dart';

class AppBarWidget extends PreferredSize {
  final UserModel? user;
  final bool isLoading;

  AppBarWidget({
    required this.user,
    required this.isLoading,
  }) : super(
          preferredSize: Size.fromHeight(250),
          child: Container(
            child: Stack(
              children: [
                Container(
                  height: 161,
                  width: double.maxFinite,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(gradient: AppGradients.linear),
                  child: isLoading
                      ? Shimmer.fromColors(
                          baseColor: Colors.grey.shade300,
                          highlightColor: AppColors.white,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: 25,
                                width: 250,
                                color: AppColors.grey,
                              ),
                              Container(
                                width: 58,
                                height: 58,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular((10)),
                                  color: AppColors.grey,
                                ),
                              ),
                            ],
                          ),
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text.rich(
                              TextSpan(
                                text: "Olá, ",
                                style: AppTextStyles.title,
                                children: [
                                  TextSpan(
                                    text: user?.name,
                                    style: AppTextStyles.titleBold,
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: 58,
                              height: 58,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular((10)),
                                image: DecorationImage(
                                  image: NetworkImage(user!.profilePicUrl),
                                ),
                              ),
                            ),
                          ],
                        ),
                ),
                Align(
                  alignment: Alignment(0.0, 1.0),
                  child: ScoreCardWidget(
                    isLoading: isLoading,
                    percent: (user?.score ?? 0) / 100,
                  ),
                ),
              ],
            ),
          ),
        );
}
