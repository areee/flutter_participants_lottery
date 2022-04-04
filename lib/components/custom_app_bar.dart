import 'package:flutter/material.dart';

PreferredSizeWidget customAppBar(
    BuildContext context, String title, List<Widget>? actions) {
  return AppBar(
    backgroundColor: Theme.of(context).colorScheme.primary,
    foregroundColor: Colors.black,
    title: Text(
      title,
      style: TextStyle(
        background: Paint()
          ..color = Colors.green.withOpacity(0.5)
          ..strokeWidth = 17
          ..strokeJoin = StrokeJoin.round
          ..strokeCap = StrokeCap.round
          ..style = PaintingStyle.stroke,
      ),
    ),
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
