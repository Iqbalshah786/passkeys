import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PurposeOfTransferBar extends StatefulWidget {
  @override
  _PurposeOfTransferBarState createState() => _PurposeOfTransferBarState();
}

class _PurposeOfTransferBarState extends State<PurposeOfTransferBar> {
  final List<String> _purposes = [
    'All Transfers',
    'Donation',
    'Bill payment',
    'Medicine',
    'Zakat & Sadqat',
    'Rental payment',
  ];
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 2.w),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List<Widget>.generate(_purposes.length, (idx) {
            final selected = idx == _selectedIndex;
            return Padding(
              padding: EdgeInsets.only(right: 11.w),
              child: GestureDetector(
                onTap: () => setState(() => _selectedIndex = idx),
                child: Container(
                  padding:
                  EdgeInsets.symmetric(horizontal: 8.w, vertical: 6.h),
                  decoration: BoxDecoration(
                    color: selected ? Color(0xff5974F0) : Colors.white,
                    borderRadius: BorderRadius.circular(4.w),
                    border: Border.all(
                      color: selected ? Color(0xff4361EE) : Color(0xff6E6E6E),
                      width: 0.6.w
                    ),
                  ),
                  child: Text(
                    _purposes[idx],
                    style: TextStyle(
                      color: selected ? Colors.white : Color(0xff6E6E6E),
                      fontSize: 10.sp,
                    ),
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
