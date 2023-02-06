import 'package:flutter/material.dart';
import 'package:movie_app/resources/colors.dart';
import 'package:movie_app/resources/strings.dart';
import 'package:movie_app/viewitems/banner_view.dart';

import '../resources/dimens.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          MAIN_SCREEN_APP_BAR_TITLE,
          style: TextStyle(
            fontWeight: FontWeight.w700,
          ),
        ),
        backgroundColor: PRIMARY_COLOR,
        leading: Icon(
          Icons.menu,
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(
              right: MARGIN_MEDIUM_2,
            ),
            child: Icon(
              Icons.search,
            ),
          ),
        ],
      ),
      body: Container(
        color: PRIMARY_COLOR,
        child: SingleChildScrollView(
          child: Column(
            children: [
              BannerSectionView(),
              SizedBox(height: MARGIN_LARGE),
              SizedBox(
                height: MOVIE_LIST_HEIGHT,
                child: ListView.builder(
                  padding: EdgeInsets.only(left: MARGIN_MEDIUM_2),
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      margin: EdgeInsets.only(right: MARGIN_CARD_MEDIUM_2),
                      color: Colors.blue,
                      width: MOVIE_LIST_ITEM_WIDTH,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BannerSectionView extends StatelessWidget {
  const BannerSectionView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 4,
      child: PageView(
        children: const [BannerView(), BannerView()],
      ),
    );
  }
}
