import 'package:flutter/widgets.dart';
import 'package:movie_app/network/api_constant.dart';
import 'package:movie_app/network/movie_data_agent.dart';
import 'package:http/http.dart' as http;

class HttpMovieDataAgentImpl extends MovieDataAgent {
  @override
  void getNowPlaying(int page) {
    Map<String, String> queryParameter = {
      PARAM_API_KEY: API_KEY,
      PARAM_LANGUAGE: LANGUAGE,
      PARAM_PAGE: page.toString()
    };

    var url = Uri.https(BASE_URL,ENGPOINT_GET_NOW_PLAYING,queryParameter);

    http.get(url).then((value){
    debugPrint(value.body.toString());
    }).catchError((onError){
      debugPrint(onError.toString());
    });
  }
}
