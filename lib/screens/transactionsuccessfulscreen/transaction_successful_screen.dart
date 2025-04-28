
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../widgets/transaction_content.dart';

class TransactionSuccessfulScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F6FF),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF4F6FF),
        titleSpacing: -8.w,
        elevation: 0,
        shadowColor: Colors.transparent,
        leading: IconButton(
          padding: EdgeInsets.only(left: 4.w),
          splashRadius: 20.r,
          icon: Image.asset(
            'assets/icons/go_to_home_btn.png',
            width: 18.w,
            height: 18.h,
          ),
          onPressed: () => Navigator.of(context).pushNamed('/main_screen'),
        ),
        title: Text(
          'Go to home',
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
            color: const Color(0xFF121212),
          ),
        ),
        centerTitle: false,
      ),
      body: Column(
        children: [
          TransactionContent(),
          SizedBox(height: 41.h,),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
              CircleAvatar(
              radius: 15.r,
              backgroundColor: Colors.white,
              child: Center(
                child: Image.asset(
                  'assets/icons/download_icon.png',
                  width: 18.w,
                  height: 18.h,
                  // fit: BoxFit.cover,
                ),
              ),
              ),
               SizedBox(width: 9.w,),
                CircleAvatar(
                  radius: 15.r,
                  backgroundColor: Colors.white,
                  child: Center(
                    child: Image.asset(
                      'assets/icons/share_icon_black.png',
                      width: 15.w,
                      height: 17.h,
                      // fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),

          ),
        ],
      )
    );
  }
}
