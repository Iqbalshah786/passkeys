import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InvestmentCardWidget extends StatelessWidget {
  const InvestmentCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Container(

      padding: EdgeInsets.symmetric(vertical:  12.h , horizontal:  12.w ),
      width: screenHeight < 700 ? 350.w : 360.w,
      height: 80.h,

      //border color
      decoration: BoxDecoration(
        color: Color(0xfff4efff),
        border: Border.all(
          color: Color(0xff5F09FF),
          width: 0.5.w,
        ),
        borderRadius: BorderRadius.circular(8.w),

      ),

      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset('assets/icons/crown.png',width:screenHeight < 700 ? 55.w : 60.w ,height: screenHeight < 700 ? 55.h : 60.h,),
          SizedBox(width: 5.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Start investing now!',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff5F09FF),
                  ),
                ),
                SizedBox(height: 2.h),
                Text(
                  'Protected savings and investment plans.',
                  style: TextStyle(
                    fontSize:  10.5.sp,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff121212),
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: Image.asset('assets/icons/ai.png',width: 37.w,height: 24.h,),
            ),
        ],
      ),
    );
  }
}
