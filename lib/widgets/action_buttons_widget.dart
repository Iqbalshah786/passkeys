// lib/widgets/action_buttons_widget.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'custom_icon_button.dart';

class ActionButtonsWidget extends StatelessWidget {
  const ActionButtonsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      // mainAxisSize: MainAxisSize.min,
      children: [
        CustomIconButton(
          assetPath: 'assets/icons/search.png',
          width: 30.w,
          height: 30.h,
          onPressed: () {
            print('search icon');
          },
        ),
        SizedBox(width: 12.w,),
        CustomIconButton(
          assetPath: 'assets/icons/bell.png',
          width: 15.w,
          height: 15.h,
          onPressed: () {
            print('notification icon');
          },
        ),
        SizedBox(width: 12.w,),
        CustomIconButton(
          assetPath: 'assets/icons/qr.png',
          width: 30.w,
          height: 30.h,
          onPressed: () {
            print('qr code');
          },
        ),
      ],
    );
  }
}
