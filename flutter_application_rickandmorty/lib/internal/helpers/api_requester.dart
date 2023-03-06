import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_rickandmorty/internal/helpers/error_helper.dart';
// import 'package:hive_flutter/hive_flutter.dart';

class APIRequester {
  APIRequester({this.baseUrl});
  // var box = Hive.box('token');

  String? baseUrl;

  late final baseOptions = BaseOptions(
    baseUrl: baseUrl ?? 'https://rickandmortyapi.com/api',
    headers: {},
    responseType: ResponseType.json,
    contentType: 'application/json; charset=utf-8',
    // ignore: prefer_const_constructors
    connectTimeout: Duration(seconds: 30),
    receiveTimeout: const Duration(seconds: 30),
  );

  Dio _init() => Dio(baseOptions);

  // Future<dynamic> getPreferences(String key) async {
  //   final preferences = await SharedPreferences.getInstance();
  //   return preferences.get(key);
  // }

  ErrorsEnum catchError(error) {
    if (error is DioError) {
      switch (error.type) {
        case DioErrorType.badResponse: //RESPONSE
          {
            debugPrint(
                '===================> error.response <===================');
            debugPrint(error.response.toString());
            if (error.response!.statusCode == 401) {
              return ErrorsEnum.invalidError;
            } else if (error.response!.statusCode == 429) {
              log(json.decode(error.response!.data)['message']);

              log(json.decode(error.response!.data)['errorDescription']);
              log("statusCode");
              return ErrorsEnum.invalidError;
            } else if (error.response!.statusCode == 422) {
              if (error.response
                  .toString()
                  .contains("Такое значение поля email уже существует")) {
                return ErrorsEnum.emailAllreadyExist;
              }
            } else if (error.response!.statusCode == 404) {
              log(error.response.toString());
              
              if (error.response.toString().contains("city not found")) {
                return ErrorsEnum.cityNotFound;
              }
            }
            // ignore: lines_longer_than_80_chars

            return ErrorsEnum.invalidError;
          }
        case DioErrorType.receiveTimeout: //RECEIVE_TIMEOUT
        case DioErrorType.connectionTimeout:
          {
            return ErrorsEnum.noInternetConnectionError;
          }
        case DioErrorType.sendTimeout: //SEND_TIMEOUT
          {
            return ErrorsEnum.connectionTimeOut;
          }
        case DioErrorType.unknown: //DEFAULT
          {
            log("message");
            if (error is ErrorsEnum) {}
            return ErrorsEnum.noInternetConnectionError;
          }
        case DioErrorType.cancel: //CANCEL
          {
            return ErrorsEnum.responceCancel;
          }
        default:
          {
            return ErrorsEnum.systemError;
          }
      }
    } else {
      debugPrint(error.toString());
      return ErrorsEnum.systemError;
    }
  }

  Future<Response> toGet(
    String url, {
    Map<String, dynamic>? dataParam,
    Map<String, dynamic>? headers,
    Options? options,
  }) async {
    try {
      final dio = _init();
      dio.options.headers = headers;
      return await dio.get(url, queryParameters: dataParam, options: options);
    } catch (error) {
      throw catchError(error);
    }
  }

  Future<Response> toPost(
    String url, {
    dynamic dataParam,
    Options? options,
    Map<String, dynamic>? headers,
  }) async {
    try {
      final dio = _init();
      dio.options.headers = headers;
      return await dio.post(url, data: dataParam, options: options);
    } catch (error) {
      throw catchError(error);
    }
  }

  Future<Response> toPostParamDynamic(
    String url, {
    dynamic dataParam,
    Map<String, dynamic>? headers,
  }) async {
    try {
      final dio = _init();
      dio.options.headers = headers;
      return await dio.post(url, data: dataParam.toString());
    } catch (error) {
      throw catchError(error);
    }
  }

  Future<Response> toPut(
    String url, {
    dynamic dataParam,
    Map<String, dynamic>? headers,
  }) async {
    try {
      final dio = _init();
      dio.options.headers = headers;
      return await dio.put(url, data: dataParam);
    } catch (error) {
      throw catchError(error);
    }
  }

  Future<Response> toDelete(
    String url, {
    Map<String, dynamic>? dataParam,
    Map<String, dynamic>? headers,
  }) async {
    try {
      final dio = _init();
      dio.options.headers = headers;
      return await dio.delete(url, data: dataParam);
    } catch (error) {
      throw catchError(error);
    }
  }
}
