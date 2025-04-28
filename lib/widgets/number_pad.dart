import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// A reusable custom numeric keypad widget.
/// Emits digits (0–9), a decimal point '.', and a custom backspace image.
class NumberPad extends StatelessWidget {
  /// Called when any key is tapped. Key is '0'–'9', '.', or 'back'.
  final void Function(String key) onKey;

  /// Asset path for your backspace icon.
  final String backspaceAsset;

  const NumberPad({
    Key? key,
    required this.onKey,
    this.backspaceAsset = 'assets/icons/clear_icon.png',
  }) : super(key: key);

  Widget _buildKey(String label) {
    final isBack = label == '⌫';
    final display = isBack
        ? Image.asset(
      backspaceAsset,
      width: 24.w,
      height: 24.h,
    )
        : Text(
      label,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: label == '.' ? 40.sp : 20.sp,
        fontWeight: FontWeight.w500,
        color: const Color(0xFF121212),
      ),
    );

    return Expanded(
      child: AspectRatio(
        aspectRatio: 2,
        child: Material(
          color: Colors.white,

          child: InkWell(
            borderRadius: BorderRadius.circular(8.r),
            splashColor: Colors.grey.withOpacity(0.3),
            highlightColor: Colors.grey.withOpacity(0.1),
            onTap: () => onKey(isBack ? '⌫' : label),
            child: Center(child: display),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final rows = [
      ['1', '2', '3'],
      ['4', '5', '6'],
      ['7', '8', '9'],
      ['.', '0', '⌫'],
    ];

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: rows
          .map((row) => Row(
        children: row.map((lbl) => _buildKey(lbl)).toList(),
      ))
          .toList(),
    );
  }
}
