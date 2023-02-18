import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

import '../utils/app_colors.dart';

class MenuBttn extends StatelessWidget {
  const MenuBttn({
    super.key,
    required this.press,
    required this.riveonInit,
  });

  final VoidCallback press;
  final ValueChanged<Artboard> riveonInit;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        margin: EdgeInsets.only(left: 16, top: 10),
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              offset: Offset(0, 3),
              blurRadius: 8,
            ),
          ],
        ),
        child: RiveAnimation.asset(
          "assets/riveAssets/menu_button.riv",
          onInit: riveonInit,
        ),
      ),
    );
  }
}
