import 'dart:ffi';
import 'dart:math';

import 'package:deep_shield_hack/components/side_menu.dart';
import 'package:deep_shield_hack/pages/auth/login_page.dart';
import 'package:deep_shield_hack/utils/app_colors.dart';
import 'package:deep_shield_hack/utils/rive_utils.dart';
import 'package:deep_shield_hack/widgets/menu_button.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  int _selectedtab = 1;
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

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  void _onSelectedTab(int index) {
    if (_selectedtab == index) return;
    _selectedtab = index;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // final width = MediaQuery.of(context).size.width * 0.8;
    final height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.sideMenuBackground,
        body: Stack(
          children: [
            AnimatedPositioned(
              duration: Duration(milliseconds: 200),
              curve: Curves.fastOutSlowIn,
              width: 288,
              height: height,
              left: isSideMenuClosed ? -288 : 0,
              child: SideMenu(),
            ),
            IndexedStack(
              index: _selectedtab,
              children: [
                Text("First"),
                Text("Second"),
                Text("Third"),
              ],
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
                          ? BorderRadius.all(Radius.circular(0))
                          : BorderRadius.all(Radius.circular(24)),
                      child: LoginPage()),
                ),
              ),
            ),
            AnimatedPositioned(
              duration: Duration(milliseconds: 200),
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
                press: () {
                  isSideBarClosed.value = !isSideBarClosed.value;
                  if (isSideMenuClosed) {
                    animationController.forward();
                  } else {
                    animationController.reverse();
                  }
                  setState(() {
                    isSideMenuClosed = isSideBarClosed.value;
                  });
                },
              ),
            ),
          ],
        ),
        // bottomNavigationBar: SalomonBottomBar(
        //   currentIndex: _selectedtab,
        //   onTap: _onSelectedTab,
        //   items: [
        //     SalomonBottomBarItem(
        //       icon: Icon(Icons.home),
        //       title: Text("Home"),
        //       selectedColor: Colors.purple,
        //     ),

        //     /// Likes
        //     SalomonBottomBarItem(
        //       icon: Icon(Icons.favorite_border),
        //       title: Text("Likes"),
        //       selectedColor: Colors.pink,
        //     ),

        //     /// Search
        //     SalomonBottomBarItem(
        //       icon: Icon(Icons.search),
        //       title: Text("Search"),
        //       selectedColor: Colors.orange,
        //     ),

        //     /// Profile
        //     SalomonBottomBarItem(
        //       icon: Icon(Icons.person),
        //       title: Text("Profile"),
        //       selectedColor: Colors.teal,
        //     ),
        //   ],
        // ),
      ),
    );
  }
}
