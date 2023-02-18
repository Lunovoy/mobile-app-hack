import 'package:deep_shield_hack/bloc.navigation_bloc/navigation_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SciencePage extends StatelessWidget with NavigationStates {
  const SciencePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Text("SciencePage"),
      ),
    ));
  }
}
