class ApiError {
  final String message;
  final int? statusCode;

  ApiError({required this.message, required this.statusCode});
}
