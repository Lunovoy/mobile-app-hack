import 'package:deep_shield_hack/bloc.navigation_bloc/navigation_bloc.dart';
import 'package:deep_shield_hack/pages/home/dormitory_card.dart';
import 'package:deep_shield_hack/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class StartPage extends StatefulWidget with NavigationStates {
  const StartPage({super.key});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.background,
      child: ListView.builder(
        padding: const EdgeInsets.only(top: 40),
        itemCount: 10,
        // itemExtent: 163,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: DormitoryCard(
              image: image,
              title: title,
              city: city,
              date: date,
              price: price,
            ),
          );
        },
      ),
    );
  }
}
