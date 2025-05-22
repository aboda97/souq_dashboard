import 'package:flutter/material.dart';

void executionPushReplacmentNamedNavigator(
  BuildContext context,
  String routeName,
  int delayInSeconds,
) {
  Future.delayed(Duration(seconds: delayInSeconds), () {
    Navigator.pushReplacementNamed(context, routeName);
  });
}

void executionPushNamedNavigator(
  BuildContext context,
  String routeName,
  int delayInSeconds,
) {
  Future.delayed(Duration(seconds: delayInSeconds), () {
    Navigator.pushNamed(context, routeName);
  });
}
