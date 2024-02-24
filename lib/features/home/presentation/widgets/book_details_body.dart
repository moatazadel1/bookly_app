import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/presentation/widgets/book_details_section.dart';
import 'package:bookly_app/features/home/presentation/widgets/book_similar_section.dart';
import 'package:bookly_app/features/home/presentation/widgets/custom_book_details_app_bar.dart';
import 'package:flutter/material.dart';

class BookDetailsBodyView extends StatelessWidget {
  const BookDetailsBodyView({super.key, required this.bookModel});
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Scaffold(
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  children: [
                    const CustomBookDetailsAppBar(),
                    const SizedBox(
                      height: 30,
                    ),
                    BookDetailsSection(
                      bookModel: bookModel,
                    ),
                    const Expanded(
                      // Using Expanded Widget here to make the rest of widgets are in the bottom of screen regardless of the dimensions of the mobile.
                      // The sizedBox widget will expand to make the rest of widgets in the bottom.
                      child: SizedBox(
                        height: 50,
                      ),
                    ),
                    BookSimilarSection(
                      bookModel: bookModel,
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
