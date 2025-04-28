import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FromAndToAccountTile extends StatelessWidget {
  const FromAndToAccountTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Text('From Account'),
        ),
        Container(
          padding: EdgeInsets.only(top: 7.h, bottom: 7.h, left: 12.w),
          decoration: BoxDecoration(
            color: Color(0xffF2F4FF),
            borderRadius: BorderRadius.circular(8.r),
          ),

          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 24.r,
                    backgroundColor: Colors.white,

                    child: Center(
                      child: Image.asset(
                        'assets/icons/f.png',
                        width: 28.w,
                        height: 19.h,
                        // fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Naveed Tejani',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 16.sp,
                          color: Color(0xff121212),
                        ),
                      ),
                      Text(
                        '1452225545588462',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 12.sp,
                          color: Color(0xff616265),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: 9.h),
        Padding(
          padding: EdgeInsets.only(left: 10.w),
          child: Text('To Account'),
        ),
        Container(
          padding: EdgeInsets.only(top: 7.h, bottom: 7.h, left: 12.w,right: 12.w),
          decoration: BoxDecoration(
            color: Color(0xffF2F4FF),
            borderRadius: BorderRadius.circular(8.r),

          ),

          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 24.r,
                    backgroundColor: Colors.white,

                    child: Center(
                      child: Image.asset(
                        'assets/icons/bank_alfalah_logo.png',
                        width: 28.w,
                        height: 23.h,
                        // fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Zeeshan Khemani',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 16.sp,
                          color: Color(0xff121212),
                        ),
                      ),
                      Text(
                        '45521231478123614',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 12.sp,
                          color: Color(0xff616265),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Image.asset('assets/icons/card_icon.png',width: 30.w,height: 18.h,)
            ],
          ),
        ),
      ],
    );
  }
}
