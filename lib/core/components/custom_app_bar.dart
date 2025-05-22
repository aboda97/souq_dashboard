import 'package:flutter/material.dart';

AppBar customAppBar({
  required String title,
  List<Widget>? actions,
  Widget? leading,
}) {
  return AppBar(
    actions: actions,
    centerTitle: true,
    title: Text(title),
    leading: leading,
  );
}
