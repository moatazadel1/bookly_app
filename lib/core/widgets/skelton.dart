import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class Skelton extends StatelessWidget {
  final double? height;
  final double? width;
  final Widget? child;

  const Skelton({
    super.key,
    this.height,
    this.width,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Shimmer.fromColors(
        baseColor: Colors.white,
        highlightColor: const Color(0xff100B20),
        child: child!,
      ),
    );
  }
}
