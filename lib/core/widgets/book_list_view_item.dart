import 'package:bookly_app/core/utils/app_colors.dart';
import 'package:bookly_app/core/utils/app_routes.dart';
import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/core/widgets/custom_rating.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/presentation/widgets/best_seller_item_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BookListViewItem extends StatelessWidget {
  const BookListViewItem({super.key, required this.bookModel});
  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 30,
        right: 47,
        top: 20,
      ),
      child: GestureDetector(
        onTap: () {
          GoRouter.of(context)
              .push(AppRoutes.kBookDetailsView, extra: bookModel);
        },
        child: SizedBox(
          height: MediaQuery.sizeOf(context).height * 0.12,
          child: Row(
            children: [
              BestSellerItemImage(
                imgUrl: bookModel.volumeInfo?.imageLinks?.thumbnail,
              ),
              const SizedBox(
                width: 30,
              ),
              SizedBox(
                width: MediaQuery.sizeOf(context).width * 0.5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      bookModel.volumeInfo?.title ?? "",
                      style: Styles.textStyle30.copyWith(
                        fontSize: 20,
                        height: 0,
                      ),
                    ),
                    Text(
                      bookModel.volumeInfo?.authors?[0] ?? '',
                      style: Styles.textStyle14.copyWith(
                        color: AppColors.subTextColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          "Free",
                          style: Styles.textStyle16
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                        const Spacer(),
                        CustomRatingWidget(
                          count: bookModel.volumeInfo?.pageCount ?? 0,
                          rating: bookModel.volumeInfo?.maturityRating ?? '0.0',
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
