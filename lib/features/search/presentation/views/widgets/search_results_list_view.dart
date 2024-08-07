import 'package:bookly_app/core/utils/app_assets.dart';
import 'package:bookly_app/core/widgets/book_list_view_item.dart';
import 'package:bookly_app/core/widgets/custom_error_widget.dart';
import 'package:bookly_app/features/search/presentation/logic/search_cubit/search_cubit_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchResultsListView extends StatelessWidget {
  const SearchResultsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchCubitState>(
      builder: (context, state) {
        if (state is SearchCubitSuccess) {
          return ListView.builder(
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.zero,
            itemCount: state.books.length,
            itemBuilder: (context, index) {
              return BookListViewItem(
                bookModel: state.books[index],
              );
            },
          );
        } else if (state is SearchCubitFailure) {
          return Center(
            child: CustomErrorWidget(errMessage: state.errMessage),
          );
        } else {
          return Center(
            child: Image.asset(AppAssets.searchImages),
          );
        }
      },
    );
  }
}
