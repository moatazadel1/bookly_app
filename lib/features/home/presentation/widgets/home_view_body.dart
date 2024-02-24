import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/features/home/presentation/widgets/best_seller_list_view.dart';
import 'package:bookly_app/features/home/presentation/widgets/custom_home_app_bar.dart';
import 'package:bookly_app/features/home/presentation/widgets/preview_books_list_view.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(left: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomHomeAppBar(),
                  PreviewBooksListView(),
                  SizedBox(
                    height: 51,
                  ),
                  Text(
                    "Newest Books",
                    style: Styles.textStyle18,
                  ),
                ],
              ),
            ),
          ),
          SliverFillRemaining(
            child: BestSellerListView(),
          ),
        ],
      ),
    );
  }
}
