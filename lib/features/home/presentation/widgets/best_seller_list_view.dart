import 'package:bookly_app/core/widgets/book_list_view_item.dart';
import 'package:bookly_app/core/widgets/custom_error_widget.dart';
import 'package:bookly_app/features/home/logic/best_seller_books_cubit/best_seller_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/widgets/custom_best_seller_skelton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BestSellerListView extends StatelessWidget {
  const BestSellerListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BestSellerBooksCubit, BestSellerBooksState>(
      builder: (context, state) {
        if (state is BestSellerBooksSuccess) {
          return ListView.builder(
            padding: EdgeInsets.zero,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: state.books.length,
            itemBuilder: (context, index) {
              return BookListViewItem(
                bookModel: state.books[index],
              );
            },
          );
        } else if (state is BestSellerBooksFailure) {
          return Center(
            child: CustomErrorWidget(errMessage: state.errMessage),
          );
        } else {
          return ListView.separated(
            padding: EdgeInsets.zero,
            // shrinkWrap: true,
            itemBuilder: (context, index) {
              return const Padding(
                padding: EdgeInsets.only(left: 30, top: 20),
                child: CustomBestSellerSkelton(),
              );
            },
            separatorBuilder: (context, index) {
              return const SizedBox(
                height: 20,
              );
            },
            itemCount: 10,
          );
        }
      },
    );
  }
}
