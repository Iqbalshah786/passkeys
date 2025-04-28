import 'dart:ui';
import 'package:carousel_slider/carousel_slider.dart' as cs;
import 'package:carousel_slider/carousel_controller.dart' as csController;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class AccountSelectedCards extends StatefulWidget {
  const AccountSelectedCards({Key? key}) : super(key: key);

  @override
  _AccountSelectedCardsState createState() => _AccountSelectedCardsState();
}

class _AccountSelectedCardsState extends State<AccountSelectedCards> {
  final csController.CarouselSliderController _controller =
  csController.CarouselSliderController();
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {

    double screenHeight = MediaQuery.of(context).size.height;


    // List of bank card widgets
    final List<Widget> cardItems = [
      _buildBankCard(
        balance: 'PKR 405,125.00',
        accountType: 'Savings account',
        name: 'Naveed Tejani',
        accountNumber: '124255625865854',
        bgColor:0xff97463d,
        screenHeight: screenHeight,
      ),
      _buildBankCard(
        balance: 'PKR 405,125.00',
        accountType: 'Current Account',
        name: 'Naveed Tejani',
        accountNumber: '124255625865854',
        bgColor:0xff3b54d1,
        screenHeight: screenHeight,
      ),
      _buildBankCard(
        balance: 'PKR 405,125.00',
        accountType: 'Another Account',
        name: 'Naveed Tejani',
        accountNumber: '124255625865854',
        bgColor:0xff5006d7,
        screenHeight: screenHeight,

      ),
    ];


    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Using CarouselSlider.builder to have access to index
        cs.CarouselSlider.builder(
          itemCount: cardItems.length,
          carouselController: _controller,
          options: cs.CarouselOptions(
            height: 64.h, // Overall slider height
            enableInfiniteScroll: true,
            enlargeCenterPage: true,
            enlargeStrategy: cs.CenterPageEnlargeStrategy.height,
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
          itemBuilder: (context, index, realIndex) {
            // Determine if the current item is centered
            bool isCentered = index == _currentIndex;
            // Wrap the card in a Container for horizontal margin
            return Container(
              margin: EdgeInsets.symmetric(horizontal: 5.w),
              child: isCentered
              // If centered, show the card without blur
                  ? cardItems[index]
              // If not centered, overlay a blur effect
                  : Stack(
                fit: StackFit.expand,
                children: [
                  cardItems[index],
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.r),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                      child: Container(
                        color: Colors.black.withOpacity(0),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
        SizedBox(height: 9.h),
        // Dot indicators
        SmoothPageIndicator(
          controller: PageController(initialPage: _currentIndex),
          count: cardItems.length,
          effect: ExpandingDotsEffect(
            dotColor: const Color(0xffDDDDDD),
            activeDotColor: const Color(0xFFAFAFAF),
            dotHeight: 4.h,
            dotWidth: 4.w,
            expansionFactor: 6,
          ),
        ),
      ],
    );
  }

  Widget _buildBankCard({
    required String balance,
    required String accountType,
    required String name,
    required String accountNumber,
    required double screenHeight,
    required int bgColor,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 5.h),
      decoration: BoxDecoration(
        color: Color(bgColor),
        borderRadius: BorderRadius.circular(8.r),
      ),

      child: Column(
        mainAxisSize: MainAxisSize.min,

        children: [
          // Top row
          Flexible(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                 Image.asset('assets/icons/selected_card_finbank_logo.png',height: 9.h,),
                 Text(accountType,style: TextStyle(fontWeight: FontWeight.w500,color: Color(0xffB0BEFF), fontSize: 10.sp),)

              ],
            ),
          ),
          SizedBox(height: 3.h,),
          // Account info
          Flexible(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(name,style: TextStyle(fontSize: 12.sp,color: Colors.white),),
                Text(balance,style: TextStyle(fontWeight: FontWeight.w800,color: Color(0xffFFD25F), fontSize: 16.sp),)
              ],
            ),
          ),
          Flexible(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(accountNumber,style: TextStyle(fontSize: 10.sp,fontWeight: FontWeight.w400, color: Color(0xffB0BEFF)),),
                Text('Available Balance',style: TextStyle(fontWeight: FontWeight.w400,color: Color(0xffB0BEFF), fontSize: 8.sp),)
              ],
            ),
          ),


        ],
      ),
    );
  }
}
