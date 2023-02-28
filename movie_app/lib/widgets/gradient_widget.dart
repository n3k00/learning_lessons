import 'package:flutter/material.dart';

import '../resources/colors.dart';

class GradientWidget extends StatelessWidget {
  const GradientWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: const [
              Colors.transparent,
              HOME_SCREEN_BACKGROUND_COLOR,
            ]),
      ),
    );
  }
}
