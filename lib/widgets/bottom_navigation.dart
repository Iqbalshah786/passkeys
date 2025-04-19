// lib/widgets/bottom_navigation.dart

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomNavigation extends StatefulWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const BottomNavigation({
    Key? key,
    required this.currentIndex,
    required this.onTap,
  }) : super(key: key);

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildNavItem(0, 'Home', Icons.home_rounded),
          _buildNavItem(1, 'Card', Icons.credit_card_outlined),
          _buildNavItem(2, 'Transaction', Icons.receipt_long_outlined),
          _buildNavItem(3, 'More', Icons.grid_view_rounded),
        ],
      ),
    );
  }

  Widget _buildNavItem(int index, String label, IconData iconData) {
    final bool isSelected = widget.currentIndex == index;
    final Color activeColor = const Color(0xFF4267F0);
    final Color inactiveColor = const Color(0xFF9E9E9E);

    return InkWell(
      onTap: () => widget.onTap(index),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            iconData,
            color: isSelected ? activeColor : inactiveColor,
            size: 24.sp,
          ),
          SizedBox(height: 4.h),
          Text(
            label,
            style: TextStyle(
              fontSize: 12.sp,
              color: isSelected ? activeColor : inactiveColor,
              fontWeight: isSelected ? FontWeight.w500 : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
