import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TransferToCard extends StatelessWidget {
  const TransferToCard({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(

        padding: EdgeInsets.symmetric(horizontal: 20.w),

        child: Column(

          children: [
            Center(child: Text('Transfer to',style: TextStyle(fontSize: 12.sp,color: Color(0xff121212),fontWeight: FontWeight.w500),),),
            SizedBox(height: 5.h,),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12.w,vertical: 8.h),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 2.r,
                    offset: Offset(0, 2.h),
                  ),
                ],
              ),

              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 24.r,
                        backgroundColor: Color(0xffEBEBEB),
                        // remove `backgroundImage`
                        child: Center(
                          child: Image.asset(
                            'assets/icons/bank_alfalah_logo.png',
                            width: 34.w,   // your desired image size
                            height: 28.h,
                            // fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(width: 12.w,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Zeeshan Khemani',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 12.sp,color: Color(0xff121212)),),
                          Text('124255625865854',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 10.sp,color: Color(0xffAAAAAA))),

                        ],
                      )
                    ],
                  ),
                  Image.asset('assets/icons/transfer_icon.png',width: 18.33.w,height: 15.h,)



                ],
              ),
            )
          ],
        )


    );
  }
}
