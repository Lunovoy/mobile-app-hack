import 'package:deep_shield_hack/bloc.navigation_bloc/navigation_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FavoritesPage extends StatelessWidget with NavigationStates {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.red,
      body: Center(
        child: Text("FavoritesPage"),
      ),
    ));
  }
}
