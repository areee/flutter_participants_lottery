import 'package:flutter/material.dart';

PreferredSizeWidget customAppBar(
    BuildContext context, String title, List<Widget>? actions) {
  return AppBar(
    title: Text(
      title,
    ),
    centerTitle: true,
    actions: actions,
  );
}
