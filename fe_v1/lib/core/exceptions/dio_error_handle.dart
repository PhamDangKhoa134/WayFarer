import 'package:dio/dio.dart';
import 'package:fe_v1/core/exceptions/user_exception.dart';

class DioErrorHandle {
  static UserException handleError(DioException e) {
    print("error ${e}");
    String errorMessage;
    int? status = e.response?.statusCode ??= 0;
    if (e.type == DioExceptionType.connectionTimeout) {
      errorMessage = 'Lỗi kết nối. Vui lòng thử lại sau.';
    } else if (e.type == DioExceptionType.receiveTimeout) {
      errorMessage = 'Lỗi thời gian nhận dữ liệu. Vui lòng thử lại sau.';
    } else if (e.type == DioExceptionType.connectionError) {
      errorMessage = 'Lỗi kết nối mạng. Vui lòng kiểm tra kết nối và thử lại.';
    } else if (e.type == DioExceptionType.badResponse) {
      errorMessage = e.response?.data ?? 'Lỗi từ server.';
    } else if (e.type == DioExceptionType.cancel) {
      errorMessage = 'Yêu cầu bị hủy.';
    } else {
      errorMessage = e.response?.data;
    }

    return UserException(message: errorMessage, status: status);
  }
}
