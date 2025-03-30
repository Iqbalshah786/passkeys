import 'package:carousel_slider/carousel_slider.dart' as cs;
import 'package:carousel_slider/carousel_controller.dart' as csController;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
      _buildCard('PKR 10,252,015.15', 'Current Account'),
      _buildCard('PKR 1,000,000.00', 'Savings Account'),
      _buildCard('PKR 50,000.00', 'Another Account'),
    ];

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        cs.CarouselSlider(
          items: cardItems,
          carouselController: _controller,
          options: cs.CarouselOptions(
            height: 151.h,
            enableInfiniteScroll: true,
            enlargeCenterPage: true,
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
              dotHeight: 4.h,  // Both active and inactive dots share this height.
              dotWidth: 4.w,  // Base width for inactive dots.
              expansionFactor: 6.w,  // Active dot width becomes 24.w * 1.5.
            )
        )
      ],
    );
  }

  Widget _buildCard(String balance, String accountType) {
    return Container(
      // Outer container with gradient background
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color(0xff7088FB),
            Color(0xff4361EE),
          ],
          begin: Alignment.centerRight,
          end: Alignment.centerLeft,
        ),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Container(
        // Margin defines the border thickness
          margin: EdgeInsets.all(2.w),
          // Inner container with solid background (or transparent) and adjusted border radius
          decoration: BoxDecoration(
            gradient: LinearGradient(colors:
            [Color(0xff4361EE), Color( 0xff7088FB)],
            ), // Replace with your desired inner background
            borderRadius: BorderRadius.circular(10.r - 2.w),
          ),

      ),
    );
  }
}
