import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class PreviewSkelton extends StatelessWidget {
  const PreviewSkelton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.white,
      highlightColor: const Color(0xff100B20),
      child: Container(
        height: MediaQuery.sizeOf(context).height * 0.27,
        width: MediaQuery.sizeOf(context).width * 0.35,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.grey.withOpacity(.1)),
      ),
    );
  }
}
