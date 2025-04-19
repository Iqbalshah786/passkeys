import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile/widgets/investment_card_widget.dart';

class QuickTransfersSection extends StatelessWidget {
  const QuickTransfersSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Column(

      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,

          children: [
            Text(
              'Quick transfers',
              style: TextStyle(
                fontSize: 13.sp,
                fontWeight: FontWeight.w500,
                color: Color(0xff121212),
              ),
            ),
            TextButton(
                onPressed: () {
                  print("see more clicked");
                },
                child: Stack(
                  children: [
                    Text(
                      "See more",
                      style: TextStyle(
                        fontSize: 10.sp,
                        color: Color(0xff4361EE),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        height: 1.3.h, // Thickness of the underline
                        color: Color(0xff4361EE), // Same color as text
                      ),
                    ),
                  ],
                )

            ),
          ],
        ),
        GridView.count(
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          crossAxisCount: 3,
          childAspectRatio: 1.1,
          crossAxisSpacing: 9.w,
          mainAxisSpacing:10.h,
          children: [
            TransferTile(
              isAction: true,
              image: Image.asset('assets/icons/sendIcon.png',width: 28.w,height: 28.h,),
              title: 'Send Money',
              // iconColor: Color(0xff4361EE),
                screenHeight:screenHeight,
            ),
            TransferTile(
              initials: 'SS',
              title: 'Samia Sajjad',
              accountNumber: '12345678901234',
              screenHeight:screenHeight,
            ),
            TransferTile(
              initials: 'AI',
              title: 'Apple Inc',
              accountNumber: '12345678901234',
              screenHeight:screenHeight,
            ),
            TransferTile(
              initials: 'AI',
              title: 'Apple Inc',
              accountNumber: '12345678901234',
              screenHeight:screenHeight,
            ),
            TransferTile(
              initials: 'AI',
              title: 'Apple Inc',
              accountNumber: '12345678901234',
              screenHeight:screenHeight,
            ),
            TransferTile(
              initials: 'AI',
              title: 'Apple Inc',
              accountNumber: '12345678901234',
              screenHeight:screenHeight,
            ),
          ],
        ),

      ],
    );
  }
}

class TransferTile extends StatelessWidget {
  final String? initials;
  final String title;
  final String? accountNumber;
  final bool isAction;
  final Image? image;
  // final Color iconColor;
  final double screenHeight;

  const TransferTile({
    Key? key,
    this.initials,
    required this.title,
    this.accountNumber,
    this.isAction = false,
    this.image,
    // this.iconColor = Colors.blue,
    required this.screenHeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(
          color: Color(0xf8181811A),
          width: 0.2.w
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (isAction) ...[
            image ?? Icon(Icons.send)

          ] else ...[
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                Container(
                  width: 50.w,
                  height: 50.h,
                  decoration: BoxDecoration(
                    color: const Color(0x14000000),
                    shape: BoxShape.circle,

                  ),
                  child: Center(
                    child: Text(
                      initials ?? '',
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
                        color: Color(0xffE6E6E6),
                        width: 0.5.w,
                      ),
                      shape: BoxShape.circle,
                    ),
                      
                      child: Image.asset('assets/icons/bank_alfalah_logo.png'),
                      // child: Image.asset(
                      //   'assets/icons/bank_alfalah_logo.png',
                      //   width: 10.w,
                      //   height: 10.h,
                      // ),
                      ),
                    ),


              ],
            )

          ],
          SizedBox(height: 5.h),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 10.sp,
              fontWeight: FontWeight.w500,
              color: isAction ? Color(0xff4361EE) : Color(0xFF121212),
            ),
          ),
          if (accountNumber != null) ...[
            SizedBox(height: 2.h),
            Text(
              accountNumber!,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 8.sp,
                color: Color(0xFFB3B3B3),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

