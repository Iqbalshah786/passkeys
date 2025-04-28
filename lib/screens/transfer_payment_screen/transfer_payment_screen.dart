import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import 'package:mobile/widgets/account_selected_cards.dart';
import 'package:mobile/widgets/transfer_to_card.dart';
import 'package:mobile/widgets/purpose_of_transfer_bar.dart';
import 'package:mobile/widgets/number_pad.dart';

class TransferPaymentScreen extends StatefulWidget {
  const TransferPaymentScreen({Key? key}) : super(key: key);

  @override
  _TransferPaymentScreenState createState() => _TransferPaymentScreenState();
}

class _TransferPaymentScreenState extends State<TransferPaymentScreen> {
  String _rawAmount = '405125';

  String get formattedAmount {
    if (_rawAmount.isEmpty) return 'PKR 0.00';
    final value = double.tryParse(_rawAmount) ?? 0.0;
    return NumberFormat.currency(
      locale: 'en_PK',
      symbol: 'PKR ',
      decimalDigits: 2,
    ).format(value);
  }

  void _handleKey(String key) {
    setState(() {
      if (key == '⌫') {
        if (_rawAmount.isNotEmpty){
          _rawAmount = _rawAmount.substring(0, _rawAmount.length - 1);
        }
      } else if (key == '.') {
        if (!_rawAmount.contains('.') && _rawAmount.isNotEmpty){
          _rawAmount += '.';
        }
      } else {
        _rawAmount += key;
      }
    });
  }

  void _showOtpSheet() {
    showModalBottomSheet<String>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder:
          (ctx) => FractionallySizedBox(
            heightFactor: 0.4, //  desired height (40% of screen)
            child: OtpVerificationSheet(
              onSubmit: (otpCode) {
                Navigator.of(ctx).pop(otpCode);
                // TODO: verify OTP
              },
            ),
          ),
    ).then((enteredOtp) {
      if (enteredOtp != null) {
        // handle verified OTP
        print('User entered: $enteredOtp');
      }
    });
  }

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

          SizedBox(height: 55.h),
          Text(
            'Enter Amount',
            style: TextStyle(fontSize: 12.sp, color: const Color(0xFF121212)),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: FittedBox(
              fit: BoxFit.scaleDown,
              alignment: Alignment.centerLeft,
              child: Text(
                formattedAmount,
                style: TextStyle(
                  fontSize: 30.sp,
                  fontWeight: FontWeight.w800,
                  color: const Color(0xFF4361EE),
                ),
              ),
            ),
          ),

          SizedBox(height: 29.h),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 7.r,
                    offset: Offset(4.h, 0),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 39.w, right: 39.w, top: 7.h),
                    child: NumberPad(onKey: _handleKey),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 12.h,
                    ),
                    child: SizedBox(
                      width: double.infinity,
                      height: 54.h,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF4361EE),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                        ),
                        onPressed: _rawAmount.isNotEmpty ? _showOtpSheet : null,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Send Money',
                              style: TextStyle(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w600,
                                color:
                                    _rawAmount.isNotEmpty
                                        ? Color(0xffE3E8FF)
                                        : Color(0xff6E6E6E),
                              ),
                            ),
                            SizedBox(width: 8.w),
                            Image.asset(
                              'assets/icons/right_arrow.png',
                              width: 15.w,
                              height: 13.h,
                              color:
                                  _rawAmount.isNotEmpty
                                      ? Color(0xffE3E8FF)
                                      : Color(0xff6E6E6E),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// OTP Sheet now full-height via FractionallySizedBox.
class OtpVerificationSheet extends StatefulWidget {
  final ValueChanged<String> onSubmit;
  const OtpVerificationSheet({Key? key, required this.onSubmit})
    : super(key: key);

  @override
  _OtpVerificationSheetState createState() => _OtpVerificationSheetState();
}

class _OtpVerificationSheetState extends State<OtpVerificationSheet> {
  final _pinController = TextEditingController();
  int _secondsRemaining = 30;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer?.cancel();
    setState(() => _secondsRemaining = 30);
    _timer = Timer.periodic(const Duration(seconds: 1), (t) {
      if (_secondsRemaining > 0){
        setState(() => _secondsRemaining--);
      }
      else {
        t.cancel();
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pinController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20.r),
        topRight: Radius.circular(20.r),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5, sigmaY:5),
        child: Container(
          color: Colors.white,
          padding: EdgeInsets.only(
            top: 28.h,
            left: 20.w,
            right: 20.w,
            bottom: 34.h,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Center(
                child: Text(
                  'OTP Verification',
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              SizedBox(height: 16.h),
              PinCodeTextField(
                appContext: context,
                length: 5,
                controller: _pinController,
                autoFocus: true,
                keyboardType: TextInputType.number,
                pinTheme: PinTheme(
                  fieldWidth: 58.w,
                  fieldHeight: 58.h,
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(6.r),
                  borderWidth: 0,
                  activeFillColor: Color(0xffF4F6FF),
                  inactiveFillColor: Color(0xffF4F6FF),
                  activeColor: Color(0xffF4F6FF), // active border
                  inactiveColor: Color(0xffF4F6FF),
                  selectedColor: Color(0xffF4F6FF),
                  selectedFillColor: Color(0xffF4F6FF),

                ),
                cursorColor: Color(0xff6E6E6E),
                animationDuration: const Duration(milliseconds: 10),
                enableActiveFill: true,
                  textStyle:TextStyle(fontWeight: FontWeight.w500,fontSize: 16.sp,color: Color(0xff6E6E6E)),
                onChanged: (_) {},
              ),

              // resend and timer row
              Row(
                // crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    borderRadius: BorderRadius.circular(4.r),
                    onTap: _secondsRemaining == 0 ? _startTimer : null,
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFFF4F6FF),
                        borderRadius: BorderRadius.circular(4.r),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
                      alignment: Alignment.center,
                      child: Text(
                        'Resend',
                        style: TextStyle(
                          color: _secondsRemaining == 0
                              ? const Color(0xFF4361EE)
                              : const Color(0xFFC7C7C7),
                          fontSize: 12.sp,
                        ),
                      ),
                    ),
                  ),


                  Text(
                    _secondsRemaining > 0
                        ? '00:${_secondsRemaining.toString().padLeft(2, '0')}'
                        : '00:00',
                    style: TextStyle(fontSize: 14.sp , color: Color(0xff121212)),
                  ),
                ],
              ),
              SizedBox(height: 22.h,),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed:
                      _pinController.text.length == 5
                          ? () {
                        // 1) Close the OTP bottom sheet
                        Navigator.of(context).pop();
                        // 2) Navigate to success page
                        Navigator.of(context).pushNamed(
                          '/success',
                        );
                      }
                          : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF4361EE),
                    padding: EdgeInsets.only(
                      top: 18.h,
                      bottom: 18.h
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                  ),
                  child: Text(
                    'Submit',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),

              SizedBox(height: 4.h,),
              // Optional: "Setup Passkey" link
              Expanded(
                child: TextButton(
                  onPressed: () {
                  },
                  child: Text('Setup Passkey',style: TextStyle(
                    fontSize: 16.sp,
                    color: Color(0xff121212),
                    fontWeight: FontWeight.w400
                  ),),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
