import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InvestmentCardWidget extends StatelessWidget {
  const InvestmentCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Container(
      padding: EdgeInsets.all(12.w),
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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Row(
                children: [
                  Image.asset('assets/icons/crown.png',width: 46.w,height: 46.h,),
                ],
              ),
              SizedBox(width: 5.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Start investing now!',
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff5F09FF),
                    ),
                  ),
                  Text(
                    'Protected savings and investment plans.',
                    style: TextStyle(
                      fontSize:  10.sp,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff121212),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Container(
            child: Image.asset('assets/icons/ai.png',width: 27.w,height: 14.h,),
          ),
        ],
      ),
    );
  }
}
