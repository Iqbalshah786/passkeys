import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileWidget extends StatefulWidget {
  final String profileImage;
  final String name;

  const ProfileWidget({
    Key? key,
    required this.profileImage,
    required this.name,
  }) : super(key: key);

  @override
  State<ProfileWidget> createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r),
            boxShadow: [
              BoxShadow(
                color: const Color(0x40000000),
                offset: Offset(0, 4.h), // responsive vertical offset
                blurRadius: 4.r, // responsive blur radius
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.r),
            child: Image.asset(
              widget.profileImage,
              fit: BoxFit.cover,
              width: 33.w,
              height: 30.h,
            ),
          ),
        ),
        SizedBox(width: 12.w),
        Text(
          widget.name,
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}
