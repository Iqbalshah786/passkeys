import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile/widgets/transfer_payment_top_up_widget.dart';
import '../widgets/CardCarousel.dart';
import '../widgets/account_credit_toggle.dart';
import '../widgets/investment_card_widget.dart';
import '../widgets/quick_transfers_section.dart';
import 'app_bar.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  int _currentIndex = 0;
  bool _isAccount = true;
  bool _isTransfer = true;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
      child: Scaffold(

        
        // ──────────────────────────────────────────────────────────────────────────
        // Custom BottomNavigationBar
        // ──────────────────────────────────────────────────────────────────────────
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.transparent,
            elevation: 0,
            currentIndex: _currentIndex,
            onTap: (idx) => setState(() => _currentIndex = idx),

            // ─── Colors & label styles ────────────────────────────────────────────
            selectedItemColor: const Color(0xFF4361EE),
            unselectedItemColor: const Color(0xFF6E6E6E),
            selectedLabelStyle: TextStyle(fontSize: 14.sp),
            unselectedLabelStyle: TextStyle(fontSize: 12.sp),

            // ─── Items ────────────────────────────────────────────────────────────
            items: [
              BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.only(top: 5.h),
                  child: ImageIcon(
                    AssetImage('assets/icons/home_icon.png'),
                    size: 22.w,
                  ),
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.only(top: 5.h),
                  child: ImageIcon(
                    AssetImage('assets/icons/card.png'),
                    size: 22.w,
                  ),
                ),
                label: 'Card',
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.only(top: 5.h),
                  child: ImageIcon(
                    AssetImage('assets/icons/transaction.png'),
                    size: 22.w,
                  ),
                ),
                label: 'Transactions',
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.only(top: 5.h),
                  child: ImageIcon(
                    AssetImage('assets/icons/more.png'),
                    size: 22.w,
                  ),
                ),
                label: 'More',
              ),
            ],
          ),
        ),

        backgroundColor: const Color(0xFFF4F6FF),

        // ──────────────────────────────────────────────────────────────────────────
        // Main Body
        // ──────────────────────────────────────────────────────────────────────────

        body: SafeArea(
          child: Column(
            children: [
              AppBarScreen(),
              // toggle credit / debit
              AccountcreditToggle(
                initialIsAccount: _isAccount,
                onToggle: (val) {
                  setState(() => _isAccount = val);
                },
              ),
              SizedBox(height: 12.h),

              // cards carousel
              CardCarousel(),
              SizedBox(height: 16.h),

              // transfer / payment / top‑up tabs
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Container(
                  padding: EdgeInsets.all(5.w),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(6.r),
                  ),
                  child: TransferPaymentTopUpWidget(
                    initialIsTransfer: _isTransfer,
                    onToggle: (val) {
                      setState(() => _isTransfer = val);
                    },
                  ),
                ),
              ),

              // quick transfers
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: QuickTransfersSection(),
              ),

              // investment card
              SizedBox(height: 16.h),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: InvestmentCardWidget(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
