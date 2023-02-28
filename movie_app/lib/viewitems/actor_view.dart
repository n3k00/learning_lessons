import 'package:flutter/material.dart';
import 'package:movie_app/resources/colors.dart';

import '../resources/dimens.dart';

class ActorView extends StatelessWidget {
  const ActorView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MOVIE_LIST_ITEM_WIDTH,
      margin: EdgeInsets.only(right: MARGIN_MEDIUM),
      child: Stack(
        children: const [
          Positioned.fill(
            child: ActorImageView(),
          ),
          Padding(
            padding: EdgeInsets.all(MARGIN_MEDIUM),
            child: Align(
              alignment: Alignment.topRight,
              child: FavouriteButtonView(),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: EdgeInsets.all(MARGIN_MEDIUM),
              child: ActorNameAndLikeView(),
            ),
          )
        ],
      ),
    );
  }
}

class ActorNameAndLikeView extends StatelessWidget {
  const ActorNameAndLikeView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Leonardo Dicaprio",
          style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.white,
              fontSize: TEXT_REGULAR),
        ),
        SizedBox(height: MARGIN_MEDIUM),
        Row(
          children: const [
            Icon(
              Icons.thumb_up,
              color: Colors.amber,
              size: MARGIN_MEDIUM_2,
            ),
            SizedBox(width: MARGIN_MEDIUM),
            Text("YOU LIKE 13 MOVIES",style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: TEXT_SMALL,
              color: HOME_SCREEN_BACKGROUND_COLOR,
            ),)
          ],
        ),
      ],
    );
  }
}

class FavouriteButtonView extends StatelessWidget {
  const FavouriteButtonView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.favorite_outline,
      color: Colors.amber,
    );
  }
}

class ActorImageView extends StatelessWidget {
  const ActorImageView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Image.network(
      "https://harpersbazaar.com.au/wp-content/uploads/2022/11/jack-titanic.jpg",
      fit: BoxFit.cover,
    );
  }
}
