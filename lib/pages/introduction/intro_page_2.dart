import 'package:flutter/material.dart';
import 'package:deep_shield_hack/utils/app_colors.dart';
import 'package:lottie/lottie.dart';

class IntroPage2 extends StatelessWidget {
  final String mainText = 'Прими участие в множестве уникальных мероприятий';

  const IntroPage2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 200),
          Lottie.asset('assets/lottie/people.json'),
          const SizedBox(height: 80),
          Text(
            mainText,
            softWrap: true,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 20,
              color: AppColors.black,
            ),
          ),
        ],
      ),
    );
  }
}
