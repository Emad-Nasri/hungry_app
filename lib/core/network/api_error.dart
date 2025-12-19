class ApiError {
  final String message;
  final int? statusCode;

  ApiError({required this.message, this.statusCode});
  @override
  String toString() {
    return 'Error is : $message (Status code is $statusCode)';
  }
}
