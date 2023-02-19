import 'package:flutter/material.dart';

import 'package:deep_shield_hack/utils/app_colors.dart';

import 'package:deep_shield_hack/widgets/auth_footer_widget.dart';
import 'package:deep_shield_hack/widgets/auth_image_widget.dart';
import 'package:deep_shield_hack/widgets/custom_text_field_widget.dart';
import 'package:deep_shield_hack/widgets/custom_filled_button_widget.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              SizedBox(height: 20),
              AuthImageWidget(),
              SizedBox(height: 40),
              SignUpFormWidget(),
              SizedBox(height: 40),
              CustomFilledButtonWidget(
                fontSize: 20,
                text: "Создать",
                routeName: "/login",
              ),
              SizedBox(height: 20),
              AuthFooterWidget(
                  commonText: "Уже есть аккаунт? ",
                  eventText: "Войти",
                  routeName: "/login"),
            ],
          ),
        ),
      ),
    );
  }
}

class SignUpFormWidget extends StatelessWidget {
  const SignUpFormWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22),
      child: Column(
        children: const [
          CustomTextFieldWidget(
            text: "Почта",
            obscureText: false,
          ),
          SizedBox(height: 20),
          CustomTextFieldWidget(
            text: "Пароль",
            obscureText: true,
          ),
          SizedBox(height: 20),
          CustomTextFieldWidget(
            text: "Повторите пароль",
            obscureText: true,
          ),
        ],
      ),
    );
  }
}
