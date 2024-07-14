// ignore_for_file: unnecessary_null_comparison

import 'package:dio/dio.dart';
import 'package:tezda/core/utils/exports.dart';

class ErrorHandler {
  static parseError(DioException e, [bool decrypt = false]) {
    if (e.response == null) {
      throw const NetworkException('Connection error');
    }

    if (e.response!.data != null) {
      if (e.requestOptions.responseType.name == 'plain') {
        List errorMap = e.response!.data['message'];
        String error = errorMap.join('\n');
        throw NetworkException(error);
      } else {
        List errorMap = e.response!.data['message'];
        String error = errorMap.join('\n');
        throw NetworkException(error);
      }
    }
  }
}
