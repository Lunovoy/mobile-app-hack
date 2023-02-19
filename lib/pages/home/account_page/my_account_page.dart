import 'package:deep_shield_hack/bloc.navigation_bloc/navigation_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MyAccountPage extends StatelessWidget with NavigationStates {
  const MyAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
        child: Scaffold(
      backgroundColor: Colors.teal,
      body: Center(
        child: Text("MyAccountPage"),
      ),
    ));
  }
}
