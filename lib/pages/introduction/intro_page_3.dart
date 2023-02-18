import 'package:flutter/material.dart';
import 'package:deep_shield_hack/utils/app_colors.dart';
import 'package:deep_shield_hack/widgets/custom_filled_button_widget.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'cust_button.dart';

class IntroPage3 extends StatelessWidget {
  final String mainText = 'Открой для себя новые границы';

  const IntroPage3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // void _onPressed() {
    //   print("ДАДАДАДАДАД");
    //   Navigator.of(context).pushNamed('/signup');
    // }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 100),
          Lottie.asset('assets/lottie/discover.json'),
          const SizedBox(height: 35),
          Text(
            mainText,
            softWrap: true,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 20,
              color: AppColors.black,
            ),
          ),
          const SizedBox(height: 60),
          CustButtonWidget(
            text: 'Начать путешествие',
            fontSize: 20,
            routeName: '/login',
          ),
        ],
      ),
    );
  }
}
