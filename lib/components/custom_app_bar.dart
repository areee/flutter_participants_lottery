import 'package:flutter/material.dart';

PreferredSizeWidget customAppBar(
    BuildContext context, String title, List<Widget>? actions) {
  return AppBar(
    title: Text(
      title,
      style: Theme.of(context).textTheme.headline4,
    ),
    centerTitle: true,
    actions: actions,
  );
}
