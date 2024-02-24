import 'package:bookly_app/core/widgets/custom_book_image.dart';
import 'package:bookly_app/features/home/logic/preview_books_cubit/preview_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PreviewBooksListView extends StatelessWidget {
  const PreviewBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    final double size = MediaQuery.of(context).size.height;
    return SizedBox(
      height: size * 0.27,
      child: BlocBuilder<PreviewBooksCubit, PreviewBooksState>(
        builder: (context, state) {
          if (state is PreviewBooksSuccess) {
            return ListView.builder(
              padding: EdgeInsets.zero,
              physics: const BouncingScrollPhysics(),
              itemCount: state.books.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: CustomBookImage(
                      bookModel: state.books[index],
                      imgUrl: state
                          .books[index].volumeInfo!.imageLinks!.thumbnail!),
                );
              },
            );
          } else if (state is PreviewBooksFailure) {
            return Center(
              child: Text(state.errMessage),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}