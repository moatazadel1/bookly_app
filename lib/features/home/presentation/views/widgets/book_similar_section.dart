import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/core/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_details_list_view.dart';
import 'package:flutter/material.dart';

class BookSimilarSection extends StatelessWidget {
  final BookModel bookModel;
  const BookSimilarSection({super.key, required this.bookModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'You can also like',
          style: Styles.textStyle14.copyWith(fontWeight: FontWeight.w600),
        ),
        const SizedBox(
          height: 16,
        ),
        BookDetailsListView(
          bookModel: bookModel,
        ),
      ],
    );
  }
}
