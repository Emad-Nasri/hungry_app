class ApiError {
  final String message;
  final int? statusCode;

  ApiError({required this.message, this.statusCode});
  @override
  String toString() {
    return 'error is $message';
  }
}
