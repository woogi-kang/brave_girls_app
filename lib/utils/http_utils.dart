import 'dart:async';
import 'dart:convert';

import 'package:fimber/fimber.dart';
import 'package:http/http.dart' as http;

class HttpUtil {
  Future<String> get({String? url, String? unEncodedPath, Map<String,dynamic>? params}) async {
    var responseData;

    var uri = Uri.https(url!, unEncodedPath!, params);

    Fimber.d('Request url: ${uri.toString()}');

    try {
      final response = await http.get(
        uri,
        //headers: header,
      ).timeout(Duration(seconds: 10));

      int status = response.statusCode;

      if(status == 200) {
        responseData = utf8.decode(response.bodyBytes);
      }
    } on TimeoutException catch (e) {
      Fimber.e('TimeoutException: ${e.toString()}');
    } on Exception catch (e) {
      Fimber.e('Exception: ${e.toString()}');
    }

    return responseData;
  }

  Future<String> post(String url, Map jsonMap, {int timeout=20}) async {
    var responseData = "";

    var uri = Uri.https(url, '');

    Fimber.d('Request url: ${uri.toString()}');
    Fimber.d('$jsonMap');

    try {
      final response = await http.post(
        uri,
        body: utf8.encode(jsonEncode(jsonMap)),
        // headers: header,
      ).timeout(Duration(seconds: timeout));

      int status = response.statusCode;

      if(status == 200) {
        responseData = utf8.decode(response.bodyBytes);
      }
    } on TimeoutException catch (e) {
      Fimber.e('Http post TimeoutException: ${e.toString()}');
    } on Exception catch (e) {
      Fimber.e('Http post Exception: ${e.toString()}');
    }

    return responseData;
  }

  // Future<dynamic> postWithDio(String url, Map<String, dynamic> param) async {
  //   var responseData;
  //
  //   try {
  //     var dio = Dio();
  //     dio.options.baseUrl = Url.PUSH_API_URL;
  //     dio.options.connectTimeout = 10000; //10~30 초 셋팅 필요
  //     dio.options.receiveTimeout = 3000;
  //     dio.options.contentType = Headers.jsonContentType;
  //
  //     FormData formData = FormData.fromMap(param);
  //     var response = await dio.post(url, data: formData);
  //
  //     int status = response.statusCode;
  //     if(status == 200) {
  //       responseData = response.data;
  //     }
  //
  //   } on TimeoutException catch (e) {
  //     print('TimeoutException: ${e.toString()}');
  //   } on DioError catch (e) {
  //     print('DioError: ${e.toString()}');
  //   } on Exception catch (e) {
  //     print('Exception: ${e.toString()}');
  //   }
  //
  //   return responseData;
  // }
}