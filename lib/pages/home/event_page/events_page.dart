import 'package:deep_shield_hack/bloc.navigation_bloc/navigation_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class EventsPage extends StatelessWidget with NavigationStates {
  const EventsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Center(
        child: Text("EventsPage"),
      ),
    ));
  }
}
