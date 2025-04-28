import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../widgets/from_and_to_account_tile.dart';
import 'package:dotted_line/dotted_line.dart';
class TransactionContent extends StatelessWidget {
  const TransactionContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w),

        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Image.asset(
                'assets/images/subtract_bg.png',
                fit: BoxFit.contain
            ),
            // 2) content padded inside the “ticket”
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: 24.h,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,

                children: [

                  Image.asset(
                    'assets/icons/success_icon.png',
                    width: 30.w,
                    height: 30.h,
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    'Transaction Successful',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff121212),
                    ),
                  ),
                  SizedBox(height: 12.h),
                  Text(
                    'PKR 405,125.00',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 31.sp,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF4361EE),
                    ),
                  ),


                  SizedBox(height: 34.h,),
                  DottedLine(
                    dashLength: 5.w,
                    dashGapLength: 4.w,
                    lineLength: double.infinity,
                    dashColor: Colors.grey,
                  ),

                  Container(
                    padding: EdgeInsets.only(
                      left: 20.w,
                      right: 20.w,
                      top: 27.h,
                      bottom: 37.h,
                    ),
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: 10.w),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Date',
                                    style: TextStyle(
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Text(
                                    '05 May 2024',
                                    style: TextStyle(
                                        color: Color(0xff969696),
                                        fontSize: 13.sp,
                                        fontWeight: FontWeight.w500
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Time',
                                    style: TextStyle(
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Text(
                                    '12:23pm',
                                    style: TextStyle(
                                        color: Color(0xff969696),
                                        fontSize: 13.sp,
                                        fontWeight: FontWeight.w500
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Reference number',
                                    style: TextStyle(
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Text(
                                    '1442454',
                                    style: TextStyle(
                                        color: Color(0xff969696),
                                        fontSize: 13.sp,
                                        fontWeight: FontWeight.w500
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),

                        SizedBox(height: 20.h),
                        FromAndToAccountTile(),

                      ]
                      ,
                    ),
                  ),
                  DottedLine(
                    dashLength: 5.w,
                    dashGapLength: 4.w,
                    lineLength: double.infinity,
                    dashColor: Colors.grey,
                  ),
                  // Finbank logo at bottom
                  SizedBox(height:27.h),
                  Image.asset('assets/icons/fin_bank_logo_2.png',height: 26.h,),
                ],

              ),

            ),
          ],
        ),

      ),
    );
  }
}
