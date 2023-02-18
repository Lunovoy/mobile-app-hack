import 'package:deep_shield_hack/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CustButtonWidget extends StatelessWidget {
  const CustButtonWidget({
    Key? key,
    required this.text,
    required this.fontSize,
    required this.routeName,
  }) : super(key: key);

  final String text;
  final double fontSize;
  final String routeName;

  Future setPref() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setInt('onBoard', 1);
  }

  @override
  Widget build(BuildContext context) {
    void onPressed() async {
      final prefs = await SharedPreferences.getInstance();
      prefs.setBool('showHome', true);
      Navigator.of(context).pushNamed(routeName);
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22),
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          height: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: AppColors.accent,
          ),
          child: Center(
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: fontSize,
                  fontWeight: FontWeight.bold,
                  color: AppColors.white),
            ),
          ),
        ),
      ),
    );
  }
}
