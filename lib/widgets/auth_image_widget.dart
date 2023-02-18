import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AuthImageWidget extends StatelessWidget {
  const AuthImageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset('assets/images/logo_w_text.svg');
  }
}
