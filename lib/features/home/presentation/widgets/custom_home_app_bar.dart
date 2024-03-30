import 'package:bookly_app/core/utils/app_assets.dart';
import 'package:bookly_app/core/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomHomeAppBar extends StatelessWidget {
  const CustomHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 30, top: 48, bottom: 46.9),
      child: Row(
        children: [
          Image.asset(
            AppAssets.logoImg,
            height: 16.1,
          ),
          const Spacer(),
          GestureDetector(
            onTap: () {
              GoRouter.of(context).push(AppRoutes.kSearchView);
            },
            child: Image.asset(
              AppAssets.searchIcon,
              height: 25,
            ),
          ),
        ],
      ),
    );
  }
}
