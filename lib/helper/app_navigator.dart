import 'package:flutter/material.dart';
import 'package:sample_flutter_messenger/routes/new_action/new_action_route.dart';

class AppNavigator {
  final BuildContext context;

  AppNavigator(this.context);

  void navigateToNewActionRoute() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (_) => NewActionRoute()));
  }

  void navigateBack() {
    Navigator.of(context).pop();
  }
}
