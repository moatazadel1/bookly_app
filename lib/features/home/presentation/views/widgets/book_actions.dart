import 'package:bookly_app/core/utils/constants.dart';
import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/core/models/book_model/book_model.dart';
import 'package:bookly_app/core/utils/utils.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_button_action.dart';
import 'package:flutter/material.dart';

class BookActions extends StatelessWidget {
  final BookModel bookModel;
  const BookActions({
    super.key,
    required this.bookModel,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomButtonAction(
          text: 'Free',
          textStyle: Styles.textStyle18.copyWith(
            color: Colors.black,
          ),
          borderRaduis: const BorderRadius.only(
            bottomLeft: Radius.circular(16),
            topLeft: Radius.circular(16),
          ),
          backgroundColor: Colors.white,
        ),
        CustomButtonAction(
          onPressed: () {
            launchCustomUrl(context, bookModel.volumeInfo!.previewLink!);
          },
          text: getText(bookModel),
          textStyle: Styles.textStyle16.copyWith(
            color: Colors.white,
            fontFamily: AppConstants.kGilroy,
          ),
          borderRaduis: const BorderRadius.only(
            bottomRight: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
          backgroundColor: const Color(0xffEF8262),
        ),
      ],
    );
  }

  String getText(BookModel bookModel) {
    if (bookModel.volumeInfo!.previewLink == null) {
      return 'Not Avaliable';
    } else {
      return 'Preview';
    }
  }
}
