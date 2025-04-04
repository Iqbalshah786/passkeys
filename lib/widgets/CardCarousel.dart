import 'dart:math' as math;
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
  final csController.CarouselSliderController _controller = csController.CarouselSliderController();
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final List<Widget> cardItems = [
      _buildBankCard(
        balance: 'PKR 10,252,015.15',
        accountType: 'Current Account',
        name: 'Naveed Tejani',
        accountNumber: 'PK012MEZN1425545523635662',
      ),
      _buildBankCard(
        balance: 'PKR 1,000,000.00',
        accountType: 'Savings Account',
        name: 'Naveed Tejani',
        accountNumber: 'PK012MEZN1425545523635662',
      ),
      _buildBankCard(
        balance: 'PKR 50,000.00',
        accountType: 'Another Account',
        name: 'Naveed Tejani',
        accountNumber: 'PK012MEZN1425545523635662',
      ),
    ];

    // Removed the Expanded wrapper here, now returning a regular Column
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        cs.CarouselSlider(
          items: cardItems
              .map(
                (item) => Container(
              margin: EdgeInsets.symmetric(horizontal: 3.w),
              child: item,
            ),
          )
              .toList(),
          carouselController: _controller,
          options: cs.CarouselOptions(
            height: 195.h, // Overall slider height
            enableInfiniteScroll: true,
            enlargeCenterPage: true,
            enlargeStrategy: cs.CenterPageEnlargeStrategy.height,
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
        ),

        SizedBox(height: 12.h),
        // Dot indicators
        SmoothPageIndicator(
            controller: PageController(initialPage: _currentIndex),
            count: cardItems.length,
            effect: ExpandingDotsEffect(
              dotColor: Color(0xffDDDDDD),
              activeDotColor: Color(0xFFAFAFAF),
              dotHeight: 4.h,
              dotWidth: 4.w,
              expansionFactor: 6,
            )
        )
      ],
    );
  }

  Widget _buildBankCard({
    required String balance,
    required String accountType,
    required String name,
    required String accountNumber,
  }) {
    // Card build method remains the same
    return Container(
      padding: EdgeInsets.all(10.w),
      decoration: BoxDecoration(
        border:  GradientBoxBorder(
          gradient: LinearGradient(
              colors: [
                Color(0xff7088FB),
                Color(0xffB9C5FF),]
          ),
          width: 2.w,
        ),
        gradient: const LinearGradient(
          colors: [
            Color(0xff4361EE),
            Color(0xff4361EE),
          ],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
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
                        color: Color(0xffCDD6FF),
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w500,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Image.asset('assets/icons/eye_hide.png',width: 18.w,height: 13.5.h,),
                ],
              )
          ),

          SizedBox(height: 15.h,),
          // Balance info;
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                balance,
                style: TextStyle(
                  color: Color(0xFFFFD25F),
                  fontSize: 22.sp,
                  fontWeight: FontWeight.w800,
                ),
              ),
              Text(
                'Available Balance',
                style: TextStyle(
                  color: Color(0xffB0BEFF),
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),

          SizedBox(height: 33.h,),

          //name & account info
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //name
                Flexible(
                  child: Text(name, style: TextStyle(
                      color: Color(0xFFECEFFF),
                      fontWeight: FontWeight.w600,
                      fontSize: 15.sp
                  ),
                  ),
                ),
                // account num
                Flexible(
                  child: Text(accountNumber,style: TextStyle(
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFFECEFFF),
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