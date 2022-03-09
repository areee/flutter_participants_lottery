import 'package:flutter/material.dart';

PreferredSizeWidget customAppBar(
    BuildContext context, Widget title, List<Widget>? actions) {
  return AppBar(
    backgroundColor: Theme.of(context).colorScheme.primary,
    foregroundColor: Colors.black,
    title: title,
    centerTitle: true,
    flexibleSpace: Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          repeat: ImageRepeat.repeatX,
          image: AssetImage('assets/images/kukkia_ruohikolla.png'),
        ),
      ),
    ),
    actions: actions,
  );
}
