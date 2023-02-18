import 'package:deep_shield_hack/components/side_menu_tile.dart';
import 'package:deep_shield_hack/utils/app_colors.dart';
import 'package:deep_shield_hack/utils/rive_asset.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

import '../utils/rive_utils.dart';
import 'info_card.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({super.key});

  @override
  State<SideMenu> createState() => SideMenuState();
}

class SideMenuState extends State<SideMenu> {
  RiveAsset selectedMenu = sideMenus.first;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: 288,
          height: double.infinity,
          color: AppColors.sideMenuBackground,
          child: Column(
            children: [
              SizedBox(height: 40),
              InfoCard(
                mail: "some@mail.ru",
              ),
              SizedBox(height: 40),
              ...sideMenus.map(
                (menu) => SideMenuTile(
                  menu: menu,
                  riveonInit: (artboard) {
                    StateMachineController controller =
                        RiveUtils.getRiveController(artboard,
                            stateMachineName: menu.stateMachineName);
                    menu.input = controller.findSMI("active") as SMIBool;
                  },
                  press: () {
                    menu.input!.change(true);
                    Future.delayed(Duration(seconds: 1), () {
                      menu.input!.change(false);
                    });
                    setState(() {
                      selectedMenu = menu;
                    });
                  },
                  isActive: selectedMenu == menu,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
