// lib/screens/app_bar_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widgets/profile_widget.dart';
import '../widgets/action_buttons_widget.dart';

class AppBarScreen extends StatelessWidget {
  const AppBarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(

      padding: EdgeInsets.symmetric(horizontal: 18.w,vertical: 0.h),
      // decoration: BoxDecoration(
      //   border: Border.all(
      //     color: Colors.grey, // Set your desired border color
      //     width: 2.0,         // Set the border width
      //   ),
      //   borderRadius: BorderRadius.circular(12.0), // Optional: for rounded corners
      // ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const ProfileWidget(
            profileImage: 'assets/images/profile.png',
            name: 'Naveed Tejani',
          ),
          const ActionButtonsWidget(),
        ],
      ),
    );
  }
}
