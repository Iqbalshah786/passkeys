import 'dart:math' as math;
import 'dart:ui'; // Import for ImageFilter
import 'package:carousel_slider/carousel_slider.dart' as cs;
import 'package:carousel_slider/carousel_controller.dart' as csController;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CardCarousel extends StatefulWidget {
  const CardCarousel({Key? key}) : super(key: key);

  @override
  _CardCarouselState createState() => _CardCarouselState();
}

class _CardCarouselState extends State<CardCarousel> {
  final csController.CarouselSliderController _controller =
  csController.CarouselSliderController();
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {

    double screenHeight = MediaQuery.of(context).size.height;


    // List of bank card widgets
    final List<Widget> cardItems = [
      _buildBankCard(
        balance: 'PKR 10,252,015.15',
        accountType: 'Current Account',
        name: 'Naveed Tejani',
        accountNumber: 'PK012MEZN1425545523635662',
        bgColor:0xff97463d,
        screenHeight: screenHeight,
      ),
      _buildBankCard(
        balance: 'PKR 1,000,000.00',
        accountType: 'Savings Account',
        name: 'Naveed Tejani',
        accountNumber: 'PK012MEZN1425545523635662',
        bgColor:0xff3b54d1,
        screenHeight: screenHeight,
      ),
      _buildBankCard(
        balance: 'PKR 50,000.00',
        accountType: 'Another Account',
        name: 'Naveed Tejani',
        accountNumber: 'PK012MEZN1425545523635662',
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
            height: 151.h, // Overall slider height
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
              margin: EdgeInsets.symmetric(horizontal: 3.w),
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
                      filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
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
        SizedBox(height: 12.h),
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
      padding: EdgeInsets.all(10.w),
      decoration: BoxDecoration(
        color: Color(bgColor),



        // border: GradientBoxBorder(
        //   gradient: const LinearGradient(
        //     colors: [
        //       Color(0xff7088FB),
        //       Color(0xffB9C5FF),
        //     ],
        //   ),
        //   width: 1.w,
        // ),

        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Top row: Account type and hide icon
          Container(
            padding: EdgeInsets.only(right: 10.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    accountType,
                    style: TextStyle(
                      color: const Color(0xffCDD6FF),
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w500,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Image.asset(
                  'assets/icons/eye_hide.png',
                  width: 18.w,
                  height: 13.5.h,
                ),
              ],
            ),
          ),
          SizedBox(height: 5.h),
          // Balance info
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                balance,
                style: TextStyle(
                  color: const Color(0xFFFFD25F),
                  fontSize: 22.sp,
                  fontWeight: FontWeight.w800,
                ),
              ),
              Text(
                'Available Balance',
                style: TextStyle(
                  color: const Color(0xffB0BEFF),
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          SizedBox(
            height: screenHeight < 700 ? 10.0.h : 28.h,
          ),
          // Name & account info
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Name
                Flexible(
                  child: Text(
                    name,
                    style: TextStyle(
                      color: const Color(0xFFECEFFF),
                      fontWeight: FontWeight.w600,
                      fontSize: 13.sp,
                    ),
                  ),
                ),
                // Account number
                Flexible(
                  child: Text(
                    accountNumber,
                    style: TextStyle(
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xFFECEFFF),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
