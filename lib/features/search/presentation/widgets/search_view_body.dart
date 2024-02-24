import 'package:bookly_app/core/api/api_service.dart';
import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/features/search/data/repos/search_repo_impl.dart';
import 'package:bookly_app/features/search/logic/search_cubit/search_cubit_cubit.dart';
import 'package:bookly_app/features/search/presentation/widgets/custom_search_text_field.dart';
import 'package:bookly_app/features/search/presentation/widgets/search_results_list_view.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: SafeArea(
          child: BlocProvider(
            create: (context) =>
                SearchCubit((SearchRepoImpl(ApiService(Dio())))),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: CustomSearchTextField(),
                ),
                SizedBox(
                  height: 16,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: Text(
                    "Search Results",
                    style: Styles.textStyle18,
                  ),
                ),
                Expanded(
                  child: SearchResultsListView(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
