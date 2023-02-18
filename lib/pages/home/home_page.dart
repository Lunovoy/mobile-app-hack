import 'dart:math';

import 'package:deep_shield_hack/components/side_menu.dart';
import 'package:deep_shield_hack/pages/home/start_page.dart';
import 'package:deep_shield_hack/utils/app_colors.dart';
import 'package:deep_shield_hack/utils/rive_utils.dart';
import 'package:deep_shield_hack/widgets/menu_button.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc.navigation_bloc/navigation_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation animation;
  late Animation scalAnimation;
  late SMIBool isSideBarClosed;
  bool isSideMenuClosed = true;

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    )..addListener(() {
        setState(() {});
      });

    animation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
        parent: animationController, curve: Curves.fastOutSlowIn));
    scalAnimation = Tween<double>(begin: 1, end: 0.8).animate(CurvedAnimation(
        parent: animationController, curve: Curves.fastOutSlowIn));
    super.initState();
  }

  void onPress() {
    isSideBarClosed.value = !isSideBarClosed.value;
    if (isSideMenuClosed) {
      animationController.forward();
    } else {
      animationController.reverse();
    }
    setState(() {
      isSideMenuClosed = isSideBarClosed.value;
    });
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.sideMenuBackground,
        body: BlocProvider<NavigationBloc>(
          create: (context) => NavigationBloc(),
          child: Stack(
            children: [
              AnimatedPositioned(
                duration: const Duration(milliseconds: 200),
                curve: Curves.fastOutSlowIn,
                width: 288,
                height: height,
                left: isSideMenuClosed ? -288 : 0,
                child: SideMenu(
                  onItemClicked: onPress,
                ),
              ),
              Transform(
                alignment: Alignment.center,
                transform: Matrix4.identity()
                  ..setEntry(3, 2, 0.001)
                  ..rotateY(animation.value - 30 * animation.value * pi / 180),
                child: Transform.translate(
                  offset: Offset(animation.value * 265, 0),
                  child: Transform.scale(
                    scale: scalAnimation.value,
                    child: ClipRRect(
                        borderRadius: isSideMenuClosed
                            ? const BorderRadius.all(Radius.circular(0))
                            : const BorderRadius.all(Radius.circular(24)),
                        child: BlocBuilder<NavigationBloc, NavigationStates>(
                          builder: (context, navigationState) {
                            return navigationState as Widget;
                          },
                        )),
                  ),
                ),
              ),
              AnimatedPositioned(
                duration: const Duration(milliseconds: 200),
                left: isSideMenuClosed ? 0 : 220,
                top: 16,
                child: MenuBttn(
                  riveonInit: (artboard) {
                    StateMachineController controller =
                        RiveUtils.getRiveController(artboard,
                            stateMachineName: "State Machine");
                    isSideBarClosed = controller.findSMI("isOpen") as SMIBool;
                    isSideBarClosed.value = true;
                  },
                  press: onPress,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
