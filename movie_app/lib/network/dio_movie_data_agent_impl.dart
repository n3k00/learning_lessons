import 'package:flutter/cupertino.dart';
import 'package:movie_app/network/movie_data_agent.dart';
import 'package:dio/dio.dart';

import 'api_constant.dart';

class DioMovieDataAgentImpl extends MovieDataAgent {
  @override
  void getNowPlaying(int page) {
    Map<String, String> queryParameter = {
      PARAM_API_KEY: API_KEY,
      PARAM_LANGUAGE: LANGUAGE,
      PARAM_PAGE: page.toString()
    };

    Dio()
        .get("$BASE_URL_DIO$ENGPOINT_GET_NOW_PLAYING",
            queryParameters: queryParameter)
        .then((value) {
      debugPrint("Now Playing Dio ===========> $value.toString()");
    }).catchError((onError) {
      debugPrint(onError.toString());
    });
  }
}
