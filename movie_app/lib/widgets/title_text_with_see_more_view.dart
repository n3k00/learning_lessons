import 'package:flutter/material.dart';
import 'package:movie_app/widgets/see_more_text.dart';
import 'package:movie_app/widgets/title_text.dart';

class TitleTextWithSeeMoreView extends StatelessWidget {
  final String titleText;
  final String seeMoreText;
  final bool seeMoreTextVisibility;

  const TitleTextWithSeeMoreView(
    this.titleText,
    this.seeMoreText, {
    this.seeMoreTextVisibility = true,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TitleText(titleText),
        Spacer(),
        SeeMoreText(seeMoreText,seeMoreTextVisibility:seeMoreTextVisibility),
      ],
    );
  }
}
