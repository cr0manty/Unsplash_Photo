import 'dart:convert';

import 'package:http/http.dart';
import 'package:http_interceptor/http_client_with_interceptor.dart';
import 'package:unsplash_photo/network/result.dart';
import 'package:unsplash_photo/utils/log_interseptor.dart';

class ApiClient {
  ApiClient._internal();

  static final ApiClient _instance = ApiClient._internal();

  static ApiClient get instance => _instance;
  static const _baseUri = 'api.unsplash.com';

  Client _client = HttpClientWithInterceptor.build(
    interceptors: [LogInterceptor()],
    requestTimeout: Duration(seconds: 30),
  );

  Uri _encodeUrl({String path = '', Map<String, String> params}) {
    return Uri.https(_baseUri, path, params ?? {});
  }

  Future<Result> getPosts({int page = 1, int perPage = 10}) async {
    Response response = await _client.get(
      _encodeUrl(
        path: 'photos',
        params: {
          'client_id':
              '896d4f52c589547b2134bd75ed48742db637fa51810b49b607e37e46ab2c0043',
          'page': '$page',
          'per_page': '$perPage',
        },
      ),
    );

    if (response.statusCode == 200) {
      List body = json.decode(response.body);
      return Result(isSuccess: true, data: body);
    }
    Map body = json.decode(response.body);

    String error = '';
    body.forEach((key, value) {
      if (value is List) {
        value.forEach((element) {
          error += '$element\n';
        });
      }
      if (value is String) {
        error += '$value\n';
      }
    });
    return Result(isSuccess: false, error: error);
  }
}
