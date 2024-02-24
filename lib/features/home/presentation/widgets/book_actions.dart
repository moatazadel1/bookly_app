import 'package:bookly_app/core/utils/constants.dart';
import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/presentation/widgets/custom_button_action.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

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
          onPressed: () async {
            final Uri url = Uri.parse(bookModel.volumeInfo!.previewLink!);

            if (await canLaunchUrl(url)) {
              await launchUrl(url);
            } else {
              throw 'Could not launch $url';
            }
          },
          text: 'Preview',
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
}
