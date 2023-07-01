// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../models/onboard_model.dart';
import '../utils/color.dart';
import '../widgets/onboard_widget.dart';


class OnbaordingScreen extends StatelessWidget {
  OnbaordingScreen({super.key});

  final PageController _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            PageView.builder(
              controller: _pageController,
              itemCount: screens.length,
              itemBuilder: (context, index) => OnboardWidget(
                description: screens[index].description,
                imageUrl: screens[index].imageUrl,
                isLast: index == screens.length - 1,
                title: screens[index].title,
                controller: _pageController,
                length: screens.length,
              ),
            ),
            Positioned(
              bottom: MediaQuery.of(context).size.height * 0.2,
              child: SmoothPageIndicator(
                controller: _pageController,
                count: screens.length,
                effect: ExpandingDotsEffect(
                  dotHeight: 6,
                  dotWidth: 6,
                  dotColor: AppColor.grayColor.shade100,
                  activeDotColor: AppColor.kDarkBlueColor,
                  expansionFactor: 3,
                  spacing: 4,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<OnboardModel> get screens {
    return [
      OnboardModel(
        controller: _pageController,
        imageUrl:
        'https://res.cloudinary.com/du4c6jbsw/image/upload/v1670779908/splash_screen_1_eu7ney.png',
        title: 'Addiction to Recovery',
        description:
        "Start your recovery journey one step at a time and one less bottle a day",
      ),
      OnboardModel(
        controller: _pageController,
        imageUrl:
        'https://res.cloudinary.com/du4c6jbsw/image/upload/v1670779876/Downloader.la_-6388b9ff9cdbd_xx47y2.jpg',
        title: 'Share Your Journey',
        description:
        "Share your journey anonymously to encourage others on their journey and help prevent a relapse.",
      ),
    ];
  }
}
