import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/network/api_constant.dart';
import 'package:movie_app/network/movie_data_agent.dart';
import 'package:movie_app/network/the_movie_api.dart';

class RetrofitDataAgentImpl extends MovieDataAgent {
  TheMovieApi? mApi;

  RetrofitDataAgentImpl() {
    final dio = Dio();
    mApi = TheMovieApi(dio);
  }

  @override
  void getNowPlaying(int page) {
    mApi
        ?.getNowPlayingMovies(API_KEY, LANGUAGE, page.toString())
        .then((value) => debugPrint(value.toString()))
        .catchError((onError) => debugPrint(onError.toString()));
  }
}
