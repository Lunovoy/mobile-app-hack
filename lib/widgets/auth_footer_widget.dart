import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:deep_shield_hack/utils/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthFooterWidget extends StatelessWidget {
  const AuthFooterWidget({
    Key? key,
    required this.commonText,
    required this.eventText,
    required this.routeName,
  }) : super(key: key);

  final String commonText;
  final String eventText;
  final String routeName;

  @override
  Widget build(BuildContext context) {
    TapGestureRecognizer _onPressed = TapGestureRecognizer()
      ..onTap = () {
        Navigator.of(context).pushNamed(routeName);
      };
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            style: GoogleFonts.comfortaa(fontSize: 18, color: AppColors.black),
            children: [
              TextSpan(text: commonText),
              TextSpan(
                  text: eventText,
                  recognizer: _onPressed,
                  style: const TextStyle(color: AppColors.accent)),
            ],
          )),
    );
  }
}
