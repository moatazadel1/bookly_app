import 'package:bookly_app/core/utils/app_colors.dart';
import 'package:bookly_app/core/utils/app_routes.dart';
import 'package:bookly_app/features/home/data/repos/home_repo_impl.dart';
import 'package:bookly_app/features/home/presentation/logic/best_seller_books_cubit/best_seller_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/logic/preview_books_cubit/preview_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'core/utils/service_locator.dart';

void main() {
  setupServiceLocator();
  runApp(const BooklyApp());
}

class BooklyApp extends StatelessWidget {
  const BooklyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) {
            return PreviewBooksCubit(
              getIt.get<HomeRepoImpl>(),
            )..fetchPreviewBooks();
          },
        ),
        BlocProvider(
          create: (context) => BestSellerBooksCubit(getIt.get<HomeRepoImpl>())
            ..fetchBestSellersBooks(),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: AppRoutes.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: AppColors.splashColor,
          textTheme: GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme)
              .apply(bodyColor: Colors.white),
          iconTheme: const IconThemeData(color: Colors.white),
        ),
        title: 'bookly app',
      ),
    );
  }
}
