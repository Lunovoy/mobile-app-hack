import 'package:deep_shield_hack/bloc.navigation_bloc/navigation_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class RequestPage extends StatelessWidget with NavigationStates {
  const RequestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.green,
      body: Center(
        child: Text("RequestPage"),
      ),
    ));
  }
}
