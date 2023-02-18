import 'package:deep_shield_hack/bloc.navigation_bloc/navigation_bloc.dart';
import 'package:deep_shield_hack/components/side_menu_tile.dart';
import 'package:deep_shield_hack/utils/app_colors.dart';
import 'package:deep_shield_hack/utils/rive_asset.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rive/rive.dart';

import '../utils/rive_utils.dart';
import 'info_card.dart';

class SideMenu extends StatefulWidget {
  SideMenu({super.key, required this.onItemClicked});

  final VoidCallback onItemClicked;

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
              const SizedBox(height: 40),
              GestureDetector(
                onTap: () {
                  BlocProvider.of<NavigationBloc>(context)
                      .add(NavigationEvents.MyAccountClickedEvent);
                  widget.onItemClicked();
                },
                child: InfoCard(
                  mail: "some@mail.ru",
                ),
              ),
              const SizedBox(height: 40),
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
                    Future.delayed(const Duration(seconds: 1), () {
                      menu.input!.change(false);
                    });
                    setState(() {
                      selectedMenu = menu;
                    });
                    widget.onItemClicked();
                    switch (selectedMenu.title) {
                      case "Жильё":
                        BlocProvider.of<NavigationBloc>(context)
                            .add(NavigationEvents.HomePageClickedEvent);
                        break;
                      case "События":
                        BlocProvider.of<NavigationBloc>(context)
                            .add(NavigationEvents.EventsClickedEvent);
                        break;
                      case "Наука":
                        BlocProvider.of<NavigationBloc>(context)
                            .add(NavigationEvents.ScienceClickedEvent);
                        break;
                      case "Избранные":
                        BlocProvider.of<NavigationBloc>(context)
                            .add(NavigationEvents.FavoriteClickedEvent);
                        break;
                      case "Мои заявки":
                        BlocProvider.of<NavigationBloc>(context)
                            .add(NavigationEvents.RequestsClickedEvent);
                        break;
                      case "Уведомления":
                        BlocProvider.of<NavigationBloc>(context)
                            .add(NavigationEvents.NotificationsClickedEvent);
                        break;
                      default:
                        break;
                    }
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
