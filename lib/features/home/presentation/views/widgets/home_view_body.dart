import 'package:bookly_app/core/utils/constants.dart';
import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/best_seller_list_view.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_home_app_bar.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/preview_books_list_view.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            Padding(
              padding: AppConstants.padding,
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
            BestSellerListView(),
          ],
        ),
      ),
    );
  }
}
