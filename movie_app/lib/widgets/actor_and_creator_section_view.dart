import 'package:flutter/material.dart';
import 'package:movie_app/resources/colors.dart';
import 'package:movie_app/widgets/title_text_with_see_more_view.dart';

import '../resources/dimens.dart';
import '../viewitems/actor_view.dart';

class ActorAndCreatorSectionView extends StatelessWidget {
  final String titleText;
  final String seeMoreText;
  final bool seeMoreTextVisibility;

  ActorAndCreatorSectionView(
    this.titleText,
    this.seeMoreText, {
    this.seeMoreTextVisibility = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: PRIMARY_COLOR,
      padding: EdgeInsets.only(top: MARGIN_MEDIUM_2, bottom: MARGIN_XXLARGE),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2),
            child: TitleTextWithSeeMoreView(
              titleText,
              seeMoreText,
              seeMoreTextVisibility: seeMoreTextVisibility,
            ),
          ),
          SizedBox(height: MARGIN_MEDIUM_2),
          SizedBox(
            height: BEST_ACTOR_HEIGHT,
            child: ListView(
              padding: EdgeInsets.only(left: MARGIN_MEDIUM_2),
              scrollDirection: Axis.horizontal,
              children: const [
                ActorView(),
                ActorView(),
                ActorView(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
