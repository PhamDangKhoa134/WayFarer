import 'package:intl/intl.dart';

class Format {
  static String formatDateToString(DateTime date,
      {String pattern = 'dd/MM/yyyy'}) {
    final formatter = DateFormat(pattern);
    return formatter.format(date);
  }

  static DateTime? formatStringToDate(String string,
      {String pattern = 'dd/MM/yyyy'}) {
    try {
      final formatter = DateFormat(pattern);
      return formatter.parse(string);
    } catch (e) {
      print('Lỗi parse ngày: $e');
      return null;
    }
  }
}
