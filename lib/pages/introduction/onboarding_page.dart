import 'package:flutter/material.dart';
import 'package:deep_shield_hack/pages/introduction/intro_page_1.dart';
import 'package:deep_shield_hack/pages/introduction/intro_page_2.dart';
import 'package:deep_shield_hack/pages/introduction/intro_page_3.dart';
import 'package:deep_shield_hack/utils/app_colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  State<OnBoardingPage> createState() => _IntroductionPageState();
}

class _IntroductionPageState extends State<OnBoardingPage> {
  final PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: Stack(
          children: [
            PageView(
              controller: _controller,
              children: [
                IntroPage1(),
                IntroPage2(),
                IntroPage3(),
              ],
            ),
            Container(
              alignment: const Alignment(0, 0.92),
              child: SmoothPageIndicator(
                controller: _controller,
                count: 3,
                effect: const JumpingDotEffect(
                  activeDotColor: AppColors.accent,
                  dotColor: AppColors.inactiveDots,
                  verticalOffset: 20,
                  dotWidth: 18,
                  dotHeight: 18,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
