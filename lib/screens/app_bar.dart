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
      padding: EdgeInsets.all(16.w),
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
