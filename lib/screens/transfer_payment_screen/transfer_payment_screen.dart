import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile/widgets/account_selected_cards.dart';
import 'package:mobile/widgets/transfer_to_card.dart';
import 'package:mobile/widgets/purpose_of_transfer_bar.dart';


class TransferPaymentScreen extends StatefulWidget {
  const TransferPaymentScreen({Key? key}) : super(key: key);

  @override
  State<TransferPaymentScreen> createState() => _TransferPaymentScreenState();
}

class _TransferPaymentScreenState extends State<TransferPaymentScreen> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F6FF),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF4F6FF),
        titleSpacing: -10.w,
        elevation: 0,
        shadowColor: Colors.transparent,
        leading: IconButton(
          padding: EdgeInsets.only(left: 4.w),
          splashRadius: 20.r,
          icon: Image.asset(
            'assets/icons/back_arrow.png',
            width: 15.w,
            height: 13.h,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'Transfer Payment',
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
            color: const Color(0xFF121212),
          ),
        ),
        centerTitle: false,
      ),
      body: Column(
        children: [
          // --- Top Area ---
          SizedBox(height: 12.h),
          Center(
            child: Text(
              'Account Selected',
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
                color: const Color(0xFF121212),
              ),
            ),
          ),
          SizedBox(height: 5.h),
          AccountSelectedCards(),
          SizedBox(height: 19.h),
          TransferToCard(),
          SizedBox(height: 19.h),
          Center(
            child: Text(
              'Purpose of Transfer',
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
                color: const Color(0xFF121212),
              ),
            ),
          ),
          SizedBox(height: 6.h),
          PurposeOfTransferBar(),





        ],
      ),
    );
  }
}
