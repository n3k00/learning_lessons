import 'package:flutter/material.dart';

import '../resources/colors.dart';
import '../resources/dimens.dart';

class PlayButtonView extends StatelessWidget {
  const PlayButtonView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.play_circle_outline,
      size: BANNER_PLAY_BUTTON_SIZE,
      color: PLAY_BUTTON_COLOR,
    );
  }
}