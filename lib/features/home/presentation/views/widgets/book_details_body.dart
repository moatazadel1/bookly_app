import 'package:bookly_app/core/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_details_section.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_similar_section.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_book_details_app_bar.dart';
import 'package:flutter/material.dart';

class BookDetailsBodyView extends StatelessWidget {
  const BookDetailsBodyView({super.key, required this.bookModel});
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    var pageSize = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: SizedBox(
              height: pageSize,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomBookDetailsAppBar(),
                  const SizedBox(height: 30),
                  BookDetailsSection(bookModel: bookModel),
                  const Expanded(child: SizedBox(height: 50)),
                  BookSimilarSection(bookModel: bookModel),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
