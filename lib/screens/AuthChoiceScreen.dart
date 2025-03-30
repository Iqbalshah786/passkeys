import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthChoiceScreen extends StatelessWidget {
  const AuthChoiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background Image
          Image.asset('assets/images/man_working.png', fit: BoxFit.cover),

          // Content
          Column(
            children: [
              Spacer(),

              // Logo
              Image.asset('assets/images/logo.png', height: 45.h),
              SizedBox(height: 16.h),
              SizedBox(
                width: 340.w,
                child: Text(
                  'Your Complete Financial Solution',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.sp,
                    fontFamily: 'Hanken Grotesk',
                    fontWeight: FontWeight.w400,
                    height: 1.50.h, // Use a simple multiplier here unless you specifically need scaling.
                  ),
                ),
              ),
              Spacer(flex: 4),

              // Buttons
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 35.w, vertical: 60.h),
                child: Row(
                  children: [
                    // Register Button
                    Expanded(
                      child: Container(
                        width: 165.w,
                        height: 55.h,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/register');
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: const Color(0xFF4361EE),
                            padding: EdgeInsets.symmetric(vertical: 14.h),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6.r),
                            ),
                          ),
                          child: Text(
                            'Register',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: const Color(0xFF4361EE),
                              fontSize: 18.sp,
                              fontFamily: 'Hanken Grotesk',
                              fontWeight: FontWeight.w600,
                              height: 1.11.h,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 20.w),

                    // Login Button
                    Expanded(
                      child: Container(
                        width: 165.w,
                        height: 55.h,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/login');
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF4361EE),
                            foregroundColor: Colors.white,
                            padding: EdgeInsets.symmetric(vertical: 14.h),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                          ),
                          child: Text(
                            'Login',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.sp,
                              fontFamily: 'Hanken Grotesk',
                              fontWeight: FontWeight.w600,
                              height: 1.11.h,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
