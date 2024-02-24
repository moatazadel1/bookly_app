import 'package:bookly_app/core/utils/app_colors.dart';
import 'package:bookly_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomRatingWidget extends StatelessWidget {
  final MainAxisAlignment mainAxisAlignment;
  final String? rating;
  final int? count;
  const CustomRatingWidget({
    super.key,
    this.mainAxisAlignment = MainAxisAlignment.start,
    required this.rating,
    required this.count,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: [
        const Icon(
          Icons.star,
          color: Colors.yellow,
          size: 18.8,
        ),
        const SizedBox(
          width: 6.3,
        ),
        Text(
          "0.0",
          style: Styles.textStyle16.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          width: 5,
        ),
        Text(
          '$count',
          style: Styles.textStyle14.copyWith(
            color: AppColors.subTextColor,
          ),
        ),
      ],
    );
  }
}
