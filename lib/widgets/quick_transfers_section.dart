import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../screens/transfer_payment_screen/transfer_payment_screen.dart';

class QuickTransfersSection extends StatefulWidget {
  const QuickTransfersSection({Key? key}) : super(key: key);

  @override
  State<QuickTransfersSection> createState() => _QuickTransfersSectionState();
}

class _QuickTransfersSectionState extends State<QuickTransfersSection> {
  int? _previewIndex;    // null = no tile in preview
  int? _selectedIndex;   // for simple taps

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    final tiles = [
      {
        'initials': 'SS',
        'title': 'Samia Sajjad',
        'accountNumber': '12345678901234',
      },
      {
        'initials': 'SS',
        'title': 'Samia Sajjad',
        'accountNumber': '12345678901234',
      },
      {
        'initials': 'AI',
        'title': 'Apple Inc',
        'accountNumber': '12345678901234',
      },
      {
        'initials': 'KK',
        'title': 'Khubaibullah',
        'accountNumber': '12345678901234',
      },
      {
        'initials': 'ZK',
        'title': 'Zeeshan Khemani',
        'accountNumber': '12345678901234',
      },
      {
        'initials': 'SS',
        'title': 'Samia Sajjad',
        'accountNumber': '12345678901234',
      },
    ];

    return Column(
      children: [
        // Header
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Quick transfers',
              style: TextStyle(
                fontSize: 13.sp,
                fontWeight: FontWeight.w500,
                color: const Color(0xff121212),
              ),
            ),
            TextButton(
              onPressed: () {
                // TODO: handle "See more"
              },
              child: Stack(
                children: [
                  Text(
                    'See more',
                    style: TextStyle(
                      fontSize: 10.sp,
                      color: const Color(0xff4361EE),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      height: 1.3.h,
                      color: const Color(0xff4361EE),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 10.h),

        // Grid
        GridView.count(
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          crossAxisCount: 3,
          childAspectRatio: 1.1,
          crossAxisSpacing: 9.w,
          mainAxisSpacing: 10.h,
          children: List.generate(tiles.length, (i) {
            final data = tiles[i];
            return GestureDetector(
              // 1) Tap: select
              onTap: () {
                setState(() {
                  _previewIndex = null;   // clear any “preview” state
                  _selectedIndex = i;     // select this tile
                });
              },


              // 2) Long-press start: show preview
              onLongPressStart: (_) {
                setState(() {
                  _selectedIndex = null;  // clear tap-highlight
                  _previewIndex = i;      // start preview
                });
              },
              // 3) Long-press end: navigate without resetting preview first
              onLongPressEnd: (_) {
                if (_previewIndex == i) {
                  Navigator.of(context).pushNamed(
                    '/transfer',
                  );

                  // only clear preview after navigation call
                  setState(() {
                    _previewIndex = null;
                  });
                }
              },
              child: TransferTile(
                initials: data['initials'] as String,
                title: data['title'] as String,
                accountNumber: data['accountNumber'] as String,
                screenHeight: screenHeight,
                // highlight on tap
                isSelected: i == _selectedIndex,
                // preview on long press
                isPreviewing: i == _previewIndex,
              ),
            );
          }),
        ),
      ],
    );
  }
}

class TransferTile extends StatelessWidget {
  final String initials, title, accountNumber;
  final double screenHeight;
  final bool isSelected, isPreviewing;

  const TransferTile({
    Key? key,
    required this.initials,
    required this.title,
    required this.accountNumber,
    required this.screenHeight,
    this.isSelected = false,
    this.isPreviewing = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // If previewing, show Send Money tile
    if (isPreviewing) {
      return _buildPreviewTile();
    }

    // Otherwise, normal data tile with tap-highlight
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(
          color: isSelected
              ? const Color(0xffd2d8fc)   // light-blue on tap
              : const Color(0xf8181811A), // default
          width: isSelected ? 1.w : 0.2.w,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // avatar
          Stack(
            alignment: Alignment.bottomRight,
            children: [
              Container(
                width: 50.w,
                height: 50.h,
                decoration: const BoxDecoration(
                  color: Color(0x14000000),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    initials,
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w200,
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                right: screenHeight < 700 ? -1 : 0,
                child: Container(
                  padding: EdgeInsets.all(2.w),
                  width: screenHeight < 700 ? 18.w : 16.w,
                  height: screenHeight < 700 ? 18.h : 16.h,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: const Color(0xffE6E6E6),
                      width: 0.5.w,
                    ),
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset('assets/icons/bank_alfalah_logo.png'),
                ),
              ),
            ],
          ),
          SizedBox(height: 5.h),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 10.sp,
              fontWeight: FontWeight.w500,
              color: const Color(0xFF121212),
            ),
          ),
          SizedBox(height: 2.h),
          Text(
            accountNumber,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 8.sp,
              color: const Color(0xFFB3B3B3),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPreviewTile() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(color: const Color(0xffd2d8fc), width: 2.w),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/icons/sendIcon.png',
            width: 28.w,
            height: 28.h,
          ),
          SizedBox(height: 5.h),
          Text(
            'Send Money',
            style: TextStyle(
              fontSize: 10.sp,
              fontWeight: FontWeight.w500,
              color: const Color(0xff4361EE),
            ),
          ),
        ],
      ),
    );
  }
}

