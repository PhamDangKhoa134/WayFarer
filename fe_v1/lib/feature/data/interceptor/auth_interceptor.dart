import 'package:dio/dio.dart';
import 'package:fe_v1/core/constants/url_base.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Authinterceptor extends Interceptor {
  final Dio _dio;

  Authinterceptor(this._dio);

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("accessToken");
    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    super.onRequest(options, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    final prefs = await SharedPreferences.getInstance();
    String? refreshToken = prefs.getString("refreshToken ");

    if (err.response?.statusCode == 401 && refreshToken != null) {
      try {
        print("401");
        final response = await _dio.post('${UrlBase.baseUrlUser}/refresh-token',
            data: {'refreshToken': refreshToken});

        final newAccessToken = response.data['accessToken'];
        final newRefreshToken = response.data['refreshToken'];

        await prefs.setString("accessToken", newAccessToken);
        await prefs.setString("refreshToken", newRefreshToken);

        final opts = err.requestOptions;
        opts.headers['Authorization'] = 'Bearer $newAccessToken';

        final cloneReq = await _dio.fetch(opts);
        return handler.resolve(cloneReq);
      } catch (e) {
        return handler.reject(err);
      }
    }
    return handler.next(err);
  }
}
