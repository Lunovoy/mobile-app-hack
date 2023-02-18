import 'package:rive/rive.dart';

class RiveAsset {
  final String artboard, stateMachineName, title, src;
  late SMIBool? input;

  RiveAsset(
    this.src, {
    required this.title,
    required this.artboard,
    required this.stateMachineName,
    this.input,
  });

  set setStatus(SMIBool status) {
    input = status;
  }
}

List<dynamic> sideMenus = [
  RiveAsset(
    "assets/riveAssets/icons.riv",
    artboard: "HOME",
    stateMachineName: "HOME_interactivity",
    title: "Жильё",
  ),
  RiveAsset(
    "assets/riveAssets/icons.riv",
    artboard: "TIMER",
    stateMachineName: "TIMER_Interactivity",
    title: "События",
  ),
  RiveAsset(
    "assets/riveAssets/icons.riv",
    artboard: "AUDIO",
    stateMachineName: "AUDIO_Interactivity",
    title: "Наука",
  ),
  RiveAsset(
    "assets/riveAssets/icons.riv",
    artboard: "LIKE/STAR",
    stateMachineName: "STAR_Interactivity",
    title: "Избранные",
  ),
  RiveAsset(
    "assets/riveAssets/icons.riv",
    artboard: "CHAT",
    stateMachineName: "CHAT_Interactivity",
    title: "Мои заявки",
  ),
  RiveAsset(
    "assets/riveAssets/icons.riv",
    artboard: "BELL",
    stateMachineName: "BELL_Interactivity",
    title: "Уведомления",
  ),
];
