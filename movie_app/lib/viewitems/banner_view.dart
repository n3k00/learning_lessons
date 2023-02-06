import 'package:flutter/material.dart';
import 'package:movie_app/resources/colors.dart';
import 'package:movie_app/resources/dimens.dart';

class BannerView extends StatelessWidget {
  const BannerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Positioned.fill(
            child: BannerImageView(),
          ),
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: const [
                      Colors.transparent,
                      PRIMARY_COLOR,
                    ]),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: BannerTitleView(),
          ),
          Align(
            alignment: Alignment.center,
            child: PlayButtonView(),
          ),
        ],
      ),
    );
  }
}

class BannerImageView extends StatelessWidget {
  const BannerImageView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Image.network(
      "https://jordanandeddie.files.wordpress.com/2013/12/the-wolverine-feature.jpg",
      fit: BoxFit.cover,
    );
  }
}

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

class BannerTitleView extends StatelessWidget {
  const BannerTitleView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(MARGIN_MEDIUM_2),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            "The Wolverine 2013",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
              fontSize: TEXT_HEADING_X1,
            ),
          ),
          Text(
            "Official Review",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
              fontSize: TEXT_HEADING_X1,
            ),
          ),
        ],
      ),
    );
  }
}
