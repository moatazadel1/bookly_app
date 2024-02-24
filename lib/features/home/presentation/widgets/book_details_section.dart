import 'package:bookly_app/core/utils/app_colors.dart';
import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/core/widgets/custom_book_image.dart';
import 'package:bookly_app/core/widgets/custom_rating.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/presentation/widgets/book_actions.dart';
import 'package:flutter/material.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({super.key, required this.bookModel});
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.sizeOf(context).width;
    final double height = MediaQuery.sizeOf(context).height;

    return Column(
      children: [
        SizedBox(
          height: height * 0.28,
          width: width * 0.39,
          child: ClipRRect(
              borderRadius: const BorderRadius.all(
                Radius.circular(16),
              ),
              child: CustomBookImage(
                bookModel: bookModel,
                imgUrl: bookModel.volumeInfo?.imageLinks?.thumbnail ?? "",
              )),
        ),
        const SizedBox(
          height: 45,
        ),
        Text(
          textAlign: TextAlign.center,
          bookModel.volumeInfo?.title ?? '',
          style: Styles.textStyle30,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(
          height: 7,
        ),
        Text(
          bookModel.volumeInfo?.authors?[0] ?? 'Unknown author',
          style: Styles.textStyle18.copyWith(
              color: AppColors.subTextColor, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 16,
        ),
        CustomRatingWidget(
          count: bookModel.volumeInfo?.pageCount ?? 0,
          rating: bookModel.volumeInfo?.maturityRating ?? '',
          mainAxisAlignment: MainAxisAlignment.center,
        ),
        const SizedBox(
          height: 37,
        ),
        BookActions(
          bookModel: bookModel,
        ),
      ],
    );
  }
}
