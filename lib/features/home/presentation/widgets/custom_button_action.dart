import 'package:flutter/material.dart';

class CustomButtonAction extends StatelessWidget {
  final String text;
  final TextStyle textStyle;
  final BorderRadius borderRaduis;
  final Color backgroundColor;
  final void Function()? onPressed;
  const CustomButtonAction(
      {super.key,
      required this.text,
      required this.textStyle,
      required this.borderRaduis,
      required this.backgroundColor,
      this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      width: 150,
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: borderRaduis,
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: textStyle,
        ),
      ),
    );
  }
}
