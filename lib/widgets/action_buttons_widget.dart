// lib/widgets/action_buttons_widget.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'custom_icon_button.dart';

class ActionButtonsWidget extends StatelessWidget {
  const ActionButtonsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomIconButton(
          assetPath: 'assets/icons/search.png',
          width: 35.w,
          height: 35.h,
          onPressed: () {
            print('search icon');
          },
        ),
        CustomIconButton(
          assetPath: 'assets/icons/bell.png',
          width: 17.w,
          height: 17.h,
          onPressed: () {
            print('notification icon');
          },
        ),
        CustomIconButton(
          assetPath: 'assets/icons/qr.png',
          width: 32.w,
          height: 32.h,
          onPressed: () {
            print('qr code');
          },
        ),
      ],
    );
  }
}
