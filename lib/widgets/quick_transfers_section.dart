import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile/widgets/investment_card_widget.dart';

class QuickTransfersSection extends StatelessWidget {
  const QuickTransfersSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(

      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,

          children: [
            Text(
              'Quick transfers',
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: Color(0xff121212),
              ),
            ),
            TextButton(
                onPressed: () {
                  print("see more clicked");
                },
                child: Stack(
                  children: [
                    Text(
                      "See more",
                      style: TextStyle(
                        fontSize: 10.sp,
                        color: Color(0xff4361EE),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        height: 1.3.h, // Thickness of the underline
                        color: Color(0xff4361EE), // Same color as text
                      ),
                    ),
                  ],
                )

            ),
          ],
        ),
        GridView.count(
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          crossAxisCount: 3,
          childAspectRatio: 1.3,
          crossAxisSpacing: 9.w,
          mainAxisSpacing:10.h,
          children: [
            TransferTile(
              isAction: true,
              icon: Icons.send,
              title: 'Send Money',
              iconColor: Colors.blue,
            ),
            TransferTile(
              initials: 'SS',
              title: 'Samia Sajjad',
              accountNumber: '12345678901234',
            ),
            TransferTile(
              initials: 'AI',
              title: 'Apple Inc',
              accountNumber: '12345678901234',
            ),
            TransferTile(
              initials: 'AI',
              title: 'Apple Inc',
              accountNumber: '12345678901234',
            ),
            TransferTile(
              initials: 'AI',
              title: 'Apple Inc',
              accountNumber: '12345678901234',
            ),
            TransferTile(
              initials: 'AI',
              title: 'Apple Inc',
              accountNumber: '12345678901234',
            ),
          ],
        ),
        // InvestmentCardWidget(),
      ],
    );
  }
}

class TransferTile extends StatelessWidget {
  final String? initials;
  final String title;
  final String? accountNumber;
  final bool isAction;
  final IconData? icon;
  final Color iconColor;

  const TransferTile({
    Key? key,
    this.initials,
    required this.title,
    this.accountNumber,
    this.isAction = false,
    this.icon,
    this.iconColor = Colors.blue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(
          color: Color(0xf8181811A),
          width: 0.2.w
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (isAction) ...[
            Icon(
              icon,
              color: iconColor,
              size: 28.sp,
            ),
          ] else ...[
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                Container(
                  width: 48.w,
                  height: 48.h,
                  decoration: BoxDecoration(
                    color: const Color(0x14000000),  // example semi‑transparent black
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      initials ?? '',
                      style: TextStyle(
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w200,
                      ),
                    ),
                  ),
                ),
                // Positioned(
                //   bottom: 0,
                //   right: 0,
                //   child: Image.asset(
                //     'assets/icons/bank_al_falah.png',  // remove the leading slash
                //     width: 17.w,
                //     height: 17.h,
                //     fit: BoxFit.contain,
                //   ),
                // ),
              ],
            )

          ],
          SizedBox(height: 5.h),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 10.sp,
              fontWeight: FontWeight.w400,
              color: isAction ? iconColor : Color(0xFF121212),
            ),
          ),
          if (accountNumber != null) ...[
            SizedBox(height: 2.h),
            Text(
              accountNumber!,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 8.sp,
                color: Color(0xFFB3B3B3),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

