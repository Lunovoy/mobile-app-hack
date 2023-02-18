import 'package:flutter/material.dart';
import 'package:deep_shield_hack/utils/app_colors.dart';
import 'package:deep_shield_hack/widgets/auth_footer_widget.dart';
import 'package:deep_shield_hack/widgets/auth_image_widget.dart';
import 'package:deep_shield_hack/widgets/custom_text_field_widget.dart';

import '../../widgets/custom_filled_button_widget.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void _onPressedLogin() {
      // Navigator.pushNamed(context, '/signup');
    }

    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              AuthImageWidget(),
              SizedBox(height: 40),
              LoginFormWidget(),
              SizedBox(height: 40),
              CustomFilledButtonWidget(
                fontSize: 20,
                text: "Войти",
                routeName: "/",
              ),
              SizedBox(height: 60),
              AuthFooterWidget(
                  commonText: "Нет учетной записи? ",
                  eventText: "Создать",
                  routeName: "/signup"),
            ],
          ),
        ),
      ),
    );
  }
}

class LoginFormWidget extends StatelessWidget {
  const LoginFormWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22),
      child: Column(
        children: [
          CustomTextFieldWidget(
            text: "Почта",
            obscureText: false,
          ),
          SizedBox(height: 20),
          CustomTextFieldWidget(
            text: "Пароль",
            obscureText: true,
          ),
        ],
      ),
    );
  }
}
