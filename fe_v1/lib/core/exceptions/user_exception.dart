class UserException implements Exception {
  final String message;
  final int? status;

  UserException({required this.message, this.status});
}
