// lib/widgets/custom_icon_button.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomIconButton extends StatelessWidget {
  final String assetPath;
  final double width;
  final double height;
  final VoidCallback onPressed;

  const CustomIconButton({
    Key? key,
    required this.assetPath,
    required this.width,
    required this.height,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Image.asset(
        assetPath,
        width: width.w,
        height: height.h,
      ),
      onPressed: onPressed,
    );
  }
}
