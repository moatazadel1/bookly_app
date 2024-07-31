import 'package:bookly_app/core/widgets/custom_book_image.dart';
import 'package:bookly_app/core/widgets/custom_error_widget.dart';
import 'package:bookly_app/core/widgets/custom_loading_indicator.dart';
import 'package:bookly_app/core/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/presentation/logic/similar_books_cubit/similar_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookDetailsListView extends StatelessWidget {
  const BookDetailsListView({super.key, required this.bookModel});
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    final double size = MediaQuery.sizeOf(context).height;

    return BlocBuilder<SimilarBooksCubit, SimilarBooksState>(
      builder: (context, state) {
        if (state is SimilarBooksSucess) {
          return SizedBox(
            height: size * 0.15,
            child: ListView.builder(
              padding: EdgeInsets.zero,
              physics: const BouncingScrollPhysics(),
              itemCount: state.books.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: CustomBookImage(
                      bookModel: bookModel,
                      imgUrl: state
                              .books[index].volumeInfo?.imageLinks?.thumbnail ??
                          ''),
                );
              },
            ),
          );
        } else if (state is SimilarBooksFailure) {
          return CustomErrorWidget(
            errMessage: state.errMessage,
          );
        } else {
          return const CustomLoadingIndicator();
        }
      },
    );
  }
}
