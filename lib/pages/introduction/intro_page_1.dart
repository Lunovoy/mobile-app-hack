import 'package:flutter/material.dart';
import 'package:deep_shield_hack/utils/app_colors.dart';
import 'package:lottie/lottie.dart';

class IntroPage1 extends StatelessWidget {
  final String mainText = 'Посети более 100 городов России';
  final String subText = 'Сервис по размещению и поиску задач для\nволонтеров';

  const IntroPage1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 170),
          Lottie.asset('assets/lottie/travel.json'),
          const SizedBox(height: 50),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              mainText,
              softWrap: true,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 20,
                color: AppColors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
