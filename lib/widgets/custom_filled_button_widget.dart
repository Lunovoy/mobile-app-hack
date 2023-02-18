import 'package:flutter/material.dart';
import 'package:deep_shield_hack/utils/app_colors.dart';

class CustomFilledButtonWidget extends StatelessWidget {
  const CustomFilledButtonWidget({
    Key? key,
    required this.text,
    required this.fontSize,
    required this.routeName,
  }) : super(key: key);

  final String text;
  final double fontSize;
  final String routeName;

  @override
  Widget build(BuildContext context) {
    void _onPressed() {
      Navigator.of(context).pushNamed(routeName);
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22),
      child: GestureDetector(
        onTap: _onPressed,
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
