import 'package:flutter/material.dart';
import 'package:multichoice/app/constants.dart';
import 'package:multichoice/utils/preference_utils.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:dio/dio.dart';

class HttpClient {
  static Dio? _dio;


  HttpClient(){
    if (_dio == null) {
      BaseOptions options =  BaseOptions(
          baseUrl: Constants.baseUrl,
          connectTimeout: 60 * 1000, // 60 seconds
          receiveTimeout: 60 * 1000 // 60 seconds
      );
      _dio = Dio(options);
      _dio!
        ..interceptors.add(PrettyDioLogger(
          request: true,
          responseBody: true,
          requestBody: true,
          requestHeader: true,
        ))
      //TODO fix null safety errors
        ..interceptors
            .add(InterceptorsWrapper(onRequest: (RequestOptions options, RequestInterceptorHandler handler ) {
          //todo app request header before sending request
          var token = PreferenceUtils.getInstance().getData(PreferenceUtils.userToken);
          if(token != null){
            options.headers['Authorization'] = "Bearer $token";
          }
          return handler.next(options);
        }));
    }
  }


  Dio getInstance() {
    return _dio!;
  }
}
