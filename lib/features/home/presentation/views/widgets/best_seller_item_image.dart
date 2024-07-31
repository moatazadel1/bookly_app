import 'package:flutter/material.dart';

class BestSellerItemImage extends StatelessWidget {
  final String? imgUrl;
  const BestSellerItemImage({
    super.key,
    required this.imgUrl,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.5 / 4,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.network(
          imgUrl ?? "https://cdn-icons-png.flaticon.com/512/6478/6478111.png",
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
