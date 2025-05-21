class UrlBase {
  // adb reverse tcp:6060 tcp:5235
  static const String baseUrl = "http://localhost:5235";
  static const String baseUrlUser = "${baseUrl}/api/user";
}
